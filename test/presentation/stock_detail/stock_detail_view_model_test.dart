import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/repository/in_memory_watchlist_repository_impl.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price_period.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_prices_result.dart';
import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_daily_prices_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_realtime_quotes_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/toggle_watchlist_stock_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/watch_watchlist_stocks_use_case.dart';
import 'package:edencrew_assignment_starter/presentation/stock_detail/stock_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/fake_stock_repository.dart';

void main() {
  const StockMetadata samsung = StockMetadata(
    symbol: '005930',
    name: '삼성전자',
    exchangeName: '코스피',
  );
  late FakeStockRepository stockRepository;
  late InMemoryWatchlistRepositoryImpl watchlistRepository;
  late StockDetailViewModel viewModel;

  setUp(() {
    stockRepository = FakeStockRepository()
      ..realtimeResult = const Result.success(<String, RealtimeQuote>{
        '005930': RealtimeQuote(
          symbol: '005930',
          currentPrice: 100,
          previousClose: 90,
          openPrice: 92,
          highPrice: 105,
          lowPrice: 88,
          accumulatedTradingVolume: 1000,
          countOfListedStock: 10,
        ),
      })
      ..dailyResult = const Result.success(
        DailyPricesResult(
          prices: <DailyPrice>[
            DailyPrice(
              localDate: '20260912',
              closePrice: 100,
              openPrice: 95,
              highPrice: 105,
              lowPrice: 90,
              accumulatedTradingVolume: 1000,
            ),
            DailyPrice(
              localDate: '20260911',
              closePrice: 90,
              openPrice: 92,
              highPrice: 96,
              lowPrice: 88,
              accumulatedTradingVolume: 900,
            ),
          ],
          lastPage: 2,
          loadedPages: 1,
          hasMore: true,
        ),
      );
    watchlistRepository = InMemoryWatchlistRepositoryImpl();
    viewModel = StockDetailViewModel(
      stock: samsung,
      getRealtimeQuotesUseCase: GetRealtimeQuotesUseCase(
        repository: stockRepository,
      ),
      getDailyPricesUseCase: GetDailyPricesUseCase(repository: stockRepository),
      watchWatchlistStocksUseCase: WatchWatchlistStocksUseCase(
        repository: watchlistRepository,
      ),
      toggleWatchlistStockUseCase: ToggleWatchlistStockUseCase(
        repository: watchlistRepository,
      ),
    );
  });

  tearDown(() => viewModel.dispose());

  test('상세 로드는 시세와 일별 가격을 가져오고 등락액을 미리 계산한다', () async {
    viewModel.onAction(const StockDetailAction.load());
    await pumpEventQueue();

    expect(stockRepository.receivedSymbols, <String>['005930']);
    expect(viewModel.state.quote?.currentPrice, 100);
    expect(viewModel.state.dailyRows.first.changeAmount, 10);
    expect(viewModel.state.dailyRows.last.changeAmount, isNull);
  });

  test('기간과 관심종목 액션이 상세 상태에 반영된다', () async {
    viewModel.onAction(const StockDetailAction.load());
    await pumpEventQueue();

    viewModel.onAction(
      const StockDetailAction.selectPeriod(DailyPricePeriod.sixMonths),
    );
    await pumpEventQueue();
    expect(viewModel.state.selectedPeriod, DailyPricePeriod.sixMonths);
    expect(stockRepository.receivedMaxPages, 12);

    viewModel.onAction(const StockDetailAction.toggleFavorite());
    await pumpEventQueue();
    expect(viewModel.state.isFavorite, isTrue);
  });
}
