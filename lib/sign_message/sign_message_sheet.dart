import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../kaspa/wallet_service/wallet_service.dart';
import '../l10n/l10n.dart';
import '../send_sheet/account_address_widget.dart';
import '../util/ui_util.dart';
import '../util/user_data_util.dart';
import '../wallet_address/address_selection_sheet.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_util.dart';
import '../widgets/sheet_widget.dart';
import 'signature_widget.dart';

const kMaxMessageLength = 2000;

final signAddressProvider = Provider((ref) {
  final selectedAddress = ref.watch(selectedAddressProvider);
  return selectedAddress;
});

class SignMessageSheet extends HookConsumerWidget {
  const SignMessageSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final signAddress = ref.watch(signAddressProvider);

    final focusNode = useFocusNode();
    final controller = useTextEditingController();

    final messageLength = useState(0);
    final hint = useState<String?>(null);
    final hintText = l10n.signMessageHint;
    final signature = useState<SignatureDetails?>(null);

    useEffect(() {
      void listener() {
        hint.value = focusNode.hasFocus ? '' : null;
      }

      focusNode.addListener(listener);
      return () => focusNode.removeListener(listener);
    }, [focusNode]);

    void setMessage(String message) {
      if (message.length > kMaxMessageLength) {
        UIUtil.showSnackbar(l10n.signMessageToLong);
        return;
      }

      controller.text = message;
    }

    Future<void> scanQrCode() async {
      final result = await UserDataUtil.scanQrCode(context);
      final message = result?.code;

      if (message == null) {
        return;
      }

      setMessage(message);
    }

    Future<void> pasteFromClipboard() async {
      final data = await Clipboard.getData(Clipboard.kTextPlain);
      final message = data?.text;

      if (message == null) {
        UIUtil.showSnackbar(l10n.clipboardEmpty);
        return;
      }

      setMessage(message);
    }

    void onMessageChanged(String message) {
      messageLength.value = message.length;
    }

    void clearMessage() {
      controller.clear();
      onMessageChanged('');
    }

    void selectAddress() {
      final theme = ref.read(themeProvider);
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const AddressSelectionSheet(addressType: .receive),
      );
    }

    Future<void> signMessage() async {
      final authUtil = ref.read(authUtilProvider);
      final authMessage = l10n.signMessage;
      final auth = await authUtil.authenticateForSecret(context, authMessage);

      if (!auth) {
        return;
      }

      final message = controller.text;
      final walletService = ref.read(walletServiceProvider);

      signature.value = await walletService.signPersonalMessage(
        message,
        address: signAddress.address,
      );
    }

    Future<void> copySignature() async {
      await Clipboard.setData(
        ClipboardData(text: signature.value?.signature ?? ''),
      );
      UIUtil.showSnackbar(l10n.signMessageSignatureCopied);
    }

    final details = signature.value;
    final signed = details != null;

    final viewInsets = MediaQuery.viewInsetsOf(context);
    final bottomPadding = max<double>(viewInsets.bottom - 178, 0);

    return SheetWidget(
      title: signed ? l10n.signMessageSigned : l10n.signMessage,
      mainWidget: ScrollableWrapper(
        child: signed
            ? SignatureWidget(details: details)
            : ListView(
                children: [
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: selectAddress,
                    child: AccountAddressWidget(address: signAddress),
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    leftMargin: 40,
                    rightMargin: 40,
                    focusNode: focusNode,
                    controller: controller,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(kMaxMessageLength),
                    ],
                    textInputAction: .done,
                    maxLines: null,
                    autocorrect: false,
                    autofocus: false,
                    hintText: hint.value ?? hintText,
                    onChanged: onMessageChanged,
                    prefixButton: controller.text.isEmpty
                        ? TextFieldButton(
                            icon: AppIcons.scan,
                            onPressed: scanQrCode,
                          )
                        : null,
                    fadePrefixOnCondition: true,
                    prefixShowFirstCondition: true,
                    suffixButton: controller.text.isEmpty
                        ? TextFieldButton(
                            icon: AppIcons.paste,
                            onPressed: pasteFromClipboard,
                          )
                        : TextFieldButton(
                            icon: Icons.clear,
                            onPressed: clearMessage,
                          ),
                    fadeSuffixOnCondition: true,
                    suffixShowFirstCondition: true,
                    style: styles.textStyleParagraph,
                  ),
                  SizedBox(height: bottomPadding),
                ],
              ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          if (signed) ...[
            PrimaryButton(
              title: l10n.signMessageCopySignature,
              onPressed: copySignature,
            ),
            const CloseActionButton(),
          ] else ...[
            PrimaryButton(
              title: l10n.signMessage,
              onPressed: signMessage,
            ),
            const CancelActionButton(),
          ],
        ],
      ),
    );
  }
}
