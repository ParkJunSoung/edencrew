// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockMetadata _$StockMetadataFromJson(Map<String, dynamic> json) =>
    _StockMetadata(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      exchangeName: json['exchangeName'] as String,
    );

Map<String, dynamic> _$StockMetadataToJson(_StockMetadata instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'exchangeName': instance.exchangeName,
    };
