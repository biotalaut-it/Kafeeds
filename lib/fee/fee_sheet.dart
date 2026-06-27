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
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/fiat_value_container.dart';
import '../widgets/kas_icon_widget.dart';
import '../widgets/sheet_widget.dart';

class FeeSheet extends HookConsumerWidget {
  final Amount minFee;
  final BigInt txMass;

  const FeeSheet({
    super.key,
    required this.minFee,
    required this.txMass,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final kaspaFormatter = ref.watch(feeFormatterProvider);
    final feeEstimate = ref.watch(feeEstimateProvider(txMass));

    final amount = useState<Amount?>(minFee);

    final controller = useTextEditingController(
      text: minFee == .zero ? null : NumberUtil.textFieldFormatedAmount(minFee),
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

    void confirmFee() {
      final newFee = amount.value ?? .zero;
      if (newFee.raw < minFee.raw) {
        final symbol = ref.read(kasSymbolProvider);
        final amountStr = NumberUtil.formatedAmount(minFee);
        UIUtil.showSnackbar(l10n.feeSheetPriorityFeeWarning(amountStr, symbol));
        return;
      }
      appRouter.pop(context, withResult: newFee);
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
