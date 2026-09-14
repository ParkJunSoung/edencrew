// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_prices_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyPricesResult _$DailyPricesResultFromJson(Map<String, dynamic> json) =>
    _DailyPricesResult(
      prices: (json['prices'] as List<dynamic>)
          .map((e) => DailyPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['lastPage'] as num).toInt(),
      loadedPages: (json['loadedPages'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$DailyPricesResultToJson(_DailyPricesResult instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'lastPage': instance.lastPage,
      'loadedPages': instance.loadedPages,
      'hasMore': instance.hasMore,
    };
