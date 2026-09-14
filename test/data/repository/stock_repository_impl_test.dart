import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/data_source/stock_data_source.dart';
import 'package:edencrew_assignment_starter/data/dto/daily_price_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/realtime_quote_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_metadata_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_search_dto.dart';
import 'package:edencrew_assignment_starter/data/repository/stock_repository_impl.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_prices_result.dart';
import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_search_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('search keeps only KOR stock entries with six-digit symbols', () async {
    final FakeStockDataSource source = FakeStockDataSource(
      searchItems: const <StockSearchDto>[
        StockSearchDto(
          code: '005930',
          name: '삼성전자',
          typeCode: 'KOSPI',
          typeName: '코스피',
          url: '/domestic/stock/005930/total',
          nationCode: 'KOR',
          category: 'stock',
        ),
        StockSearchDto(
          code: 'AAPL',
          name: 'Apple',
          typeCode: 'NASDAQ',
          typeName: '나스닥',
          url: '/worldstock/stock/AAPL/total',
          nationCode: 'USA',
          category: 'stock',
        ),
        StockSearchDto(
          code: '12345A',
          name: '잘못된 코드',
          typeCode: 'KOSPI',
          typeName: '코스피',
          url: '',
          nationCode: 'KOR',
          category: 'stock',
        ),
        StockSearchDto(
          code: '123456',
          name: '국내 지수',
          typeCode: 'INDEX',
          typeName: '지수',
          url: '',
          nationCode: 'KOR',
          category: 'index',
        ),
      ],
    );
    final StockRepositoryImpl repository = StockRepositoryImpl(
      dataSource: source,
    );

    final result = await repository.searchDomesticStocks('삼성');
    final stocks =
        (result as ResultSuccess<List<StockSearchResult>, StockDataError>).data;

    expect(stocks, hasLength(1));
    expect(stocks.single.id, 'domestic:005930');
    expect(stocks.single.symbol, '005930');
    expect(stocks.single.exchangeName, '코스피');
  });

  test('realtime DTOs become a symbol-keyed map', () async {
    final FakeStockDataSource source = FakeStockDataSource(
      realtimeItems: const <RealtimeQuoteDto>[
        RealtimeQuoteDto(
          symbol: '005930',
          currentPrice: 259500,
          previousClose: 269000,
          openPrice: 258000,
          highPrice: 261500,
          lowPrice: 256500,
          accumulatedTradingVolume: 13938673,
          countOfListedStock: 5846278608,
        ),
        RealtimeQuoteDto(
          symbol: '000660',
          currentPrice: 1812000,
          previousClose: 1853000,
          openPrice: 1773000,
          highPrice: 1827000,
          lowPrice: 1768000,
          accumulatedTradingVolume: 2620493,
          countOfListedStock: 730492365,
        ),
      ],
    );
    final StockRepositoryImpl repository = StockRepositoryImpl(
      dataSource: source,
    );

    final result = await repository.getRealtimeQuotes(<String>[
      '005930',
      '000660',
    ]);
    final quotes =
        (result as ResultSuccess<Map<String, RealtimeQuote>, StockDataError>)
            .data;

    expect(quotes.keys, containsAll(<String>['005930', '000660']));
    expect(quotes['005930']?.currentPrice, 259500);
  });

  test('quote calculations are deterministic and use raw integer values', () {
    const RealtimeQuote quote = RealtimeQuote(
      symbol: '005930',
      currentPrice: 259500,
      previousClose: 269000,
      openPrice: 258000,
      highPrice: 261500,
      lowPrice: 256500,
      accumulatedTradingVolume: 13938673,
      countOfListedStock: 5846278608,
    );

    expect(quote.changeAmount, -9500);
    expect(quote.changeRate, closeTo(-9500 / 269000, 1e-12));
    expect(quote.marketCap, 259500 * 5846278608);
    expect(quote.changeAmount, -9500);
  });

  test('zero or missing previousClose is handled safely', () {
    const RealtimeQuote zero = RealtimeQuote(
      symbol: '005930',
      currentPrice: 100,
      previousClose: 0,
      openPrice: 0,
      highPrice: 0,
      lowPrice: 0,
      accumulatedTradingVolume: 0,
      countOfListedStock: 0,
    );
    const RealtimeQuote missing = RealtimeQuote(
      symbol: '005930',
      currentPrice: 100,
      openPrice: 0,
      highPrice: 0,
      lowPrice: 0,
      accumulatedTradingVolume: 0,
      countOfListedStock: 0,
    );

    expect(zero.changeAmount, 100);
    expect(zero.changeRate, 0);
    expect(missing.changeAmount, 0);
    expect(missing.changeRate, 0);
  });

  test('metadata DTO becomes reusable domain metadata', () async {
    final FakeStockDataSource source = FakeStockDataSource(
      metadata: const StockMetadataDto(
        symbolCode: '005930',
        stockName: '삼성전자',
        stockExchangeNameKor: '코스피',
      ),
    );
    final StockRepositoryImpl repository = StockRepositoryImpl(
      dataSource: source,
    );

    final result = await repository.getStockMetadata('005930');
    final StockMetadata metadata =
        (result as ResultSuccess<StockMetadata, StockDataError>).data;

    expect(metadata.symbol, '005930');
    expect(metadata.name, '삼성전자');
    expect(metadata.exchangeName, '코스피');
  });

  test('daily prices are de-duplicated and sorted newest first', () async {
    final FakeStockDataSource source = FakeStockDataSource(
      dailyPageBuilder: (int page) => DailyPricePageDto(
        prices: page == 1
            ? <DailyPriceDto>[_daily('20260102'), _daily('20260103')]
            : <DailyPriceDto>[_daily('20260102'), _daily('20260101')],
        lastPage: 2,
        skippedRowCount: 0,
      ),
    );
    final StockRepositoryImpl repository = StockRepositoryImpl(
      dataSource: source,
    );

    final first = await repository.getDailyPrices(
      symbol: '005930',
      requiredTradingDays: 4,
      maxPages: 2,
    );
    final second = await repository.getDailyPrices(
      symbol: '005930',
      requiredTradingDays: 4,
      maxPages: 2,
    );
    final DailyPricesResult firstData =
        (first as ResultSuccess<DailyPricesResult, StockDataError>).data;
    final DailyPricesResult secondData =
        (second as ResultSuccess<DailyPricesResult, StockDataError>).data;

    expect(firstData.prices.map((price) => price.localDate), <String>[
      '20260103',
      '20260102',
      '20260101',
    ]);
    expect(secondData, firstData);
  });
}

