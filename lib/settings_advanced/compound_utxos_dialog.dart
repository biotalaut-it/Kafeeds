import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../widgets/app_simpledialog.dart';

class CompoundUtxosDialog extends ConsumerWidget {
  final bool lightMode;

  const CompoundUtxosDialog({
    super.key,
    this.lightMode = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final utxos = ref.watch(utxoListProvider);
    final balance = ref.watch(formatedTotalBalanceProvider);
    final maxSend = NumberUtil.formatedAmount(ref.watch(maxSendProvider));
    final kasSymbol = ref.watch(kasSymbolProvider);

    void compound() {
      if (lightMode) appRouter.pop(context);
      UIUtil.showCompoundFlow(context, ref: ref);
    }

    return AppAlertDialog(
      title: Text(
        lightMode ? l10n.compoundRequired : l10n.compoundUtxosConfirmation,
        style: styles.textStyleDialogHeader,
      ),
      content: lightMode
          ? Text(
              l10n.compoundRequiredDescription,
              style: styles.textStyleSettingItemHeader,
            )
          : Row(
              crossAxisAlignment: .start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        l10n.utxosUppercase,
                        style: styles.textStyleSettingItemHeader,
                      ),
                      Padding(
                        padding: const .symmetric(vertical: 8),
                        child: Text(
                          l10n.balance,
                          style: styles.textStyleSettingItemHeader,
                        ),
                      ),
                      Text(
                        l10n.maxSend,
                        style: styles.textStyleSettingItemHeader,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        '${utxos.length}',
                        style: styles.textStyleSettingItemHeader,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$balance $kasSymbol',
                        style: styles.textStyleSettingItemHeader,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$maxSend $kasSymbol',
                        style: styles.textStyleSettingItemHeader,
                      ),
                    ],
                  ),
                ),
              ],
            ),
      actions: [
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: () => appRouter.pop(context),
          child: Text(
            l10n.closeUppercased,
            style: styles.textStyleDialogOptions,
          ),
        ),
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: compound,
          child: Text(
            l10n.compoundUppercased,
            style: styles.textStyleDialogOptions,
          ),
        ),
      ],
    );
  }
}
