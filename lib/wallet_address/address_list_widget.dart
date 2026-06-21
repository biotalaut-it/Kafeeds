import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../widgets/item_divider.dart';
import 'address_list_item.dart';
import 'wallet_address.dart';
import 'wallet_address_providers.dart';

class AddressListWidget extends HookConsumerWidget {
  final AddressType addressType;
  final ScrollController scrollController;
  final void Function(WalletAddress address)? onSelection;

  const AddressListWidget({
    super.key,
    required this.addressType,
    required this.scrollController,
    this.onSelection,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    var addresses = ref.watch(filteredAddressesOfTypeProvider(addressType));
    final receiveAddress = ref.watch(receiveAddressProvider);
    if (addressType == .receive && addresses.isEmpty) {
      addresses = [receiveAddress].lock;
    }

    useAutomaticKeepAlive();

    final emptyDescription = switch (addressType) {
      .receive => l10n.receiveAddressListEmpty,
      .change => l10n.changeAddressListEmpty,
    };

    if (addresses.isEmpty) {
      return Column(
        children: [
          Align(
            alignment: .topCenter,
            child: Padding(
              padding: const .only(top: 40, bottom: 20),
              child: Text(
                emptyDescription,
                style: styles.textStyleAccount,
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Text(
              l10n.hintAddressListEmpty,
              style: styles.textStyleAddressText60,
              maxLines: 2,
              textAlign: .center,
            ),
          ),
        ],
      );
    }

    final items = addresses.unlockView.reversed;

    return ListView.separated(
      padding: const .symmetric(vertical: 10),
      controller: scrollController,
      separatorBuilder: (_, _) => const ItemDivider(),
      itemCount: items.length,
      itemBuilder: (_, index) {
        final address = items.elementAt(index);
        return AddressListItem(
          address: address,
          onSelection: onSelection,
        );
      },
    );
  }
}
