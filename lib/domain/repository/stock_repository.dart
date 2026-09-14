import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/daily_prices_result.dart';
import '../model/realtime_quote.dart';
import '../model/stock_metadata.dart';
import '../model/stock_search_result.dart';

abstract interface class StockRepository {
  Future<Result<List<StockSearchResult>, StockDataError>> searchDomesticStocks(
    String query,
  );

  Future<Result<Map<String, RealtimeQuote>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  );

  Future<Result<StockMetadata, StockDataError>> getStockMetadata(String symbol);

  Future<Result<DailyPricesResult, StockDataError>> getDailyPrices({
    required String symbol,
    required int requiredTradingDays,
    required int maxPages,
  });
}
