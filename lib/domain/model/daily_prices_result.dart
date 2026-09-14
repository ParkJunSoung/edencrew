import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_price.dart';

part 'daily_prices_result.freezed.dart';
part 'daily_prices_result.g.dart';

/// [prices] is always normalized to newest date first.
@freezed
abstract class DailyPricesResult with _$DailyPricesResult {
  const factory DailyPricesResult({
    required List<DailyPrice> prices,
    required int lastPage,
    required int loadedPages,
    required bool hasMore,
  }) = _DailyPricesResult;

  factory DailyPricesResult.fromJson(Map<String, Object?> json) =>
      _$DailyPricesResultFromJson(json);
}
