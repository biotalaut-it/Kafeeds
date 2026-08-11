import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:kaspium_wallet/push/push_claim_inbox.dart';
import 'package:kaspium_wallet/push/push_identity.dart';
import 'package:kaspium_wallet/push/push_service.dart';
import 'package:kaspium_wallet/push/push_types.dart';

import 'push_test_fakes.dart';

void main() {
  final identity = generatePushIdentity();
  final token = PushToken('fcm-token-1:APA91');

  const skewMs = 10 * 60 * 1000;

  late List<Map<String, Object?>> sent;

  setUp(() => sent = []);

  int nowMs() => DateTime.now().millisecondsSinceEpoch;

  http.Response staleRequest({int? serverTime}) => http.Response(
    json.encode({'error': 'stale_request', 'serverTime': ?serverTime}),
    400,
    headers: {'content-type': 'application/json'},
  );

  Future<PushApiResult> register(
    MemoryClockOffsetStore clockOffset,
    http.Response Function(Map<String, Object?> body) respond,
  ) {
    final client = MockClient((request) async {
      final body = json.decode(request.body) as Map<String, Object?>;
      sent.add(body);
      return respond(body);
    });

    return http.runWithClient(
      () => PushService(
        claimInbox: PushClaimInbox(),
        clockOffset: clockOffset,
      ).updateToken(
        clientId: identity.clientId,
        privateKey: identity.privateKey,
        token: token,
      ),
      () => client,
    );
  }

  test('adopts the server clock and retries once with it', () async {
    final clockOffset = MemoryClockOffsetStore();

    final result = await register(clockOffset, (body) {
      if (sent.length == 1) return staleRequest(serverTime: nowMs() + skewMs);
      return http.Response('{}', 200);
    });

    expect(result, PushApiResult.success);
    expect(sent, hasLength(2));
    expect(clockOffset.offsetMs, closeTo(skewMs, 5000));
    expect(sent[1]['ts'] as int, closeTo(nowMs() + skewMs, 5000));
    expect(sent[1]['token'], token);
    expect(sent[1]['clientId'], identity.clientId);
  });

  test('reports retryable when the retry is stale again', () async {
    final clockOffset = MemoryClockOffsetStore();

    final result = await register(
      clockOffset,
      (_) => staleRequest(serverTime: nowMs() + skewMs),
    );

    expect(result, PushApiResult.retryable);
    expect(sent, hasLength(2));
    expect(clockOffset.offsetMs, closeTo(skewMs, 5000));
  });

  test('stamps with the stored offset from the first request', () async {
    final clockOffset = MemoryClockOffsetStore(skewMs);

    final result = await register(clockOffset, (_) => http.Response('{}', 200));

    expect(result, PushApiResult.success);
    expect(sent.single['ts'] as int, closeTo(nowMs() + skewMs, 5000));
  });

  test('reports retryable when no server time is carried', () async {
    final clockOffset = MemoryClockOffsetStore();

    final result = await register(clockOffset, (_) => staleRequest());

    expect(result, PushApiResult.retryable);
    expect(sent, hasLength(1));
    expect(clockOffset.offsetMs, 0);
  });

  test('a claim challenge on the corrected retry is still answered', () async {
    final clockOffset = MemoryClockOffsetStore();
    final inbox = PushClaimInbox();
    final nonce = 'a' * 64;

    final client = MockClient((request) async {
      final body = json.decode(request.body) as Map<String, Object?>;
      sent.add(body);
      if (sent.length == 1) return staleRequest(serverTime: nowMs() + skewMs);
      if (body['claim'] == null) {
        inbox.submit(nonce);
        return http.Response(
          json.encode({'error': 'claim_required'}),
          400,
          headers: {'content-type': 'application/json'},
        );
      }
      return http.Response('{}', 200);
    });

    final result = await http.runWithClient(
      () => PushService(
        claimInbox: inbox,
        clockOffset: clockOffset,
        claimTimeout: const Duration(milliseconds: 200),
      ).updateToken(
        clientId: identity.clientId,
        privateKey: identity.privateKey,
        token: token,
      ),
      () => client,
    );

    expect(result, PushApiResult.success);
    expect(sent, hasLength(3));
    expect(sent[2]['claim'], nonce);
    expect(sent[2]['ts'] as int, closeTo(nowMs() + skewMs, 5000));
  });
}
