import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../settings_drawer/double_line_item_two.dart';
import '../sign_message/sign_message_sheet.dart';
import '../widgets/sheet_util.dart';

class SignMessageSettingsEntry extends ConsumerWidget {
  const SignMessageSettingsEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    void showSignMessage() => Sheets.showAppHeightNineSheet(
      context: context,
      theme: theme,
      widget: const SignMessageSheet(),
    );

    return DoubleLineItemTwo(
      heading: l10n.signMessage,
      text: l10n.signMessageDescription,
      icon: Icons.edit_outlined,
      iconSize: 28,
      onPressed: showSignMessage,
    );
  }
}
