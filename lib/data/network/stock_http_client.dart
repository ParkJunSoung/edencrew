class StockHttpResponse {
  const StockHttpResponse({
    required this.statusCode,
    required this.headers,
    required this.bodyBytes,
  });

  final int statusCode;
  final Map<String, String> headers;
  final List<int> bodyBytes;
}

abstract interface class StockHttpClient {
  Future<StockHttpResponse> get(Uri uri);
}
