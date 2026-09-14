import 'package:flutter/material.dart';

class HighlightedMatchText extends StatelessWidget {
  const HighlightedMatchText({
    super.key,
    required this.text,
    required this.query,
    required this.style,
    required this.highlightColor,
    this.maxLines = 1,
  });

  final String text;
  final String query;
  final TextStyle style;
  final Color highlightColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: text,
      child: ExcludeSemantics(
        child: RichText(
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(style: style, children: _spans()),
        ),
      ),
    );
  }

  List<TextSpan> _spans() {
    final String normalizedQuery = query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return <TextSpan>[TextSpan(text: text)];
    }
    final String normalizedText = text.toLowerCase();
    final List<TextSpan> spans = <TextSpan>[];
    int start = 0;
    while (start < text.length) {
      final int matchIndex = normalizedText.indexOf(normalizedQuery, start);
      if (matchIndex < 0) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
      if (matchIndex > start) {
        spans.add(TextSpan(text: text.substring(start, matchIndex)));
      }
      final int matchEnd = matchIndex + normalizedQuery.length;
      spans.add(
        TextSpan(
          text: text.substring(matchIndex, matchEnd),
          style: style.copyWith(color: highlightColor),
        ),
      );
      start = matchEnd;
    }
    return spans;
  }
}
