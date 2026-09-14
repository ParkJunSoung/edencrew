import 'package:http/http.dart' as http;

import 'stock_http_client.dart';

class DefaultStockHttpClient implements StockHttpClient {
  DefaultStockHttpClient({
    http.Client? client,
    this.userAgent =
        'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',
  }) : _client = client ?? http.Client();

  final http.Client _client;
  final String userAgent;

  @override
  Future<StockHttpResponse> get(Uri uri) async {
    // Naver Finance returns an HTTP 200 error document instead of the daily
    // price table when a browser-like User-Agent is missing.
    final http.Response response = await _client.get(
      uri,
      headers: <String, String>{'User-Agent': userAgent},
    );
    return StockHttpResponse(
      statusCode: response.statusCode,
      headers: response.headers,
      bodyBytes: response.bodyBytes,
    );
  }
}
