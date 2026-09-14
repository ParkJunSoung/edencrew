import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../../domain/model/daily_price.dart';
import '../../domain/model/daily_price_period.dart';
import '../../domain/model/daily_prices_result.dart';
import '../../domain/model/realtime_quote.dart';
import '../../domain/model/stock_metadata.dart';
import '../../domain/use_case/get_daily_prices_use_case.dart';
import '../../domain/use_case/get_realtime_quotes_use_case.dart';
import '../../domain/use_case/toggle_watchlist_stock_use_case.dart';
import '../../domain/use_case/watch_watchlist_stocks_use_case.dart';

part 'stock_detail_view_model.freezed.dart';

@immutable
class StockDetailDailyRow {
  const StockDetailDailyRow({required this.price, this.changeAmount});

  final DailyPrice price;
  final int? changeAmount;
}

@freezed
abstract class StockDetailState with _$StockDetailState {
  const factory StockDetailState({
    required StockMetadata stock,
    RealtimeQuote? quote,
    @Default(<StockDetailDailyRow>[]) List<StockDetailDailyRow> dailyRows,
    @Default(DailyPricePeriod.oneMonth) DailyPricePeriod selectedPeriod,
    @Default(false) bool isFavorite,
    @Default(false) bool isLoadingQuote,
    @Default(false) bool isLoadingDailyPrices,
    StockDataError? error,
  }) = _StockDetailState;
}

@freezed
sealed class StockDetailAction with _$StockDetailAction {
  const factory StockDetailAction.load() = LoadStockDetail;
  const factory StockDetailAction.selectPeriod(DailyPricePeriod period) =
      SelectStockDetailPeriod;
  const factory StockDetailAction.toggleFavorite() = ToggleDetailFavorite;
}

class StockDetailViewModel with ChangeNotifier {
  StockDetailViewModel({
    required StockMetadata stock,
    required GetRealtimeQuotesUseCase getRealtimeQuotesUseCase,
    required GetDailyPricesUseCase getDailyPricesUseCase,
    required WatchWatchlistStocksUseCase watchWatchlistStocksUseCase,
    required ToggleWatchlistStockUseCase toggleWatchlistStockUseCase,
  }) : _getRealtimeQuotesUseCase = getRealtimeQuotesUseCase,
       _getDailyPricesUseCase = getDailyPricesUseCase,
       _watchWatchlistStocksUseCase = watchWatchlistStocksUseCase,
       _toggleWatchlistStockUseCase = toggleWatchlistStockUseCase,
       _state = StockDetailState(stock: stock);

  final GetRealtimeQuotesUseCase _getRealtimeQuotesUseCase;
  final GetDailyPricesUseCase _getDailyPricesUseCase;
  final WatchWatchlistStocksUseCase _watchWatchlistStocksUseCase;
  final ToggleWatchlistStockUseCase _toggleWatchlistStockUseCase;

  StockDetailState _state;
  StockDetailState get state => _state;
  StreamSubscription<List<StockMetadata>>? _watchlistSubscription;
  int _dailyRequestId = 0;
  bool _hasLoaded = false;

  void onAction(StockDetailAction action) {
    switch (action) {
      case LoadStockDetail():
        _load();
      case SelectStockDetailPeriod():
        _state = state.copyWith(selectedPeriod: action.period, error: null);
        notifyListeners();
        unawaited(_loadDailyPrices(action.period));
      case ToggleDetailFavorite():
        unawaited(_toggleFavorite());
    }
  }

  void _load() {
    if (_hasLoaded) return;
    _hasLoaded = true;
    _watchlistSubscription = _watchWatchlistStocksUseCase.execute().listen((
      List<StockMetadata> stocks,
    ) {
      _state = state.copyWith(
        isFavorite: stocks.any(
          (StockMetadata stock) => stock.symbol == state.stock.symbol,
        ),
      );
      notifyListeners();
    });
    unawaited(_loadQuote());
    unawaited(_loadDailyPrices(state.selectedPeriod));
  }

  Future<void> _loadQuote() async {
    _state = state.copyWith(isLoadingQuote: true, error: null);
    notifyListeners();
    final Result<Map<String, RealtimeQuote>, StockDataError> result =
        await _getRealtimeQuotesUseCase.execute(<String>[state.stock.symbol]);
    switch (result) {
      case ResultSuccess<Map<String, RealtimeQuote>, StockDataError>():
        _state = state.copyWith(
          quote: result.data[state.stock.symbol],
          isLoadingQuote: false,
        );
      case ResultError<Map<String, RealtimeQuote>, StockDataError>():
        _state = state.copyWith(isLoadingQuote: false, error: result.error);
    }
    notifyListeners();
  }

  Future<void> _loadDailyPrices(DailyPricePeriod period) async {
    final int requestId = ++_dailyRequestId;
    _state = state.copyWith(isLoadingDailyPrices: true, error: null);
    notifyListeners();
    final Result<DailyPricesResult, StockDataError> result =
        await _getDailyPricesUseCase.execute(
          symbol: state.stock.symbol,
          period: period,
        );
    if (requestId != _dailyRequestId) return;

    switch (result) {
      case ResultSuccess<DailyPricesResult, StockDataError>():
        _state = state.copyWith(
          dailyRows: _toRows(result.data.prices),
          isLoadingDailyPrices: false,
        );
      case ResultError<DailyPricesResult, StockDataError>():
        _state = state.copyWith(
          isLoadingDailyPrices: false,
          error: result.error,
        );
    }
    notifyListeners();
  }

  List<StockDetailDailyRow> _toRows(List<DailyPrice> prices) {
    return List<StockDetailDailyRow>.unmodifiable(
      List<StockDetailDailyRow>.generate(prices.length, (int index) {
        final DailyPrice price = prices[index];
        final int? changeAmount = index + 1 < prices.length
            ? price.closePrice - prices[index + 1].closePrice
            : null;
        return StockDetailDailyRow(price: price, changeAmount: changeAmount);
      }),
    );
  }

  Future<void> _toggleFavorite() async {
    final Result<bool, StockDataError> result =
        await _toggleWatchlistStockUseCase.execute(state.stock);
    switch (result) {
      case ResultSuccess<bool, StockDataError>():
        break;
      case ResultError<bool, StockDataError>():
        _state = state.copyWith(error: result.error);
        notifyListeners();
    }
  }

  @override
  void dispose() {
    final StreamSubscription<List<StockMetadata>>? subscription =
        _watchlistSubscription;
    if (subscription != null) unawaited(subscription.cancel());
    super.dispose();
  }
}
