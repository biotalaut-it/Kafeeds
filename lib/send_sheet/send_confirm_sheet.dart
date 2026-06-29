import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../fee/fee_sheet.dart';
import '../kaspa/kaspa.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
// import '../utxos/utxos_selection_page.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/address_card.dart';
import '../widgets/amount_card.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/dialog.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_util.dart';
import '../widgets/sheet_widget.dart';
import 'send_complete_sheet.dart';
import 'send_note_widget.dart';

class SendConfirmSheet extends HookConsumerWidget {
  final SendTx sendTx;
  final bool rbf;

  const SendConfirmSheet({
    super.key,
    required this.sendTx,
    this.rbf = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final sendTxState = useState(sendTx);
    final tx = sendTxState.value;

    final toAddress = tx.address;
    final amount = tx.amount;
    final fee = tx.fee;
    final note = tx.note;
    final isCompoundTx = tx.isCompoundTx;

    Future<void> sendTransaction() async {
      final walletService = ref.read(walletServiceProvider);

      try {
        AppDialogs.showInProgressDialog(
          context,
          l10n.sendTxProgressTitle,
          l10n.sendTxProgressDescription,
        );

        final txId = await walletService.sendTransaction(tx.tx, rbf: rbf);

        if (!context.mounted) return;

        ref.invalidate(pendingTxsProvider);

        if (tx.note case final txNote?) {
          final notes = ref.read(txNotesProvider);
          notes.addNoteForTxId(txId, txNote);
        }

        appRouter.pop(context);

        if (isCompoundTx) {
          appRouter.pop(context);
          UIUtil.showSnackbar(l10n.compoundSuccess);
        } else {
          final sheet = SendCompleteSheet(
            amount: amount,
            toAddress: toAddress,
            txId: txId,
            note: tx.note,
          );

          Sheets.showAppHeightNineSheet(
            context: context,
            theme: theme,
            closeOnTap: true,
            removeUntilHome: true,
            widget: sheet,
          );
        }
      } catch (e, st) {
        final log = ref.read(loggerProvider);
        log.e('Failed to send transaction', error: e, stackTrace: st);

        UIUtil.showSnackbar(l10n.sendError);
        appRouter.pop(context);
      }
    }

    String authMessage() {
      final symbol = ref.read(symbolProvider(amount));
      final formatedAmount = NumberUtil.formatedAmount(amount);
      final message = isCompoundTx ? l10n.compoundUppercased : l10n.sendConfirm;
      return '$message $formatedAmount $symbol';
    }

    bool checkInsufficientBalance() {
      final balance = ref.read(totalBalanceProvider);

      return balance.raw < amount.raw + fee.raw;
    }

    // Future<void> selectUtxos({required Amount minFee}) async {
    //   final notifier = ref.read(selectedUtxosProvider.notifier);
    //   notifier.state = ISet(tx.userSelectedUtxos);

    //   final selectedUtxos = await Sheets.showAppHeightNineSheet<List<Utxo>>(
    //     context: context,
    //     theme: theme,
    //     widget: UtxosSelectionPage(tx: tx.copyWith(fee: minFee)),
    //   );

    //   if (selectedUtxos != null) {
    //     updateTx(selectedUtxos: selectedUtxos, minFee: minFee);
    //   }
    // }

    Future<void> authAndSend() async {
      // Authenticate
      final message = authMessage();
      final authUtil = ref.read(authUtilProvider);
      final auth = await authUtil.authenticateForSecret(context, message);

      if (auth) sendTransaction();
    }

    void checkFee() {
      // soft cap on fee of 1 KAS
      if (tx.fee.raw > kSompiPerKaspa) {
        final symbol = ref.read(kasSymbolProvider);
        final feeFormated = NumberUtil.formatedAmount(tx.fee);
        final feeAmount = l10n.feeHighDescriptionAmount(feeFormated, symbol);
        AppDialogs.showConfirmDialog(
          context,
          l10n.feeHighTitle,
          '$feeAmount\n\n${l10n.feeHighDescription}',
          l10n.send.toUpperCase(),
          authAndSend,
        );
      } else {
        authAndSend();
      }
    }

    Future<void> adjustFee({Amount? minFee}) async {
      final newTx = await Sheets.showAppHeightNineSheet<SendTx>(
        context: context,
        theme: theme,
        widget: FeeSheet(minFee: minFee ?? .zero, tx: tx),
      );

      if (newTx != null) {
        sendTxState.value = newTx;
      }
    }

    Future<void> onConfirm() async {
      final symbol = ref.read(kasSymbolProvider);
      final insufficientBalance = checkInsufficientBalance();
      if (insufficientBalance) {
        AppDialogs.showInfoDialog(
          context,
          l10n.insufficientBalance,
          l10n.insufficientBalanceDetails.replaceAll('KAS', symbol),
        );
        return;
      }

      // handle RBF
      if (rbf) {
        final txNotifier = ref.read(txNotifierProvider);
        if (txNotifier.pendingTxs.firstOrNull case final pendingTx?) {
          final minFee = Amount.raw(pendingTx.fee.raw + .one);
          if (fee.raw < minFee.raw) {
            adjustFee(minFee: minFee);
            return;
          }
        }
      }

      checkFee();
    }

    return SheetWidget(
      title: tx.isCompoundTx ? l10n.compoundUppercased : l10n.sendConfirm,
      mainWidget: ScrollableWrapper(
        child: SingleChildScrollView(
          padding: const .only(top: 20, bottom: 20),
          child: Column(
            mainAxisSize: .min,
            children: [
              AmountCard(
                amount: amount,
                // rightButton: TextFieldButton(
                //   icon: Icons.sort,
                //   onPressed: () => selectUtxos(minFee: tx.fee),
                // ),
              ),
              // "TO" text
              Container(
                margin: const .only(top: 30, bottom: 10),
                child: Text(
                  l10n.sendToAddressTitle.toUpperCase(),
                  style: styles.textStyleSubHeader,
                ),
              ),
              AddressCard(address: toAddress),
              Container(
                margin: const .only(top: 30, bottom: 10),
                child: Text(
                  l10n.fee.toUpperCase(),
                  style: styles.textStyleSubHeader,
                ),
              ),
              AmountCard(
                amount: fee,
                rightButton: TextFieldButton(
                  icon: Icons.add,
                  onPressed: adjustFee,
                ),
              ),
              if (note != null)
                Padding(
                  padding: const .only(top: 30, bottom: 10),
                  child: SendNoteWidget(note: note),
                ),
            ],
          ),
        ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.confirm, onPressed: onConfirm),
          const CancelActionButton(),
        ],
      ),
    );
  }
}
