// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyPrice _$DailyPriceFromJson(Map<String, dynamic> json) => _DailyPrice(
  localDate: json['localDate'] as String,
  closePrice: (json['closePrice'] as num).toInt(),
  openPrice: (json['openPrice'] as num).toInt(),
  highPrice: (json['highPrice'] as num).toInt(),
  lowPrice: (json['lowPrice'] as num).toInt(),
  accumulatedTradingVolume: (json['accumulatedTradingVolume'] as num).toInt(),
);

Map<String, dynamic> _$DailyPriceToJson(_DailyPrice instance) =>
    <String, dynamic>{
      'localDate': instance.localDate,
      'closePrice': instance.closePrice,
      'openPrice': instance.openPrice,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'accumulatedTradingVolume': instance.accumulatedTradingVolume,
    };
