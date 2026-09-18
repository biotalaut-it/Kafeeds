import 'dart:typed_data';

import 'package:pointycastle/digests/blake2b.dart';

import '../kaspa/kaspa.dart';

class KnsInscriptionScript {
  static Uint8List build(
    Uint8List xOnlyPubKey,
    String title,
    Uint8List payload,
  ) {
    if (xOnlyPubKey.length != 32)
      throw ArgumentError('KNS key must be 32 bytes.');
    if (payload.length > 520)
      throw ArgumentError('KNS payload exceeds 520 bytes.');
    return Uint8List.fromList([
      0x20,
      ...xOnlyPubKey,
      0xac,
      0x00,
      0x63,
      ..._push(Uint8List.fromList(title.codeUnits)),
      0x00,
      ..._push(payload),
      0x68,
    ]);
  }

  static Uint8List commitAddress(Uint8List script, String hrp) {
    final digest = Blake2bDigest(digestSize: 32);
    final hash = digest.process(script);
    return hash;
  }

  static Uint8List _push(Uint8List data) {
    if (data.length <= 75) return Uint8List.fromList([data.length, ...data]);
    if (data.length <= 255)
      return Uint8List.fromList([0x4c, data.length, ...data]);
    return Uint8List.fromList([
      0x4d,
      data.length & 255,
      data.length >> 8,
      ...data,
    ]);
  }

  static Uint8List pushRedeemScript(Uint8List script) => _push(script);
}

class KnsProfilePayload {
  const KnsProfilePayload({
    required this.assetId,
    required this.key,
    required this.value,
  });

  final String assetId;
  final String key;
  final String value;

  Uint8List toBytes() => Uint8List.fromList(
    '{"op":"addProfile","id":"$assetId","key":"$key","value":"${value.replaceAll('"', '\\"')}"}'
        .codeUnits,
  );
}
