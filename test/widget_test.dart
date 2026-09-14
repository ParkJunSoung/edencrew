import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:edencrew_assignment_starter/core/di/di_setup.dart';
import 'package:edencrew_assignment_starter/main.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    diSetup(useMockData: true);
  });

  tearDown(() async => getIt.reset());

  testWidgets('관심 화면이 다크 테마로 렌더링된다', (WidgetTester tester) async {
    await tester.pumpWidget(const EdencrewAssignmentApp());
    await tester.pump();

    expect(find.text('관심 종목이 없습니다'), findsOneWidget);
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );
  });

  testWidgets('정렬 버튼은 현재 선택값이 표시된 바텀시트를 연다', (WidgetTester tester) async {
    await tester.pumpWidget(const EdencrewAssignmentApp());
    await tester.pump();

    await tester.tap(find.text('가나다순'));
    await tester.pumpAndSettle();

    expect(find.text('정렬'), findsOneWidget);
    expect(find.text('현재가순'), findsOneWidget);
    expect(find.text('등락률순'), findsOneWidget);
    expect(find.text('가나다순'), findsNWidgets(2));
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);

    await tester.tap(find.text('현재가순'));
    await tester.pumpAndSettle();

    expect(find.text('현재가순'), findsOneWidget);
    expect(find.text('가나다순'), findsNothing);
  });

  testWidgets('검색, 관심 추가, 상세, 관심목록이 하나의 상태로 연결된다', (WidgetTester tester) async {
    await tester.pumpWidget(const EdencrewAssignmentApp());
    await tester.pump();

    await tester.tap(find.text('검색'));
    await tester.pumpAndSettle();
    expect(find.text('종목을 검색해 보세요'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '삼성');
    await tester.pumpAndSettle();
    final Finder samsungResult = find.bySemanticsLabel(RegExp('삼성전자'));
    expect(samsungResult, findsWidgets);

    await tester.tap(find.byTooltip('관심종목에 추가').first);
    await tester.pump();
    expect(find.byTooltip('관심종목에서 삭제'), findsOneWidget);

    await tester.tap(samsungResult.first);
    await tester.pumpAndSettle();
    expect(find.text('005930 · 코스피'), findsOneWidget);
    expect(find.byTooltip('관심종목에서 삭제'), findsOneWidget);

    await tester.tap(find.byTooltip('뒤로'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('관심'));
    await tester.pumpAndSettle();
    expect(find.text('005930 · 코스피'), findsOneWidget);
  });
}
