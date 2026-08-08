// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'setting_item.dart';

enum AvailableCurrencies {
  USD('US Dollar', '\$'),
  BTC('Bitcoin', '₿'),
  ARS('Argentine Peso', '\$'),
  AUD('Australian Dollar', '\$'),
  BDT('Bangladeshi Taka', '৳', symbolOnRight: true),
  BHD('Bahraini Dinar', '.د.ب', symbolOnRight: true),
  BMD('Bermudian Dollar', '\$'),
  BRL('Brazilian Real', 'R\$'),
  CAD('Canadian Dollar', '\$'),
  CHF('Swiss Franc', 'CHF'),
  CLP('Chilean Peso', '\$'),
  CNY('Chinese Yuan', '¥'),
  COP('Colombian Peso', '\$', kaspiumApiOnly: true),
  CZK('Czech Koruna', 'Kč', symbolOnRight: true),
  DKK('Danish Krone', 'kr.', symbolOnRight: true),
  EGP('Egyptian Pound', 'E£', kaspiumApiOnly: true, symbolOnRight: true),
  EUR('Euro', '€', symbolOnRight: true),
  GBP('Great Britain Pound', '£'),
  HKD('Hong Kong Dollar', 'HK\$'),
  HUF('Hungarian Forint', 'Ft', symbolOnRight: true),
  IDR('Indonesian Rupiah', 'Rp'),
  ILS('Israeli Shekel', '₪', symbolOnRight: true),
  INR('Indian Rupee', '₹'),
  JPY('Japanese Yen', '¥'),
  KES('Kenyan Shilling', 'KSh', kaspiumApiOnly: true),
  KRW('South Korean Won', '₩'),
  KWD('Kuwaiti Dinar', 'KD', symbolOnRight: true),
  KZT('Kazakhstani Tenge', '₸', kaspiumApiOnly: true, symbolOnRight: true),
  LKR('Sri Lankan Rupee', 'Rs'),
  MAD('Moroccan Dirham', 'د.م.', kaspiumApiOnly: true, symbolOnRight: true),
  MMK('Myanmar Kyat', 'Ks.', symbolOnRight: true),
  MXN('Mexican Peso', '\$'),
  MYR('Malaysian Ringgit', 'RM'),
  NGN('Nigerian Naira', '₦'),
  NOK('Norwegian Krone', 'kr', symbolOnRight: true),
  NZD('New Zealand Dollar', '\$'),
  PEN('Peruvian Sol', 'S/', kaspiumApiOnly: true),
  PHP('Philippine Peso', '₱'),
  PKR('Pakistani Rupee', 'Rs'),
  PLN('Polish Zloty', 'zł', symbolOnRight: true),
  RON('Romanian Leu', 'lei', kaspiumApiOnly: true, symbolOnRight: true),
  RUB('Russian Ruble', '\u20BD', symbolOnRight: true),
  SAR('Saudi Riyal', 'SR', symbolOnRight: true),
  SEK('Swedish Krona', 'kr', symbolOnRight: true),
  SGD('Singapore Dollar', '\$'),
  THB('Thai Baht', '฿'),
  TRY('Turkish Lira', '₺'),
  TWD('Taiwan Dollar', 'NT\$'),
  AED('UAE Dirham', 'د.إ', symbolOnRight: true),
  UAH('Ukraine Hryvnia', '₴', symbolOnRight: true),
  VEF('Venezuelan Bolivar', 'Bs.F'),
  VND('Vietnamese Đồng', '₫', symbolOnRight: true),
  ZAR('South African Rand', 'R'),
  ;

  final String title;
  final String symbol;

  /// Not supported by CoinGecko, so the price comes from the Kaspium API only.
  final bool kaspiumApiOnly;

  /// The symbol trails the amount, as in `12.50 lei` instead of `lei12.50`.
  final bool symbolOnRight;

  const AvailableCurrencies(
    this.title,
    this.symbol, {
    this.kaspiumApiOnly = false,
    this.symbolOnRight = false,
  });
}

/// A word-like symbol runs into the amount, as in `CHF1,234.50`, so those get
/// a separator. Bare currency signs stay tight, as does a lone letter like the
/// rand's `R`, which reads cleanly against a digit.
final _wordLikeSymbol = RegExp(r'.\p{L}$', unicode: true);

/// Represent the available currency our app supports
class AvailableCurrency extends SettingSelectionItem {
  final AvailableCurrencies currency;

  const AvailableCurrency(this.currency);

  String get name => currency.name;

  @override
  String getDisplayName(BuildContext context) =>
      '${currency.symbol} ${currency.title}';

  String get symbol => currency.symbol;

  /// Formats fiat amounts the way this currency writes them, independent of
  /// the app locale — which still supplies the group and decimal separators.
  NumberFormat numberFormat({int? decimalDigits}) => NumberFormat.currency(
    symbol: currency.symbol,
    name: currency.name,
    decimalDigits: decimalDigits,
    customPattern: _pattern,
  );

  // Separators are non-breaking spaces, as CLDR uses, so the symbol never
  // wraps off the amount.
  String get _pattern {
    if (currency.symbolOnRight) return '#,##0.00\u00A0¤';
    if (_wordLikeSymbol.hasMatch(currency.symbol)) {
      return '¤\u00A0#,##0.00';
    }
    return '¤#,##0.00';
  }

  // For saving to shared prefs
  String getId() => currency.name;
}
