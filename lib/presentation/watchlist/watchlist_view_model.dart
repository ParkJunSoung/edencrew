import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../../domain/model/realtime_quote.dart';
import '../../domain/model/stock_metadata.dart';
import '../../domain/use_case/get_realtime_quotes_use_case.dart';
import '../../domain/use_case/watch_watchlist_stocks_use_case.dart';

part 'watchlist_view_model.freezed.dart';

enum WatchlistSort {
  currentPrice('현재가순'),
  changeRate('등락률순'),
  name('가나다순');

  const WatchlistSort(this.label);

  final String label;
}

@freezed
abstract class WatchlistState with _$WatchlistState {
  const factory WatchlistState({
    @Default(<StockMetadata>[]) List<StockMetadata> stocks,
    @Default(<String, RealtimeQuote>{}) Map<String, RealtimeQuote> quotes,
    @Default(WatchlistSort.name) WatchlistSort sort,
    @Default(false) bool isRefreshing,
    StockDataError? error,
  }) = _WatchlistState;
}

@freezed
sealed class WatchlistAction with _$WatchlistAction {
  const factory WatchlistAction.load() = LoadWatchlist;
  const factory WatchlistAction.refresh() = RefreshWatchlist;
  const factory WatchlistAction.selectSort(WatchlistSort sort) =
      SelectWatchlistSort;
}

class WatchlistViewModel with ChangeNotifier {
  WatchlistViewModel({
    required WatchWatchlistStocksUseCase watchWatchlistStocksUseCase,
    required GetRealtimeQuotesUseCase getRealtimeQuotesUseCase,
  }) : _watchWatchlistStocksUseCase = watchWatchlistStocksUseCase,
       _getRealtimeQuotesUseCase = getRealtimeQuotesUseCase;

  final WatchWatchlistStocksUseCase _watchWatchlistStocksUseCase;
  final GetRealtimeQuotesUseCase _getRealtimeQuotesUseCase;

  WatchlistState _state = const WatchlistState();
  WatchlistState get state => _state;
  StreamSubscription<List<StockMetadata>>? _subscription;

  void onAction(WatchlistAction action) {
    switch (action) {
      case LoadWatchlist():
        _startWatching();
      case RefreshWatchlist():
        unawaited(_refreshQuotes());
      case SelectWatchlistSort():
        _state = state.copyWith(
          sort: action.sort,
          stocks: _sorted(state.stocks, action.sort),
        );
        notifyListeners();
    }
  }

  void _startWatching() {
    if (_subscription != null) {
      return;
    }
    _subscription = _watchWatchlistStocksUseCase.execute().listen((
      List<StockMetadata> stocks,
    ) {
      _state = state.copyWith(stocks: _sorted(stocks, state.sort));
      notifyListeners();
      unawaited(_refreshQuotes());
    });
  }

  Future<void> _refreshQuotes() async {
    final List<String> symbols = state.stocks
        .map((StockMetadata stock) => stock.symbol)
        .toList(growable: false);
    if (symbols.isEmpty) {
      _state = state.copyWith(
        quotes: const <String, RealtimeQuote>{},
        isRefreshing: false,
        error: null,
      );
      notifyListeners();
      return;
    }

    _state = state.copyWith(isRefreshing: true, error: null);
    notifyListeners();
    final Result<Map<String, RealtimeQuote>, StockDataError> result =
        await _getRealtimeQuotesUseCase.execute(symbols);
    switch (result) {
      case ResultSuccess<Map<String, RealtimeQuote>, StockDataError>():
        _state = state.copyWith(
          quotes: result.data,
          stocks: _sorted(state.stocks, state.sort, quotes: result.data),
          isRefreshing: false,
          error: null,
        );
      case ResultError<Map<String, RealtimeQuote>, StockDataError>():
        _state = state.copyWith(isRefreshing: false, error: result.error);
    }
    notifyListeners();
  }

  List<StockMetadata> _sorted(
    List<StockMetadata> stocks,
    WatchlistSort sort, {
    Map<String, RealtimeQuote>? quotes,
  }) {
    final Map<String, RealtimeQuote> availableQuotes = quotes ?? state.quotes;
    final List<StockMetadata> sorted = List<StockMetadata>.of(stocks);
    sorted.sort((StockMetadata left, StockMetadata right) {
      return switch (sort) {
        WatchlistSort.name => left.name.compareTo(right.name),
        WatchlistSort.currentPrice => _compareQuoteValue(
          left,
          right,
          availableQuotes,
          (RealtimeQuote quote) => quote.currentPrice.toDouble(),
        ),
        WatchlistSort.changeRate => _compareQuoteValue(
          left,
          right,
          availableQuotes,
          (RealtimeQuote quote) => quote.changeRate,
        ),
      };
    });
    return List<StockMetadata>.unmodifiable(sorted);
  }

  int _compareQuoteValue(
    StockMetadata left,
    StockMetadata right,
    Map<String, RealtimeQuote> quotes,
    double Function(RealtimeQuote quote) valueOf,
  ) {
    final RealtimeQuote? leftQuote = quotes[left.symbol];
    final RealtimeQuote? rightQuote = quotes[right.symbol];
    if (leftQuote == null && rightQuote == null) {
      return left.name.compareTo(right.name);
    }
    if (leftQuote == null) {
      return 1;
    }
    if (rightQuote == null) {
      return -1;
    }
    final int valueComparison = valueOf(
      rightQuote,
    ).compareTo(valueOf(leftQuote));
    return valueComparison != 0
        ? valueComparison
        : left.name.compareTo(right.name);
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }
}
