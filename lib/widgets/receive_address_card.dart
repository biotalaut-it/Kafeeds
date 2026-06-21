import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../wallet_address/address_selection_sheet.dart';
import 'address_widgets.dart';
import 'sheet_util.dart';

class ReceiveAddressCard extends HookConsumerWidget {
  final Address address;
  final bool showLabel;
  final AddressTextType type;

  const ReceiveAddressCard({
    super.key,
    required this.address,
    this.showLabel = true,
    this.type = .PRIMARY,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    final label = useMemoized(() {
      if (!showLabel) return null;

      final addressNotifier = ref.read(addressNotifierProvider);
      final name = addressNotifier.nameForAddress(address.encoded);
      if (name == null) {
        return null;
      }
      return '#$name';
    }, [address, showLabel]);

    final horizontal = MediaQuery.widthOf(context) * 0.105;

    return Container(
      margin: .symmetric(horizontal: horizontal),
      width: .infinity,
      decoration: BoxDecoration(
        color: theme.backgroundDarkest,
        borderRadius: .circular(25),
      ),
      child: TextButton(
        style: styles.fieldCardButtonStyle,
        onPressed: () {
          Sheets.showAppHeightNineSheet(
            context: context,
            theme: ref.read(themeProvider),
            widget: AddressSelectionSheet(addressType: .receive),
          );
        },
        child: Padding(
          padding: const .symmetric(horizontal: 25, vertical: 15),
          child: AddressThreeLineText(
            address: address.encoded,
            label: label,
            type: type,
          ),
        ),
      ),
    );
  }
}
