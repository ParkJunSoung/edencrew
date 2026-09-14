// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RealtimeQuote _$RealtimeQuoteFromJson(Map<String, dynamic> json) =>
    _RealtimeQuote(
      symbol: json['symbol'] as String,
      currentPrice: (json['currentPrice'] as num).toInt(),
      previousClose: (json['previousClose'] as num?)?.toInt(),
      openPrice: (json['openPrice'] as num).toInt(),
      highPrice: (json['highPrice'] as num).toInt(),
      lowPrice: (json['lowPrice'] as num).toInt(),
      accumulatedTradingVolume: (json['accumulatedTradingVolume'] as num)
          .toInt(),
      countOfListedStock: (json['countOfListedStock'] as num).toInt(),
    );

Map<String, dynamic> _$RealtimeQuoteToJson(_RealtimeQuote instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'currentPrice': instance.currentPrice,
      'previousClose': instance.previousClose,
      'openPrice': instance.openPrice,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'accumulatedTradingVolume': instance.accumulatedTradingVolume,
      'countOfListedStock': instance.countOfListedStock,
    };
