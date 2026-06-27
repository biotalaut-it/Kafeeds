import 'dart:math';
import 'dart:typed_data';

import '../bip340/bip340.dart' as schnorr;
import '../utils.dart';

Uint8List _genAux([int bytes = 32]) {
  final random = Random.secure();
  final aux = Uint8List(bytes);
  for (int i = 0; i < bytes; ++i) {
    aux[i] = random.nextInt(0x100);
  }
  return aux;
}

String signSchnorrHex({
  required String privateKey,
  required String hash,
  required String aux,
}) {
  final signature = schnorr.sign(privateKey, hash, aux);

  return signature;
}

bool verifySchnorr({
  required String publicKey,
  required String hash,
  required String signature,
}) {
  final result = schnorr.verify(publicKey, hash, signature);
  return result;
}

Uint8List signSchnorr({
  required Uint8List hash,
  required Uint8List privateKey,
}) {
  final signatureHex = signSchnorrHex(
    privateKey: bytesToHex(privateKey),
    hash: bytesToHex(hash),
    aux: bytesToHex(_genAux()),
  );

  return hexToBytes(signatureHex);
}
