import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../contacts/contact_add_sheet.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../util/util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/sheet_handle.dart';
import '../widgets/sheet_util.dart';
import '../widgets/sheet_wrapper.dart';
import 'transaction_details.dart';
import 'transaction_types.dart';

class TransactionDetailsSheet extends ConsumerWidget {
  final String transactionId;
  final String address;
  final bool displayContactButton;
  final bool displayAddressButton;
  final TxItem? txItem;

  const TransactionDetailsSheet({
    super.key,
    required this.transactionId,
    required this.address,
    this.displayContactButton = false,
    this.displayAddressButton = true,
    this.txItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);
    final styles = ref.watch(stylesProvider);

    void addContact() {
      appRouter.pop(context);
      Sheets.showAppHeightNineSheet(
        context: context,
        widget: ContactAddSheet(address: address),
        theme: theme,
      );
    }

    void viewAddress() {
      final explorer = ref.read(blockExplorerProvider);
      openUrl(explorer.urlForAddress(address));
    }

    void viewTransaction() {
      final explorer = ref.read(blockExplorerProvider);
      openUrl(explorer.urlForTx(transactionId));
    }

    Future<void> cancelTransaction() async {
      final txItem = this.txItem;
      if (txItem == null || !txItem.pending) return;
      UIUtil.showCancelTransactionFlow(context, ref: ref, tx: txItem.tx);
    }

    return SheetWrapper(
      child: Column(
        mainAxisSize: .min,
        children: [
          const SheetHandle(),
          if (txItem case final txItem?)
            Expanded(child: TransactionDetails(txItem: txItem)),
          ActionButtonsWrapper(
            buttons: [
              if (txItem?.pending ?? false)
                PrimaryButton(
                  title: l10n.cancelTransaction,
                  onPressed: cancelTransaction,
                )
              else if (displayAddressButton) ...[
                Stack(
                  children: [
                    PrimaryButton(
                      title: l10n.viewAddress,
                      onPressed: viewAddress,
                    ),
                    Row(
                      mainAxisAlignment: .end,
                      crossAxisAlignment: .center,
                      children: [
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: Visibility(
                            visible: displayContactButton,
                            child: TextButton(
                              style: styles.innerButtonStyle,
                              onPressed: addContact,
                              child: Icon(
                                AppIcons.addcontact,
                                size: 35,
                                color: theme.backgroundDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              if (txItem case final txItem? when !txItem.pending)
                PrimaryOutlineButton(
                  title: l10n.viewTransaction,
                  onPressed: viewTransaction,
                )
              else
                const CloseActionButton(),
            ],
          ),
        ],
      ),
    );
  }
}
