import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../kaspa/kaspa.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/sheet_widget.dart';
import 'utxos_widget.dart';

final _summaryProvider = Provider.family.autoDispose((ref, SendTx sendTx) {
  final spendableUtxos = ref.watch(spendableUtxosProvider);
  final selectedUtxos = ref.watch(selectedUtxosProvider).toList();
  final walletService = ref.watch(walletServiceProvider);
  final feeRate = ref.watch(feeRateProvider);

  return walletService.createSendTx(
    toAddress: sendTx.address,
    amount: sendTx.amount,
    spendableUtxos: spendableUtxos,
    selectedUtxos: selectedUtxos,
    feeRate: feeRate,
    minFee: sendTx.fee,
    changeAddress: sendTx.changeAddress,
    payload: sendTx.payload,
    note: sendTx.note,
  );
});

class UtxosSelectionSummary extends HookConsumerWidget {
  final SendTx tx;
  const UtxosSelectionSummary({super.key, required this.tx});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);

    final pendingTx = ref.watch(_summaryProvider(tx));

    final spendableUtxos = ref.watch(spendableUtxosProvider);
    final symbol = ref.watch(kasSymbolProvider);

    return Padding(
      padding: const .symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Target Amount',
                style: styles.textStyleParagraph,
              ),
              Text(
                'Selected Amount',
                style: styles.textStyleParagraph,
              ),
              Text(
                'Selected UTXOs',
                style: styles.textStyleParagraph,
              ),
              Text(
                'Total fee',
                style: styles.textStyleParagraph,
              ),
              Text(
                'Change',
                style: styles.textStyleParagraph,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text(
                '${tx.amount.value} $symbol',
                style: styles.textStyleParagraph,
              ),
              Text(
                '${pendingTx.amount.value} $symbol',
                style: styles.textStyleParagraph,
              ),
              Text(
                '${pendingTx.utxos.length} of ${spendableUtxos.length}',
                style: styles.textStyleParagraph,
              ),
              Text(
                '${pendingTx.fee.value} $symbol',
                style: styles.textStyleParagraph,
              ),
              Text(
                '${pendingTx.change.value}$symbol',
                style: styles.textStyleParagraph,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UtxosSelectionPage extends HookConsumerWidget {
  final SendTx tx;
  const UtxosSelectionPage({
    super.key,
    required this.tx,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    Future<void> onConfirm() async {
      try {
        final spendableUtxos = ref.read(spendableUtxosProvider);
        final selectedUtxos = ref.read(selectedUtxosProvider).toList();
        final walletService = ref.read(walletServiceProvider);
        final feeRate = ref.read(feeRateProvider);

        walletService.createSendTx(
          toAddress: tx.address,
          amount: tx.amount,
          spendableUtxos: spendableUtxos,
          selectedUtxos: selectedUtxos,
          feeRate: feeRate,
          minFee: tx.fee,
          changeAddress: tx.changeAddress,
        );
        appRouter.pop(context, withResult: selectedUtxos);
      } catch (e) {
        UIUtil.showSnackbar(l10n.utxoSelectionHint);
      }
    }

    return SheetWidget(
      title: l10n.utxoSelectionTitle,
      mainWidget: Column(
        mainAxisSize: .min,
        children: [
          UtxosSelectionSummary(tx: tx),
          Expanded(child: UtxosWidget(selectionMode: true)),
        ],
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
