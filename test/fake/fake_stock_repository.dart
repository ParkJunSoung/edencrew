import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_prices_result.dart';
import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_search_result.dart';
import 'package:edencrew_assignment_starter/domain/repository/stock_repository.dart';

class FakeStockRepository implements StockRepository {
  Result<List<StockSearchResult>, StockDataError> searchResult =
      const Result.success(<StockSearchResult>[]);
  Result<Map<String, RealtimeQuote>, StockDataError> realtimeResult =
      const Result.success(<String, RealtimeQuote>{});
  Result<StockMetadata, StockDataError> metadataResult = const Result.error(
    StockDataError.emptyResult,
  );
  Result<DailyPricesResult, StockDataError> dailyResult = const Result.error(
    StockDataError.emptyResult,
  );

  String? receivedQuery;
  List<String>? receivedSymbols;
  String? receivedMetadataSymbol;
  String? receivedDailySymbol;
  int? receivedTradingDays;
  int? receivedMaxPages;

  @override
  Future<Result<Map<String, RealtimeQuote>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  ) async {
    receivedSymbols = symbols;
    return realtimeResult;
  }

  @override
  Future<Result<StockMetadata, StockDataError>> getStockMetadata(
    String symbol,
  ) async {
    receivedMetadataSymbol = symbol;
    return metadataResult;
  }

  @override
  Future<Result<List<StockSearchResult>, StockDataError>> searchDomesticStocks(
    String query,
  ) async {
    receivedQuery = query;
    return searchResult;
  }

  @override
  Future<Result<DailyPricesResult, StockDataError>> getDailyPrices({
    required String symbol,
    required int requiredTradingDays,
    required int maxPages,
  }) async {
    receivedDailySymbol = symbol;
    receivedTradingDays = requiredTradingDays;
    receivedMaxPages = maxPages;
    return dailyResult;
  }
}
