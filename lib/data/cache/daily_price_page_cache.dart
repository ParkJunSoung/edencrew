import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../dto/daily_price_dto.dart';

abstract interface class DailyPricePageCache {
  Future<Result<DailyPricePageDto, StockDataError>> getOrLoad({
    required String symbol,
    required int page,
    required Future<Result<DailyPricePageDto, StockDataError>> Function()
    loader,
  });
}

class MemoryDailyPricePageCache implements DailyPricePageCache {
  final Map<String, DailyPricePageDto> _pages = <String, DailyPricePageDto>{};
  final Map<String, Future<Result<DailyPricePageDto, StockDataError>>>
  _pending = <String, Future<Result<DailyPricePageDto, StockDataError>>>{};
  final Map<String, int> _lastPages = <String, int>{};

  @override
  Future<Result<DailyPricePageDto, StockDataError>> getOrLoad({
    required String symbol,
    required int page,
    required Future<Result<DailyPricePageDto, StockDataError>> Function()
    loader,
  }) {
    final int? knownLastPage = _lastPages[symbol];
    if (knownLastPage != null && page > knownLastPage) {
      return Future.value(
        const Result<DailyPricePageDto, StockDataError>.error(
          StockDataError.invalidPage,
        ),
      );
    }

    final String key = '$symbol:$page';
    final DailyPricePageDto? cached = _pages[key];
    if (cached != null) {
      return Future.value(
        Result<DailyPricePageDto, StockDataError>.success(cached),
      );
    }
    final Future<Result<DailyPricePageDto, StockDataError>>? inFlight =
        _pending[key];
    if (inFlight != null) {
      return inFlight;
    }

    final Future<Result<DailyPricePageDto, StockDataError>> request = loader();
    _pending[key] = request;
    return request
        .then((Result<DailyPricePageDto, StockDataError> result) {
          switch (result) {
            case ResultSuccess<DailyPricePageDto, StockDataError>():
              _pages[key] = result.data;
              _lastPages[symbol] = result.data.lastPage;
            case ResultError<DailyPricePageDto, StockDataError>():
              break;
          }
          return result;
        })
        .whenComplete(() => _pending.remove(key));
  }
}
