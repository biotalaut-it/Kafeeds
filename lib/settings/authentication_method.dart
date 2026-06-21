// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import 'setting_item.dart';

enum AuthMethod { PIN, BIOMETRICS }

/// Represent the available authentication methods our app supports
class AuthenticationMethod extends SettingSelectionItem {
  final AuthMethod method;

  const AuthenticationMethod(this.method);

  @override
  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);

    return switch (method) {
      .BIOMETRICS => l10n.biometricsMethod,
      .PIN => l10n.pinMethod,
    };
  }

  // For saving to shared prefs
  String getId() => method.name;
}
