import 'package:flutter/material.dart';

import '../../core/di/di_setup.dart';
import '../../core/presentation/components/favorite_snack_bar.dart';
import '../../core/presentation/components/stock_candlestick_chart.dart';
import '../../core/presentation/formatters/stock_number_formatter.dart';
import '../../domain/model/daily_price.dart';
import '../../domain/model/daily_price_period.dart';
import '../../domain/model/realtime_quote.dart';
import '../../domain/model/stock_metadata.dart';
import '../../theme/theme.dart';
import 'stock_detail_view_model.dart';

class StockDetailRoot extends StatefulWidget {
  const StockDetailRoot({super.key, required this.stock});

  final StockMetadata stock;

  @override
  State<StockDetailRoot> createState() => _StockDetailRootState();
}

class _StockDetailRootState extends State<StockDetailRoot> {
  late final StockDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<StockDetailViewModel>(param1: widget.stock);
    _viewModel.onAction(const StockDetailAction.load());
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (BuildContext context, Widget? child) => StockDetailScreen(
        state: _viewModel.state,
        onAction: (StockDetailAction action) => _onAction(context, action),
        onBack: () => Navigator.of(context).pop(),
      ),
    );
  }

  void _onAction(BuildContext context, StockDetailAction action) {
    if (action is ToggleDetailFavorite) {
      final bool willBeFavorite = !_viewModel.state.isFavorite;
      _viewModel.onAction(action);
      showFavoriteSnackBar(context, isFavorite: willBeFavorite);
      return;
    }

    _viewModel.onAction(action);
  }
}

class StockDetailScreen extends StatelessWidget {
  const StockDetailScreen({
    super.key,
    required this.state,
    required this.onAction,
    required this.onBack,
  });

  final StockDetailState state;
  final ValueChanged<StockDetailAction> onAction;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _DetailHeader(
              stock: state.stock,
              isFavorite: state.isFavorite,
              onBack: onBack,
              onToggleFavorite: () =>
                  onAction(const StockDetailAction.toggleFavorite()),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  context.dimens.space4,
                  context.dimens.space3,
                  context.dimens.space4,
                  context.dimens.space6,
                ),
                children: <Widget>[
                  _CurrentPrice(quote: state.quote),
                  SizedBox(height: context.dimens.space3),
                  _PeriodTabs(
                    selectedPeriod: state.selectedPeriod,
                    onSelected: (DailyPricePeriod period) =>
                        onAction(StockDetailAction.selectPeriod(period)),
                  ),
                  SizedBox(height: context.dimens.space5),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      StockCandlestickChart(
                        prices: state.dailyRows
                            .map((StockDetailDailyRow row) => row.price)
                            .toList(growable: false),
                      ),
                      if (state.isLoadingDailyPrices && state.dailyRows.isEmpty)
                        CircularProgressIndicator(
                          color: context.colors.accentDefault,
                        ),
                    ],
                  ),
                  SizedBox(height: context.dimens.space5),
                  _QuoteMetrics(quote: state.quote),
                  SizedBox(height: context.dimens.space5),
                  Text(
                    '일별 시세',
                    style: TextStyle(
                      color: context.colors.textPrimary,
                      fontSize: 13,
                      fontWeight: AppTypography.bold,
                    ),
                  ),
                  SizedBox(height: context.dimens.space2),
                  _DailyPriceTable(rows: state.dailyRows),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({
    required this.stock,
    required this.isFavorite,
    required this.onBack,
    required this.onToggleFavorite,
  });

  final StockMetadata stock;
  final bool isFavorite;
  final VoidCallback onBack;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: context.dimens.rowMinHeight),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colors.borderSubtle,
            width: context.dimens.borderHairline,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: onBack,
            tooltip: '뒤로',
            icon: Icon(
              Icons.arrow_back_rounded,
              color: context.colors.textSecondary,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stock.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 14,
                    fontWeight: AppTypography.medium,
                  ),
                ),
                SizedBox(height: context.dimens.space1),
                Text(
                  '${stock.symbol} · ${stock.exchangeName}',
                  style: TextStyle(
                    color: context.colors.textTertiary,
                    fontSize: 10,
                    fontWeight: AppTypography.regular,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onToggleFavorite,
            tooltip: isFavorite ? '관심종목에서 삭제' : '관심종목에 추가',
            icon: Icon(
              isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
              color: isFavorite
                  ? context.colors.favoriteActive
                  : context.colors.favoriteInactive,
            ),
          ),
          SizedBox(width: context.dimens.space1),
        ],
      ),
    );
  }
}

