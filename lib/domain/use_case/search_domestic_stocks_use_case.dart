import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/stock_search_result.dart';
import '../repository/stock_repository.dart';

class SearchDomesticStocksUseCase {
  const SearchDomesticStocksUseCase({required StockRepository repository})
    : _repository = repository;

  final StockRepository _repository;

  Future<Result<List<StockSearchResult>, StockDataError>> execute(
    String query,
  ) => _repository.searchDomesticStocks(query.trim());
}
