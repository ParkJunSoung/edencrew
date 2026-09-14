import '../model/stock_metadata.dart';
import '../repository/watchlist_repository.dart';

class WatchWatchlistStocksUseCase {
  const WatchWatchlistStocksUseCase({required WatchlistRepository repository})
    : _repository = repository;

  final WatchlistRepository _repository;

  Stream<List<StockMetadata>> execute() => _repository.watchStocks();
}
