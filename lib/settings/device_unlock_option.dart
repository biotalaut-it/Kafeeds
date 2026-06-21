// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import 'setting_item.dart';

enum UnlockOption {
  YES,
  NO;

  bool get value => switch (this) {
    .YES => true,
    .NO => false,
  };
}

/// Represent authenticate to open setting
class UnlockSetting extends SettingSelectionItem {
  final UnlockOption setting;

  const UnlockSetting(this.setting);

  @override
  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);

    return switch (setting) {
      .YES => l10n.yes,
      .NO => l10n.no,
    };
  }

  // For saving to shared prefs
  String getId() => setting.name;
}
