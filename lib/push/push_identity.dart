import 'dart:math';

import 'package:pointycastle/ecc/api.dart';

import '../kaspa/bip340/bip340.dart' as bip340;
import '../kaspa/kaspa.dart';
import 'push_types.dart';

final _secp256k1 = ECDomainParameters('secp256k1');

const _kSupportIdLength = 12;

String _randomHex32() {
  final rng = Random.secure();
  final bytes = Uint8List.fromList(List.generate(32, (_) => rng.nextInt(256)));
  return bytes.hex;
}

({String privateKey, ClientId clientId}) generatePushIdentity() {
  while (true) {
    final privateKey = _randomHex32();
    final d = BigInt.parse(privateKey, radix: 16);
    if (d < BigInt.one || d >= _secp256k1.n) continue;

    return (
      privateKey: privateKey,
      clientId: ClientId(bip340.getPublicKey(privateKey)),
    );
  }
}

String signPushRequest(String body, {required String privateKey}) =>
    bip340.sign(privateKey, hashPushRequest(body).hex, _randomHex32());

String supportIdFor(ClientId clientId) {
  final prefix = clientId.substring(0, _kSupportIdLength);
  final groups = [
    for (var i = 0; i < prefix.length; i += 4)
      prefix.substring(i, min(i + 4, prefix.length)),
  ];
  return groups.join('-');
}
