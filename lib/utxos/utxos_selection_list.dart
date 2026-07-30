import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../kaspa/types.dart';
import '../kaspa/utils.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../widgets/address_widgets.dart';
import 'utxos_empty_card.dart';

typedef _AddressGroup = ({String address, List<Utxo> utxos});

final _expandedAddressesProvider = StateProvider.autoDispose<ISet<String>>(
  (ref) => const ISetConst({}),
);

final _groupedUtxosProvider = Provider.autoDispose((ref) {
  final utxos = ref.watch(spendableUtxosProvider);

  final groups = <String, List<Utxo>>{};
  for (final utxo in utxos) {
    groups.putIfAbsent(utxo.address, () => []).add(utxo);
  }

  return groups.entries
      .map((entry) => (address: entry.key, utxos: entry.value))
      .toList();
});

class _AddressGroupHeader extends ConsumerWidget {
  final _AddressGroup group;

  const _AddressGroupHeader({super.key, required this.group});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);
    final kasSymbol = ref.watch(kasSymbolProvider);

    final utxos = group.utxos;
    final selectedCount = ref.watch(
      selectedUtxosProvider.select(
        (selected) => utxos.where(selected.contains).length,
      ),
    );
    final allSelected = selectedCount == utxos.length;
    final noneSelected = selectedCount == 0;

    final total = utxos
        .map((utxo) => utxo.utxoEntry.amount)
        .fold(BigInt.zero, (total, amount) => total + amount);
    final formatedTotal = NumberUtil.formatedAmount(Amount.raw(total));

    final expanded = ref.watch(
      _expandedAddressesProvider.select(
        (addresses) => addresses.contains(group.address),
      ),
    );

    void toggleAll() {
      final notifier = ref.read(selectedUtxosProvider.notifier);
      if (allSelected) {
        notifier.update((state) => state.removeAll(utxos));
        return;
      }

      final state = notifier.state;
      final missing = utxos.where((utxo) => !state.contains(utxo)).toList();
      final capacity = kMaxInputsPerTransaction - state.length;
      if (missing.length > capacity) {
        UIUtil.showSnackbar(
          l10n.utxoSelectionMaxInputs(kMaxInputsPerTransaction),
        );
      }
      if (capacity <= 0) return;
      notifier.state = state.addAll(missing.take(capacity));
    }

    void toggleExpanded() {
      ref
          .read(_expandedAddressesProvider.notifier)
          .update(
            (state) => expanded
                ? state.remove(group.address)
                : state.add(group.address),
          );
    }

    return Column(
      mainAxisSize: .min,
      children: [
        TextButton(
          style: styles.rowButtonStyle,
          onPressed: toggleExpanded,
          child: Padding(
            padding: const .fromSTEB(8, 8, 4, 8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: switch (Directionality.of(context)) {
                    _ when !expanded => 0,
                    .rtl => -0.25,
                    .ltr => 0.25,
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.chevron_right, color: theme.text),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        addressNotifier.nameForAddress(group.address) ??
                            l10n.address,
                        style: styles.textStyleTransactionAmountSmall,
                      ),
                      AddressTwoLineText(address: group.address),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            '$formatedTotal $kasSymbol',
                            style: styles.textStyleCurrencyAlt,
                          ),
                          Padding(
                            padding: const .directional(end: 8),
                            child: Text(
                              '$selectedCount / ${utxos.length}',
                              style: styles.textStyleTransactionAmountSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Checkbox(
                  tristate: true,
                  value: switch (selectedCount) {
                    _ when allSelected => true,
                    _ when noneSelected => false,
                    _ => null,
                  },
                  onChanged: (_) => toggleAll(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: expanded ? const .directional(start: 40, end: 16) : .zero,
          child: Container(height: 1, color: theme.text05),
        ),
      ],
    );
  }
}

class _UtxoListItem extends ConsumerWidget {
  final Utxo item;
  final bool lastInGroup;

  const _UtxoListItem({
    super.key,
    required this.item,
    this.lastInGroup = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final amount = Amount.raw(item.utxoEntry.amount);
    final kasSymbol = ref.watch(kasSymbolProvider);
    final formatedValue = NumberUtil.formatedAmount(amount);
    final fiatValue = ref.watch(formatedFiatForAmountProvider(amount));

    final selected = ref.watch(
      selectedUtxosProvider.select((value) => value.contains(item)),
    );

    void updateSelected(bool? value) {
      if (value == null) return;

      final notifier = ref.read(selectedUtxosProvider.notifier);
      if (!value) {
        notifier.update((state) => state.remove(item));
        return;
      }

      if (notifier.state.length >= kMaxInputsPerTransaction) {
        UIUtil.showSnackbar(
          l10n.utxoSelectionMaxInputs(kMaxInputsPerTransaction),
        );
        return;
      }
      notifier.update((state) => state.add(item));
    }

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) => Opacity(opacity: value, child: child),
      child: Column(
        mainAxisSize: .min,
        children: [
          TextButton(
            style: styles.rowButtonStyle,
            onPressed: () => updateSelected(!selected),
            child: Padding(
              padding: const .fromSTEB(40, 8, 4, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          item.outpoint.transactionId,
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: styles.textStyleCurrencyAlt,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              '$formatedValue $kasSymbol',
                              style: styles.textStyleCurrencyAlt,
                            ),
                            Text(
                              '≈ $fiatValue',
                              style: styles.textStyleTransactionAmount,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Checkbox(value: selected, onChanged: updateSelected),
                ],
              ),
            ),
          ),
          Padding(
            padding: lastInGroup
                ? .zero
                : const .directional(start: 40, end: 16),
            child: Container(height: 1, color: theme.text05),
          ),
        ],
      ),
    );
  }
}

class UtxosSelectionList extends ConsumerWidget {
  const UtxosSelectionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    final groups = ref.watch(_groupedUtxosProvider);
    final expanded = ref.watch(_expandedAddressesProvider);

    final rows = <Object>[];
    for (final group in groups) {
      rows.add(group);
      if (expanded.contains(group.address)) rows.addAll(group.utxos);
    }

    Future<void> refresh() async {
      ref.read(hapticUtilProvider).success();

      final networkError = ref.read(networkErrorProvider);
      if (networkError) {
        ref.invalidate(kaspaRpcProvider);
      }

      final addresses = ref.read(activeAddressesProvider);
      final notifier = ref.read(utxoNotifierProvider);
      await notifier.refresh(addresses: addresses);
    }

    return RefreshIndicator(
      color: theme.primary,
      backgroundColor: theme.backgroundDark,
      onRefresh: refresh,
      child: rows.isEmpty
          ? ListView(
              padding: const .fromSTEB(0, 5, 0, 15),
              children: const [UtxosEmptyCard()],
            )
          : ListView.builder(
              key: const PageStorageKey('utxo-selection-list'),
              padding: const .only(top: 6, bottom: 28),
              itemCount: rows.length,
              itemBuilder: (context, index) {
                return switch (rows[index]) {
                  final Utxo utxo => _UtxoListItem(
                    key: ValueKey(utxo.outpoint),
                    item: utxo,
                    lastInGroup:
                        index + 1 == rows.length ||
                        rows[index + 1] is _AddressGroup,
                  ),
                  final _AddressGroup group => _AddressGroupHeader(
                    key: ValueKey(group.address),
                    group: group,
                  ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
    );
  }
}
