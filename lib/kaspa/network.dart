import 'bip32/bip32.dart';

const String kKaspaNetworkMainnet = 'mainnet';
const String kKaspaNetworkTestnet = 'testnet';
const String kKaspaNetworkSimnet = 'simnet';
const String kKaspaNetworkDevnet = 'devnet';

const String kKaspaNetworkIdMainnet = kKaspaNetworkMainnet;
const String kKaspaNetworkIdTestnet10 = kKaspaNetworkTestnet;
const String kKaspaNetworkIdSimnet = kKaspaNetworkSimnet;
const String kKaspaNetworkIdDevnet = kKaspaNetworkDevnet;

const int kMainnetRpcPort = 16110;
const int kTestnetPpcPort = 16210;
const int kSimnetRpcPort = 16510;
const int kDevnetRpcPort = 16610;

enum KaspaNetwork {
  mainnet,
  testnet,
  devnet,
  simnet;

  static KaspaNetwork? tryParse(String network) {
    return switch (network) {
      kKaspaNetworkMainnet => .mainnet,
      kKaspaNetworkTestnet => .testnet,
      kKaspaNetworkSimnet => .simnet,
      kKaspaNetworkDevnet => .devnet,
      _ => null,
    };
  }

  String idWithSuffix([String suffix = '']) {
    if (suffix.isNotEmpty) {
      return '$name-$suffix';
    }
    return name;
  }

  int get defaultRpcPort => switch (this) {
    .mainnet => kMainnetRpcPort,
    .testnet => kTestnetPpcPort,
    .simnet => kSimnetRpcPort,
    .devnet => kDevnetRpcPort,
  };
}

KaspaNetwork networkForPort(int port) => switch (port) {
  kMainnetRpcPort => .mainnet,
  kTestnetPpcPort => .testnet,
  kSimnetRpcPort => .simnet,
  kDevnetRpcPort => .devnet,
  _ => .mainnet,
};

KaspaNetwork networkForKpub(String kpub) => switch (kpub.substring(0, 4)) {
  'kpub' => .mainnet,
  'ktub' => .testnet,
  'ksub' => .simnet,
  'kdub' => .devnet,
  _ => .mainnet,
};

NetworkType networkTypeForNetwork(KaspaNetwork network) => switch (network) {
  .mainnet => kaspaMainnet,
  .testnet => kaspaTestnet,
  .devnet => kaspaDevnet,
  .simnet => kaspaSimnet,
};

final kaspaMainnet = NetworkType(
  messagePrefix: 'Kaspa Signed Message:\n',
  bech32: 'kaspa',
  bip32: Bip32Type(
    public: 0x038f332e,
    private: 0x038f2ef4,
  ),
  wif: 0x80,
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);

final kaspaTestnet = NetworkType(
  messagePrefix: 'Kaspa Signed Message:\n',
  bech32: 'kaspatest',
  wif: 0xef,
  bip32: Bip32Type(
    public: 0x0390a241,
    private: 0x03909e07,
  ),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);

final kaspaSimnet = NetworkType(
  messagePrefix: 'Kaspa Signed Message:\n',
  bech32: 'kaspasim',
  wif: 0x64,
  bip32: Bip32Type(
    public: 0x0390467d,
    private: 0x03904242,
  ),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);

final kaspaDevnet = NetworkType(
  messagePrefix: 'Kaspa Signed Message:\n',
  bech32: 'kaspadev',
  wif: 0xef,
  bip32: Bip32Type(
    public: 0x038b41ba,
    private: 0x038b3d80,
  ),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);
