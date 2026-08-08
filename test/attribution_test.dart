import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/l10n/app_localizations/app_localizations.dart';
import 'package:kaspium_wallet/settings_drawer/currency_dialog.dart';

void main() {
  test('attribution backlinks point at the right hosts', () {
    expect(Uri.parse(kYadioUrl).host, 'yadio.io');
    expect(Uri.parse(kCoinGeckoUrl).host, endsWith('coingecko.com'));
  });

  test('brand splitting keeps the whole translation', () {
    // Word order differs per language; the brand must be linkable in any spot.
    for (final text in [
      'Powered by CoinGecko',
      '由 CoinGecko 提供支持',
      'CoinGecko کے ذریعہ تقویت یافتہ',
    ]) {
      final parts = splitAroundBrand(text, kCoinGeckoBrand);
      expect(parts, isNotNull, reason: text);
      final (before, after) = parts!;
      expect(before + kCoinGeckoBrand + after, text);
    }
  });

  test('a localized brand name falls back to linking the whole line', () {
    // Hindi transliterates the brand, so there is no token to split on.
    expect(splitAroundBrand('कॉइनगेको द्वारा संचालित', kCoinGeckoBrand), isNull);
  });

  test('every locale renders a CoinGecko attribution', () async {
    var splittable = 0;
    for (final locale in AppLocalizations.supportedLocales) {
      final l10n = await AppLocalizations.delegate.load(locale);
      expect(l10n.currencyPoweredBy, isNotEmpty, reason: locale.toString());
      if (splitAroundBrand(l10n.currencyPoweredBy, kCoinGeckoBrand) != null) {
        splittable++;
      }
    }
    // Every locale but Hindi carries the literal brand; the rest fall back.
    expect(splittable, AppLocalizations.supportedLocales.length - 1);
  });
}
