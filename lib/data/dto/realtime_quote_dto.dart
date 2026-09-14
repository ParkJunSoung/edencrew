import '../../domain/model/realtime_quote.dart';

class RealtimeQuoteDto {
  const RealtimeQuoteDto({
    required this.symbol,
    required this.currentPrice,
    required this.previousClose,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.accumulatedTradingVolume,
    required this.countOfListedStock,
  });

  factory RealtimeQuoteDto.fromJson(Map<String, Object?> json) {
    final String? symbol = json['cd'] as String?;
    final int? currentPrice = _intFrom(json['nv']);
    if (symbol == null || currentPrice == null) {
      throw const FormatException('Missing realtime quote identity or price');
    }
    return RealtimeQuoteDto(
      symbol: symbol,
      currentPrice: currentPrice,
      previousClose: _intFrom(json['pcv']),
      openPrice: _intFrom(json['ov']) ?? 0,
      highPrice: _intFrom(json['hv']) ?? 0,
      lowPrice: _intFrom(json['lv']) ?? 0,
      accumulatedTradingVolume: _intFrom(json['aq']) ?? 0,
      countOfListedStock: _intFrom(json['countOfListedStock']) ?? 0,
    );
  }

  final String symbol;
  final int currentPrice;
  final int? previousClose;
  final int openPrice;
  final int highPrice;
  final int lowPrice;
  final int accumulatedTradingVolume;
  final int countOfListedStock;

  RealtimeQuote toDomain() => RealtimeQuote(
    symbol: symbol,
    currentPrice: currentPrice,
    previousClose: previousClose,
    openPrice: openPrice,
    highPrice: highPrice,
    lowPrice: lowPrice,
    accumulatedTradingVolume: accumulatedTradingVolume,
    countOfListedStock: countOfListedStock,
  );
}

int? _intFrom(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is num && value.isFinite && value == value.roundToDouble()) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value.replaceAll(',', '').trim());
  }
  return null;
}
