import 'package:freezed_annotation/freezed_annotation.dart';

import '../wallet_address.dart';

part 'address_discovery_types.freezed.dart';

@freezed
sealed class ScanIndexes with _$ScanIndexes {
  const ScanIndexes._();

  const factory ScanIndexes({
    int? start,
    int? scanned,
    int? last,
  }) = _ScanIndexes;

  static const empty = ScanIndexes(start: null, scanned: null, last: null);

  int get nextScanStart => (scanned ?? start ?? -1) + 1;
}

typedef ScanIndexesPair = ({ScanIndexes receive, ScanIndexes change});

typedef AddressCheck = ({Set<String> used, bool apiAnswered});

class DiscoveryResult {
  final Map<int, WalletAddress> addresses;
  final ScanIndexes scanIndexes;

  const DiscoveryResult({
    required this.addresses,
    required this.scanIndexes,
  });
}

typedef WalletDiscoveryResult = ({
  DiscoveryResult receive,
  DiscoveryResult change,
});

extension WalletDiscoveryResultHelper on WalletDiscoveryResult {
  Iterable<WalletAddress> get addresses =>
      receive.addresses.values.followedBy(change.addresses.values);

  bool get isEmpty => receive.addresses.isEmpty && change.addresses.isEmpty;
  bool get isNotEmpty => !isEmpty;
}
