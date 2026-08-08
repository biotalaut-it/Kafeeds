import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaspium_wallet/core/core_providers.dart';
import 'package:kaspium_wallet/l10n/app_localizations/app_localizations.dart';
import 'package:kaspium_wallet/settings/available_themes.dart';
import 'package:kaspium_wallet/settings_drawer/currency_dialog.dart';

Widget wrap(Widget child) => ProviderScope(
  overrides: [
    themeProvider.overrideWithValue(
      const ThemeSetting(ThemeOptions.KASPIUM_DARK).getTheme(),
    ),
  ],
  child: MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  ),
);

/// The footer is a single Text.rich, so it is found by its plain text.
final footer = find.textContaining(kYadioBrand);

/// Every span carrying a tap recognizer, keyed by its text.
Map<String, TapGestureRecognizer> linkedSpans(WidgetTester tester) {
  final text = tester.widget<Text>(footer);
  final links = <String, TapGestureRecognizer>{};
  text.textSpan!.visitChildren((span) {
    if (span is TextSpan && span.recognizer is TapGestureRecognizer) {
      links[span.text ?? ''] = span.recognizer as TapGestureRecognizer;
    }
    return true;
  });
  return links;
}

void main() {
  testWidgets('footer is one line naming both sources', (tester) async {
    await tester.pumpWidget(wrap(const CurrencyDialog()));
    await tester.pumpAndSettle();

    final text = tester.widget<Text>(footer).textSpan!.toPlainText();
    expect(text, 'Powered by CoinGecko & yadio.io');
  });

  testWidgets('both brands are linked', (tester) async {
    await tester.pumpWidget(wrap(const CurrencyDialog()));
    await tester.pumpAndSettle();

    expect(linkedSpans(tester).keys, containsAll([kCoinGeckoBrand, kYadioBrand]));
  });

  testWidgets('currency labels are left aligned', (tester) async {
    await tester.pumpWidget(wrap(const CurrencyDialog()));
    await tester.pumpAndSettle();

    // Labels of different widths must share a leading edge; if the options
    // were centred, the wider label would start further left.
    final short = tester.getTopLeft(find.textContaining('Euro')).dx;
    final long = tester.getTopLeft(find.textContaining('US Dollar')).dx;
    expect(short, long);
  });

  testWidgets('the list scrolls while the footer stays pinned', (tester) async {
    await tester.pumpWidget(wrap(const CurrencyDialog()));
    await tester.pumpAndSettle();

    final scrollable = find.byType(Scrollable);
    expect(scrollable, findsOneWidget);

    // The footer must live outside the scroll view, or it would scroll away.
    expect(find.descendant(of: scrollable, matching: footer), findsNothing);

    final firstCurrency = find.textContaining('US Dollar');
    final currencyBefore = tester.getTopLeft(firstCurrency).dy;
    final footerBefore = tester.getTopLeft(footer).dy;

    await tester.drag(scrollable, const Offset(0, -400));
    await tester.pumpAndSettle();

    // The list moved up under the footer, which stayed exactly put.
    expect(tester.getTopLeft(firstCurrency).dy, lessThan(currencyBefore));
    expect(tester.getTopLeft(footer).dy, footerBefore);
  });
}
