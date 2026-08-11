import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';

class PushDataWidget extends ConsumerWidget {
  final String data;
  final VoidCallback? onPressed;

  const PushDataWidget({
    super.key,
    required this.data,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    return Row(
      children: [
        Expanded(
          child: Text(
            data,
            style: styles.textStyleAddressText60,
            overflow: .fade,
            softWrap: false,
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 40,
          width: 40,
          child: TextButton(
            style: styles.roundedTextButtonStyle,
            onPressed: onPressed,
            child: Icon(Icons.copy, color: theme.text),
          ),
        ),
      ],
    );
  }
}

class PushInfoDialog extends ConsumerWidget {
  const PushInfoDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final supportId = ref.watch(supportIdProvider);
    final accountId = ref.watch(accountIdForPushProvider);

    Future<void> copySupportId() async {
      await Clipboard.setData(ClipboardData(text: supportId));
      UIUtil.showSnackbar(l10n.notificationsSupportIdCopied);
    }

    Future<void> copyAccountId() async {
      await Clipboard.setData(ClipboardData(text: accountId));
      UIUtil.showSnackbar(l10n.notificationsAccountIdCopied);
    }

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(l10n.notificationsSupportId, style: styles.textStyleParagraphBold),
        PushDataWidget(data: supportId, onPressed: copySupportId),
        const SizedBox(height: 20),
        Text(l10n.notificationsAccountId, style: styles.textStyleParagraphBold),
        PushDataWidget(data: accountId, onPressed: copyAccountId),
        const SizedBox(height: 20),
      ],
    );
  }
}
