// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'setting_item.dart';

enum AvailableCurrencies {
  USD('US Dollar', '\$'),
  BTC('Bitcoin', '₿'),
  ARS('Argentine Peso', '\$'),
  AUD('Australian Dollar', '\$'),
  BDT('Bangladeshi Taka', '৳'),
  BHD('Bahraini Dinar', '.د.ب'),
  BMD('Bermudian Dollar', '\$'),
  BRL('Brazilian Real', 'R\$'),
  CAD('Canadian Dollar', '\$'),
  CHF('Swiss Franc', 'CHF'),
  CLP('Chilean Peso', '\$'),
  CNY('Chinese Yuan', '¥'),
  CZK('Czech Koruna', 'Kč'),
  DKK('Danish Krone', 'kr.'),
  EUR('Euro', '€'),
  GBP('Great Britain Pound', '£'),
  HKD('Hong Kong Dollar', 'HK\$'),
  HUF('Hungarian Forint', 'Ft'),
  IDR('Indonesian Rupiah', 'Rp'),
  ILS('Israeli Shekel', '₪'),
  INR('Indian Rupee', '₹'),
  JPY('Japanese Yen', '¥'),
  KRW('South Korean Won', '₩'),
  KWD('Kuwaiti Dinar', 'KD'),
  LKR('Sri Lankan Rupee', 'Rs'),
  MMK('Myanmar Kyat', 'Ks.'),
  MXN('Mexican Peso', '\$'),
  MYR('Malaysian Ringgit', 'RM'),
  NGN('Nigerian Naira', '₦'),
  NOK('Norwegian Krone', 'kr'),
  NZD('New Zealand Dollar', '\$'),
  PHP('Philippine Peso', '₱'),
  PKR('Pakistani Rupee', 'Rs'),
  PLN('Polish Zloty', 'zł'),
  RUB('Russian Ruble', '\u20BD'),
  SAR('Saudi Riyal', 'SR'),
  SEK('Swedish Krona', 'kr'),
  SGD('Singapore Dollar', '\$'),
  THB('Thai Baht', '฿'),
  TRY('Turkish Lira', '₺'),
  TWD('Taiwan Dollar', 'NT\$'),
  AED('UAE Dirham', 'د.إ'),
  UAH('Ukraine Hryvnia', '₴'),
  VEF('Venezuelan Bolivar', 'Bs.F'),
  VND('Vietnamese Đồng', '₫'),
  ZAR('South African Rand', 'R\$'),
  ;

  final String title;
  final String symbol;

  const AvailableCurrencies(this.title, this.symbol);
}

/// Represent the available currency our app supports
class AvailableCurrency extends SettingSelectionItem {
  final AvailableCurrencies currency;

  const AvailableCurrency(this.currency);

  String get name => currency.name;

  @override
  String getDisplayName(BuildContext context) =>
      '${currency.symbol} ${currency.title}';

  String get symbol => currency.symbol;

  // For saving to shared prefs
  String getId() => currency.name;
}
