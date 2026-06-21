import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../wallet_address/address_details_sheet.dart';
import '../widgets/selected_wallet_button.dart';
import '../widgets/sheet_util.dart';
import 'account_switcher.dart';
import 'account_widget.dart';

class AccountsArea extends ConsumerWidget {
  const AccountsArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    final account = ref.watch(receiveAddressProvider);
    final wallet = ref.watch(walletProvider);

    void showAccountDetails() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: AddressDetailsSheet(address: account),
      );
    }

    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .start,
              children: [
                const SizedBox(width: 30),
                const SelectedWalletButton(),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    FittedBox(
                      alignment: .centerLeft,
                      fit: .scaleDown,
                      child: Text(
                        wallet.name,
                        style: styles.textStyleAppTextFieldSimple.copyWith(
                          fontSize: 18,
                          fontWeight: .bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: .symmetric(horizontal: 16),
              child: AccountSwitcher(),
            ),
          ],
        ),
        Padding(
          padding: const .only(left: 18, right: 18, top: 12, bottom: 8),
          child: TextButton(
            style: styles.accountButtonStyle,
            onPressed: showAccountDetails,
            child: const AccountWidget(),
          ),
        ),
      ],
    );
  }
}
