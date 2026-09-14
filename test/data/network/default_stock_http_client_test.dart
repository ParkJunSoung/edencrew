import 'dart:async';

import 'package:edencrew_assignment_starter/data/network/default_stock_http_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('네이버가 정상 HTML을 반환하도록 User-Agent를 포함한다', () async {
    final RecordingHttpClient recordingClient = RecordingHttpClient();
    final DefaultStockHttpClient client = DefaultStockHttpClient(
      client: recordingClient,
      userAgent: 'test-browser-agent',
    );

    await client.get(
      Uri.https('finance.naver.com', '/item/sise_day.naver', <String, String>{
        'code': '005930',
        'page': '1',
      }),
    );

    expect(
      recordingClient.request?.headers['user-agent'],
      'test-browser-agent',
    );
  });
}

class RecordingHttpClient extends http.BaseClient {
  http.BaseRequest? request;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    this.request = request;
    return http.StreamedResponse(const Stream<List<int>>.empty(), 200);
  }
}
