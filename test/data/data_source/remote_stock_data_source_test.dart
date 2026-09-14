import 'dart:async';
import 'dart:convert';

import 'package:edencrew_assignment_starter/core/domain/error/result.dart';
import 'package:edencrew_assignment_starter/data/cache/daily_price_page_cache.dart';
import 'package:edencrew_assignment_starter/data/data_source/remote/remote_stock_data_source_impl.dart';
import 'package:edencrew_assignment_starter/data/dto/daily_price_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/realtime_quote_dto.dart';
import 'package:edencrew_assignment_starter/data/dto/stock_search_dto.dart';
import 'package:edencrew_assignment_starter/data/network/stock_http_client.dart';
import 'package:edencrew_assignment_starter/domain/error/stock_data_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('search query is safely encoded with the documented target', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => _jsonResponse('{"items":[]}'),
    );
    final source = _source(client);

    await source.searchStocks('삼성 전자&우');

    expect(client.uris, hasLength(1));
    expect(client.uris.single.host, 'ac.stock.naver.com');
    expect(client.uris.single.path, '/ac');
    expect(client.uris.single.queryParameters['q'], '삼성 전자&우');
    expect(
      client.uris.single.queryParameters['target'],
      'stock,ipo,index,marketindicator',
    );
  });

  test('multiple unique symbols use one realtime request', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => _jsonResponse('''
        {"result":{"areas":[{"name":"SERVICE_ITEM","datas":[
          {"cd":"005930","nv":70000,"pcv":69000},
          {"cd":"000660","nv":120000,"pcv":121000}
        ]}]}}
      '''),
    );
    final source = _source(client);

    final result = await source.getRealtimeQuotes(<String>[
      '005930',
      '000660',
      '005930',
    ]);

    expect(client.uris, hasLength(1));
    expect(
      client.uris.single.queryParameters['query'],
      'SERVICE_ITEM:005930,000660',
    );
    expect(
      (result as ResultSuccess<List<RealtimeQuoteDto>, StockDataError>).data,
      hasLength(2),
    );
  });

  test('empty realtime symbol list does not make a request', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => throw StateError('must not be called'),
    );
    final source = _source(client);

    final result = await source.getRealtimeQuotes(const <String>[]);

    expect(client.uris, isEmpty);
    expect(
      (result as ResultSuccess<List<RealtimeQuoteDto>, StockDataError>).data,
      isEmpty,
    );
  });

  test('invalid metadata symbol is rejected before request', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => throw StateError('must not be called'),
    );
    final source = _source(client);

    final result = await source.getStockMetadata('A05930');

    expect(client.uris, isEmpty);
    expect(
      (result as ResultError<Object, StockDataError>).error,
      StockDataError.invalidSymbol,
    );
  });

  test('page below one is rejected before request', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => throw StateError('must not be called'),
    );
    final source = _source(client);

    final result = await source.getDailyPricePage(symbol: '005930', page: 0);

    expect(client.uris, isEmpty);
    expect(
      (result as ResultError<DailyPricePageDto, StockDataError>).error,
      StockDataError.invalidPage,
    );
  });

  test('simultaneous requests for the same page share one HTTP call', () async {
    final Completer<StockHttpResponse> completer = Completer();
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => completer.future,
    );
    final source = _source(client);

    final first = source.getDailyPricePage(symbol: '005930', page: 1);
    final second = source.getDailyPricePage(symbol: '005930', page: 1);
    completer.complete(_htmlResponse(_dailyHtml(lastPage: 2)));
    final results = await Future.wait(<Future<Object>>[first, second]);

    expect(client.uris, hasLength(1));
    expect(results, everyElement(isA<ResultSuccess<Object, StockDataError>>()));
  });

  test('known lastPage prevents later out-of-range requests', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => _htmlResponse(_dailyHtml(lastPage: 2)),
    );
    final source = _source(client);

    await source.getDailyPricePage(symbol: '005930', page: 1);
    final result = await source.getDailyPricePage(symbol: '005930', page: 3);

    expect(client.uris, hasLength(1));
    expect(
      (result as ResultError<DailyPricePageDto, StockDataError>).error,
      StockDataError.invalidPage,
    );
  });

  test('malformed JSON is converted to malformedResponse', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => _jsonResponse('{broken'),
    );
    final source = _source(client);

    final result = await source.searchStocks('삼성');

    expect(
      (result as ResultError<List<StockSearchDto>, StockDataError>).error,
      StockDataError.malformedResponse,
    );
  });

  test('malformed HTML is converted to parsing', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => _htmlResponse('<html>broken</html>'),
    );
    final source = _source(client);

    final result = await source.getDailyPricePage(symbol: '005930', page: 1);

    expect(
      (result as ResultError<DailyPricePageDto, StockDataError>).error,
      StockDataError.parsing,
    );
  });

  test('403 and 429 responses are distinguished as blocked', () async {
    final FakeStockHttpClient client = FakeStockHttpClient(
      (_) => const StockHttpResponse(
        statusCode: 429,
        headers: <String, String>{},
        bodyBytes: <int>[],
      ),
    );
    final source = _source(client);

    final result = await source.searchStocks('삼성');

    expect(
      (result as ResultError<List<StockSearchDto>, StockDataError>).error,
      StockDataError.blocked,
    );
  });
}

RemoteStockDataSourceImpl _source(FakeStockHttpClient client) =>
    RemoteStockDataSourceImpl(
      httpClient: client,
      dailyPricePageCache: MemoryDailyPricePageCache(),
    );

StockHttpResponse _jsonResponse(String source) => StockHttpResponse(
  statusCode: 200,
  headers: const <String, String>{
    'content-type': 'application/json; charset=utf-8',
  },
  bodyBytes: utf8.encode(source),
);

StockHttpResponse _htmlResponse(String source) => StockHttpResponse(
  statusCode: 200,
  headers: const <String, String>{'content-type': 'text/html; charset=utf-8'},
  bodyBytes: utf8.encode(source),
);

String _dailyHtml({required int lastPage}) =>
    '''
  <table class="type2">
    <tr>
      <td>2026.09.11</td><td>70,000</td><td>1,000</td>
      <td>69,000</td><td>71,000</td><td>68,000</td><td>1,234,567</td>
    </tr>
  </table>
  <table class="Nnavi"><tr><td><a href="?page=$lastPage">$lastPage</a></td></tr></table>
''';

class FakeStockHttpClient implements StockHttpClient {
  FakeStockHttpClient(this._handler);

  final FutureOr<StockHttpResponse> Function(Uri uri) _handler;
  final List<Uri> uris = <Uri>[];

  @override
  Future<StockHttpResponse> get(Uri uri) async {
    uris.add(uri);
    return _handler(uri);
  }
}
