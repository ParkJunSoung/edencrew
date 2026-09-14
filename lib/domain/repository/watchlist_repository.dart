import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/stock_metadata.dart';

abstract interface class WatchlistRepository {
  Stream<List<StockMetadata>> watchStocks();

  Future<Result<bool, StockDataError>> toggle(StockMetadata stock);
}
