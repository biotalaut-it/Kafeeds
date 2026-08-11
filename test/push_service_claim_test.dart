import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:kaspium_wallet/push/push_claim_inbox.dart';
import 'package:kaspium_wallet/push/push_identity.dart';
import 'package:kaspium_wallet/push/push_service.dart';
import 'package:kaspium_wallet/push/push_types.dart';

import 'push_test_fakes.dart';

typedef SentRequest = ({Map<String, Object?> body, String? signature});

void main() {
  final identity = generatePushIdentity();
  final token = PushToken('fcm-token-1:APA91');
  final nonce = 'a' * 64;

  late List<SentRequest> sent;

  setUp(() => sent = []);

  http.Response claimRequired() => http.Response(
    json.encode({'error': 'claim_required'}),
    400,
    headers: {'content-type': 'application/json'},
  );

  http.Response ok() => http.Response('{}', 200);

  Future<PushApiResult> register(
    PushClaimInbox inbox,
    http.Response Function(Map<String, Object?> body) respond,
  ) {
    final client = MockClient((request) async {
      final body = json.decode(request.body) as Map<String, Object?>;
      sent.add((body: body, signature: request.headers['x-signature']));
      return respond(body);
    });

    return http.runWithClient(
      () => PushService(
        claimInbox: inbox,
        clockOffset: MemoryClockOffsetStore(),
        claimTimeout: const Duration(milliseconds: 200),
      ).updateToken(
        clientId: identity.clientId,
        privateKey: identity.privateKey,
        token: token,
      ),
      () => client,
    );
  }

  test('answers a challenge with the nonce and resends the payload', () async {
    final inbox = PushClaimInbox();

    final result = await register(inbox, (body) {
      if (body['claim'] == null) {
        inbox.submit(nonce);
        return claimRequired();
      }
      return ok();
    });

    expect(result, PushApiResult.success);
    expect(sent, hasLength(2));
    expect(sent[1].body['claim'], nonce);
    expect(sent[1].body['token'], token);
    expect(sent[1].body['clientId'], identity.clientId);
  });

  test('uses a nonce that arrived before the request was made', () async {
    final inbox = PushClaimInbox()..submit(nonce);

    final result = await register(
      inbox,
      (body) => body['claim'] == null ? claimRequired() : ok(),
    );

    expect(result, PushApiResult.success);
    expect(sent[1].body['claim'], nonce);
  });

  test('signs the retry afresh', () async {
    final inbox = PushClaimInbox();

    await register(inbox, (body) {
      if (body['claim'] == null) {
        inbox.submit(nonce);
        return claimRequired();
      }
      return ok();
    });

    expect(sent[0].signature, isNotNull);
    expect(sent[1].signature, isNot(sent[0].signature));
  });

  test('reports claimPending when no nonce arrives', () async {
    final result = await register(PushClaimInbox(), (_) => claimRequired());

    expect(result, PushApiResult.claimPending);
    expect(sent, hasLength(1));
  });

  test('does not loop when the answered claim is refused again', () async {
    final inbox = PushClaimInbox()..submit(nonce);

    final result = await register(inbox, (_) => claimRequired());

    expect(result, PushApiResult.claimPending);
    expect(sent, hasLength(2));
  });

  test('claimPending is pending, never a rejection', () {
    expect(PushApiResult.claimPending.isPending, isTrue);
    expect(PushApiResult.claimPending.isSuccess, isFalse);
    expect(PushApiResult.rejected.isPending, isFalse);
  });

  test('an unrelated rejection is still permanent', () async {
    final result = await register(
      PushClaimInbox(),
      (_) => http.Response(json.encode({'error': 'invalid_request'}), 400),
    );

    expect(result, PushApiResult.rejected);
    expect(sent, hasLength(1));
  });
}
