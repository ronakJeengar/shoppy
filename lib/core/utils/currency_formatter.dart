/// Centralized Indian Currency & Numbering Formatter.
/// Adheres to the Indian numbering system (Lakhs, Crores) with the official '₹' symbol.
class CurrencyFormatter {
  CurrencyFormatter._();

  static const String currencySymbol = '₹';
  static const String currencyCode = 'INR';

  /// Formats an amount using Indian currency format (e.g. ₹12,999.00, ₹1,29,999.00).
  static String format(
    num? amount, {
    bool? showDecimals,
    bool showSymbol = true,
  }) {
    if (amount == null) return showSymbol ? '$currencySymbol 0.00' : '0.00';

    final bool isNegative = amount < 0;
    final double absVal = amount.abs().toDouble();

    // Auto-detect decimals if not explicitly specified: show decimals only if fraction exists
    final bool includeDecimals = showDecimals ?? (absVal % 1 != 0);

    final String fixedStr = absVal.toStringAsFixed(2);
    final parts = fixedStr.split('.');
    final integerPart = parts[0];
    final decimalPart = parts[1];

    final formattedInteger = _formatIndianGrouping(integerPart);
    final result = includeDecimals
        ? '$formattedInteger.$decimalPart'
        : formattedInteger;

    final sign = isNegative ? '-' : '';
    final symbol = showSymbol ? currencySymbol : '';
    return '$sign$symbol$result';
  }

  /// Indian Numbering format: Last 3 digits grouped, then pairs of 2.
  static String _formatIndianGrouping(String digits) {
    if (digits.length <= 3) return digits;

    final lastThree = digits.substring(digits.length - 3);
    final remaining = digits.substring(0, digits.length - 3);

    final StringBuffer buffer = StringBuffer();
    int count = 0;
    for (int i = remaining.length - 1; i >= 0; i--) {
      buffer.write(remaining[i]);
      count++;
      if (count == 2 && i != 0) {
        buffer.write(',');
        count = 0;
      }
    }

    final reversedRemaining = buffer.toString().split('').reversed.join('');
    return '$reversedRemaining,$lastThree';
  }

  /// Compact representation for large amounts (Lakhs, Crores).
  static String formatCompact(num? amount, {bool showSymbol = true}) {
    if (amount == null) return showSymbol ? currencySymbol : '0';
    final double val = amount.toDouble();
    final prefix = showSymbol ? currencySymbol : '';

    if (val.abs() >= 10000000) {
      return '$prefix${(val / 10000000).toStringAsFixed(2)} Cr';
    } else if (val.abs() >= 100000) {
      return '$prefix${(val / 100000).toStringAsFixed(2)} L';
    } else if (val.abs() >= 1000) {
      return '$prefix${(val / 1000).toStringAsFixed(1)} K';
    }
    return format(val, showDecimals: false, showSymbol: showSymbol);
  }
}
