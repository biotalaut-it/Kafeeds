import 'package:freezed_annotation/freezed_annotation.dart';

import '../../kaspa/kaspa.dart';

part 'block_explorers.freezed.dart';
part 'block_explorers.g.dart';

const kParamPattern = '{0}';

@freezed
sealed class BlockExplorer with _$BlockExplorer {
  const BlockExplorer._();
  const factory BlockExplorer({
    required KaspaNetwork network,
    required String name,
    required String url,
    required String addressUrl,
    required String txUrl,
  }) = _BlockExplorer;

  String urlForAddress(String address) =>
      addressUrl.replaceFirst(kParamPattern, address);

  String urlForTx(String hash) => txUrl.replaceFirst(kParamPattern, hash);

  factory BlockExplorer.fromJson(Map<String, dynamic> json) =>
      _$BlockExplorerFromJson(json);
}

const kKaspaExplorerMainnet = BlockExplorer(
  network: .mainnet,
  name: 'Kaspa Explorer',
  url: 'explorer.kaspa.org',
  addressUrl: 'https://explorer.kaspa.org/addresses/$kParamPattern',
  txUrl: 'https://explorer.kaspa.org/txs/$kParamPattern',
);

const kKaspaExplorerTestnet10 = BlockExplorer(
  network: .testnet,
  name: 'Kaspa Explorer',
  url: 'explorer-tn10.kaspa.org',
  addressUrl: 'https://explorer-tn10.kaspa.org/addresses/$kParamPattern',
  txUrl: 'https://explorer-tn10.kaspa.org/txs/$kParamPattern',
);

const kKaspaStreamMainnet = BlockExplorer(
  network: .mainnet,
  name: 'Kaspa.stream',
  url: 'kaspa.stream',
  addressUrl: 'https://kaspa.stream/addresses/$kParamPattern',
  txUrl: 'https://kaspa.stream/transactions/$kParamPattern',
);

const kKaspaStreamTestnet10 = BlockExplorer(
  network: .testnet,
  name: 'Kaspa.steam',
  url: 'tn10.kaspa.stream',
  addressUrl: 'https://tn10.kaspa.stream/addresses/$kParamPattern',
  txUrl: 'https://tn10.kaspa.stream/transactions/$kParamPattern',
);

const kBlockExplorersOptions = <String, List<BlockExplorer>>{
  kKaspaNetworkIdMainnet: [
    kKaspaExplorerMainnet,
    kKaspaStreamMainnet,
  ],
  kKaspaNetworkIdTestnet10: [
    kKaspaExplorerTestnet10,
    kKaspaStreamTestnet10,
  ],
  kKaspaNetworkIdDevnet: [],
  kKaspaNetworkIdSimnet: [],
};
