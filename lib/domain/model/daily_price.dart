import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_price.freezed.dart';
part 'daily_price.g.dart';

@freezed
abstract class DailyPrice with _$DailyPrice {
  const factory DailyPrice({
    required String localDate,
    required int closePrice,
    required int openPrice,
    required int highPrice,
    required int lowPrice,
    required int accumulatedTradingVolume,
  }) = _DailyPrice;

  factory DailyPrice.fromJson(Map<String, Object?> json) =>
      _$DailyPriceFromJson(json);
}
