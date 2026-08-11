import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/kaspa/bip340/bip340.dart' as bip340;
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/push/push_identity.dart';
import 'package:kaspium_wallet/push/push_types.dart';

void main() {
  const body = '{"clientId":"abc","ts":1700000000000,"reset":true}';

  group('hashPushRequest', () {
    test('matches the digest the api computes for the same body', () {
      expect(
        hashPushRequest(body).hex,
        '3b99bc639d3dd4a2f068370baaddaf8892a11547ff1fb68d81f33729cec21d3a',
      );
    });

    test('uses a different domain than personal message signing', () {
      expect(hashPushRequest(body).hex, isNot(hashPersonalMessage(body).hex));
    });
  });

  group('generatePushIdentity', () {
    test('derives the client id from the private key', () {
      final identity = generatePushIdentity();

      expect(identity.privateKey, hasLength(64));
      expect(identity.clientId, hasLength(64));
      expect(identity.clientId, bip340.getPublicKey(identity.privateKey));
    });

    test('is distinct per call', () {
      expect(
        generatePushIdentity().privateKey,
        isNot(generatePushIdentity().privateKey),
      );
    });
  });

  group('signPushRequest', () {
    test('produces a signature the client id verifies', () {
      final identity = generatePushIdentity();

      final signature = signPushRequest(body, privateKey: identity.privateKey);

      expect(signature, hasLength(128));
      expect(
        bip340.verify(identity.clientId, hashPushRequest(body).hex, signature),
        isTrue,
      );
    });

    test('does not verify against an altered body', () {
      final identity = generatePushIdentity();
      final signature = signPushRequest(body, privateKey: identity.privateKey);

      expect(
        bip340.verify(
          identity.clientId,
          hashPushRequest('$body ').hex,
          signature,
        ),
        isFalse,
      );
    });

    test('does not verify against another key', () {
      final identity = generatePushIdentity();
      final other = generatePushIdentity();
      final signature = signPushRequest(body, privateKey: identity.privateKey);

      expect(
        bip340.verify(other.clientId, hashPushRequest(body).hex, signature),
        isFalse,
      );
    });
  });

  group('supportIdFor', () {
    test('is a grouped prefix of the client id', () {
      final clientId = ClientId('0123456789abcdef' * 4);

      expect(supportIdFor(clientId), '0123-4567-89ab');
    });
  });
}
