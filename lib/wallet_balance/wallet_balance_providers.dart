import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../settings/available_currency.dart';
import '../util/formatters.dart';
import '../util/numberutil.dart';
import 'wallet_balance_notifier.dart';

final kaspaPriceProvider = Provider.autoDispose((ref) {
  return ref.watch(coingeckoKaspaPriceProvider);
});

final _addressBalanceBoxProvider = Provider.autoDispose((ref) {
  final boxInfo = ref.watch(walletBoxInfoProvider);
  final db = ref.watch(dbProvider);

  final boxKey = boxInfo.balance.boxKey;
  final box = db.getTypedBox<AddressBalance>(boxKey);

  return box;
});

final balanceNotifierProvider = ChangeNotifierProvider.autoDispose((ref) {
  final balanceBox = ref.watch(_addressBalanceBoxProvider);
  final addressNotifier = ref.watch(addressNotifierProvider.notifier);
  final rpc = ref.watch(kaspaRpcProvider);

  final notifier = WalletBalanceNotifier(
    balanceBox: balanceBox,
    addressAware: addressNotifier,
    rpc: rpc,
  );

  // Listen to address changes and refresh balances
  ref.listen(
    allAddressesProvider,
    (previous, next) async {
      final previousSet = Set.of(previous ?? <String>[]);
      final addresses = previousSet.isEmpty
          ? next
          : next.where((address) => !previousSet.contains(address));

      final log = ref.read(loggerProvider);
      log.d('Refreshing balances for $addresses');
      await notifier.refresh(addresses);
    },
    fireImmediately: true,
    onError: (error, _) {
      final log = ref.read(loggerProvider);
      log.e('Failed to refresh balances', error: error);
    },
  );

  ref.listen(utxosChangedDebouncedProvider, (_, next) async {
    if (next.asData?.value case final message?) {
      final addresses = Set.of(message.removed
          .followedBy(message.added)
          .map((utxo) => utxo.address));
      await notifier.refresh(addresses);
    }
  });

  ref.onDispose(() {
    notifier.disposed = true;
  });

  return notifier;
});

final lastBalanceChangesProvider = Provider.autoDispose((ref) {
  final lastRefresh = ref.watch(
    balanceNotifierProvider.select((value) => value.lastRefreshChanges),
  );
  return lastRefresh;
});

final totalBalanceProvider = Provider.autoDispose((ref) {
  final totalBalance = ref.watch<Amount>(
    balanceNotifierProvider.select((value) => value.totalBalance),
  );
  return totalBalance;
});

final balanceForAddressProvider =
    Provider.family.autoDispose<Amount, String>((ref, address) {
  final notifier = ref.watch(balanceNotifierProvider);
  return notifier.balanceForAddress(address);
});

final formatedBalanceForAddressProvider =
    Provider.family.autoDispose<String, String>((ref, address) {
  final balance = ref.watch(balanceForAddressProvider(address));
  return NumberUtil.formatedAmount(balance);
});

final formatedTotalBalanceProvider = Provider.autoDispose((ref) {
  final balance = ref.watch(totalBalanceProvider);

  return NumberUtil.formatedAmount(balance);
});

final formatedTotalFiatProvider = Provider.autoDispose((ref) {
  final balance = ref.watch(totalBalanceProvider);
  final price = ref.watch(kaspaPriceProvider);
  final currency = ref.watch(currencyProvider);
  final fiat = balance.value * price.price;
  if (fiat == .zero) {
    return '';
  }
  final decimals = fiat >= .parse('1')
      ? 2
      : fiat >= .parse('0.01')
      ? 4
      : fiat >= .parse('0.0001')
      ? 6
      : 8;

  final format = currency.numberFormat(decimalDigits: decimals);
  final formatter = DecimalFormatter(format);

  return formatter.format(fiat);
});

