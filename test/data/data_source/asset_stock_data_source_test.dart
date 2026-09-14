import 'dart:io';

import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/asset/stock_asset_reader.dart';
import 'package:edencrew_assignment_starter/data/cache/daily_price_page_cache.dart';
import 'package:edencrew_assignment_starter/data/data_source/asset/asset_stock_data_source_impl.dart';
import 'package:edencrew_assignment_starter/data/dto/daily_price_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/realtime_quote_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_metadata_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_search_dto.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FileStockAssetReader reader;
  late AssetStockDataSourceImpl source;

  setUp(() {
    reader = FileStockAssetReader();
    source = AssetStockDataSourceImpl(
      assetReader: reader,
      dailyPricePageCache: MemoryDailyPricePageCache(),
    );
  });

  test(
    'asset source runs the search JSON through the production parser',
    () async {
      final result = await source.searchStocks('삼성전자');

      final items =
          (result as ResultSuccess<List<StockSearchDto>, StockDataError>).data;
      expect(items, hasLength(2));
      expect(items.first.code, '005930');
    },
  );

  test('asset source can search by the six-digit symbol', () async {
    final result = await source.searchStocks('005930');

    final items =
        (result as ResultSuccess<List<StockSearchDto>, StockDataError>).data;
    expect(items, hasLength(1));
    expect(items.single.name, '삼성전자');
  });

  test('asset source decodes EUC-KR realtime JSON', () async {
    final result = await source.getRealtimeQuotes(<String>['005930', '000660']);

    final items =
        (result as ResultSuccess<List<RealtimeQuoteDto>, StockDataError>).data;
    expect(items, hasLength(2));
    expect(items.first.currentPrice, 259500);
  });

  test('asset source parses metadata and daily HTML', () async {
    final metadataResult = await source.getStockMetadata('005930');
    final dailyResult = await source.getDailyPricePage(
      symbol: '005930',
      page: 1,
    );

    expect(
      (metadataResult as ResultSuccess<StockMetadataDto, StockDataError>)
          .data
          .stockName,
      '삼성전자',
    );
    expect(
      (dailyResult as ResultSuccess<DailyPricePageDto, StockDataError>)
          .data
          .prices,
      hasLength(10),
    );
  });

  test('asset source page result is reused from memory', () async {
    await source.getDailyPricePage(symbol: '005930', page: 1);
    await source.getDailyPricePage(symbol: '005930', page: 1);

    expect(reader.readCounts['assets/mock/naver_daily_prices_page_1.html'], 1);
  });
}

class FileStockAssetReader implements StockAssetReader {
  final Map<String, int> readCounts = <String, int>{};

  @override
  Future<List<int>> readBytes(String path) {
    readCounts.update(path, (int count) => count + 1, ifAbsent: () => 1);
    return File(path).readAsBytes();
  }
}