class _CurrentPrice extends StatelessWidget {
  const _CurrentPrice({required this.quote});

  final RealtimeQuote? quote;

  @override
  Widget build(BuildContext context) {
    final RealtimeQuote? value = quote;
    if (value == null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 180,
          height: 30,
          decoration: BoxDecoration(
            color: context.colors.feedbackSkeleton,
            borderRadius: BorderRadius.circular(context.dimens.radiusSm),
          ),
        ),
      );
    }
    final Color changeColor = _changeColor(context, value.changeAmount);
    final String direction = value.changeAmount > 0
        ? '▲ '
        : value.changeAmount < 0
        ? '▼ '
        : '';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          StockNumberFormatter.integer(value.currentPrice),
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 28,
            fontWeight: AppTypography.bold,
            height: 1,
          ),
        ),
        SizedBox(width: context.dimens.space2),
        Padding(
          padding: EdgeInsets.only(bottom: context.dimens.space1),
          child: Text(
            '$direction${StockNumberFormatter.integer(value.changeAmount.abs())} '
            '(${StockNumberFormatter.percentage(value.changeRate)})',
            style: TextStyle(
              color: changeColor,
              fontSize: 13,
              fontWeight: AppTypography.medium,
            ),
          ),
        ),
      ],
    );
  }
}

class _PeriodTabs extends StatelessWidget {
  const _PeriodTabs({required this.selectedPeriod, required this.onSelected});

  final DailyPricePeriod selectedPeriod;
  final ValueChanged<DailyPricePeriod> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (final DailyPricePeriod period in DailyPricePeriod.values)
          Expanded(
            child: Semantics(
              selected: selectedPeriod == period,
              button: true,
              label: _periodLabel(period),
              child: InkWell(
                key: ValueKey<String>('period-${period.name}'),
                onTap: () => onSelected(period),
                borderRadius: BorderRadius.circular(context.dimens.radiusMd),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: context.dimens.space2,
                  ),
                  decoration: BoxDecoration(
                    color: selectedPeriod == period
                        ? context.colors.accentBg
                        : null,
                    borderRadius: BorderRadius.circular(
                      context.dimens.radiusMd,
                    ),
                  ),
                  child: Text(
                    _periodLabel(period),
                    style: TextStyle(
                      color: selectedPeriod == period
                          ? context.colors.accentDefault
                          : context.colors.textTertiary,
                      fontSize: 11,
                      fontWeight: AppTypography.medium,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _QuoteMetrics extends StatelessWidget {
  const _QuoteMetrics({required this.quote});

  final RealtimeQuote? quote;

  @override
  Widget build(BuildContext context) {
    final RealtimeQuote? value = quote;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: _MetricCard(
                label: '시가',
                value: value == null
                    ? '-'
                    : StockNumberFormatter.integer(value.openPrice),
              ),
            ),
            SizedBox(width: context.dimens.space2),
            Expanded(
              child: _MetricCard(
                label: '고가',
                value: value == null
                    ? '-'
                    : StockNumberFormatter.integer(value.highPrice),
              ),
            ),
            SizedBox(width: context.dimens.space2),
            Expanded(
              child: _MetricCard(
                label: '저가',
                value: value == null
                    ? '-'
                    : StockNumberFormatter.integer(value.lowPrice),
              ),
            ),
          ],
        ),
        SizedBox(height: context.dimens.space2),
        Row(
          children: <Widget>[
            Expanded(
              child: _MetricCard(
                label: '거래량',
                value: value == null
                    ? '-'
                    : StockNumberFormatter.integer(
                        value.accumulatedTradingVolume,
                      ),
              ),
            ),
            SizedBox(width: context.dimens.space2),
            Expanded(
              child: _MetricCard(
                label: '시가총액',
                value: value == null
                    ? '-'
                    : StockNumberFormatter.compactKoreanWon(value.marketCap),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.dimens.space3),
      decoration: BoxDecoration(
        color: context.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(context.dimens.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: context.colors.textTertiary,
              fontSize: 10,
              fontWeight: AppTypography.regular,
            ),
          ),
          SizedBox(height: context.dimens.space1),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.colors.textPrimary,
              fontSize: 13,
              fontWeight: AppTypography.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyPriceTable extends StatelessWidget {
  const _DailyPriceTable({required this.rows});

  final List<StockDetailDailyRow> rows;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: context.dimens.space5),
        child: Text(
          '표시할 일별 시세가 없습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.colors.textTertiary,
            fontSize: 11,
            fontWeight: AppTypography.regular,
          ),
        ),
      );
    }
    return Column(
      children: <Widget>[
        const _DailyPriceHeader(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rows.length,
          itemBuilder: (BuildContext context, int index) =>
              _DailyPriceRow(row: rows[index]),
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: context.dimens.borderHairline,
            thickness: context.dimens.borderHairline,
            color: context.colors.borderSubtle,
          ),
        ),
      ],
    );
  }
}

class _DailyPriceHeader extends StatelessWidget {
  const _DailyPriceHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dimens.space2),
      child: Row(
        children: <Widget>[
          _tableCell(context, '날짜', flex: 2, alignment: TextAlign.left),
          _tableCell(context, '종가', flex: 3),
          _tableCell(context, '등락', flex: 2),
          _tableCell(context, '거래량', flex: 3),
        ],
      ),
    );
  }
}

