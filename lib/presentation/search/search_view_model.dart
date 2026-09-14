import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/error/result.dart';
import '../../domain/error/stock_data_error.dart';
import '../../domain/model/stock_metadata.dart';
import '../../domain/model/stock_search_result.dart';
import '../../domain/use_case/search_domestic_stocks_use_case.dart';
import '../../domain/use_case/toggle_watchlist_stock_use_case.dart';
import '../../domain/use_case/watch_watchlist_stocks_use_case.dart';

part 'search_view_model.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(<StockSearchResult>[]) List<StockSearchResult> results,
    @Default(<String>{}) Set<String> favoriteSymbols,
    @Default(false) bool isSearching,
    StockDataError? error,
  }) = _SearchState;
}

@freezed
sealed class SearchAction with _$SearchAction {
  const factory SearchAction.load() = LoadSearch;
  const factory SearchAction.queryChanged(String query) = SearchQueryChanged;
  const factory SearchAction.toggleFavorite(StockSearchResult stock) =
      ToggleSearchFavorite;
}

class SearchViewModel with ChangeNotifier {
  SearchViewModel({
    required SearchDomesticStocksUseCase searchDomesticStocksUseCase,
    required WatchWatchlistStocksUseCase watchWatchlistStocksUseCase,
    required ToggleWatchlistStockUseCase toggleWatchlistStockUseCase,
  }) : _searchDomesticStocksUseCase = searchDomesticStocksUseCase,
       _watchWatchlistStocksUseCase = watchWatchlistStocksUseCase,
       _toggleWatchlistStockUseCase = toggleWatchlistStockUseCase;

  final SearchDomesticStocksUseCase _searchDomesticStocksUseCase;
  final WatchWatchlistStocksUseCase _watchWatchlistStocksUseCase;
  final ToggleWatchlistStockUseCase _toggleWatchlistStockUseCase;

  SearchState _state = const SearchState();
  SearchState get state => _state;

  StreamSubscription<List<StockMetadata>>? _watchlistSubscription;
  int _searchRequestId = 0;

  void onAction(SearchAction action) {
    switch (action) {
      case LoadSearch():
        _startWatchingFavorites();
      case SearchQueryChanged():
        unawaited(_search(action.query));
      case ToggleSearchFavorite():
        unawaited(_toggleFavorite(action.stock));
    }
  }

  void _startWatchingFavorites() {

    if (_watchlistSubscription != null) return;
    _watchlistSubscription = _watchWatchlistStocksUseCase.execute().listen((
      List<StockMetadata> stocks,
    ) {
      _state = state.copyWith(
        favoriteSymbols: Set<String>.unmodifiable(
          stocks.map((StockMetadata stock) => stock.symbol),
        ),
      );
      notifyListeners();
    });
  }

  Future<void> _search(String query) async {
    final int requestId = ++_searchRequestId;
    final String normalized = query.trim();
    if (normalized.isEmpty) {
      _state = state.copyWith(
        query: '',
        results: const <StockSearchResult>[],
        isSearching: false,
        error: null,
      );
      notifyListeners();
      return;
    }

    _state = state.copyWith(query: normalized, isSearching: true, error: null);
    notifyListeners();
    final Result<List<StockSearchResult>, StockDataError> result =
        await _searchDomesticStocksUseCase.execute(normalized);
    if (requestId != _searchRequestId) return;

    switch (result) {
      case ResultSuccess<List<StockSearchResult>, StockDataError>():
        _state = state.copyWith(
          results: result.data,
          isSearching: false,
          error: null,
        );
      case ResultError<List<StockSearchResult>, StockDataError>():
        _state = state.copyWith(
          results: const <StockSearchResult>[],
          isSearching: false,
          error: result.error,
        );
    }
    notifyListeners();
  }

  Future<void> _toggleFavorite(StockSearchResult stock) async {
    final Result<bool, StockDataError> result =
        await _toggleWatchlistStockUseCase.execute(
          StockMetadata(
            symbol: stock.symbol,
            name: stock.name,
            exchangeName: stock.exchangeName,
          ),
        );
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
