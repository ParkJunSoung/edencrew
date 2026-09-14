import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../../domain/model/daily_price.dart';
import '../../domain/model/daily_prices_result.dart';
import '../../domain/model/realtime_quote.dart';
import '../../domain/model/stock_metadata.dart';
import '../../domain/model/stock_search_result.dart';
import '../../domain/repository/stock_repository.dart';
import '../data_source/stock_data_source.dart';
import '../dto/daily_price_dto.dart';
import '../dto/realtime_quote_dto.dart';
import '../dto/stock_metadata_dto.dart';
import '../dto/stock_search_dto.dart';

class StockRepositoryImpl implements StockRepository {
  const StockRepositoryImpl({required StockDataSource dataSource})
    : _dataSource = dataSource;

  final StockDataSource _dataSource;

  @override
  Future<Result<List<StockSearchResult>, StockDataError>> searchDomesticStocks(
    String query,
  ) async {
    final Result<List<StockSearchDto>, StockDataError> result =
        await _dataSource.searchStocks(query);
    switch (result) {
      case ResultSuccess<List<StockSearchDto>, StockDataError>():
        final List<StockSearchResult> stocks = result.data
            .map((StockSearchDto dto) => dto.toDomain())
            .whereType<StockSearchResult>()
            .toList(growable: false);
        return Result<List<StockSearchResult>, StockDataError>.success(
          List<StockSearchResult>.unmodifiable(stocks),
        );
      case ResultError<List<StockSearchDto>, StockDataError>():
        return Result<List<StockSearchResult>, StockDataError>.error(
          result.error,
        );
    }
  }

  @override
  Future<Result<Map<String, RealtimeQuote>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  ) async {
    final List<String> uniqueSymbols = symbols.toSet().toList(growable: false);
    if (uniqueSymbols.isEmpty) {
      return const Result<Map<String, RealtimeQuote>, StockDataError>.success(
        <String, RealtimeQuote>{},
      );
    }
    if (uniqueSymbols.any((String symbol) => !_isValidSymbol(symbol))) {
      return const Result<Map<String, RealtimeQuote>, StockDataError>.error(
        StockDataError.invalidSymbol,
      );
    }

    final Result<List<RealtimeQuoteDto>, StockDataError> result =
        await _dataSource.getRealtimeQuotes(uniqueSymbols);
    switch (result) {
      case ResultSuccess<List<RealtimeQuoteDto>, StockDataError>():
        final Map<String, RealtimeQuote> quotes = <String, RealtimeQuote>{};
        for (final RealtimeQuoteDto dto in result.data) {
          quotes[dto.symbol] = dto.toDomain();
        }
        return Result<Map<String, RealtimeQuote>, StockDataError>.success(
          Map<String, RealtimeQuote>.unmodifiable(quotes),
        );
      case ResultError<List<RealtimeQuoteDto>, StockDataError>():
        return Result<Map<String, RealtimeQuote>, StockDataError>.error(
          result.error,
        );
    }
  }

  @override
  Future<Result<StockMetadata, StockDataError>> getStockMetadata(
    String symbol,
  ) async {
    if (!_isValidSymbol(symbol)) {
      return const Result<StockMetadata, StockDataError>.error(
        StockDataError.invalidSymbol,
      );
    }
    final Result<StockMetadataDto, StockDataError> result = await _dataSource
        .getStockMetadata(symbol);
    switch (result) {
      case ResultSuccess<StockMetadataDto, StockDataError>():
        if (result.data.symbolCode != symbol) {
          return const Result<StockMetadata, StockDataError>.error(
            StockDataError.malformedResponse,
          );
        }
        return Result<StockMetadata, StockDataError>.success(
          result.data.toDomain(),
        );
      case ResultError<StockMetadataDto, StockDataError>():
        return Result<StockMetadata, StockDataError>.error(result.error);
    }
  }

  @override
  Future<Result<DailyPricesResult, StockDataError>> getDailyPrices({
    required String symbol,
    required int requiredTradingDays,
    required int maxPages,
  }) async {
    if (!_isValidSymbol(symbol)) {
      return const Result<DailyPricesResult, StockDataError>.error(
        StockDataError.invalidSymbol,
      );
    }
    if (requiredTradingDays < 1 || maxPages < 1) {
      return const Result<DailyPricesResult, StockDataError>.error(
        StockDataError.invalidPage,
      );
    }

    final Map<String, DailyPrice> pricesByDate = <String, DailyPrice>{};
    int lastPage = maxPages;
    int loadedPages = 0;
    int page = 1;
    while (page <= maxPages && page <= lastPage) {
      final Result<DailyPricePageDto, StockDataError> pageResult =
          await _dataSource.getDailyPricePage(symbol: symbol, page: page);
      switch (pageResult) {
        case ResultSuccess<DailyPricePageDto, StockDataError>():
          loadedPages++;
          lastPage = pageResult.data.lastPage;
          for (final DailyPriceDto dto in pageResult.data.prices) {
            pricesByDate.putIfAbsent(dto.localDate, dto.toDomain);
          }
        case ResultError<DailyPricePageDto, StockDataError>():
          return Result<DailyPricesResult, StockDataError>.error(
            pageResult.error,
          );
      }
      if (pricesByDate.length >= requiredTradingDays || page >= lastPage) {
        break;
      }
      page++;
    }

    if (pricesByDate.isEmpty) {
      return const Result<DailyPricesResult, StockDataError>.error(
        StockDataError.emptyResult,
      );
    }
    final List<DailyPrice> normalized = pricesByDate.values.toList()
      ..sort(
        (DailyPrice left, DailyPrice right) =>
            right.localDate.compareTo(left.localDate),
      );
    final List<DailyPrice> limited = normalized.length > requiredTradingDays
        ? normalized.sublist(0, requiredTradingDays)
        : normalized;
    return Result<DailyPricesResult, StockDataError>.success(
      DailyPricesResult(
        prices: List<DailyPrice>.unmodifiable(limited),
        lastPage: lastPage,
        loadedPages: loadedPages,
        hasMore: loadedPages < lastPage,
      ),
    );
  }
}

bool _isValidSymbol(String symbol) => RegExp(r'^\d{6}$').hasMatch(symbol);
