// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../themes/themes.dart';
import 'setting_item.dart';

enum ThemeOptions { KASPIUM_DARK, KASPIUM_LIGHT }

class ThemeSetting extends SettingSelectionItem {
  final ThemeOptions theme;

  const ThemeSetting(this.theme);

  @override
  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);

    return switch (theme) {
      .KASPIUM_LIGHT => l10n.themeLight,
      .KASPIUM_DARK => l10n.themeDark,
    };
  }

  BaseTheme getTheme() {
    return switch (theme) {
      .KASPIUM_LIGHT => KaspiumLightTheme(),
      .KASPIUM_DARK => KaspiumDarkTheme(),
    };
  }

  // For saving to shared prefs
  String getId() => theme.name;
}
