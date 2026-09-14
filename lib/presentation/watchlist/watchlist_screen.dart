import 'package:flutter/material.dart';

import '../../core/di/di_setup.dart';
import '../../core/presentation/components/app_bottom_navigation_bar.dart';
import '../../core/presentation/components/stock_list_tile.dart';
import '../../domain/model/stock_metadata.dart';
import '../../theme/theme.dart';
import 'watchlist_view_model.dart';

class WatchlistRoot extends StatefulWidget {
  const WatchlistRoot({super.key, this.onTapSearch, this.onTapStock});

  final VoidCallback? onTapSearch;
  final ValueChanged<StockMetadata>? onTapStock;

  @override
  State<WatchlistRoot> createState() => _WatchlistRootState();
}

class _WatchlistRootState extends State<WatchlistRoot> {
  late final WatchlistViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<WatchlistViewModel>();
    _viewModel.onAction(const WatchlistAction.load());
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _showSortSheet() async {
    final WatchlistSort? sort = await showModalBottomSheet<WatchlistSort>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) =>
          _WatchlistSortSheet(selectedSort: _viewModel.state.sort),
    );
    if (sort != null) {
      _viewModel.onAction(WatchlistAction.selectSort(sort));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (BuildContext context, Widget? child) {
        return WatchlistScreen(
          state: _viewModel.state,
          onAction: _viewModel.onAction,
          onTapSort: _showSortSheet,
          onTapSearch: widget.onTapSearch,
          onTapStock: widget.onTapStock,
        );
      },
    );
  }
}

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({
    super.key,
    required this.state,
    required this.onAction,
    required this.onTapSort,
    this.onTapSearch,
    this.onTapStock,
  });

  final WatchlistState state;
  final ValueChanged<WatchlistAction> onAction;
  final VoidCallback onTapSort;
  final VoidCallback? onTapSearch;
  final ValueChanged<StockMetadata>? onTapStock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            _WatchlistHeader(
              sort: state.sort,
              isRefreshing: state.isRefreshing,
              onTapSort: onTapSort,
              onRefresh: () => onAction(const WatchlistAction.refresh()),
            ),
            Expanded(
              child: state.stocks.isEmpty
                  ? const _WatchlistEmptyView()
                  : _WatchlistContent(state: state, onTapStock: onTapStock),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: 0,
        onTap: (int index) {
          if (index == 1) onTapSearch?.call();
        },
      ),
    );
  }
}

class _WatchlistHeader extends StatelessWidget {
  const _WatchlistHeader({
    required this.sort,
    required this.isRefreshing,
    required this.onTapSort,
    required this.onRefresh,
  });

  final WatchlistSort sort;
  final bool isRefreshing;
  final VoidCallback onTapSort;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppDimens dimens = context.dimens;
    return SizedBox(
      height: dimens.rowMinHeight,
      child: Padding(
        padding: EdgeInsets.only(left: dimens.space4, right: dimens.space2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '관심',
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 19,
                  fontWeight: AppTypography.bold,
                ),
              ),
            ),
            Semantics(
              button: true,
              label: '정렬 기준 ${sort.label}',
              child: InkWell(
                onTap: onTapSort,
                borderRadius: BorderRadius.circular(dimens.radiusMd),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 48),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: dimens.space2),
                    child: Row(
                      children: <Widget>[
                        Text(
                          sort.label,
                          style: TextStyle(
                            color: colors.textSecondary,
                            fontSize: 13,
                            fontWeight: AppTypography.bold,
                          ),
                        ),
                        SizedBox(width: dimens.space1),
                        Icon(
                          Icons.arrow_downward_rounded,
                          size: dimens.iconSm,
                          color: colors.textSecondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: isRefreshing ? null : onRefresh,
              tooltip: isRefreshing ? '시세 갱신 중' : '시세 새로고침',
              icon: isRefreshing
                  ? SizedBox.square(
                      dimension: dimens.iconSm,
                      child: CircularProgressIndicator(
                        strokeWidth: dimens.borderHairline,
                        color: colors.textSecondary,
                      ),
                    )
                  : Icon(
                      Icons.refresh_rounded,
                      size: dimens.iconMd,
                      color: colors.textSecondary,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WatchlistEmptyView extends StatelessWidget {
  const _WatchlistEmptyView();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppDimens dimens = context.dimens;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(dimens.space6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.star_border_rounded,
              size: 40,
              color: colors.favoriteInactive,
            ),
            SizedBox(height: dimens.space3),
            Text(
              '관심 종목이 없습니다',
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 19,
                fontWeight: AppTypography.bold,
              ),
            ),
            SizedBox(height: dimens.space2),
            Text(
              '검색 탭에서 종목을 찾아\n별 아이콘을 눌러 추가해 주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.textTertiary,
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

class _WatchlistContent extends StatelessWidget {
  const _WatchlistContent({required this.state, this.onTapStock});

  final WatchlistState state;
  final ValueChanged<StockMetadata>? onTapStock;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.stocks.length,
      itemBuilder: (BuildContext context, int index) {
        final StockMetadata stock = state.stocks[index];
        return StockListTile(
          key: ValueKey<String>(stock.symbol),
          stock: stock,
          quote: state.quotes[stock.symbol],
          onTap: onTapStock == null ? null : () => onTapStock!(stock),
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

class _WatchlistSortSheet extends StatelessWidget {
  const _WatchlistSortSheet({required this.selectedSort});

  final WatchlistSort selectedSort;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppDimens dimens = context.dimens;
    return SafeArea(
      top: false,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surfaceRaised,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(dimens.radiusLg),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: dimens.space5, bottom: dimens.space2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: dimens.space5),
                child: Text(
                  '정렬',
                  style: TextStyle(
                    color: colors.textPrimary,
                    fontSize: 18,
                    fontWeight: AppTypography.bold,
                  ),
                ),
              ),
              SizedBox(height: dimens.space3),
              for (final WatchlistSort sort in WatchlistSort.values)
                _SortOption(sort: sort, selected: sort == selectedSort),
            ],
          ),
        ),
      ),
    );
  }
}

class _SortOption extends StatelessWidget {
  const _SortOption({required this.sort, required this.selected});

  final WatchlistSort sort;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(sort),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.dimens.rowMinHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.dimens.space5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    sort.label,
                    style: TextStyle(
                      color: selected
                          ? context.colors.textPrimary
                          : context.colors.textSecondary,
                      fontSize: 14,
                      fontWeight: AppTypography.regular,
                    ),
                  ),
                ),
                if (selected)
                  Icon(
                    Icons.check_rounded,
                    size: context.dimens.iconMd,
                    color: context.colors.textPrimary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
