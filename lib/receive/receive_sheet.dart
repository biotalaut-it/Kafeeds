import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../l10n/l10n.dart';
import '../send_sheet/account_address_widget.dart';
import '../util/ui_util.dart';
import '../wallet_address/address_selection_sheet.dart';
import '../wallet_address/wallet_address.dart';
import '../widgets/buttons/primary_outline_button.dart';
import '../widgets/qr_code_widget.dart';
import '../widgets/sheet_handle.dart';
import '../widgets/sheet_header_button.dart';
import '../widgets/sheet_util.dart';
import '../widgets/tap_outside_unfocus.dart';
import 'receive_amount_field.dart';
import 'share_card.dart';

class ReceiveSheet extends HookConsumerWidget {
  const ReceiveSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final receiveAddress = ref.watch(selectedAddressProvider);
    final address = receiveAddress.encoded;
    final amount = ref.watch(amountProvider);

    final kaspaUri = KaspaUri(address: receiveAddress.address, amount: amount);

    final shareCardKey = useRef(GlobalKey());
    final showShareCard = useState(false);

    Future<Uint8List?> capturePng() async {
      if (shareCardKey.value.currentContext == null) {
        return null;
      }
      RenderRepaintBoundary boundary = shareCardKey.value.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 5);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    }

    void selectAddress() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const AddressSelectionSheet(
          addressType: AddressType.receive,
        ),
      );
    }

    Future<void> copyAddress() async {
      try {
        await Clipboard.setData(ClipboardData(text: address));
        UIUtil.showSnackbar(l10n.addressCopied);
      } catch (_) {
        UIUtil.showSnackbar(l10n.addressCopiedFailed);
      }
    }

    Future<void> copyUri() async {
      try {
        await Clipboard.setData(ClipboardData(text: kaspaUri.toString()));
        UIUtil.showSnackbar(l10n.kaspaUriCopied);
      } catch (_) {
        UIUtil.showSnackbar(l10n.kaspaUriCopyFailed);
      }
    }

    Future<void> shareAddress() async {
      final lockDisabled = ref.read(lockDisabledProvider.notifier);
      lockDisabled.state = true;

      try {
        showShareCard.value = true;
        await Future.delayed(Duration(milliseconds: 50));
        if (!showShareCard.value) {
          return;
        }
        final byteData = await capturePng();
        final box = context.findRenderObject() as RenderBox?;
        final params = ShareParams(
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
          text: address,
          files: [
            if (byteData != null)
              XFile.fromData(byteData, mimeType: 'image/png'),
          ],
          fileNameOverrides: [
            if (byteData != null) '$address.png',
          ],
        );
        SharePlus.instance.share(params);
        showShareCard.value = false;
      } catch (e, st) {
        final log = ref.read(loggerProvider);
        log.e('Failed to share address', error: e, stackTrace: st);
      }

      lockDisabled.state = false;
    }

    return TapOutsideUnfocus(
      child: SafeArea(
        minimum: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.035,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 60, height: 60),
                Column(children: [
                  const SheetHandle(),
                  GestureDetector(
                    child: AccountAddressWidget(address: receiveAddress),
                    onTap: selectAddress,
                    onLongPress: copyAddress,
                  ),
                ]),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 10, end: 10),
                  child: SheetHeaderButton(
                    icon: Icons.copy,
                    onPressed: copyAddress,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ReceiveAmountField(hint: l10n.optionalLabel),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 28,
                  left: 20,
                  right: 20,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Visibility(
                        visible: showShareCard.value,
                        child: Container(
                          child: AppShareCard(globalKey: shareCardKey.value),
                          alignment: const AlignmentDirectional(0, 0),
                        ),
                      ),
                      // This is for hiding the share card
                      Center(
                        child: Container(
                          width: 260,
                          height: 150,
                          color: theme.backgroundDark,
                        ),
                      ),
                      Center(
                        child: QrCodeWidget(
                          data: '$kaspaUri',
                          onTap: copyUri,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PrimaryOutlineButton(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              title: l10n.addressShare,
              disabled: showShareCard.value,
              onPressed: shareAddress,
            ),
          ],
        ),
      ),
    );
  }
}
