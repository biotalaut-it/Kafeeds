import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

class Sha {
  static Uint8List sha256(List<Uint8List> byteArrays) {
    Digest digest = Digest("SHA-256");
    Uint8List hashed = Uint8List(32);
    for (final byteArray in byteArrays) {
      digest.update(byteArray, 0, byteArray.lengthInBytes);
    }
    digest.doFinal(hashed, 0);
    return hashed;
  }

  static Uint8List sha512(List<Uint8List> byteArrays) {
    Digest digest = Digest("SHA-512");
    Uint8List hashed = Uint8List(64);
    for (final byteArray in byteArrays) {
      digest.update(byteArray, 0, byteArray.lengthInBytes);
    }
    digest.doFinal(hashed, 0);

    return hashed;
  }
}