class _DailyPriceRow extends StatelessWidget {
  const _DailyPriceRow({required this.row});

  final StockDetailDailyRow row;

  @override
  Widget build(BuildContext context) {
    final DailyPrice price = row.price;
    final int? changeAmount = row.changeAmount;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dimens.space2),
      child: Row(
        children: <Widget>[
          _tableCell(
            context,
            _shortDate(price.localDate),
            flex: 2,
            alignment: TextAlign.left,
          ),
          _tableCell(
            context,
            StockNumberFormatter.integer(price.closePrice),
            flex: 3,
            color: context.colors.textSecondary,
          ),
          _tableCell(
            context,
            changeAmount == null
                ? '-'
                : StockNumberFormatter.integer(changeAmount, showPlus: true),
            flex: 2,
            color: changeAmount == null
                ? context.colors.textTertiary
                : _changeColor(context, changeAmount),
          ),
          _tableCell(
            context,
            StockNumberFormatter.integer(price.accumulatedTradingVolume),
            flex: 3,
            color: context.colors.textTertiary,
          ),
        ],
      ),
    );
  }
}

Widget _tableCell(
  BuildContext context,
  String text, {
  required int flex,
  TextAlign alignment = TextAlign.right,
  Color? color,
}) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
      style: TextStyle(
        color: color ?? context.colors.textTertiary,
        fontSize: 11,
        fontWeight: AppTypography.regular,
      ),
    ),
  );
}

Color _changeColor(BuildContext context, int value) {
  if (value > 0) return context.colors.priceUpText;
  if (value < 0) return context.colors.priceDownText;
  return context.colors.priceFlatText;
}

String _periodLabel(DailyPricePeriod period) => switch (period) {
  DailyPricePeriod.oneMonth => '1개월',
  DailyPricePeriod.threeMonths => '3개월',
  DailyPricePeriod.sixMonths => '6개월',
  DailyPricePeriod.oneYear => '1년',
};

String _shortDate(String localDate) {
  if (localDate.length != 8) return localDate;
  return '${localDate.substring(4, 6)}.${localDate.substring(6, 8)}';
}
