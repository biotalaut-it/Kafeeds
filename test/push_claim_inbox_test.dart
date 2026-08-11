import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/push/push_claim_inbox.dart';

void main() {
  final nonce = 'a' * 64;
  const timeout = Duration(milliseconds: 50);

  test('delivers a nonce that arrives while a waiter is listening', () async {
    final inbox = PushClaimInbox();

    final waiting = inbox.awaitNonce(timeout: const Duration(seconds: 5));
    inbox.submit(nonce);

    expect(await waiting, nonce);
  });

  test('delivers a nonce that arrived before the wait began', () async {
    final inbox = PushClaimInbox();

    inbox.submit(nonce);

    expect(await inbox.awaitNonce(timeout: timeout), nonce);
  });

  test('drops anything not shaped like a nonce the service mints', () async {
    final inbox = PushClaimInbox();

    inbox.submit('A' * 64); // uppercase
    inbox.submit('a' * 63); // short
    inbox.submit('${'a' * 63}g'); // not hex
    inbox.submit('');

    expect(await inbox.awaitNonce(timeout: timeout), isNull);
  });

  test('a malformed nonce does not satisfy a listening waiter', () async {
    final inbox = PushClaimInbox();

    final waiting = inbox.awaitNonce(timeout: timeout);
    inbox.submit('not a nonce');
    inbox.submit(nonce);

    expect(await waiting, nonce);
  });

  test('returns null when no nonce arrives', () async {
    final inbox = PushClaimInbox();

    expect(await inbox.awaitNonce(timeout: timeout), isNull);
  });

  test('hands a buffered nonce to one waiter only', () async {
    final inbox = PushClaimInbox();
    inbox.submit(nonce);

    expect(await inbox.awaitNonce(timeout: timeout), nonce);
    expect(await inbox.awaitNonce(timeout: timeout), isNull);
  });

  test('drops a buffered nonce once the claim slot has expired', () async {
    var now = DateTime(2026);
    final inbox = PushClaimInbox(now: () => now);

    inbox.submit(nonce);
    now = now.add(PushClaimInbox.claimTtl + const Duration(seconds: 1));

    expect(await inbox.awaitNonce(timeout: timeout), isNull);
  });

  test('keeps a buffered nonce that is still inside the slot', () async {
    var now = DateTime(2026);
    final inbox = PushClaimInbox(now: () => now);

    inbox.submit(nonce);
    now = now.add(PushClaimInbox.claimTtl - const Duration(seconds: 1));

    expect(await inbox.awaitNonce(timeout: timeout), nonce);
  });

  test('a second concurrent wait gives up instead of racing', () async {
    final inbox = PushClaimInbox();

    final first = inbox.awaitNonce(timeout: const Duration(seconds: 5));
    expect(await inbox.awaitNonce(timeout: timeout), isNull);

    inbox.submit(nonce);
    expect(await first, nonce);
  });

  test('the latest nonce supersedes an unclaimed earlier one', () async {
    final inbox = PushClaimInbox();

    inbox.submit(nonce);
    inbox.submit('b' * 64);

    expect(await inbox.awaitNonce(timeout: timeout), 'b' * 64);
  });
}
