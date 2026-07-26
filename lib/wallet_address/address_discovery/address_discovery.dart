import 'dart:async';

import '../../kaspa/kaspa.dart';
import '../wallet_address.dart';
import 'address_discovery_types.dart';

class AddressDiscovery {
  static const kGapLimit = 30;

  static const kBatchSize = ApiService.kMaxActiveAddressBatch;

  static const kMaxScan = 1000;

  final ApiService api;
  final RpcService rpc;
  final HdAddressGenerator addressGenerator;
  final AddressNameCallback addressNameCallback;

  final _cache = <(int, AddressType), WalletAddress>{};

  AddressDiscovery({
    required this.api,
    required this.rpc,
    required this.addressGenerator,
    required this.addressNameCallback,
  });

  WalletAddress get mainAddress {
    const index = 0;
    const type = AddressType.receive;
    return WalletAddress(
      index: index,
      type: type,
      name: addressNameCallback(type, index),
      address: addressGenerator.mainAddress,
      used: false,
    );
  }

  WalletDiscoveryResult get newWalletDiscoveryResult {
    const index = 0;
    final discovery = (
      receive: DiscoveryResult(
        addresses: {index: mainAddress},
        scanIndexes: ScanIndexes(start: index, scanned: index, last: index),
      ),
      change: DiscoveryResult(
        addresses: {},
        scanIndexes: .empty,
      ),
    );
    return discovery;
  }

  Future<WalletAddress> getAddress({
    required int index,
    required AddressType type,
  }) async {
    if (_cache[(index, type)] case final cached?) {
      return cached;
    }
    final address = await addressGenerator.addressAtIndex(
      typeIndex: type.index,
      index: index,
    );
    final name = addressNameCallback(type, index);
    final walletAddress = WalletAddress(
      index: index,
      type: type,
      address: address,
      name: name,
      used: false,
    );
    _cache[(index, type)] = walletAddress;
    return walletAddress;
  }

  Future<Iterable<WalletAddress>> getAddresses({
    required int startIndex,
    required AddressType type,
    required int count,
  }) async {
    final addresses = <WalletAddress>[];

    for (int i = startIndex; i < startIndex + count; ++i) {
      final address = await getAddress(index: i, type: type);
      addresses.add(address);
    }

    return addresses;
  }

  Future<Set<String>?> _activeAddresses(Iterable<String> addresses) async {
    try {
      final results = await api.checkActive(addresses: addresses);
      return {
        for (final result in results)
          if (result.active) result.address,
      };
    } catch (e) {
      return null;
    }
  }

  Future<Set<String>?> _fundedAddresses(Iterable<String> addresses) async {
    try {
      final balances = await rpc.getBalancesByAddresses(addresses);
      return {
        for (final balance in balances)
          if (balance.balance > .zero) balance.address,
      };
    } catch (e) {
      return null;
    }
  }

  Future<AddressCheck?> _usedAddresses(Iterable<String> addresses) async {
    final (active, funded) = await (
      _activeAddresses(addresses),
      _fundedAddresses(addresses),
    ).wait;

    if (active == null && funded == null) {
      return null;
    }

    return (used: {...?active, ...?funded}, apiAnswered: active != null);
  }

  Future<DiscoveryResult> addressDiscoveryFor({
    required AddressType type,
    required int startIndex,
    int gapLimit = kGapLimit,
    int batchSize = kBatchSize,
    bool Function(AddressType type, int index)? onProgress,
  }) async {
    int index = startIndex;
    int? lastUsedIndex;
    int? scannedIndex;

    int gapAnchor = startIndex - 1;

    final addresses = <int, WalletAddress>{};

    while (index < startIndex + kMaxScan) {
      if (onProgress?.call(type, index) == false) {
        break;
      }

      final batch = await getAddresses(
        startIndex: index,
        type: type,
        count: batchSize,
      );

      final check = await _usedAddresses(batch.map((e) => e.encoded));
      if (check == null) {
        break;
      }

      for (final address in batch) {
        final isUsed = check.used.contains(address.encoded);
        addresses[address.index] = address.copyWith(used: isUsed);
        if (isUsed) {
          lastUsedIndex = address.index;
        }
      }

      scannedIndex = index + batchSize - 1;
      index = scannedIndex + 1;

      if (!check.apiAnswered) {
        gapAnchor = scannedIndex;
      }
      if (lastUsedIndex != null && lastUsedIndex > gapAnchor) {
        gapAnchor = lastUsedIndex;
      }

      if (scannedIndex - gapAnchor >= gapLimit) {
        break;
      }
    }

    final scanIndexes = ScanIndexes(
      start: startIndex,
      scanned: scannedIndex,
      last: lastUsedIndex,
    );

    addresses.removeWhere((index, _) => index > (lastUsedIndex ?? -1));

    return DiscoveryResult(
      addresses: addresses,
      scanIndexes: scanIndexes,
    );
  }

  Future<WalletDiscoveryResult> addressDiscovery({
    required int startReceiveIndex,
    required int startChangeIndex,
    int gapLimit = kGapLimit,
    bool Function(AddressType type, int index)? onProgress,
  }) async {
    final receiveResult = await addressDiscoveryFor(
      type: .receive,
      startIndex: startReceiveIndex,
      gapLimit: gapLimit,
      onProgress: onProgress,
    );

    final changeResult = await addressDiscoveryFor(
      type: .change,
      startIndex: startChangeIndex,
      gapLimit: gapLimit,
      onProgress: onProgress,
    );

    return (receive: receiveResult, change: changeResult);
  }
}
