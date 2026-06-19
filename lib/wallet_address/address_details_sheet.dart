import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../util/util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/address_widgets.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/contact_info_button.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/sheet_widget.dart';
import 'wallet_address.dart';

class AddressDetailsSheet extends HookConsumerWidget {
  final WalletAddress address;

  const AddressDetailsSheet({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final nameFocusNode = useFocusNode();
    final nameController = useTextEditingController(text: address.name);

    final title = address.type == AddressType.receive
        ? l10n.receiveAddress.toUpperCase()
        : l10n.changeAddress.toUpperCase();

    Future<void> copyAddress() async {
      try {
        await Clipboard.setData(ClipboardData(text: address.encoded));
        UIUtil.showSnackbar(l10n.addressCopied);
      } catch (_) {
        UIUtil.showSnackbar(l10n.addressCopiedFailed);
      }
    }

    void showExplorer() {
      final explorer = ref.read(blockExplorerProvider);
      final url = explorer.urlForAddress(address.encoded);
      openUrl(url);
    }

    useEffect(() {
      final notifier = ref.read(addressNotifierProvider.notifier);
      return () {
        final name = nameController.text.trim();
        if (name.isNotEmpty) {
          notifier.changeAddressName(address, name);
        }
      };
    }, const []);

    return SheetWidget(
      title: title,
      rightWidget: ContactInfoButton(onPressed: showExplorer),
      mainWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextField(
            topMargin: 10,
            controller: nameController,
            focusNode: nameFocusNode,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            keyboardType: TextInputType.text,
            inputFormatters: [
              LengthLimitingTextInputFormatter(25),
            ],
            style: styles.textStyleAppTextField,
          ),
          const SizedBox(height: 22),
          AddressThreeLineText(
            address: address.encoded,
            type: AddressTextType.PRIMARY60,
          ),
          const SizedBox(height: 12),
          if (address.type == AddressType.receive)
            Expanded(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 280),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: theme.primary, width: 2),
                  ),
                  child: QrImageView(
                    data: address.encoded,
                    gapless: false,
                    embeddedImage: AssetImage('assets/qr_code_icon.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: const Size(40, 40),
                    ),
                    backgroundColor: Colors.white,
                    errorCorrectionLevel: QrErrorCorrectLevel.Q,
                    semanticsLabel: 'QR code for address $address',
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.copyAddress, onPressed: copyAddress),
          const CloseActionButton(),
        ],
      ),
    );
  }
}
