import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../send_sheet/send_sheet.dart';
import '../util/ui_util.dart';
import '../util/util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/address_widgets.dart';
import '../widgets/buttons.dart';
import '../widgets/contact_info_button.dart';
import '../widgets/dialog.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/qr_code_widget.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_util.dart';
import '../widgets/sheet_widget.dart';
import '../widgets/trashcan_button.dart';
import 'contact.dart';

class ContactDetails extends HookConsumerWidget {
  final Contact contact;
  final String? documentsDirectory;

  const ContactDetails({
    super.key,
    required this.contact,
    this.documentsDirectory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressCopied = useState(false);
    final addressCopiedTimer = useRef<Timer?>(null);

    void deleteContact() {
      ref.read(contactsProvider).removeContact(contact);
      final message = l10n.contactRemoved(contact.name);
      UIUtil.showSnackbar(message);
      appRouter.pop(context);
    }

    void confirmDeleteContact() {
      AppDialogs.showConfirmDialog(
        context,
        l10n.removeContact,
        l10n.removeContactConfirmation(contact.name),
        l10n.yesUppercase,
        deleteContact,
        cancelText: l10n.noUppercase,
      );
    }

    Future<void> copyAddress() async {
      await Clipboard.setData(ClipboardData(text: contact.address));
      addressCopied.value = true;
      addressCopiedTimer.value?.cancel();
      addressCopiedTimer.value = Timer(
        const Duration(milliseconds: 800),
        () => addressCopied.value = false,
      );
    }

    Future<void> showSendSheet() async {
      appRouter.pop(context);
      final (:cont, :rbf) = await UIUtil.checkForPendingTx(context, ref: ref);
      if (cont) {
        Sheets.showAppHeightNineSheet(
          context: context,
          theme: theme,
          widget: SendSheet(contact: contact, rbf: rbf),
        );
      }
    }

    final size = MediaQuery.sizeOf(context);
    final horizontal = size.width * 0.105;

    return SheetWidget(
      title: l10n.contactHeader,
      leftWidget: TrashcanButton(onPressed: confirmDeleteContact),
      rightWidget: ContactInfoButton(
        onPressed: () {
          final explorer = ref.read(blockExplorerProvider);
          openUrl(explorer.urlForAddress(contact.address));
        },
      ),
      mainWidget: ScrollableWrapper(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.only(top: 19, bottom: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Contact Name container
                Container(
                  width: double.infinity,
                  margin: .symmetric(horizontal: horizontal),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: theme.backgroundDarkest,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    contact.name,
                    textAlign: TextAlign.center,
                    style: styles.textStyleDialogOptions,
                  ),
                ),
                // Contact Address
                GestureDetector(
                  onTap: copyAddress,
                  child: Container(
                    width: double.infinity,
                    margin: .only(
                      left: horizontal,
                      right: horizontal,
                      top: 15,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: theme.backgroundDarkest,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: AddressThreeLineText(
                      address: contact.address,
                      type: addressCopied.value
                          ? AddressTextType.SUCCESS_FULL
                          : AddressTextType.PRIMARY,
                    ),
                  ),
                ),
                // Address Copied text container
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    addressCopied.value ? l10n.addressCopied : '',
                    style: styles.textStyleParagraphThinSuccess,
                  ),
                ),
                // QR Code
                FittedBox(
                  fit: BoxFit.contain,
                  child: QrCodeWidget(
                    data: contact.address,
                    onTap: copyAddress,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.send, onPressed: showSendSheet),
          const CloseActionButton(),
        ],
      ),
    );
  }
}
