import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaspium_wallet/core/core_providers.dart';
import 'package:kaspium_wallet/l10n/app_localizations/app_localizations.dart';
import 'package:kaspium_wallet/settings/available_language.dart';
import 'package:kaspium_wallet/settings/available_themes.dart';
import 'package:kaspium_wallet/settings_drawer/language_dialog.dart';

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

void main() {
  testWidgets('language labels are left aligned', (tester) async {
    await tester.pumpWidget(wrap(const LanguageDialog()));
    await tester.pumpAndSettle();

    // Labels of different widths must share a leading edge; if the options
    // were centred, the wider label would start further left.
    final options = tester
        .widgetList<SimpleDialogOption>(find.byType(SimpleDialogOption))
        .length;
    expect(options, AvailableLanguage.values.length);

    final edges = find
        .byType(SimpleDialogOption)
        .evaluate()
        .take(5)
        .map((e) => tester.getTopLeft(find.byWidget(e.widget)).dx)
        .toSet();
    expect(edges, hasLength(1));
  });

  testWidgets('the list scrolls under a pinned title', (tester) async {
    await tester.pumpWidget(wrap(const LanguageDialog()));
    await tester.pumpAndSettle();

    final scrollable = find.byType(Scrollable);
    expect(scrollable, findsOneWidget);

    final title = find.text('Language');
    expect(find.descendant(of: scrollable, matching: title), findsNothing);

    final firstOption = find.byType(SimpleDialogOption).first;
    final optionBefore = tester.getTopLeft(firstOption).dy;
    final titleBefore = tester.getTopLeft(title).dy;

    await tester.drag(scrollable, const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(tester.getTopLeft(firstOption).dy, lessThan(optionBefore));
    expect(tester.getTopLeft(title).dy, titleBefore);
  });

  testWidgets('every available language is selectable', (tester) async {
    await tester.pumpWidget(wrap(const LanguageDialog()));
    await tester.pumpAndSettle();

    final options = tester.widgetList<SimpleDialogOption>(
      find.byType(SimpleDialogOption),
    );
    final enabled = options.where((o) => o.onPressed != null).length;
    final available = AvailableLanguage.values
        .where(LanguageSetting.isAvailable)
        .length;

    // All languages are available today, so this guards against the options
    // being wired up non-tappable rather than against the disabled styling.
    expect(available, greaterThan(0));
    expect(enabled, available);
  });
}
