import 'package:get_it/get_it.dart';

import '../../data/asset/stock_asset_reader.dart';
import '../../data/cache/daily_price_page_cache.dart';
import '../../data/data_source/asset/asset_stock_data_source_impl.dart';
import '../../data/data_source/remote/remote_stock_data_source_impl.dart';
import '../../data/data_source/stock_data_source.dart';
import '../../data/network/default_stock_http_client.dart';
import '../../data/network/stock_http_client.dart';
import '../../data/repository/in_memory_watchlist_repository_impl.dart';
import '../../data/repository/stock_repository_impl.dart';
import '../../domain/repository/stock_repository.dart';
import '../../domain/repository/watchlist_repository.dart';
import '../../domain/use_case/get_daily_prices_use_case.dart';
import '../../domain/use_case/get_realtime_quotes_use_case.dart';
import '../../domain/use_case/get_stock_metadata_use_case.dart';
import '../../domain/use_case/search_domestic_stocks_use_case.dart';
import '../../domain/use_case/toggle_watchlist_stock_use_case.dart';
import '../../domain/use_case/watch_watchlist_stocks_use_case.dart';
import '../../presentation/stock/stock_data_view_model.dart';
import '../../presentation/search/search_view_model.dart';
import '../../presentation/stock_detail/stock_detail_view_model.dart';
import '../../presentation/watchlist/watchlist_view_model.dart';
import '../../domain/model/stock_metadata.dart';

final GetIt getIt = GetIt.instance;

void diSetup({bool useMockData = false}) {
  // 1. HTTP client and source infrastructure.
  getIt.registerSingleton<StockHttpClient>(DefaultStockHttpClient());
  getIt.registerSingleton<DailyPricePageCache>(MemoryDailyPricePageCache());
  getIt.registerSingleton<StockAssetReader>(const RootBundleStockAssetReader());

  // 2. DataSource.
  getIt.registerSingleton<StockDataSource>(
    useMockData
        ? AssetStockDataSourceImpl(
            assetReader: getIt<StockAssetReader>(),
            dailyPricePageCache: getIt<DailyPricePageCache>(),
          )
        : RemoteStockDataSourceImpl(
            httpClient: getIt<StockHttpClient>(),
            dailyPricePageCache: getIt<DailyPricePageCache>(),
          ),
  );

  // 3. Repository.
  getIt.registerSingleton<StockRepository>(
    StockRepositoryImpl(dataSource: getIt<StockDataSource>()),
  );
  getIt.registerSingleton<WatchlistRepository>(
    InMemoryWatchlistRepositoryImpl(),
  );

  // 4. UseCases.
  getIt.registerSingleton<SearchDomesticStocksUseCase>(
    SearchDomesticStocksUseCase(repository: getIt<StockRepository>()),
  );
  getIt.registerSingleton<GetRealtimeQuotesUseCase>(
    GetRealtimeQuotesUseCase(repository: getIt<StockRepository>()),
  );
  getIt.registerSingleton<GetStockMetadataUseCase>(
    GetStockMetadataUseCase(repository: getIt<StockRepository>()),
  );
  getIt.registerSingleton<GetDailyPricesUseCase>(
    GetDailyPricesUseCase(repository: getIt<StockRepository>()),
  );
  getIt.registerSingleton<WatchWatchlistStocksUseCase>(
    WatchWatchlistStocksUseCase(repository: getIt<WatchlistRepository>()),
  );
  getIt.registerSingleton<ToggleWatchlistStockUseCase>(
    ToggleWatchlistStockUseCase(repository: getIt<WatchlistRepository>()),
  );

  // 5. ViewModel.
  getIt.registerFactory<StockDataViewModel>(
    () => StockDataViewModel(
      searchDomesticStocksUseCase: getIt<SearchDomesticStocksUseCase>(),
      getRealtimeQuotesUseCase: getIt<GetRealtimeQuotesUseCase>(),
      getStockMetadataUseCase: getIt<GetStockMetadataUseCase>(),
      getDailyPricesUseCase: getIt<GetDailyPricesUseCase>(),
    ),
  );
  getIt.registerFactory<WatchlistViewModel>(
    () => WatchlistViewModel(
      watchWatchlistStocksUseCase: getIt<WatchWatchlistStocksUseCase>(),
      getRealtimeQuotesUseCase: getIt<GetRealtimeQuotesUseCase>(),
    ),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      searchDomesticStocksUseCase: getIt<SearchDomesticStocksUseCase>(),
      watchWatchlistStocksUseCase: getIt<WatchWatchlistStocksUseCase>(),
      toggleWatchlistStockUseCase: getIt<ToggleWatchlistStockUseCase>(),
    ),
  );
  getIt.registerFactoryParam<StockDetailViewModel, StockMetadata, void>(
    (StockMetadata stock, void _) => StockDetailViewModel(
      stock: stock,
      getRealtimeQuotesUseCase: getIt<GetRealtimeQuotesUseCase>(),
      getDailyPricesUseCase: getIt<GetDailyPricesUseCase>(),
      watchWatchlistStocksUseCase: getIt<WatchWatchlistStocksUseCase>(),
      toggleWatchlistStockUseCase: getIt<ToggleWatchlistStockUseCase>(),
    ),
  );
}
