import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/cache/daily_price_page_cache.dart';
import 'package:edencrew_assignment_starter/data/data_source/stock_data_source.dart';
import 'package:edencrew_assignment_starter/data/dto/daily_price_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/realtime_quote_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_metadata_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_search_dto.dart';
import 'package:edencrew_assignment_starter/data/repository/stock_repository_impl.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price_period.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_prices_result.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_daily_prices_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final DailyPricePeriod period in DailyPricePeriod.values) {
    test(
      '${period.name} requests no more than ${period.maxPages} pages',
      () async {
        final TrackingPagedDataSource source = TrackingPagedDataSource();
        final GetDailyPricesUseCase useCase = _useCase(source);

        final result = await useCase.execute(symbol: '005930', period: period);

        expect(result, isA<ResultSuccess<DailyPricesResult, StockDataError>>());
        expect(
          source.requestedPages,
          List<int>.generate(period.maxPages, (i) => i + 1),
        );
        final data =
            (result as ResultSuccess<DailyPricesResult, StockDataError>).data;
        expect(data.prices, hasLength(period.targetTradingDays));
      },
    );
  }

  test('requesting stops immediately at lastPage', () async {
    final TrackingPagedDataSource source = TrackingPagedDataSource(lastPage: 3);
    final GetDailyPricesUseCase useCase = _useCase(source);

    final result = await useCase.execute(
      symbol: '005930',
      period: DailyPricePeriod.threeMonths,
    );

    expect(result, isA<ResultSuccess<DailyPricesResult, StockDataError>>());
    expect(source.requestedPages, <int>[1, 2, 3]);
  });

  test(
    'requesting stops as soon as enough trading days are collected',
    () async {
      final TrackingPagedDataSource source = TrackingPagedDataSource(
        rowsPerPage: 20,
      );
      final GetDailyPricesUseCase useCase = _useCase(source);

      final result = await useCase.execute(
        symbol: '005930',
        period: DailyPricePeriod.oneMonth,
      );

      expect(result, isA<ResultSuccess<DailyPricesResult, StockDataError>>());
      expect(source.requestedPages, <int>[1]);
    },
  );

  test('one-month then three-month lookup reuses pages 1 and 2', () async {
    final CachingPagedDataSource source = CachingPagedDataSource();
    final GetDailyPricesUseCase useCase = _useCase(source);

    await useCase.execute(symbol: '005930', period: DailyPricePeriod.oneMonth);
    await useCase.execute(
      symbol: '005930',
      period: DailyPricePeriod.threeMonths,
    );

    expect(source.loadCounts[1], 1);
    expect(source.loadCounts[2], 1);
    expect(source.loadCounts.keys, containsAll(<int>[1, 2, 3, 4, 5, 6]));
    expect(source.loadCounts.values, everyElement(1));
  });

  test('invalid custom trading-day count returns typed error', () async {
    final TrackingPagedDataSource source = TrackingPagedDataSource();
    final GetDailyPricesUseCase useCase = _useCase(source);

    final result = await useCase.execute(
      symbol: '005930',
      requiredTradingDays: 0,
    );

    expect(
      (result as ResultError<DailyPricesResult, StockDataError>).error,
      StockDataError.invalidPage,
    );
    expect(source.requestedPages, isEmpty);
  });

  test('repository failure is passed through by the use case', () async {
    final TrackingPagedDataSource source = TrackingPagedDataSource(
      error: StockDataError.network,
    );
    final GetDailyPricesUseCase useCase = _useCase(source);

    final result = await useCase.execute(
      symbol: '005930',
      period: DailyPricePeriod.oneMonth,
    );

    expect(
      (result as ResultError<DailyPricesResult, StockDataError>).error,
      StockDataError.network,
    );
  });
}

GetDailyPricesUseCase _useCase(StockDataSource source) =>
    GetDailyPricesUseCase(repository: StockRepositoryImpl(dataSource: source));

class TrackingPagedDataSource implements StockDataSource {
  TrackingPagedDataSource({
    this.lastPage = 100,
    this.rowsPerPage = 10,
    this.error,
  });

  final int lastPage;
  final int rowsPerPage;
  final StockDataError? error;
  final List<int> requestedPages = <int>[];

  @override
  Future<Result<DailyPricePageDto, StockDataError>> getDailyPricePage({
    required String symbol,
    required int page,
  }) async {
    requestedPages.add(page);
    if (error != null) {
      return Result.error(error!);
    }
    return Result.success(_page(page, lastPage: lastPage, rows: rowsPerPage));
  }

  @override
  Future<Result<List<RealtimeQuoteDto>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  ) async => const Result.success(<RealtimeQuoteDto>[]);

  @override
  Future<Result<StockMetadataDto, StockDataError>> getStockMetadata(
    String symbol,
  ) async => const Result.error(StockDataError.emptyResult);

  @override
  Future<Result<List<StockSearchDto>, StockDataError>> searchStocks(
    String query,
  ) async => const Result.success(<StockSearchDto>[]);
}

class CachingPagedDataSource extends TrackingPagedDataSource {
  CachingPagedDataSource() : super();

  final MemoryDailyPricePageCache cache = MemoryDailyPricePageCache();
  final Map<int, int> loadCounts = <int, int>{};

  @override
  Future<Result<DailyPricePageDto, StockDataError>> getDailyPricePage({
    required String symbol,
    required int page,
  }) => cache.getOrLoad(
    symbol: symbol,
    page: page,
    loader: () async {
      loadCounts.update(page, (int count) => count + 1, ifAbsent: () => 1);
      return Result.success(_page(page, lastPage: 100, rows: 10));
    },
  );
}

DailyPricePageDto _page(int page, {required int lastPage, required int rows}) {
  final DateTime anchor = DateTime(2026, 12, 31);
  return DailyPricePageDto(
    prices: List<DailyPriceDto>.generate(rows, (int index) {
      final int offset = ((page - 1) * rows) + index;
      final DateTime date = anchor.subtract(Duration(days: offset));
      final String localDate =
          '${date.year.toString().padLeft(4, '0')}'
          '${date.month.toString().padLeft(2, '0')}'
          '${date.day.toString().padLeft(2, '0')}';
      return DailyPriceDto(
        localDate: localDate,
        closePrice: 1000 - offset,
        openPrice: 990 - offset,
        highPrice: 1010 - offset,
        lowPrice: 980 - offset,
        accumulatedTradingVolume: 10000 + offset,
      );
    }),
    lastPage: lastPage,
    skippedRowCount: 0,
  );
}
