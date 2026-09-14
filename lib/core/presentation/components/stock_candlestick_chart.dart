import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../domain/model/daily_price.dart';
import '../../../theme/theme.dart';

class StockCandlestickChart extends StatelessWidget {
  const StockCandlestickChart({
    super.key,
    required this.prices,
    this.height = 164,
  });

  final List<DailyPrice> prices;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (prices.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            '시세 데이터가 없습니다',
            style: TextStyle(
              color: context.colors.textTertiary,
              fontSize: 12,
              fontWeight: AppTypography.regular,
            ),
          ),
        ),
      );
    }
    return Semantics(
      label: '${prices.length}거래일 캔들 차트',
      image: true,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: CustomPaint(
          painter: _CandlestickPainter(
            prices: prices,
            upColor: context.colors.chartLineUp,
            downColor: context.colors.chartLineDown,
            flatColor: context.colors.chartLineFlat,
          ),
        ),
      ),
    );
  }
}

class _CandlestickPainter extends CustomPainter {
  const _CandlestickPainter({
    required this.prices,
    required this.upColor,
    required this.downColor,
    required this.flatColor,
  });

  final List<DailyPrice> prices;
  final Color upColor;
  final Color downColor;
  final Color flatColor;

  @override
  void paint(Canvas canvas, Size size) {
    final List<DailyPrice> chronological = prices.reversed.toList(
      growable: false,
    );
    final int highest = chronological
        .map((DailyPrice price) => price.highPrice)
        .reduce(math.max);
    final int lowest = chronological
        .map((DailyPrice price) => price.lowPrice)
        .reduce(math.min);
    final double range = math.max(1, highest - lowest).toDouble();
    final double slotWidth = size.width / chronological.length;
    final double bodyWidth = math.min(6, math.max(2, slotWidth * 0.52));

    double yFor(int value) =>
        ((highest - value) / range) * math.max(1, size.height - 8) + 4;

    for (int index = 0; index < chronological.length; index++) {
      final DailyPrice price = chronological[index];
      final double centerX = slotWidth * (index + 0.5);
      final double openY = yFor(price.openPrice);
      final double closeY = yFor(price.closePrice);
      final Color color = price.closePrice > price.openPrice
          ? upColor
          : price.closePrice < price.openPrice
          ? downColor
          : flatColor;
      final Paint paint = Paint()
        ..color = color
        ..strokeWidth = 1;
      canvas.drawLine(
        Offset(centerX, yFor(price.highPrice)),
        Offset(centerX, yFor(price.lowPrice)),
        paint,
      );
      final double bodyTop = math.min(openY, closeY);
      final double bodyHeight = math.max(1.5, (openY - closeY).abs());
      canvas.drawRect(
        Rect.fromLTWH(centerX - bodyWidth / 2, bodyTop, bodyWidth, bodyHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CandlestickPainter oldDelegate) {
    return oldDelegate.prices != prices ||
        oldDelegate.upColor != upColor ||
        oldDelegate.downColor != downColor ||
        oldDelegate.flatColor != flatColor;
  }
}
