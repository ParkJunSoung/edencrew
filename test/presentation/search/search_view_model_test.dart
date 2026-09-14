import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/repository/in_memory_watchlist_repository_impl.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_search_result.dart';
import 'package:edencrew_assignment_starter/domain/use_case/search_domestic_stocks_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/toggle_watchlist_stock_use_case.dart';
import 'package:edencrew_assignment_starter/domain/use_case/watch_watchlist_stocks_use_case.dart';
import 'package:edencrew_assignment_starter/presentation/search/search_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/fake_stock_repository.dart';

void main() {
  const StockSearchResult samsung = StockSearchResult(
    id: 'domestic:005930',
    symbol: '005930',
    name: '삼성전자',
    exchangeName: '코스피',
    category: 'stock',
  );
  late FakeStockRepository stockRepository;
  late InMemoryWatchlistRepositoryImpl watchlistRepository;
  late SearchViewModel viewModel;

  setUp(() {
    stockRepository = FakeStockRepository()
      ..searchResult = const Result.success(<StockSearchResult>[samsung]);
    watchlistRepository = InMemoryWatchlistRepositoryImpl();
    viewModel = SearchViewModel(
      searchDomesticStocksUseCase: SearchDomesticStocksUseCase(
        repository: stockRepository,
      ),
      watchWatchlistStocksUseCase: WatchWatchlistStocksUseCase(
        repository: watchlistRepository,
      ),
      toggleWatchlistStockUseCase: ToggleWatchlistStockUseCase(
        repository: watchlistRepository,
      ),
    );
    viewModel.onAction(const SearchAction.load());
  });

  tearDown(() => viewModel.dispose());

  test('검색어를 전달하고 mock 검색 결과를 상태에 반영한다', () async {
    viewModel.onAction(const SearchAction.queryChanged('삼성'));
    await pumpEventQueue();

    expect(stockRepository.receivedQuery, '삼성');
    expect(viewModel.state.query, '삼성');
    expect(viewModel.state.results.single, samsung);
    expect(viewModel.state.isSearching, isFalse);
  });

  test('별 액션은 관심종목 추가와 삭제 상태를 스트림으로 동기화한다', () async {
    viewModel.onAction(const SearchAction.toggleFavorite(samsung));
    await pumpEventQueue();
    expect(viewModel.state.favoriteSymbols, contains('005930'));

    viewModel.onAction(const SearchAction.toggleFavorite(samsung));
    await pumpEventQueue();
    expect(viewModel.state.favoriteSymbols, isNot(contains('005930')));
  });
}
