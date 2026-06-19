import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/content_wrapper.dart';

class SetupFailedPage extends ConsumerWidget {
  final Object? error;
  final VoidCallback onRestart;

  const SetupFailedPage({
    super.key,
    required this.error,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    Future<void> copyError() async {
      await Clipboard.setData(ClipboardData(text: error.toString()));
      UIUtil.showSnackbar(l10n.errorMessageCopied);
    }

    return ContentWrapper(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset('assets/kaspa.png'),
                  ),
                ),
                Text(
                  l10n.setupFailedMessage,
                  style: styles.textStyleSettingItemHeaderLarge,
                ),
              ],
            ),
          ),
          ActionButtonsWrapper(
            buttons: [
              PrimaryButton(
                title: l10n.copyErrorButton,
                onPressed: copyError,
              ),
              PrimaryOutlineButton(
                title: l10n.restartSetupButton,
                onPressed: onRestart,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
