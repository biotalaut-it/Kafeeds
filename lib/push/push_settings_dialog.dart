import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../widgets/item_divider.dart';

enum PushSettingsAction { enable, disable, manageAddresses, reset }

class PushSettingsDialog extends ConsumerWidget {
  const PushSettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final pushEnabled = ref.watch(pushEnabledProvider);

    final hasToken = ref.watch(pushTokenProvider).isNotEmpty;

    Widget option(PushSettingsAction action, String title, {TextStyle? style}) {
      return SimpleDialogOption(
        onPressed: () => Navigator.pop(context, action),
        child: Padding(
          padding: const .symmetric(vertical: 8),
          child: Text(title, style: style ?? styles.textStyleDialogOptions),
        ),
      );
    }

    return SimpleDialog(
      title: Padding(
        padding: const .only(bottom: 10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(l10n.notifications, style: styles.textStyleDialogHeader),
            const SizedBox(height: 4),
            Text(
              l10n.notificationsDescription,
              style: styles.textStyleParagraphSmall,
            ),
            if (!pushEnabled) ...[
              const SizedBox(height: 8),
              Text(
                l10n.notificationsDisclosure,
                style: styles.textStyleParagraphSmall,
              ),
            ],
          ],
        ),
      ),
      children: [
        if (pushEnabled) ...[
          option(.disable, l10n.turnOff),
          option(.manageAddresses, l10n.watchedAddresses),
        ] else
          option(.enable, l10n.turnOn),
        if (hasToken) ...[
          const Padding(
            padding: .symmetric(vertical: 4),
            child: ItemDivider(),
          ),
          option(
            .reset,
            l10n.resetNotifications,
            style: styles.textStyleDialogOptions.copyWith(
              color: Colors.orange,
            ),
          ),
        ],
      ],
    );
  }
}
