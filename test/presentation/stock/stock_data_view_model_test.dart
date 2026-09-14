import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price_period.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_prices_result.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_search_result.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_daily_prices_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_realtime_quotes_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_stock_metadata_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/search_domestic_stocks_use_case.dart';
import 'package:edencrew_assignment_starter/presentation/stock/stock_data_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/fake_stock_repository.dart';

void main() {
  late FakeStockRepository repository;
  late StockDataViewModel viewModel;

  setUp(() {
    repository = FakeStockRepository();
    viewModel = StockDataViewModel(
      searchDomesticStocksUseCase: SearchDomesticStocksUseCase(
        repository: repository,
      ),
      getRealtimeQuotesUseCase: GetRealtimeQuotesUseCase(
        repository: repository,
      ),
      getStockMetadataUseCase: GetStockMetadataUseCase(repository: repository),
      getDailyPricesUseCase: GetDailyPricesUseCase(repository: repository),
    );
  });

  tearDown(() => viewModel.dispose());

  test('SearchStocks action updates query and successful results', () async {
    repository.searchResult = const Result.success(<StockSearchResult>[
      StockSearchResult(
        id: 'domestic:005930',
        symbol: '005930',
        name: '삼성전자',
        exchangeName: '코스피',
        category: 'stock',
      ),
    ]);

    viewModel.onAction(const StockDataAction.search('삼성'));
    await pumpEventQueue();

    expect(viewModel.state.searchQuery, '삼성');
    expect(viewModel.state.searchResults.single.symbol, '005930');
    expect(viewModel.state.isSearching, isFalse);
    expect(viewModel.state.error, isNull);
  });

  test('empty SearchStocks action restores the initial search state', () async {
    viewModel.onAction(const StockDataAction.search('삼성'));
    await pumpEventQueue();

    viewModel.onAction(const StockDataAction.search('   '));
    await pumpEventQueue();

    expect(viewModel.state.searchQuery, isEmpty);
    expect(viewModel.state.searchResults, isEmpty);
    expect(viewModel.state.isSearching, isFalse);
  });

  test('typed failures are stored without exposing exceptions', () async {
    repository.searchResult = const Result.error(StockDataError.network);

    viewModel.onAction(const StockDataAction.search('삼성'));
    await pumpEventQueue();

    expect(viewModel.state.error, StockDataError.network);
    expect(viewModel.state.isSearching, isFalse);
  });

  test('LoadDailyPrices action updates period and normalized data', () async {
    repository.dailyResult = const Result.success(
      DailyPricesResult(
        prices: <DailyPrice>[
          DailyPrice(
            localDate: '20260911',
            closePrice: 100,
            openPrice: 90,
            highPrice: 110,
            lowPrice: 80,
            accumulatedTradingVolume: 1000,
          ),
        ],
        lastPage: 10,
        loadedPages: 1,
        hasMore: true,
      ),
    );

    viewModel.onAction(
      const StockDataAction.loadDailyPrices(
        '005930',
        DailyPricePeriod.threeMonths,
      ),
    );
    await pumpEventQueue();

    expect(viewModel.state.selectedPeriod, DailyPricePeriod.threeMonths);
    expect(viewModel.state.dailyPrices.single.localDate, '20260911');
    expect(viewModel.state.isLoadingDailyPrices, isFalse);
  });

  test('ClearStockDataError action clears persistent error state', () async {
    repository.searchResult = const Result.error(StockDataError.blocked);
    viewModel.onAction(const StockDataAction.search('삼성'));
    await pumpEventQueue();
    expect(viewModel.state.error, StockDataError.blocked);

    viewModel.onAction(const StockDataAction.clearError());

    expect(viewModel.state.error, isNull);
  });
}
