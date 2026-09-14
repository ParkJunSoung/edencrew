import '../../domain/model/daily_price.dart';

class DailyPriceDto {
  const DailyPriceDto({
    required this.localDate,
    required this.closePrice,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.accumulatedTradingVolume,
  });

  final String localDate;
  final int closePrice;
  final int openPrice;
  final int highPrice;
  final int lowPrice;
  final int accumulatedTradingVolume;

  DailyPrice toDomain() => DailyPrice(
    localDate: localDate,
    closePrice: closePrice,
    openPrice: openPrice,
    highPrice: highPrice,
    lowPrice: lowPrice,
    accumulatedTradingVolume: accumulatedTradingVolume,
  );
}

class DailyPricePageDto {
  const DailyPricePageDto({
    required this.prices,
    required this.lastPage,
    required this.skippedRowCount,
  });

  final List<DailyPriceDto> prices;
  final int lastPage;
  final int skippedRowCount;
}
