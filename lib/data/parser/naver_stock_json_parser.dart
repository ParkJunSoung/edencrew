import 'dart:convert';

import '../dto/realtime_quote_dto.dart';
import '../dto/stock_metadata_dto.dart';
import '../dto/stock_search_dto.dart';

class NaverStockJsonParser {
  const NaverStockJsonParser();

  List<StockSearchDto> parseSearch(String source) {
    final Map<String, Object?> root = _map(jsonDecode(source));
    final Object? rawItems = root['items'];
    if (rawItems is! List<Object?>) {
      throw const FormatException('Missing search items');
    }
    return rawItems
        .map((Object? item) => StockSearchDto.fromJson(_map(item)))
        .toList(growable: false);
  }

  List<RealtimeQuoteDto> parseRealtimeQuotes(String source) {
    final Map<String, Object?> root = _map(jsonDecode(source));
    final Map<String, Object?> result = _map(root['result']);
    final Object? rawAreas = result['areas'];
    if (rawAreas is! List<Object?>) {
      throw const FormatException('Missing realtime areas');
    }

    Map<String, Object?>? serviceArea;
    for (final Object? rawArea in rawAreas) {
      final Map<String, Object?> area = _map(rawArea);
      if (area['name'] == 'SERVICE_ITEM') {
        serviceArea = area;
        break;
      }
    }
    final Object? rawData = serviceArea?['datas'];
    if (rawData is! List<Object?>) {
      throw const FormatException('Missing SERVICE_ITEM data');
    }
    return rawData
        .map((Object? item) => RealtimeQuoteDto.fromJson(_map(item)))
        .toList(growable: false);
  }

  StockMetadataDto parseMetadata(String source) =>
      StockMetadataDto.fromJson(_map(jsonDecode(source)));
}

Map<String, Object?> _map(Object? value) {
  if (value is! Map<Object?, Object?>) {
    throw const FormatException('Expected JSON object');
  }
  return value.map(
    (Object? key, Object? item) => MapEntry(key.toString(), item),
  );
}
