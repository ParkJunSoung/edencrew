import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/realtime_quote.dart';
import '../repository/stock_repository.dart';

class GetRealtimeQuotesUseCase {
  const GetRealtimeQuotesUseCase({required StockRepository repository})
    : _repository = repository;

  final StockRepository _repository;

  Future<Result<Map<String, RealtimeQuote>, StockDataError>> execute(
    List<String> symbols,
  ) => _repository.getRealtimeQuotes(symbols);
}
