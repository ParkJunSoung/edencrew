// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockSearchResult _$StockSearchResultFromJson(Map<String, dynamic> json) =>
    _StockSearchResult(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      exchangeName: json['exchangeName'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$StockSearchResultToJson(_StockSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'exchangeName': instance.exchangeName,
      'category': instance.category,
    };
