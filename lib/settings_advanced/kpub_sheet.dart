import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/qr_code_widget.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_widget.dart';

final kpubProvider = Provider.autoDispose((ref) {
  final wallet = ref.watch(walletProvider);
  final network = ref.watch(networkProvider);

  return wallet.hdPublicKey(network);
});

class KpubSheet extends ConsumerWidget {
  const KpubSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final kpub = ref.watch(kpubProvider);

    Future<void> copyKpub() async {
      try {
        await Clipboard.setData(ClipboardData(text: kpub));
        UIUtil.showSnackbar(l10n.kpubCopied);
      } catch (_) {
        UIUtil.showSnackbar(l10n.kpubCopyFailed);
      }
    }

    final horizontal = MediaQuery.widthOf(context) * 0.115;

    return SheetWidget(
      title: l10n.kpubTitle,

      mainWidget: ScrollableWrapper(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: .symmetric(horizontal: horizontal, vertical: 30),
                child: Text(
                  l10n.kpubDescription,
                  style: styles.textStyleAccount,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              Container(
                padding: const .symmetric(horizontal: 25, vertical: 15),
                margin: .symmetric(horizontal: horizontal),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.backgroundDarkest,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(kpub, style: styles.textStyleAddressText90),
              ),
              const SizedBox(height: 40),
              QrCodeWidget(data: kpub, showIcon: false),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.copyKpub, onPressed: copyKpub),
          const CloseActionButton(),
        ],
      ),
    );
  }
}