final formatedKaspaPriceProvider = Provider.autoDispose((ref) {
  final price = ref.watch(kaspaPriceProvider).price;
  final currency = ref.watch(currencyProvider);
  final symbol = ref.watch(kasSymbolProvider);
  final decimals = price >= .parse('1')
      ? 2
      : price >= .parse('0.01')
      ? 4
      : price >= .parse('0.0001')
      ? 6
      : 8;
  final format = currency.numberFormat(decimalDigits: decimals);
  final formatter = DecimalFormatter(format);
  final priceStr = formatter.format(price);

  return '$priceStr / $symbol';
});

final fiatValueForAddressProvider =
    Provider.autoDispose.family<Decimal, String>((ref, address) {
  final price = ref.watch(kaspaPriceProvider);
  final balance = ref.watch(balanceForAddressProvider(address));

  return balance.value * price.price;
});

final formatedFiatForAddressProvider =
    Provider.autoDispose.family<String, String>((ref, address) {
  final balance = ref.watch(fiatValueForAddressProvider(address));
  final currency = ref.watch(currencyProvider);

  final format = currency.numberFormat();
  final formatter = DecimalFormatter(format);

  return formatter.format(balance);
});

final formatedFiatForAmountProvider =
    Provider.autoDispose.family<String, Amount>((ref, value) {
  final price = ref.watch(kaspaPriceProvider);
  final currency = ref.watch(currencyProvider);

  final fiatValue = value.value * price.price;
  final format = currency.numberFormat();
  final formatter = DecimalFormatter(format);

  return formatter.format(fiatValue);
});

final fiatForAmountProvider =
    Provider.autoDispose.family<String, Amount>((ref, value) {
  final price = ref.watch(kaspaPriceProvider);
  final currency = ref.watch(currencyProvider);

  final fiatValue = value.value * price.price;
  if (fiatValue == .zero) {
    return '0';
  }
  final format = currency.numberFormat();
  final formatter = DecimalFormatter(format);
  return formatter
      .format(fiatValue)
      .replaceAll(format.currencySymbol, '')
      .trim();
});

final kaspaFormatterProvider = Provider((ref) {
  final symbol = ref.watch(kasSymbolProvider);
  final format = NumberFormat.currency(name: '', symbol: symbol);
  final formatter = CurrencyFormatter(
    groupSeparator: format.symbols.GROUP_SEP,
    decimalSeparator: format.symbols.DECIMAL_SEP,
    maxDecimalDigits: TokenInfo.kaspa.decimals,
    maxAmount: kMaxKaspa,
  );

  return formatter;
});

final fiatFormatterProvider = Provider.autoDispose((ref) {
  final price = ref.watch(kaspaPriceProvider);
  final currency = ref.watch(currencyProvider);
  final maxAmount = price.price * kMaxKaspa;

  final format = NumberFormat.currency(
    name: currency.name,
    symbol: currency.symbol,
  );

  var maxDecimalDigits = format.decimalDigits ?? 2;
  if (currency.currency == AvailableCurrencies.BTC) {
    maxDecimalDigits = 8;
  }

  final formatter = CurrencyFormatter(
    groupSeparator: format.symbols.GROUP_SEP,
    decimalSeparator: format.symbols.DECIMAL_SEP,
    maxDecimalDigits: maxDecimalDigits,
    maxAmount: maxAmount,
  );

  return formatter;
});

final maxSendProvider = Provider.autoDispose((ref) {
  final walletService = ref.watch(walletServiceProvider);
  final address = ref.watch(selectedAddressProvider);
  final utxos = ref.watch(spendableUtxosProvider);
  final feeRate = ref.watch(feeRateProvider);

  if (utxos.isEmpty) {
    return Amount.zero;
  }

  try {
    final tx = walletService.createCompoundTx(
      compoundAddress: address.address,
      utxos: utxos,
      feeRate: feeRate,
    );

    final maxSend = tx.amount;
    if (maxSend.raw < .zero) {
      return Amount.zero;
    }

    return maxSend;
  } catch (_) {
    return Amount.zero;
  }
});
