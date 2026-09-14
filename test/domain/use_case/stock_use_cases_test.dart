import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price_period.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_prices_result.dart';
import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_search_result.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_daily_prices_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_realtime_quotes_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_stock_metadata_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/search_domestic_stocks_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/fake_stock_repository.dart';

void main() {
  test(
    'SearchDomesticStocksUseCase trims and returns repository data',
    () async {
      final FakeStockRepository repository = FakeStockRepository()
        ..searchResult = const Result.success(<StockSearchResult>[
          StockSearchResult(
            id: 'domestic:005930',
            symbol: '005930',
            name: '삼성전자',
            exchangeName: '코스피',
            category: 'stock',
          ),
        ]);
      final SearchDomesticStocksUseCase useCase = SearchDomesticStocksUseCase(
        repository: repository,
      );

      final result = await useCase.execute('  삼성  ');

      expect(repository.receivedQuery, '삼성');
      expect(
        (result as ResultSuccess<List<StockSearchResult>, StockDataError>).data,
        hasLength(1),
      );
    },
  );

  test('GetRealtimeQuotesUseCase delegates a single symbol list', () async {
    final FakeStockRepository repository = FakeStockRepository();
    final GetRealtimeQuotesUseCase useCase = GetRealtimeQuotesUseCase(
      repository: repository,
    );

    await useCase.execute(<String>['005930', '000660']);

    expect(repository.receivedSymbols, <String>['005930', '000660']);
  });

  test('GetStockMetadataUseCase returns typed repository error', () async {
    final FakeStockRepository repository = FakeStockRepository()
      ..metadataResult = const Result<StockMetadata, StockDataError>.error(
        StockDataError.network,
      );
    final GetStockMetadataUseCase useCase = GetStockMetadataUseCase(
      repository: repository,
    );

    final result = await useCase.execute('005930');

    expect(repository.receivedMetadataSymbol, '005930');
    expect(
      (result as ResultError<StockMetadata, StockDataError>).error,
      StockDataError.network,
    );
  });

  test(
    'GetDailyPricesUseCase maps period to target days and page cap',
    () async {
      final FakeStockRepository repository = FakeStockRepository()
        ..dailyResult = const Result.success(
          DailyPricesResult(
            prices: <Never>[],
            lastPage: 100,
            loadedPages: 0,
            hasMore: true,
          ),
        );
      final GetDailyPricesUseCase useCase = GetDailyPricesUseCase(
        repository: repository,
      );

      final result = await useCase.execute(
        symbol: '005930',
        period: DailyPricePeriod.sixMonths,
      );

      expect(result, isA<ResultSuccess<DailyPricesResult, StockDataError>>());
      expect(repository.receivedDailySymbol, '005930');
      expect(repository.receivedTradingDays, 120);
      expect(repository.receivedMaxPages, 12);
    },
  );

  test('custom target computes the minimum ten-row page count', () async {
    final FakeStockRepository repository = FakeStockRepository();
    final GetDailyPricesUseCase useCase = GetDailyPricesUseCase(
      repository: repository,
    );

    await useCase.execute(symbol: '005930', requiredTradingDays: 21);

    expect(repository.receivedTradingDays, 21);
    expect(repository.receivedMaxPages, 3);
  });

  test('realtime quote result remains strongly typed', () async {
    const RealtimeQuote quote = RealtimeQuote(
      symbol: '005930',
      currentPrice: 1,
      previousClose: 1,
      openPrice: 1,
      highPrice: 1,
      lowPrice: 1,
      accumulatedTradingVolume: 1,
      countOfListedStock: 1,
    );
    final FakeStockRepository repository = FakeStockRepository()
      ..realtimeResult = const Result.success(<String, RealtimeQuote>{
        '005930': quote,
      });

    final result = await GetRealtimeQuotesUseCase(
      repository: repository,
    ).execute(<String>['005930']);

    expect(
      (result as ResultSuccess<Map<String, RealtimeQuote>, StockDataError>)
          .data['005930'],
      quote,
    );
  });
}
