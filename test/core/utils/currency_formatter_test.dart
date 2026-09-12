import 'package:flutter_test/flutter_test.dart';
import 'package:shopp_app/core/utils/currency_formatter.dart';

void main() {
  group('CurrencyFormatter - Indian Rupee (₹) & Numbering System', () {
    test('formats standard amounts with ₹ symbol', () {
      expect(CurrencyFormatter.format(0), '₹0');
      expect(CurrencyFormatter.format(50), '₹50');
      expect(CurrencyFormatter.format(499), '₹499');
      expect(CurrencyFormatter.format(1299), '₹1,299');
    });

    test('preserves paise when fraction exists', () {
      expect(CurrencyFormatter.format(89.99), '₹89.99');
      expect(CurrencyFormatter.format(1299.50), '₹1,299.50');
      expect(CurrencyFormatter.format(161.99), '₹161.99');
    });

    test('formats correctly according to Indian numbering (Lakhs, Crores)', () {
      // Thousands
      expect(CurrencyFormatter.format(1000), '₹1,000');
      expect(CurrencyFormatter.format(12999), '₹12,999');

      // Lakhs (2,2,3 grouping)
      expect(CurrencyFormatter.format(100000), '₹1,00,000');
      expect(CurrencyFormatter.format(129999), '₹1,29,999');
      expect(CurrencyFormatter.format(1299999), '₹12,99,999');

      // Crores
      expect(CurrencyFormatter.format(10000000), '₹1,00,00,000');
      expect(CurrencyFormatter.format(12999999), '₹1,29,99,999');
      expect(CurrencyFormatter.format(123456789), '₹12,34,56,789');
    });

    test('respects showDecimals option', () {
      expect(CurrencyFormatter.format(499, showDecimals: true), '₹499.00');
      expect(CurrencyFormatter.format(1299.99, showDecimals: false), '₹1,299');
      expect(CurrencyFormatter.format(1299.50, showDecimals: true), '₹1,299.50');
    });

    test('respects showSymbol option', () {
      expect(CurrencyFormatter.format(129999, showSymbol: false), '1,29,999');
      expect(CurrencyFormatter.format(89.99, showSymbol: false), '89.99');
    });

    test('handles negative values correctly', () {
      expect(CurrencyFormatter.format(-499), '-₹499');
      expect(CurrencyFormatter.format(-1299.50), '-₹1,299.50');
    });

    test('handles null values safely', () {
      expect(CurrencyFormatter.format(null), '₹ 0.00');
      expect(CurrencyFormatter.format(null, showSymbol: false), '0.00');
    });

    test('formats compact representations correctly', () {
      expect(CurrencyFormatter.formatCompact(500), '₹500');
      expect(CurrencyFormatter.formatCompact(1500), '₹1.5 K');
      expect(CurrencyFormatter.formatCompact(250000), '₹2.50 L');
      expect(CurrencyFormatter.formatCompact(35000000), '₹3.50 Cr');
      expect(CurrencyFormatter.formatCompact(250000, showSymbol: false), '2.50 L');
    });
  });
}
