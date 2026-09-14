import 'package:edencrew_assignment_starter/core/presentation/components/highlighted_match_text.dart';
import 'package:edencrew_assignment_starter/domain/model/stock_search_result.dart';
import 'package:edencrew_assignment_starter/presentation/search/search_screen.dart';
import 'package:edencrew_assignment_starter/presentation/search/search_view_model.dart';
import 'package:edencrew_assignment_starter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const StockSearchResult samsung = StockSearchResult(
    id: 'domestic:005930',
    symbol: '005930',
    name: '삼성전자',
    exchangeName: '코스피',
    category: 'stock',
  );

  testWidgets('검색 전 안내와 검색어가 포함된 빈 결과 문구를 표시한다', (WidgetTester tester) async {
    await tester.pumpWidget(_app(const SearchState()));
    expect(find.text('종목을 검색해 보세요'), findsOneWidget);

    await tester.pumpWidget(_app(const SearchState(query: '구글모비스')));
    expect(find.text('검색 결과가 없습니다'), findsOneWidget);
    expect(find.text('‘구글모비스’와\n일치하는 검색 결과를 찾지 못했습니다.'), findsOneWidget);
  });

  testWidgets('일치한 검색어 색상과 비활성 별을 표시한다', (WidgetTester tester) async {
    await tester.pumpWidget(
      _app(
        const SearchState(query: '삼성', results: <StockSearchResult>[samsung]),
      ),
    );

    final Finder highlightedName = find.descendant(
      of: find.byType(HighlightedMatchText).first,
      matching: find.byType(RichText),
    );
    final RichText richText = tester.widget<RichText>(highlightedName);
    final TextSpan root = richText.text as TextSpan;
    final TextSpan match = root.children!.cast<TextSpan>().firstWhere(
      (TextSpan span) => span.text == '삼성',
    );
    final BuildContext context = tester.element(highlightedName);

    expect(match.style?.color, context.colors.searchHighlight);
    expect(find.byTooltip('관심종목에 추가'), findsOneWidget);
  });

  testWidgets('활성 별을 누르면 삭제 액션을 전달한다', (WidgetTester tester) async {
    SearchAction? action;
    await tester.pumpWidget(
      _app(
        const SearchState(
          query: '삼성',
          results: <StockSearchResult>[samsung],
          favoriteSymbols: <String>{'005930'},
        ),
        onAction: (SearchAction value) => action = value,
      ),
    );

    await tester.tap(find.byTooltip('관심종목에서 삭제'));

    expect(action, const SearchAction.toggleFavorite(samsung));
  });
}

Widget _app(SearchState state, {ValueChanged<SearchAction>? onAction}) =>
    MaterialApp(
      theme: AppTheme.dark,
      home: SearchScreen(
        state: state,
        onAction: onAction ?? (_) {},
        onTapWatchlist: () {},
        onTapStock: (_) {},
      ),
    );
