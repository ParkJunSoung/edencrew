import 'package:edencrew_assignment_starter/core/presentation/components/stock_candlestick_chart.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price.dart';
import 'package:edencrew_assignment_starter/domain/model/daily_price_period.dart';
import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/presentation/stock_detail/stock_detail_screen.dart';
import 'package:edencrew_assignment_starter/presentation/stock_detail/stock_detail_view_model.dart';
import 'package:edencrew_assignment_starter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const StockMetadata stock = StockMetadata(
    symbol: '005930',
    name: '삼성전자',
    exchangeName: '코스피',
  );
  const RealtimeQuote quote = RealtimeQuote(
    symbol: '005930',
    currentPrice: 179700,
    previousClose: 180100,
    openPrice: 172100,
    highPrice: 181700,
    lowPrice: 172000,
    accumulatedTradingVolume: 29113000,
    countOfListedStock: 5910000000,
  );
  const StockDetailDailyRow row = StockDetailDailyRow(
    price: DailyPrice(
      localDate: '20260327',
      closePrice: 179700,
      openPrice: 172100,
      highPrice: 181700,
      lowPrice: 172000,
      accumulatedTradingVolume: 29113466,
    ),
    changeAmount: -400,
  );

  testWidgets('상세 시세, 활성 별, 캔들 차트와 선택 기간을 표시한다', (WidgetTester tester) async {
    await tester.pumpWidget(
      _app(
        const StockDetailState(
          stock: stock,
          quote: quote,
          dailyRows: <StockDetailDailyRow>[row],
          isFavorite: true,
        ),
      ),
    );

    expect(find.text('삼성전자'), findsOneWidget);
    expect(find.text('005930 · 코스피'), findsOneWidget);
    expect(find.text('179,700'), findsWidgets);
    expect(find.byTooltip('관심종목에서 삭제'), findsOneWidget);
    expect(find.byType(StockCandlestickChart), findsOneWidget);
    expect(
      find.byKey(const ValueKey<String>('period-oneMonth')),
      findsOneWidget,
    );
  });

  testWidgets('기간 탭을 누르면 선택 액션을 전달한다', (WidgetTester tester) async {
    StockDetailAction? action;
    await tester.pumpWidget(
      _app(
        const StockDetailState(stock: stock),
        onAction: (StockDetailAction value) => action = value,
      ),
    );

    await tester.tap(find.byKey(const ValueKey<String>('period-threeMonths')));

    expect(
      action,
      const StockDetailAction.selectPeriod(DailyPricePeriod.threeMonths),
    );
  });
}

Widget _app(
  StockDetailState state, {
  ValueChanged<StockDetailAction>? onAction,
}) => MaterialApp(
  theme: AppTheme.dark,
  home: StockDetailScreen(
    state: state,
    onAction: onAction ?? (_) {},
    onBack: () {},
  ),
);
