import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../wallet_address/address_discovery.dart';
import '../wallet_address/wallet_address.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/item_divider.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_widget.dart';

typedef _ScanProgress = ({AddressType type, int checked});

typedef _ScanOutcome = ({int found, _ScanEnd end});

enum _ScanEnd { completed, stopped, failed }

const _kStatusHeight = 96.0;

class AddressDiscoverySheet extends HookConsumerWidget {
  const AddressDiscoverySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    final addresses = ref.read(addressNotifierProvider);

    final scanIndexes = useState<ScanIndexesPair>((
      receive: ScanIndexes(
        start: addresses.lastUsedReceiveIndex,
        scanned: null,
        last: addresses.lastUsedReceiveIndex,
      ),
      change: ScanIndexes(
        start: addresses.lastUsedChangeIndex,
        scanned: null,
        last: addresses.lastUsedChangeIndex,
      ),
    ));

    final progress = useState<_ScanProgress?>(null);
    final outcome = useState<_ScanOutcome?>(null);
    final cancelled = useRef(false);
    final stopping = useState(false);

    final receiveIndexes = scanIndexes.value.receive;
    final changeIndexes = scanIndexes.value.change;
    final scanning = progress.value != null;

    useEffect(() {
      return () => cancelled.value = true;
    }, const []);

    Future<void> scan() async {
      final receiveStart = receiveIndexes.nextScanStart;
      final changeStart = changeIndexes.nextScanStart;

      cancelled.value = false;
      stopping.value = false;
      outcome.value = null;
      progress.value = (type: .receive, checked: 0);

      try {
        final network = ref.read(networkProvider);
        final auth = ref.read(walletAuthProvider.notifier);
        final addressGenerator = auth.addressGenerator(network);
        final rpc = ref.read(kaspaRpcProvider);
        final api = ref.read(kaspaApiServiceProvider);

        final addressDiscovery = AddressDiscovery(
          rpc: rpc,
          api: api,
          addressGenerator: addressGenerator,
          addressNameCallback: (type, index) {
            return switch (type) {
              .receive => l10n.receiveIndexParam('$index'),
              .change => l10n.changeIndexParam('$index'),
            };
          },
        );

        final result = await addressDiscovery.addressDiscovery(
          startReceiveIndex: receiveStart,
          startChangeIndex: changeStart,
          onProgress: (type, index) {
            if (cancelled.value) return false;

            final start = switch (type) {
              .receive => receiveStart,
              .change => changeStart,
            };
            progress.value = (type: type, checked: index - start);
            return true;
          },
        );

        if (result.isNotEmpty) {
          await addresses.addAddresses(result.addresses);
        }

        if (!context.mounted) return;

        scanIndexes.value = (
          receive: ScanIndexes(
            start: receiveIndexes.start,
            scanned:
                result.receive.scanIndexes.scanned ?? receiveIndexes.scanned,
            last: result.receive.scanIndexes.last ?? receiveIndexes.last,
          ),
          change: ScanIndexes(
            start: changeIndexes.start,
            scanned: result.change.scanIndexes.scanned ?? changeIndexes.scanned,
            last: result.change.scanIndexes.last ?? changeIndexes.last,
          ),
        );

        outcome.value = (
          found: result.addresses.where((address) => address.used).length,
          end: cancelled.value ? .stopped : .completed,
        );
      } catch (e) {
        if (!context.mounted) return;

        outcome.value = (found: 0, end: .failed);
      } finally {
        if (context.mounted) progress.value = null;
      }
    }

    void stopScan() {
      cancelled.value = true;
      stopping.value = true;
    }

    return SheetWidget(
      title: l10n.addressDiscovery,
      mainWidget: ScrollableWrapper(
        child: SingleChildScrollView(
          child: Padding(
            padding: const .symmetric(horizontal: 28, vertical: 24),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                _ChainSummary(title: l10n.receive, indexes: receiveIndexes),
                const SizedBox(height: 20),
                const ItemDivider(),
                const SizedBox(height: 20),
                _ChainSummary(title: l10n.change, indexes: changeIndexes),
                const SizedBox(height: 20),
                const ItemDivider(),
                SizedBox(
                  height: _kStatusHeight,
                  child: Align(
                    alignment: .centerLeft,
                    child: switch ((progress.value, outcome.value)) {
                      (final scan?, _) => _ScanProgressView(progress: scan),
                      (_, final result?) => _ScanOutcomeView(outcome: result),
                      _ => const SizedBox(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: scanning
            ? [
                PrimaryOutlineButton(
                  title: l10n.cancel,
                  disabled: stopping.value,
                  onPressed: stopScan,
                ),
              ]
            : [
                PrimaryButton(
                  title: l10n.scanMoreAddresses,
                  onPressed: scan,
                ),
                const CloseActionButton(),
              ],
      ),
    );
  }
}

class _ChainSummary extends ConsumerWidget {
  final String title;
  final ScanIndexes indexes;

  const _ChainSummary({required this.title, required this.indexes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    String indexText(int? index) =>
        index != null && index >= 0 ? '$index' : '-';

    Widget row(String label, int? index) => Padding(
      padding: const .only(top: 8),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            label,
            style: styles.textStyleParagraph.copyWith(color: theme.text60),
          ),
          Text(indexText(index), style: styles.textStyleParagraph),
        ],
      ),
    );

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        Text(title.toUpperCase(), style: styles.textStyleSettingItemHeader),
        row(l10n.lastUsedIndex, indexes.last),
        row(l10n.scannedIndex, indexes.scanned),
      ],
    );
  }
}

class _ScanProgressView extends ConsumerWidget {
  final _ScanProgress progress;

  const _ScanProgressView({required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    return Row(
      children: [
        Container(
          margin: const .directional(end: 12),
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: theme.primary,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                switch (progress.type) {
                  .receive => l10n.scanningReceiveAddresses,
                  .change => l10n.scanningChangeAddresses,
                },
                style: styles.textStyleParagraph,
              ),
              const SizedBox(height: 2),
              Text(
                l10n.addressesChecked(progress.checked),
                style: styles.textStyleParagraphSmall.copyWith(
                  color: theme.text60,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: .circular(2),
                child: LinearProgressIndicator(
                  minHeight: 4,
                  backgroundColor: theme.backgroundDarkest,
                  color: theme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScanOutcomeView extends ConsumerWidget {
  final _ScanOutcome outcome;

  const _ScanOutcomeView({required this.outcome});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final found = outcome.found;
    final foundMessage = found > 0
        ? l10n.scanFoundAddresses(found)
        : l10n.scanFoundNoAddresses;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Text(
          switch (outcome.end) {
            .failed => l10n.scanFailedMessage,
            .stopped => l10n.scanStopped,
            .completed => foundMessage,
          },
          style: styles.textStyleParagraph,
        ),
        if (outcome.end == .stopped)
          Text(foundMessage, style: styles.textStyleParagraph),
        if (found > 0) ...[
          const SizedBox(height: 2),
          Text(
            l10n.scanSyncingTransactions,
            style: styles.textStyleParagraphSmall.copyWith(color: theme.text60),
          ),
        ],
      ],
    );
  }
}
