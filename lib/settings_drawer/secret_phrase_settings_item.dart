import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/sheet_util.dart';
import 'seed_backup_sheet.dart';
import 'single_line_item.dart';

class SecretPhraseSettingsItem extends ConsumerWidget {
  const SecretPhraseSettingsItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    Future<void> backupSecretPhrase() async {
      final authUtil = ref.read(authUtilProvider);

      final mnemonic = await authUtil.getMnemonic(context);
      if (mnemonic == null) {
        return;
      }
      if (!context.mounted) return;
      if (mnemonic.isEmpty) {
        UIUtil.showSnackbar(l10n.missingSecretPhrase);
        return;
      }

      Sheets.showAppHeightNineSheet(
        context: context,
        theme: ref.read(themeProvider),
        widget: SeedBackupSheet(mnemonic: mnemonic),
      );
    }

    return SingleLineItem(
      heading: l10n.backupSecretPhrase,
      settingIcon: AppIcons.backupseed,
      onPressed: backupSecretPhrase,
    );
  }
}
