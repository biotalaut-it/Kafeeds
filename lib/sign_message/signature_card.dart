import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/qr_code_widget.dart';

class SignatureCard extends HookConsumerWidget {
  final String signature;
  const SignatureCard({super.key, required this.signature});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final showQrCode = useState(false);

    Future<void> copySignature() async {
      await Clipboard.setData(ClipboardData(text: signature));
      UIUtil.showSnackbar(l10n.signMessageSignatureCopied);
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.105,
      ),
      //width: double.infinity,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: theme.backgroundDarkest,
        child: InkWell(
          onTap: () => showQrCode.value = !showQrCode.value,
          onLongPress: copySignature,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.signMessageSignature.toUpperCase(),
                        style: showQrCode.value
                            ? styles.textStyleDataTypeHeader
                            : styles.textStyleDataTypeHeaderHighlight,
                      ),
                      TextSpan(
                        text: ' | '.toUpperCase(),
                        style: styles.textStyleDataTypeHeader,
                      ),
                      TextSpan(
                        text: l10n.signMessageQrCode.toUpperCase(),
                        style: showQrCode.value
                            ? styles.textStyleDataTypeHeaderHighlight
                            : styles.textStyleDataTypeHeader,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (showQrCode.value) ...[
                  QrCodeWidget(data: signature, showIcon: false),
                  const SizedBox(height: 10),
                ] else
                  Text(
                    signature,
                    style: styles.textStyleSeed,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
