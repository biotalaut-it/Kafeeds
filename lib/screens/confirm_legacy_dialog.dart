import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../widgets/radio_item.dart';

class ConfirmLegacyWalletDialog extends HookConsumerWidget {
  const ConfirmLegacyWalletDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.read(stylesProvider);
    final l10n = l10nOf(context);

    final isLegacy = useState(true);

    return AlertDialog(
      title: Text(
        l10n.importLegacyWalletDetectedTitle,
        style: styles.textStyleButtonPrimaryOutline,
      ),
      contentPadding: const .fromSTEB(12, 20, 24, 12),
      content: SingleChildScrollView(
        child: RadioGroup(
          groupValue: isLegacy.value,
          onChanged: (value) => isLegacy.value = value ?? true,
          child: Column(
            children: [
              Padding(
                padding: const .directional(start: 12),
                child: Text(
                  l10n.importLegacyWalletDetectedDetails,
                  style: styles.textStyleParagraph,
                ),
              ),
              const SizedBox(height: 12),
              RadioItem(title: l10n.importAsLegacyWallet, value: true),
              RadioItem(title: l10n.importAsStandardWallet, value: false),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: () => appRouter.pop(context, withResult: isLegacy.value),
          child: Text(l10n.doContinue, style: styles.textStyleDialogOptions),
        ),
      ],
    );
  }
}
