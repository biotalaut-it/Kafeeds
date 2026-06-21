import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../widgets/dialog.dart';
import 'single_line_item.dart';

class LogoutSettingsItem extends ConsumerWidget {
  const LogoutSettingsItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    void logout() => AppDialogs.showConfirmDialog(
      context,
      l10n.areYouSure,
      l10n.logoutDialogContent,
      l10n.yesUppercase,
      () => appRouter.logout(context),
    );

    return SingleLineItem(
      heading: l10n.logoutOrSwitchWallet,
      settingIcon: AppIcons.logout,
      onPressed: logout,
    );
  }
}
