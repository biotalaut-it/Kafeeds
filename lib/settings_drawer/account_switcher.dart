import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../wallet_address/wallet_addresses_sheet.dart';
import '../widgets/sheet_util.dart';

class AccountSwitcher extends ConsumerWidget {
  const AccountSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    void showAccountsSheet() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        fullHeight: true,
        widget: const WalletAddressesSheet(),
      );
    }

    return Container(
      height: 36,
      width: 36,
      decoration: const BoxDecoration(shape: .circle),
      child: TextButton(
        style: styles.roundButtonStyle,
        onPressed: showAccountsSheet,
        child: Icon(
          AppIcons.accountswitcher,
          size: 36,
          color: theme.primary,
        ),
      ),
    );
  }
}
