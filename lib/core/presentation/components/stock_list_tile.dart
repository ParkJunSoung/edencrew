import 'package:flutter/material.dart';

import '../../../domain/model/realtime_quote.dart';
import '../../../domain/model/stock_metadata.dart';
import '../../../theme/theme.dart';
import '../formatters/stock_number_formatter.dart';

class StockListTile extends StatelessWidget {
  const StockListTile({super.key, required this.stock, this.quote, this.onTap});

  final StockMetadata stock;
  final RealtimeQuote? quote;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppDimens dimens = context.dimens;
    return Semantics(
      button: onTap != null,
      label: '${stock.name}, ${stock.symbol}, ${stock.exchangeName}',
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: dimens.rowMinHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: dimens.space4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        stock.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontSize: 14,
                          fontWeight: AppTypography.medium,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(height: dimens.space1),
                      Text(
                        '${stock.symbol} · ${stock.exchangeName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colors.textTertiary,
                          fontSize: 10,
                          fontWeight: AppTypography.regular,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: dimens.space3),
                if (quote case final RealtimeQuote value)
                  _QuoteSummary(quote: value)
                else
                  const _QuoteSkeleton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QuoteSummary extends StatelessWidget {
  const _QuoteSummary({required this.quote});

  final RealtimeQuote quote;

  @override
  Widget build(BuildContext context) {
    final Color changeColor = quote.changeAmount > 0
        ? context.colors.priceUpText
        : quote.changeAmount < 0
        ? context.colors.priceDownText
        : context.colors.priceFlatText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          StockNumberFormatter.integer(quote.currentPrice),
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 14,
            fontWeight: AppTypography.medium,
            height: 1.25,
          ),
        ),
        SizedBox(height: context.dimens.space1),
        Text(
          '${StockNumberFormatter.integer(quote.changeAmount, showPlus: true)} '
          '(${StockNumberFormatter.percentage(quote.changeRate, showPlus: true)})',
          style: TextStyle(
            color: changeColor,
            fontSize: 10,
            fontWeight: AppTypography.regular,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class _QuoteSkeleton extends StatelessWidget {
  const _QuoteSkeleton();

  @override
  Widget build(BuildContext context) {
    final Color color = context.colors.feedbackSkeleton;
    return Semantics(
      label: '시세 불러오는 중',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 64,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(context.dimens.radiusSm),
            ),
          ),
          SizedBox(height: context.dimens.space2),
          Container(
            width: 48,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(context.dimens.radiusSm),
            ),
          ),
        ],
      ),
    );
  }
}
