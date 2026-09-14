import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    required this.value,
    required this.onChanged,
    this.hintText = '종목명 또는 종목코드',
    this.autofocus = false,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool autofocus;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant AppSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
    if (!oldWidget.autofocus && widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _focusNode.requestFocus();
      });
    } else if (oldWidget.autofocus && !widget.autofocus) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppDimens dimens = context.dimens;

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.search,
      style: TextStyle(
        color: colors.textPrimary,
        fontSize: 14,
        fontWeight: AppTypography.medium,
      ),
      cursorColor: colors.accentDefault,
      onChanged: (String value) {
        setState(() {});
        widget.onChanged(value);
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: colors.textTertiary,
          fontSize: 15,
          fontWeight: AppTypography.regular,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: dimens.iconSm,
          color: colors.textTertiary,
        ),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  _controller.clear();
                  widget.onChanged('');
                  setState(() {});
                },
                tooltip: '검색어 지우기',
                icon: Icon(
                  Icons.close_rounded,
                  size: dimens.iconSm,
                  color: colors.textTertiary,
                ),
              ),
        filled: true,
        fillColor: colors.surfaceRaised,
        contentPadding: EdgeInsets.symmetric(
          horizontal: dimens.space3,
          vertical: dimens.space2,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dimens.radiusMd),
          borderSide: BorderSide(
            width: dimens.borderHairline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dimens.radiusMd),
          borderSide: BorderSide(
            width: dimens.borderHairline,
          ),
        ),
      ),
    );
  }
}
