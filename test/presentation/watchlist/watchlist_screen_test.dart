import 'package:edencrew_assignment_starter/domain/model/realtime_quote.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_metadata.dart';
import 'package:edencrew_assignment_starter/presentation/watchlist/watchlist_screen.dart';
import 'package:edencrew_assignment_starter/presentation/watchlist/watchlist_view_model.dart';
import 'package:edencrew_assignment_starter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('빈 관심 화면과 하단 탭을 표시한다', (WidgetTester tester) async {
    await tester.pumpWidget(
      _app(
        WatchlistScreen(
          state: const WatchlistState(),
          onAction: (_) {},
          onTapSort: () {},
        ),
      ),
    );

    expect(find.text('관심 종목이 없습니다'), findsOneWidget);
    expect(find.text('검색 탭에서 종목을 찾아\n별 아이콘을 눌러 추가해 주세요.'), findsOneWidget);
    expect(find.text('관심'), findsNWidgets(2));
    expect(find.text('검색'), findsOneWidget);
  });

  testWidgets('관심 종목의 메타데이터와 파생 시세를 표시한다', (WidgetTester tester) async {
    const StockMetadata stock = StockMetadata(
      symbol: '005930',
      name: '삼성전자',
      exchangeName: '코스피',
    );
    const RealtimeQuote quote = RealtimeQuote(
      symbol: '005930',
      currentPrice: 179700,
      previousClose: 180100,
      openPrice: 180000,
      highPrice: 181000,
      lowPrice: 179000,
      accumulatedTradingVolume: 1000000,
      countOfListedStock: 1000,
    );
    await tester.pumpWidget(
      _app(
        WatchlistScreen(
          state: const WatchlistState(
            stocks: <StockMetadata>[stock],
            quotes: <String, RealtimeQuote>{'005930': quote},
          ),
          onAction: (_) {},
          onTapSort: () {},
        ),
      ),
    );

    expect(find.text('삼성전자'), findsOneWidget);
    expect(find.text('005930 · 코스피'), findsOneWidget);
    expect(find.text('179,700'), findsOneWidget);
    expect(find.text('-400 (-0.22%)'), findsOneWidget);
  });

  testWidgets('정렬과 새로고침 입력을 액션으로 전달한다', (WidgetTester tester) async {
    bool sortTapped = false;
    final List<WatchlistAction> actions = <WatchlistAction>[];
    await tester.pumpWidget(
      _app(
        WatchlistScreen(
          state: const WatchlistState(),
          onAction: actions.add,
          onTapSort: () => sortTapped = true,
        ),
      ),
    );

    await tester.tap(find.text('가나다순'));
    await tester.tap(find.byTooltip('시세 새로고침'));

    expect(sortTapped, isTrue);
    expect(actions.single, const WatchlistAction.refresh());
  });
}

Widget _app(Widget home) => MaterialApp(theme: AppTheme.dark, home: home);
