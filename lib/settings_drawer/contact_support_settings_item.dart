import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../l10n/l10n.dart';
import '../settings/setting_item.dart';
import '../util/util.dart';
import 'double_line_item.dart';

class ContactSupportItem extends SettingSelectionItem {
  final String email;
  const ContactSupportItem({required this.email});

  @override
  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);
    return l10n.emailAction(email);
  }
}

class ContactSupportSettingsItem extends StatelessWidget {
  const ContactSupportSettingsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    void contactSupport() =>
        openUrl('mailto:$kSupportEmail?subject=Kaspium support');

    return DoubleLineItem(
      heading: l10n.contactSupport,
      defaultMethod: const ContactSupportItem(email: kSupportEmail),
      icon: Icons.email,
      onPressed: contactSupport,
    );
  }
}
