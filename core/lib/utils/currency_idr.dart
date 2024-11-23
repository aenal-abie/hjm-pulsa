import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit,
      {String? symbol}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: symbol ?? 'Rp ',
      decimalDigits:
          decimalDigit, //decimalDigit = 1,2,3 Add Number after comma ,00 if not used set to 0
    );
    return currencyFormatter.format(number);
  }

  static String convertToWithoutSymbol(dynamic v) {
    const locale = 'en';
    String formatNumber(String s) =>
        NumberFormat.decimalPattern(locale).format(int.parse(s));
    String value = formatNumber(v);
    return value.replaceAll(RegExp('[,]'), '.');
  }
}

String formatCurrency(double? value, {String? symbol}) {
  if (value == null) return '';
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: symbol ?? 'Rp ',
    decimalDigits: 0,
  ).format(value);
}

extension FormatDouble on double {
  String get toRpCurrency => formatCurrency(this);

  String get toCurrency => formatCurrency(this, symbol: "");
}

extension FormatInt on int {
  String get toRpCurrency => formatCurrency(toDouble());

  String get toCurrency => formatCurrency(toDouble(), symbol: "");
}
