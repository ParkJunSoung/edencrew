import 'dart:convert';
import 'dart:io';

import 'package:edencrew_assignment_starter/data/parser/naver_daily_price_html_parser.dart';
import 'package:edencrew_assignment_starter/data/parser/naver_stock_json_parser.dart';
import 'package:edencrew_assignment_starter/data/parser/stock_response_decoder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const StockResponseDecoder decoder = StockResponseDecoder();
  const NaverStockJsonParser jsonParser = NaverStockJsonParser();
  const NaverDailyPriceHtmlParser htmlParser = NaverDailyPriceHtmlParser();

  group('Naver JSON parser', () {
    test('search response JSON is parsed into DTOs', () async {
      final String source = await File(
        'assets/mock/naver_stock_search.json',
      ).readAsString();

      final items = jsonParser.parseSearch(source);

      expect(items, hasLength(10));
      expect(items.first.code, '005930');
      expect(items.first.name, '삼성전자');
      expect(items.first.nationCode, 'KOR');
      expect(items.first.typeName, '코스피');
    });

    test('realtime response JSON is parsed into multiple DTOs', () async {
      final List<int> bytes = await File(
        'assets/mock/naver_realtime_quotes.json',
      ).readAsBytes();
      final String source = decoder.decode(
        bytes,
        contentType: 'application/json; charset=euc-kr',
      );

      final items = jsonParser.parseRealtimeQuotes(source);

      expect(items.map((item) => item.symbol), <String>['005930', '000660']);
      expect(items.first.currentPrice, 259500);
      expect(items.first.countOfListedStock, 5846278608);
    });

    test('metadata response JSON is parsed', () async {
      final String source = await File(
        'assets/mock/naver_stock_metadata.json',
      ).readAsString();

      final metadata = jsonParser.parseMetadata(source);

      expect(metadata.symbolCode, '005930');
      expect(metadata.stockName, '삼성전자');
      expect(metadata.stockExchangeNameKor, '코스피');
    });

    test('malformed JSON is rejected', () {
      expect(
        () => jsonParser.parseSearch('{not-json'),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('Naver daily price HTML parser', () {
    test('EUC-KR bytes are decoded using response charset', () async {
      final List<int> bytes = await File(
        'assets/mock/naver_daily_prices_page_1.html',
      ).readAsBytes();

      final String source = decoder.decode(
        bytes,
        contentType: 'text/html; charset=euc-kr',
      );

      expect(source, contains('증권'));
      expect(source, contains('날짜'));
    });

    test('EUC-KR is detected from the HTML meta tag', () async {
      final List<int> bytes = await File(
        'assets/mock/naver_daily_prices_page_1.html',
      ).readAsBytes();

      final String source = decoder.decode(bytes);

      expect(source, contains('일별'));
      expect(source, contains('시세'));
    });

    test('daily columns skip previous-day change without shifting', () async {
      final List<int> bytes = await File(
        'assets/mock/naver_daily_prices_page_1.html',
      ).readAsBytes();
      final page = htmlParser.parse(
        decoder.decode(bytes, contentType: 'text/html; charset=euc-kr'),
      );

      expect(page.prices, hasLength(10));
      expect(page.prices.first.closePrice, 259500);
      expect(page.prices.first.openPrice, 258000);
      expect(page.prices.first.highPrice, 261500);
      expect(page.prices.first.lowPrice, 256500);
      expect(page.prices.first.accumulatedTradingVolume, 13938673);
    });

    test('dates are normalized to yyyyMMdd', () async {
      final List<int> bytes = await File(
        'assets/mock/naver_daily_prices_page_1.html',
      ).readAsBytes();
      final page = htmlParser.parse(
        decoder.decode(bytes, contentType: 'text/html; charset=euc-kr'),
      );

      expect(page.prices.first.localDate, '20260911');
    });

    test('lastPage is extracted from the navigation links', () async {
      final List<int> bytes = await File(
        'assets/mock/naver_daily_prices_page_1.html',
      ).readAsBytes();
      final page = htmlParser.parse(
        decoder.decode(bytes, contentType: 'text/html; charset=euc-kr'),
      );

      expect(page.lastPage, 756);
    });

    test('incomplete candidate rows are counted and skipped', () {
      const String source = '''
        <table class="type2"><tr><td>2026.09.11</td><td>1</td></tr></table>
        <table class="Nnavi"><tr><td><a href="?page=1">1</a></td></tr></table>
      ''';

      expect(() => htmlParser.parse(source), throwsA(isA<FormatException>()));
    });

    test('malformed HTML is rejected explicitly', () {
      expect(
        () => htmlParser.parse('<html>${htmlEscape.convert('broken')}</html>'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
