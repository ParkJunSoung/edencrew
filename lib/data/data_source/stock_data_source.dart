import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../dto/daily_price_dto.dart';
import '../dto/realtime_quote_dto.dart';
import '../dto/stock_metadata_dto.dart';
import '../dto/stock_search_dto.dart';

abstract interface class StockDataSource {
  Future<Result<List<StockSearchDto>, StockDataError>> searchStocks(
    String query,
  );

  Future<Result<List<RealtimeQuoteDto>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  );

  Future<Result<StockMetadataDto, StockDataError>> getStockMetadata(
    String symbol,
  );

  Future<Result<DailyPricePageDto, StockDataError>> getDailyPricePage({
    required String symbol,
    required int page,
  });
}
