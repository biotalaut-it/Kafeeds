import 'dart:typed_data';

import '../model/keyiv.dart';

/// KDF (Key derivator function) base class
abstract class KDF {
  /// Derive a KeyIV with given password and optional salt
  KeyIV deriveKey(String password, {required Uint8List salt});
}
