abstract final class StockNumberFormatter {
  static String integer(int value, {bool showPlus = false}) {
    final bool isNegative = value < 0;
    final String digits = value.abs().toString();
    final StringBuffer output = StringBuffer();
    for (int index = 0; index < digits.length; index++) {
      if (index > 0 && (digits.length - index) % 3 == 0) {
        output.write(',');
      }
      output.write(digits[index]);
    }
    if (isNegative) {
      return '-$output';
    }
    return showPlus && value > 0 ? '+$output' : output.toString();
  }

  static String percentage(double rate, {bool showPlus = false}) {
    final double percentage = rate * 100;
    final String sign = percentage < 0
        ? '-'
        : showPlus && percentage > 0
        ? '+'
        : '';
    return '$sign${percentage.abs().toStringAsFixed(2)}%';
  }

  static String compactKoreanWon(int value) {
    const int trillion = 1000000000000;
    const int hundredMillion = 100000000;
    if (value.abs() >= trillion) {
      return '${integer(value ~/ trillion)}조';
    }
    if (value.abs() >= hundredMillion) {
      return '${integer(value ~/ hundredMillion)}억';
    }
    return integer(value);
  }
}
