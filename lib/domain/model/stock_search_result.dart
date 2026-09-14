import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_search_result.freezed.dart';
part 'stock_search_result.g.dart';

@freezed
abstract class StockSearchResult with _$StockSearchResult {
  const factory StockSearchResult({
    required String id,
    required String symbol,
    required String name,
    required String exchangeName,
    required String category,
  }) = _StockSearchResult;

  factory StockSearchResult.fromJson(Map<String, Object?> json) =>
      _$StockSearchResultFromJson(json);
}
