import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/repository/in_memory_watchlist_repository_impl.dart';
import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/domain/use_case/get_realtime_quotes_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/watch_watchlist_stocks_use_case.dart';
import 'package:edencrew_assignment_starter/presentation/watchlist/watchlist_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/fake_stock_repository.dart';

void main() {
  const StockMetadata samsung = StockMetadata(
    symbol: '005930',
    name: '삼성전자',
    exchangeName: '코스피',
  );
  const StockMetadata kakao = StockMetadata(
    symbol: '035720',
    name: '카카오',
    exchangeName: '코스피',
  );

  test('관심 종목 전체를 한 번의 실시간 시세 요청으로 조회한다', () async {
    final InMemoryWatchlistRepositoryImpl watchlistRepository =
        InMemoryWatchlistRepositoryImpl(
          initialStocks: const <StockMetadata>[samsung, kakao],
        );
    final FakeStockRepository stockRepository = FakeStockRepository()
      ..realtimeResult = const Result.success(<String, RealtimeQuote>{
        '005930': RealtimeQuote(
          symbol: '005930',
          currentPrice: 70000,
          previousClose: 69000,
          openPrice: 69500,
          highPrice: 71000,
          lowPrice: 68000,
          accumulatedTradingVolume: 100000,
          countOfListedStock: 1000,
        ),
        '035720': RealtimeQuote(
          symbol: '035720',
          currentPrice: 50000,
          previousClose: 51000,
          openPrice: 50500,
          highPrice: 51500,
          lowPrice: 49500,
          accumulatedTradingVolume: 200000,
          countOfListedStock: 2000,
        ),
      });
    final WatchlistViewModel viewModel = WatchlistViewModel(
      watchWatchlistStocksUseCase: WatchWatchlistStocksUseCase(
        repository: watchlistRepository,
      ),
      getRealtimeQuotesUseCase: GetRealtimeQuotesUseCase(
        repository: stockRepository,
      ),
    );

    viewModel.onAction(const WatchlistAction.load());
    await _flushMicrotasks();

    expect(stockRepository.receivedSymbols, <String>['005930', '035720']);
    expect(
      viewModel.state.quotes.keys,
      containsAll(<String>['005930', '035720']),
    );
    expect(viewModel.state.isRefreshing, isFalse);
    viewModel.dispose();
  });

  test('정렬 액션은 시세가 없는 종목을 뒤로 두고 결정적으로 정렬한다', () async {
    final InMemoryWatchlistRepositoryImpl watchlistRepository =
        InMemoryWatchlistRepositoryImpl(
          initialStocks: const <StockMetadata>[kakao, samsung],
        );
    final FakeStockRepository stockRepository = FakeStockRepository()
      ..realtimeResult = const Result.success(<String, RealtimeQuote>{
        '005930': RealtimeQuote(
          symbol: '005930',
          currentPrice: 70000,
          previousClose: 69000,
          openPrice: 69500,
          highPrice: 71000,
          lowPrice: 68000,
          accumulatedTradingVolume: 100000,
          countOfListedStock: 1000,
        ),
      });
    final WatchlistViewModel viewModel = WatchlistViewModel(
      watchWatchlistStocksUseCase: WatchWatchlistStocksUseCase(
        repository: watchlistRepository,
      ),
      getRealtimeQuotesUseCase: GetRealtimeQuotesUseCase(
        repository: stockRepository,
      ),
    );
    viewModel.onAction(const WatchlistAction.load());
    await _flushMicrotasks();

    viewModel.onAction(
      const WatchlistAction.selectSort(WatchlistSort.currentPrice),
    );

    expect(viewModel.state.sort, WatchlistSort.currentPrice);
    expect(
      viewModel.state.stocks.map((StockMetadata stock) => stock.symbol),
      <String>['005930', '035720'],
    );
    viewModel.dispose();
  });
}

Future<void> _flushMicrotasks() async {
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}
