import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/stock_metadata.dart';
import '../repository/stock_repository.dart';

class GetStockMetadataUseCase {
  const GetStockMetadataUseCase({required StockRepository repository})
    : _repository = repository;

  final StockRepository _repository;

  Future<Result<StockMetadata, StockDataError>> execute(String symbol) =>
      _repository.getStockMetadata(symbol);
}