DailyPriceDto _daily(String date) => DailyPriceDto(
  localDate: date,
  closePrice: 100,
  openPrice: 90,
  highPrice: 110,
  lowPrice: 80,
  accumulatedTradingVolume: 1000,
);

class FakeStockDataSource implements StockDataSource {
  FakeStockDataSource({
    this.searchItems = const <StockSearchDto>[],
    this.realtimeItems = const <RealtimeQuoteDto>[],
    this.metadata,
    this.dailyPageBuilder,
  });

  final List<StockSearchDto> searchItems;
  final List<RealtimeQuoteDto> realtimeItems;
  final StockMetadataDto? metadata;
  final DailyPricePageDto Function(int page)? dailyPageBuilder;

  @override
  Future<Result<List<StockSearchDto>, StockDataError>> searchStocks(
    String query,
  ) async => Result.success(searchItems);

  @override
  Future<Result<List<RealtimeQuoteDto>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  ) async => Result.success(realtimeItems);

  @override
  Future<Result<StockMetadataDto, StockDataError>> getStockMetadata(
    String symbol,
  ) async => metadata == null
      ? const Result.error(StockDataError.emptyResult)
      : Result.success(metadata!);

  @override
  Future<Result<DailyPricePageDto, StockDataError>> getDailyPricePage({
    required String symbol,
    required int page,
  }) async => Result.success(dailyPageBuilder!(page));
}
