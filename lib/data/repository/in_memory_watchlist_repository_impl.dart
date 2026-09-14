import 'package:rxdart/rxdart.dart';

import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../../domain/model/stock_metadata.dart';
import '../../domain/repository/watchlist_repository.dart';

class InMemoryWatchlistRepositoryImpl implements WatchlistRepository {
  InMemoryWatchlistRepositoryImpl({
    List<StockMetadata> initialStocks = const [],
  }) : _stocks = <String, StockMetadata>{
         for (final StockMetadata stock in initialStocks) stock.symbol: stock,
       },
       _controller = BehaviorSubject<List<StockMetadata>>.seeded(
         List<StockMetadata>.unmodifiable(initialStocks),
       );

  final Map<String, StockMetadata> _stocks;
  final BehaviorSubject<List<StockMetadata>> _controller;

  @override
  Stream<List<StockMetadata>> watchStocks() => _controller.stream;

  @override
  Future<Result<bool, StockDataError>> toggle(StockMetadata stock) async {
    final bool isFavorite;
    if (_stocks.containsKey(stock.symbol)) {
      _stocks.remove(stock.symbol);
      isFavorite = false;
    } else {
      _stocks[stock.symbol] = stock;
      isFavorite = true;
    }
    _controller.add(List<StockMetadata>.unmodifiable(_stocks.values));
    return Result<bool, StockDataError>.success(isFavorite);
  }
}
