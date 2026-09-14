import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

void showFavoriteSnackBar(BuildContext context, {required bool isFavorite}) {
  final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 200),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        elevation: 0,
        margin: EdgeInsets.fromLTRB(
          context.dimens.space4,
          0,
          context.dimens.space4,
          context.dimens.space4,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.dimens.space5,
          vertical: context.dimens.space4,
        ),
        backgroundColor: context.colors.surfaceOverlay,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.dimens.radiusLg),
        ),
        content: Row(
          children: <Widget>[
            Icon(
              isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
              size: context.dimens.space6,
              color: isFavorite
                  ? context.colors.favoriteActive
                  : context.colors.textSecondary,
            ),
            SizedBox(width: context.dimens.space3),
            Text(
              isFavorite ? '관심이 등록되었습니다' : '관심이 해제되었습니다',
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 14,
                fontWeight: AppTypography.bold,
              ),
            ),
          ],
        ),
      ),
    );
}
