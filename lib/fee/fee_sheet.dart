import 'dart:math';

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
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/dialog.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/fiat_value_container.dart';
import '../widgets/kas_icon_widget.dart';
import '../widgets/sheet_widget.dart';

BigInt _max(BigInt a, BigInt b) => a > b ? a : b;

class FeeSheet extends HookConsumerWidget {
  final Amount minFee;
  final SendTx tx;

  const FeeSheet({
    super.key,
    required this.minFee,
    required this.tx,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final kaspaFormatter = ref.watch(feeFormatterProvider);
    final feeEstimate = ref.watch(feeEstimateProvider(tx.mass));

    final amount = useState<Amount?>(tx.fee);

    final controller = useTextEditingController(
      text: NumberUtil.textFieldFormatedAmount(tx.fee),
    );
    final focusNode = useFocusNode();

    final hint = useState<String?>(null);

    useEffect(() {
      void listener() {
        hint.value = focusNode.hasFocus ? '' : null;
      }

      focusNode.addListener(listener);
      return () => focusNode.removeListener(listener);
    }, [focusNode]);

    void onValueChanged(String text) {
      final value = kaspaFormatter.tryParse(text);

      if (value == null) {
        amount.value = null;
        return;
      }
      amount.value = .value(value);
    }

    void clearAmount() {
      amount.value = null;
      controller.clear();
    }

    Future<void> confirmFee() async {
      if (amount.value == null) {
        appRouter.pop(context);
        return;
      }

      final newFee = amount.value ?? .zero;
      final minFeeRaw = _max(minFee.raw, tx.mass * .from(kMinFeeRate));
      if (newFee.raw < minFeeRaw) {
        final symbol = ref.read(kasSymbolProvider);
        final amountStr = NumberUtil.formatedAmount(.raw(minFeeRaw));
        UIUtil.showSnackbar(l10n.feeSheetPriorityFeeWarning(amountStr, symbol));
        return;
      }

      final spendableUtxos = ref.read(spendableUtxosProvider);
      final walletService = ref.read(walletServiceProvider);

      SendTx newTx;
      try {
        if (tx.isCompoundTx) {
          newTx = walletService
              .createCompoundTx(
                compoundAddress: tx.changeAddress,
                utxos: tx.userSelectedUtxos ?? spendableUtxos,
                feeRate: kMinFeeRate,
                minFee: newFee,
              )
              .copyWith(userSelected: tx.userSelected);

          if (newTx.amount != tx.amount) {
            UIUtil.showSnackbar(l10n.feeCompoundAmountAdjusted);
          }
        } else {
          final inputCount = tx.tx.inputs.length;
          final hasMaxInputs =
              inputCount == kMaxInputsPerTransaction ||
              inputCount == spendableUtxos.length;
          final needsAmountAdjustment =
              (tx.tx.outputs.length == 1 && hasMaxInputs) &&
              newFee.raw != tx.fee.raw;

          Amount newAmount = tx.amount;
          if (needsAmountAdjustment) {
            newAmount = .raw(tx.amount.raw + tx.fee.raw - newFee.raw);
            if (newAmount.raw <= .zero) {
              UIUtil.showSnackbar(l10n.feeAmountNotEnough);
              return;
            }

            final currentAmountStr = NumberUtil.formatedAmount(tx.amount);
            final newAmountStr = NumberUtil.formatedAmount(newAmount);
            final symbol = ref.read(kasSymbolProvider);
            bool confirmed = false;
            await AppDialogs.showConfirmDialog(
              context,
              l10n.feeAmountAdjustmentTitle,
              l10n.feeAmountAdjustmentDescription(
                currentAmountStr,
                newAmountStr,
                symbol,
              ),
              l10n.confirm.toUpperCase(),
              () => confirmed = true,
            );
            if (!confirmed) return;
          }
          newTx = walletService.createSendTx(
            toAddress: tx.address,
            amount: newAmount,
            spendableUtxos: spendableUtxos,
            selectedUtxos: tx.userSelectedUtxos,
            feeRate: kMinFeeRate,
            minFee: newFee,
            changeAddress: tx.changeAddress,
            payload: tx.payload,
            note: tx.note,
          );
        }
      } catch (_) {
        UIUtil.showSnackbar(l10n.feeUpdateError);
        return;
      }

      if (!context.mounted) return;
      appRouter.pop(context, withResult: newTx);
    }

    return SheetWidget(
      title: l10n.feeTitle,
      mainWidget: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            l10n.feePriorityUppsercase,
            style: styles.textStyleSubHeader,
          ),
          FiatValueContainer(
            amount: amount.value ?? .zero,
            hint: l10n.optionalLabel,
            child: AppTextField(
              focusNode: focusNode,
              controller: controller,
              topMargin: 15,
              cursorColor: theme.primary,
              style: styles.textStyleParagraphPrimary,
              inputFormatters: [kaspaFormatter],
              onChanged: onValueChanged,
              textInputAction: .done,
              maxLines: null,
              autocorrect: false,
              hintText: hint.value ?? l10n.feePriorityHint,
              prefixButton: TextFieldButton(widget: KasIconWidget()),
              suffixButton: TextFieldButton(
                icon: Icons.clear,
                onPressed: clearAmount,
              ),
              fadeSuffixOnCondition: true,
              suffixShowFirstCondition: (amount.value?.value ?? .zero) > .zero,
              keyboardType: const .numberWithOptions(decimal: true),
              textAlign: .center,
            ),
          ),
          if (feeEstimate.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(
              l10n.feeSheetRecommendedPriority,
              style: styles.textStyleTokenSymbolSuccess,
            ),
            Padding(
              padding: const .symmetric(horizontal: 28, vertical: 10),
              child: FittedBox(
                fit: .scaleDown,
                child: Row(
                  children: [
                    for (final fee in feeEstimate)
                      Column(
                        children: [
                          Text(
                            switch (fee.$3) {
                              .min => l10n.feePriorityMin,
                              .low => l10n.feePriorityLow,
                              .normal => l10n.feePriorityNormal,
                              .high => l10n.feePriorityHigh,
                            },
                            style: styles.textStyleParagraphSuccess,
                          ),
                          Padding(
                            padding: const .symmetric(horizontal: 4),
                            child: ActionChip(
                              label: Text('${fee.$1}'),
                              labelStyle:
                                  styles.textStyleTransactionAmountSmall,
                              padding: const .symmetric(
                                horizontal: 8,
                                vertical: 12,
                              ),
                              onPressed: () {
                                final text = fee.$1.toString();
                                controller.text = text;
                                onValueChanged(text);
                              },
                            ),
                          ),
                          if (fee.$2 case final time?)
                            Text(
                              '< ${max(time, 1)} s',
                              style: styles.textStyleParagraphThinSuccess,
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.confirm, onPressed: confirmFee),
          const CancelActionButton(),
        ],
      ),
    );
  }
}
