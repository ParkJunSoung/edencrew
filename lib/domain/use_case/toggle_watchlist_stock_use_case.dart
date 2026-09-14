import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/stock_metadata.dart';
import '../repository/watchlist_repository.dart';

class ToggleWatchlistStockUseCase {
  const ToggleWatchlistStockUseCase({required WatchlistRepository repository})
    : _repository = repository;

  final WatchlistRepository _repository;

  Future<Result<bool, StockDataError>> execute(StockMetadata stock) =>
      _repository.toggle(stock);
}
