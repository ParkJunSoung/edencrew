import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_metadata.freezed.dart';
part 'stock_metadata.g.dart';

@freezed
abstract class StockMetadata with _$StockMetadata {
  const factory StockMetadata({
    required String symbol,
    required String name,
    required String exchangeName,
  }) = _StockMetadata;

  factory StockMetadata.fromJson(Map<String, Object?> json) =>
      _$StockMetadataFromJson(json);
}
