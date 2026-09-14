import '../../core/domain/error/result.dart';
import '../error/stock_data_error.dart';
import '../model/daily_price_period.dart';
import '../model/daily_prices_result.dart';
import '../repository/stock_repository.dart';

class GetDailyPricesUseCase {
  const GetDailyPricesUseCase({required StockRepository repository})
    : _repository = repository;

  final StockRepository _repository;

  Future<Result<DailyPricesResult, StockDataError>> execute({
    required String symbol,
    DailyPricePeriod? period,
    int? requiredTradingDays,
  }) {
    final int? targetDays = requiredTradingDays ?? period?.targetTradingDays;
    if (targetDays == null || targetDays < 1) {
      return Future.value(
        const Result<DailyPricesResult, StockDataError>.error(
          StockDataError.invalidPage,
        ),
      );
    }

    final int maxPages = period?.maxPages ?? ((targetDays + 9) ~/ 10);
    return _repository.getDailyPrices(
      symbol: symbol,
      requiredTradingDays: targetDays,
      maxPages: maxPages,
    );
  }
}
