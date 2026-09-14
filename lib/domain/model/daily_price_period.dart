enum DailyPricePeriod {
  oneMonth(targetTradingDays: 20, maxPages: 2),
  threeMonths(targetTradingDays: 60, maxPages: 6),
  sixMonths(targetTradingDays: 120, maxPages: 12),
  oneYear(targetTradingDays: 245, maxPages: 25);

  const DailyPricePeriod({
    required this.targetTradingDays,
    required this.maxPages,
  });

  final int targetTradingDays;
  final int maxPages;
}
