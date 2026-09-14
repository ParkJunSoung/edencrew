import 'package:flutter/material.dart';

import '../../core/di/di_setup.dart';
import '../../core/presentation/components/app_bottom_navigation_bar.dart';
import '../../core/presentation/components/app_search_field.dart';
import '../../core/presentation/components/favorite_snack_bar.dart';
import '../../core/presentation/components/highlighted_match_text.dart';
import '../../domain/model/stock_metadata.dart';
import '../../domain/model/stock_search_result.dart';
import '../../theme/theme.dart';
import 'search_view_model.dart';

class SearchRoot extends StatefulWidget {
  const SearchRoot({
    super.key,
    required this.isActive,
    required this.onTapWatchlist,
    required this.onTapStock,
  });

  final bool isActive;
  final VoidCallback onTapWatchlist;
  final ValueChanged<StockMetadata> onTapStock;

  @override
  State<SearchRoot> createState() => _SearchRootState();
}

class _SearchRootState extends State<SearchRoot> {
  late final SearchViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<SearchViewModel>();
    _viewModel.onAction(const SearchAction.load());
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
      builder: (BuildContext context, Widget? child) => SearchScreen(
        state: _viewModel.state,
        onAction: (SearchAction action) => _onAction(context, action),
        autofocus: widget.isActive,
        onTapWatchlist: widget.onTapWatchlist,
        onTapStock: (StockSearchResult stock) => widget.onTapStock(
          StockMetadata(
            symbol: stock.symbol,
            name: stock.name,
            exchangeName: stock.exchangeName,
          ),
        ),
      ),
    );
  }

  void _onAction(BuildContext context, SearchAction action) {
    if (action case ToggleSearchFavorite(:final stock)) {
      final bool willBeFavorite = !_viewModel.state.favoriteSymbols.contains(
        stock.symbol,
      );
      _viewModel.onAction(action);
      showFavoriteSnackBar(context, isFavorite: willBeFavorite);
      return;
    }

    _viewModel.onAction(action);
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.state,
    required this.onAction,
    required this.onTapWatchlist,
    required this.onTapStock,
    this.autofocus = true,
  });

  final SearchState state;
  final ValueChanged<SearchAction> onAction;
  final VoidCallback onTapWatchlist;
  final ValueChanged<StockSearchResult> onTapStock;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.dimens.space4,
                context.dimens.space4,
                context.dimens.space4,
                context.dimens.space3,
              ),
              child: AppSearchField(
                value: state.query,
                autofocus: autofocus,
                onChanged: (String query) =>
                    onAction(SearchAction.queryChanged(query)),
              ),
            ),
            if (state.isSearching)
              LinearProgressIndicator(
                minHeight: context.dimens.borderHairline,
                color: context.colors.accentDefault,
                backgroundColor: context.colors.surfaceBase,
              ),
            Expanded(
              child: _SearchBody(
                state: state,
                onAction: onAction,
                onTapStock: onTapStock,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: 1,
        onTap: (int index) {
          if (index == 0) onTapWatchlist();
        },
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody({
    required this.state,
    required this.onAction,
    required this.onTapStock,
  });

  final SearchState state;
  final ValueChanged<SearchAction> onAction;
  final ValueChanged<StockSearchResult> onTapStock;

  @override
  Widget build(BuildContext context) {
    if (state.query.isEmpty) return const _SearchGuide();
    if (!state.isSearching && state.results.isEmpty) {
      return _NoSearchResult(query: state.query, hasError: state.error != null);
    }
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: state.results.length,
      itemBuilder: (BuildContext context, int index) {
        final StockSearchResult stock = state.results[index];
        return _SearchResultTile(
          key: ValueKey<String>(stock.id),
          stock: stock,
          query: state.query,
          isFavorite: state.favoriteSymbols.contains(stock.symbol),
          onTap: () => onTapStock(stock),
          onToggleFavorite: () => onAction(SearchAction.toggleFavorite(stock)),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: context.dimens.borderHairline,
        thickness: context.dimens.borderHairline,
        indent: context.dimens.space4,
        endIndent: context.dimens.space4,
        color: context.colors.borderSubtle,
      ),
    );
  }
}

class _SearchGuide extends StatelessWidget {
  const _SearchGuide();

  @override
  Widget build(BuildContext context) {
    return _SearchMessage(
      icon: Icons.search_rounded,
      title: '종목을 검색해 보세요',
      description: '종목명 또는 종목코드 6자리로\n검색하실 수 있습니다.',
    );
  }
}

class _NoSearchResult extends StatelessWidget {
  const _NoSearchResult({required this.query, required this.hasError});

  final String query;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return _SearchMessage(
      icon: Icons.search_off_rounded,
      title: hasError ? '검색 결과를 불러오지 못했습니다' : '검색 결과가 없습니다',
      description: hasError
          ? '잠시 후 다시 검색해 주세요.'
          : '‘$query’와\n일치하는 검색 결과를 찾지 못했습니다.',
    );
  }
}

class _SearchMessage extends StatelessWidget {
  const _SearchMessage({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.dimens.space6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 40, color: context.colors.textTertiary),
            SizedBox(height: context.dimens.space3),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.textSecondary,
                fontSize: 19,
                fontWeight: AppTypography.bold,
              ),
            ),
            SizedBox(height: context.dimens.space2),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.textTertiary,
                fontSize: 11,
                fontWeight: AppTypography.regular,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  const _SearchResultTile({
    super.key,
    required this.stock,
    required this.query,
    required this.isFavorite,
    required this.onTap,
    required this.onToggleFavorite,
  });

  final StockSearchResult stock;
  final String query;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: context.dimens.rowMinHeight),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(left: context.dimens.space4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HighlightedMatchText(
                      text: stock.name,
                      query: query,
                      highlightColor: context.colors.searchHighlight,
                      style: TextStyle(
                        color: context.colors.textPrimary,
                        fontSize: 14,
                        fontWeight: AppTypography.medium,
                      ),
                    ),
                    SizedBox(height: context.dimens.space1),
                    HighlightedMatchText(
                      text: '${stock.symbol} · ${stock.exchangeName}',
                      query: query,
                      highlightColor: context.colors.searchHighlight,
                      style: TextStyle(
                        color: context.colors.textTertiary,
                        fontSize: 10,
                        fontWeight: AppTypography.regular,
                      ),
                    ),
                  ],
                ),
              ),
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
          SizedBox(width: context.dimens.space2),
        ],
      ),
    );
  }
}
