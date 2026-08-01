import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../kaspa/kaspa.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_widget.dart';
import 'utxos_selection_list.dart';

typedef _SummaryParams = ({SendTx tx, Amount minFee});

final _summaryProvider = Provider.family.autoDispose<SendTx?, _SummaryParams>((
  ref,
  params,
) {
  final spendableUtxos = ref.watch(spendableUtxosProvider);
  final selectedUtxos = ref.watch(selectedUtxosProvider).toList();
  final walletService = ref.watch(walletServiceProvider);
  final feeRate = ref.watch(feeRateProvider);

  final sendTx = params.tx;
  try {
    if (sendTx.isCompoundTx) {
      if (selectedUtxos.length == 1) return null;
      final utxos = selectedUtxos.isEmpty ? spendableUtxos : selectedUtxos;
      return walletService.createCompoundTx(
        compoundAddress: sendTx.changeAddress,
        utxos: utxos,
        feeRate: feeRate,
        minFee: params.minFee,
      );
    }
    return walletService.createSendTx(
      toAddress: sendTx.address,
      amount: sendTx.amount,
      spendableUtxos: spendableUtxos,
      selectedUtxos: selectedUtxos,
      feeRate: feeRate,
      minFee: params.minFee,
      changeAddress: sendTx.changeAddress,
      payload: sendTx.payload,
      note: sendTx.note,
    );
  } catch (_) {
    return null;
  }
});

class UtxosSelectionSummary extends ConsumerWidget {
  final SendTx tx;
  final Amount minFee;
  const UtxosSelectionSummary({
    super.key,
    required this.tx,
    required this.minFee,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final pendingTx = ref.watch(_summaryProvider((tx: tx, minFee: minFee)));
    final spendableUtxos = ref.watch(spendableUtxosProvider);
    final selectedUtxos = ref.watch(selectedUtxosProvider);
    final symbol = ref.watch(kasSymbolProvider);

    final selectedAmount = Amount.raw(
      selectedUtxos
          .map((utxo) => utxo.utxoEntry.amount)
          .fold(BigInt.zero, (total, amount) => total + amount),
    );

    String formated(Amount? amount) {
      if (amount == null) return '-';
      return '${NumberUtil.formatedAmount(amount)} $symbol';
    }

    Widget cell(String label, String value, {bool end = false}) {
      return Expanded(
        child: Column(
          crossAxisAlignment: end ? .end : .start,
          children: [
            Text(label, style: styles.textStyleTransactionAmountSmall),
            Text(value, style: styles.textStyleCurrencyAlt),
          ],
        ),
      );
    }

    return Container(
      margin: const .fromSTEB(14, 4, 14, 4),
      padding: const .symmetric(vertical: 12, horizontal: 24),
      width: .infinity,
      decoration: BoxDecoration(
        color: theme.backgroundDarkest,
        borderRadius: .circular(25),
        boxShadow: [theme.boxShadow],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                l10n.utxoSelectionSelectedCount,
                style: styles.textStyleTransactionAmountSmall,
              ),
              Text(
                '${selectedUtxos.length} / ${spendableUtxos.length}',
                style: styles.textStyleCurrencyAlt,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              cell(
                l10n.utxoSelectionTargetAmount,
                formated(tx.isCompoundTx ? pendingTx?.amount : tx.amount),
              ),
              cell(
                l10n.utxoSelectionSelectedAmount,
                formated(selectedAmount),
                end: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            alignment: .center,
            children: [
              Visibility(
                visible: pendingTx != null,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Row(
                  children: [
                    cell(l10n.utxoSelectionTotalFee, formated(pendingTx?.fee)),
                    cell(l10n.change, formated(pendingTx?.change), end: true),
                  ],
                ),
              ),
              if (pendingTx == null)
                Text(
                  l10n.utxoSelectionHint,
                  style: styles.textStyleParagraphPrimary,
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
  final Amount minFee;
  const UtxosSelectionPage({
    super.key,
    required this.tx,
    required this.minFee,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    useEffect(() {
      Future.microtask(() {
        final spendable = ref.read(spendableUtxosProvider).toSet();
        ref.read(selectedUtxosProvider.notifier).state = ISet(
          tx.userSelectedUtxos?.where(spendable.contains),
        );
      });
      return null;
    }, const []);

    ref.listen(spendableUtxosProvider, (_, spendable) {
      final notifier = ref.read(selectedUtxosProvider.notifier);
      final spendableSet = spendable.toSet();
      final pruned = ISet(notifier.state.where(spendableSet.contains));
      if (pruned.length != notifier.state.length) notifier.state = pruned;
    });

    void onConfirm() {
      final pendingTx = ref.read(_summaryProvider((tx: tx, minFee: minFee)));
      if (pendingTx == null) {
        UIUtil.showSnackbar(l10n.utxoSelectionHint);
        return;
      }

      final selectedUtxos = ref.read(selectedUtxosProvider).toList();
      appRouter.pop(context, withResult: selectedUtxos);
    }

    return SheetWidget(
      title: l10n.utxoSelectionTitle,
      mainWidget: Column(
        mainAxisSize: .min,
        children: [
          UtxosSelectionSummary(tx: tx, minFee: minFee),
          const Expanded(
            child: ScrollableWrapper(child: UtxosSelectionList()),
          ),
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
