import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/settings/authentication_method.dart';
import 'package:kaspium_wallet/settings/available_currency.dart';
import 'package:kaspium_wallet/settings/available_language.dart';
import 'package:kaspium_wallet/settings/available_themes.dart';
import 'package:kaspium_wallet/util/sharedprefsutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPrefsUtil> utilWith(Map<String, Object> values) async {
  SharedPreferences.setMockInitialValues(values);
  return SharedPrefsUtil(await SharedPreferences.getInstance());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('unknown stored enum name falls back instead of throwing', () async {
    final util = await utilWith({
      'flutter.${SharedPrefsUtil.cur_currency}': 'COP_FROM_THE_FUTURE',
      'flutter.${SharedPrefsUtil.auth_method}': 'NOPE',
      'flutter.${SharedPrefsUtil.cur_language}': 'NOPE',
      'flutter.${SharedPrefsUtil.cur_theme}': 'NOPE',
    });
    expect(util.getCurrency().currency, AvailableCurrencies.USD);
    expect(util.getAuthMethod().method, AuthMethod.BIOMETRICS);
    expect(util.getLanguage().language, AvailableLanguage.DEFAULT);
    expect(util.getTheme().theme, ThemeOptions.KASPIUM_DARK);

    // The unguarded lookup these accessors used to do still throws, so the
    // expectations above are testing the fallback and not a no-op.
    expect(
      () => AvailableCurrencies.values.byName('COP_FROM_THE_FUTURE'),
      throwsArgumentError,
    );
  });

  test('known stored names still round-trip', () async {
    final util = await utilWith({
      'flutter.${SharedPrefsUtil.cur_currency}': 'RON',
      'flutter.${SharedPrefsUtil.cur_theme}': 'KASPIUM_LIGHT',
    });
    expect(util.getCurrency().currency, AvailableCurrencies.RON);
    expect(util.getTheme().theme, ThemeOptions.KASPIUM_LIGHT);
  });

  test('missing keys use defaults', () async {
    final util = await utilWith({});
    expect(util.getCurrency().currency, AvailableCurrencies.USD);
    expect(util.getTheme().theme, ThemeOptions.KASPIUM_DARK);
  });
}
