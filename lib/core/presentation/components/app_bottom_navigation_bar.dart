import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppDimens dimens = context.dimens;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceRaised,
        border: Border(
          top: BorderSide(
            color: colors.borderSubtle,
            width: dimens.borderHairline,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: dimens.tabBarHeight,
          child: Row(
            children: <Widget>[
              Expanded(
                child: _NavigationItem(
                  label: '관심',
                  icon: Icons.star_rounded,
                  selected: selectedIndex == 0,
                  onTap: () => onTap(0),
                ),
              ),
              Expanded(
                child: _NavigationItem(
                  label: '검색',
                  icon: Icons.search_rounded,
                  selected: selectedIndex == 1,
                  onTap: () => onTap(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color color = selected
        ? context.colors.navActive
        : context.colors.navInactive;
    return Semantics(
      selected: selected,
      button: true,
      label: label,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: context.dimens.iconMd, color: color),
            SizedBox(height: context.dimens.space1),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: AppTypography.regular,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
