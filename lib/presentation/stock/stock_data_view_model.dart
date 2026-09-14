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
import '../../domain/model/stock_search_result.dart';
import '../../domain/use_case/get_daily_prices_use_case.dart';
import '../../domain/use_case/get_realtime_quotes_use_case.dart';
import '../../domain/use_case/get_stock_metadata_use_case.dart';
import '../../domain/use_case/search_domestic_stocks_use_case.dart';

part 'stock_data_view_model.freezed.dart';

@freezed
abstract class StockDataState with _$StockDataState {
  const factory StockDataState({
    @Default('') String searchQuery,
    @Default(<StockSearchResult>[]) List<StockSearchResult> searchResults,
    @Default(<String, RealtimeQuote>{}) Map<String, RealtimeQuote> quotes,
    StockMetadata? metadata,
    @Default(<DailyPrice>[]) List<DailyPrice> dailyPrices,
    @Default(DailyPricePeriod.oneMonth) DailyPricePeriod selectedPeriod,
    @Default(false) bool isSearching,
    @Default(false) bool isLoadingQuotes,
    @Default(false) bool isLoadingMetadata,
    @Default(false) bool isLoadingDailyPrices,
    StockDataError? error,
  }) = _StockDataState;
}

@freezed
sealed class StockDataAction with _$StockDataAction {
  const factory StockDataAction.search(String query) = SearchStocks;
  const factory StockDataAction.loadRealtimeQuotes(List<String> symbols) =
      LoadRealtimeQuotes;
  const factory StockDataAction.loadMetadata(String symbol) = LoadMetadata;
  const factory StockDataAction.loadDailyPrices(
    String symbol,
    DailyPricePeriod period,
  ) = LoadDailyPrices;
  const factory StockDataAction.clearError() = ClearStockDataError;
}

class StockDataViewModel with ChangeNotifier {
  StockDataViewModel({
    required SearchDomesticStocksUseCase searchDomesticStocksUseCase,
    required GetRealtimeQuotesUseCase getRealtimeQuotesUseCase,
    required GetStockMetadataUseCase getStockMetadataUseCase,
    required GetDailyPricesUseCase getDailyPricesUseCase,
  }) : _searchDomesticStocksUseCase = searchDomesticStocksUseCase,
       _getRealtimeQuotesUseCase = getRealtimeQuotesUseCase,
       _getStockMetadataUseCase = getStockMetadataUseCase,
       _getDailyPricesUseCase = getDailyPricesUseCase;

  final SearchDomesticStocksUseCase _searchDomesticStocksUseCase;
  final GetRealtimeQuotesUseCase _getRealtimeQuotesUseCase;
  final GetStockMetadataUseCase _getStockMetadataUseCase;
  final GetDailyPricesUseCase _getDailyPricesUseCase;

  StockDataState _state = const StockDataState();
  StockDataState get state => _state;
  int _searchRequestId = 0;

  void onAction(StockDataAction action) {
    switch (action) {
      case SearchStocks():
        unawaited(_search(action.query));
      case LoadRealtimeQuotes():
        unawaited(_loadRealtimeQuotes(action.symbols));
      case LoadMetadata():
        unawaited(_loadMetadata(action.symbol));
      case LoadDailyPrices():
        unawaited(_loadDailyPrices(action.symbol, action.period));
      case ClearStockDataError():
        _state = state.copyWith(error: null);
        notifyListeners();
    }
  }

  Future<void> _search(String query) async {
    final int requestId = ++_searchRequestId;
    final String normalized = query.trim();
    if (normalized.isEmpty) {
      _state = state.copyWith(
        searchQuery: '',
        searchResults: const <StockSearchResult>[],
        isSearching: false,
        error: null,
      );
      notifyListeners();
      return;
    }
    _state = state.copyWith(
      searchQuery: normalized,
      isSearching: true,
      error: null,
    );
    notifyListeners();

    final Result<List<StockSearchResult>, StockDataError> result =
        await _searchDomesticStocksUseCase.execute(normalized);
    if (requestId != _searchRequestId) {
      return;
    }
    switch (result) {
      case ResultSuccess<List<StockSearchResult>, StockDataError>():
        _state = state.copyWith(
          searchResults: result.data,
          isSearching: false,
          error: null,
        );
      case ResultError<List<StockSearchResult>, StockDataError>():
        _state = state.copyWith(
          searchResults: const <StockSearchResult>[],
          isSearching: false,
          error: result.error,
        );
    }
    notifyListeners();
  }

  Future<void> _loadRealtimeQuotes(List<String> symbols) async {
    _state = state.copyWith(isLoadingQuotes: true, error: null);
    notifyListeners();
    final Result<Map<String, RealtimeQuote>, StockDataError> result =
        await _getRealtimeQuotesUseCase.execute(symbols);
    switch (result) {
      case ResultSuccess<Map<String, RealtimeQuote>, StockDataError>():
        _state = state.copyWith(
          quotes: result.data,
          isLoadingQuotes: false,
          error: null,
        );
      case ResultError<Map<String, RealtimeQuote>, StockDataError>():
        _state = state.copyWith(isLoadingQuotes: false, error: result.error);
    }
    notifyListeners();
  }

  Future<void> _loadMetadata(String symbol) async {
    _state = state.copyWith(isLoadingMetadata: true, error: null);
    notifyListeners();
    final Result<StockMetadata, StockDataError> result =
        await _getStockMetadataUseCase.execute(symbol);
    switch (result) {
      case ResultSuccess<StockMetadata, StockDataError>():
        _state = state.copyWith(
          metadata: result.data,
          isLoadingMetadata: false,
          error: null,
        );
      case ResultError<StockMetadata, StockDataError>():
        _state = state.copyWith(isLoadingMetadata: false, error: result.error);
    }
    notifyListeners();
  }

  Future<void> _loadDailyPrices(String symbol, DailyPricePeriod period) async {
    _state = state.copyWith(
      selectedPeriod: period,
      isLoadingDailyPrices: true,
      error: null,
    );
    notifyListeners();
    final Result<DailyPricesResult, StockDataError> result =
        await _getDailyPricesUseCase.execute(symbol: symbol, period: period);
    switch (result) {
      case ResultSuccess<DailyPricesResult, StockDataError>():
        _state = state.copyWith(
          dailyPrices: result.data.prices,
          isLoadingDailyPrices: false,
          error: null,
        );
      case ResultError<DailyPricesResult, StockDataError>():
        _state = state.copyWith(
          isLoadingDailyPrices: false,
          error: result.error,
        );
    }
    notifyListeners();
  }
}
