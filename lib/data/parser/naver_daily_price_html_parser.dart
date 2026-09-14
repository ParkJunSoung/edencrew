import 'package:html/dom.dart';
import 'package:html/parser.dart' as html_parser;

import '../dto/daily_price_dto.dart';

class NaverDailyPriceHtmlParser {
  const NaverDailyPriceHtmlParser();

  DailyPricePageDto parse(String source) {
    final Document document = html_parser.parse(source);
    final Element? priceTable = document.querySelector('table.type2');
    final Element? navigation = document.querySelector('table.Nnavi');
    if (priceTable == null || navigation == null) {
      throw const FormatException('Missing daily price table or navigation');
    }

    final List<DailyPriceDto> prices = <DailyPriceDto>[];
    int skippedRowCount = 0;
    for (final Element row in priceTable.querySelectorAll('tr')) {
      final List<Element> cells = row.querySelectorAll('td');
      if (cells.isEmpty) {
        continue;
      }
      final String rawDate = _text(cells.first);
      if (!RegExp(r'^\d{4}\.\d{2}\.\d{2}$').hasMatch(rawDate)) {
        continue;
      }
      if (cells.length < 7) {
        skippedRowCount++;
        continue;
      }

      final int? closePrice = _price(_text(cells[1]));
      // cells[2] is the previous-day change and is intentionally skipped.
      final int? openPrice = _price(_text(cells[3]));
      final int? highPrice = _price(_text(cells[4]));
      final int? lowPrice = _price(_text(cells[5]));
      final int? volume = _price(_text(cells[6]));
      if (closePrice == null ||
          openPrice == null ||
          highPrice == null ||
          lowPrice == null ||
          volume == null) {
        skippedRowCount++;
        continue;
      }

      prices.add(
        DailyPriceDto(
          localDate: rawDate.replaceAll('.', ''),
          closePrice: closePrice,
          openPrice: openPrice,
          highPrice: highPrice,
          lowPrice: lowPrice,
          accumulatedTradingVolume: volume,
        ),
      );
    }

    if (prices.isEmpty && skippedRowCount > 0) {
      throw const FormatException('All daily price rows were incomplete');
    }

    final Iterable<int> pages = navigation
        .querySelectorAll('a[href]')
        .map((Element anchor) => anchor.attributes['href'])
        .whereType<String>()
        .map((String href) => Uri.tryParse(href)?.queryParameters['page'])
        .whereType<String>()
        .map(int.tryParse)
        .whereType<int>();
    if (pages.isEmpty) {
      throw const FormatException('Missing last page');
    }

    return DailyPricePageDto(
      prices: List<DailyPriceDto>.unmodifiable(prices),
      lastPage: pages.reduce(
        (int left, int right) => left > right ? left : right,
      ),
      skippedRowCount: skippedRowCount,
    );
  }

  String _text(Element element) =>
      element.text.replaceAll(RegExp(r'\s+'), ' ').trim();

  int? _price(String value) => int.tryParse(value.replaceAll(',', '').trim());
}
