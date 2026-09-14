import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_quote.freezed.dart';
part 'realtime_quote.g.dart';

@freezed
abstract class RealtimeQuote with _$RealtimeQuote {
  const RealtimeQuote._();

  const factory RealtimeQuote({
    required String symbol,
    required int currentPrice,
    int? previousClose,
    required int openPrice,
    required int highPrice,
    required int lowPrice,
    required int accumulatedTradingVolume,
    required int countOfListedStock,
  }) = _RealtimeQuote;

  factory RealtimeQuote.fromJson(Map<String, Object?> json) =>
      _$RealtimeQuoteFromJson(json);

  int get changeAmount =>
      previousClose == null ? 0 : currentPrice - previousClose!;

  double get changeRate {
    final int? close = previousClose;
    if (close == null || close == 0) {
      return 0;
    }
    return (currentPrice - close) / close;
  }

  int get marketCap => currentPrice * countOfListedStock;
}
