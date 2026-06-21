import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../receive/receive_amount_field.dart';
import '../settings/setting_item.dart';
import '../util/util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/receive_address_card.dart';
import '../widgets/sheet_header_button.dart';
import '../widgets/sheet_widget.dart';
import 'buy_info_dialog.dart';

const kUSDCurrency = 'USD';
const kDefaultCurrencies = [kUSDCurrency];

final _remoteSourceProvider = FutureProvider((ref) async {
  final response = await http.get(
    Uri.https('api.topperpay.com', '/assets/crypto-onramp'),
  );

  if (response.statusCode != 200) {
    return kDefaultCurrencies;
  }

  final data = jsonDecode(response.body);
  if (data case {'assets': {'source': List<dynamic> currencies}}) {
    return currencies
        .mapNotNull((e) => (e as Map<String, dynamic>)['code'] as String?)
        .toList();
  }
  return kDefaultCurrencies;
});

final _sourceProvider = Provider((ref) {
  final remote = ref.watch(_remoteSourceProvider);
  final currency = ref.watch(currencyProvider);
  final options = remote.valueOrNull ?? kDefaultCurrencies;

  if (options.contains(currency.name)) {
    return currency.name;
  }
  return kUSDCurrency;
});

class BuySettingItem extends SettingSelectionItem {
  const BuySettingItem();

  @override
  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);
    return l10n.buyKaspaSubtitle;
  }
}

class BuySheet extends ConsumerWidget {
  const BuySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);
    final styles = ref.watch(stylesProvider);
    final receiveAddress = ref.watch(selectedAddressProvider);

    ref.listen(_sourceProvider, (_, _) {});

    void showInfo() {
      showAppDialog(context: context, builder: (_) => const BuyInfoDialog());
    }

    void buyKaspa() {
      final source = ref.read(_sourceProvider);
      final address = ref.read(selectedAddressProvider);
      final amount = ref.read(amountProvider);

      final uri = Uri.https('kaspa-topper.vercel.app', '/api/topper', {
        'source': source,
        'target': 'KAS',
        'amount': amount?.value.toStringAsFixed(8) ?? '0',
        'address': address.encoded,
      });
      appRouter.pop(context);
      openUri(uri);
    }

    final horizontal = MediaQuery.widthOf(context) * 0.115;

    return SheetWidget(
      title: l10n.buyKaspaTitle,
      mainWidget: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            margin: .symmetric(horizontal: horizontal),
            child: Text(
              '${l10n.buyKaspaMessage}\n${l10n.buyKaspaMessageSecondary}',
              style: styles.textStyleAccount,
              textAlign: .center,
            ),
          ),
          const SizedBox(height: 30),
          const ReceiveAmountField(
            allowFiat: false,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const .only(top: 30, bottom: 10),
            child: Text(
              l10n.receiveAddress.toUpperCase(),
              style: styles.textStyleSubHeader,
            ),
          ),
          ReceiveAddressCard(address: receiveAddress.address),
        ],
      ),
      rightWidget: SheetHeaderButton(
        onPressed: showInfo,
        icon: AppIcons.info,
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.getStarted, onPressed: buyKaspa),
          const CancelActionButton(),
        ],
      ),
    );
  }
}
