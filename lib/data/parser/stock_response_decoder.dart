import 'dart:convert';

import 'package:cp949_codec/cp949_codec.dart';

class StockResponseDecoder {
  const StockResponseDecoder();

  String decode(List<int> bytes, {String? contentType}) {
    final String? charset =
        _charsetFrom(contentType) ?? _charsetFromMeta(bytes);
    return switch (charset?.toLowerCase()) {
      'euc-kr' || 'euckr' || 'ks_c_5601-1987' || 'cp949' => cp949.decode(bytes),
      null || 'utf-8' || 'utf8' => utf8.decode(bytes),
      _ => throw FormatException('Unsupported charset: $charset'),
    };
  }

  String? _charsetFrom(String? contentType) {
    if (contentType == null) {
      return null;
    }
    return RegExp(
      r'''charset\s*=\s*["']?([^;\s"']+)''',
      caseSensitive: false,
    ).firstMatch(contentType)?.group(1);
  }

  String? _charsetFromMeta(List<int> bytes) {
    final int scanLength = bytes.length < 2048 ? bytes.length : 2048;
    final String prefix = latin1.decode(bytes.sublist(0, scanLength));
    return _charsetFrom(prefix);
  }
}
