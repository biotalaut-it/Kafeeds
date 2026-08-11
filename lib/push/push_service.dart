import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'push_claim_inbox.dart';
import 'push_clock_offset.dart';
import 'push_identity.dart';
import 'push_types.dart';

enum PushApiResult {
  success,
  retryable,
  rejected,
  unknownClient,
  claimRequired,
  claimPending;

  bool get isSuccess => this == success;

  bool get isPending => this == retryable || this == claimPending;
}

class PushClaimPendingException implements Exception {
  const PushClaimPendingException();
}

const _kSignatureHeader = 'x-signature';

class PushService {
  final Uri uri;
  final PushClaimInbox claimInbox;
  final ClockOffsetStore clockOffset;
  final Logger? log;

  static const requestTimeout = Duration(seconds: 15);

  static const defaultClaimTimeout = Duration(seconds: 20);

  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'User-Agent': 'Kaspium Wallet',
  };

  final Duration claimTimeout;

  PushService({
    required this.claimInbox,
    required this.clockOffset,
    this.log,
    this.claimTimeout = defaultClaimTimeout,
    String? baseUrl,
  }) : uri = Uri.https(
         baseUrl ?? 'push.kaspium.io',
         '/api/v1/kaspa/notifications',
       );

  Future<PushApiResult> _request(
    PushApiData data, {
    required String privateKey,
  }) async {
    final result = await _send(data, privateKey: privateKey);
    if (result != .claimRequired) return result;

    final nonce = await claimInbox.awaitNonce(timeout: claimTimeout);
    if (nonce == null) return .claimPending;

    final claimed = await _send(
      data.copyWith(claim: nonce),
      privateKey: privateKey,
    );
    return claimed == .claimRequired ? .claimPending : claimed;
  }

  Future<PushApiResult> _send(
    PushApiData data, {
    required String privateKey,
    bool retryOnStale = true,
  }) async {
    try {
      final stamped = data.copyWith(
        ts: DateTime.now().millisecondsSinceEpoch + clockOffset.offsetMs,
      );
      final body = json.encode(stamped.toJson());
      final signature = signPushRequest(body, privateKey: privateKey);

      final response = await http
          .post(
            uri,
            body: body,
            headers: {...headers, _kSignatureHeader: signature},
          )
          .timeout(requestTimeout);

      if (response.statusCode == 200) return .success;

      final rejected = switch (response.statusCode) {
        408 || 429 => false,
        >= 400 && < 500 => true,
        _ => false,
      };
      if (!rejected) return .retryable;
      return switch (_errorCode(response.body)) {
        'unknown_client' => .unknownClient,
        'claim_required' => .claimRequired,
        'stale_request' => await _adoptServerTime(
          response.body,
          data,
          privateKey: privateKey,
          retry: retryOnStale,
        ),
        _ => .rejected,
      };
    } catch (e, st) {
      log?.w('Push request failed', error: e, stackTrace: st);
      return .retryable;
    }
  }

  Future<PushApiResult> _adoptServerTime(
    String body,
    PushApiData data, {
    required String privateKey,
    required bool retry,
  }) async {
    final serverTime = _serverTime(body);
    if (serverTime == null) return .retryable;

    await clockOffset.save(serverTime - DateTime.now().millisecondsSinceEpoch);
    if (!retry) return .retryable;

    return _send(data, privateKey: privateKey, retryOnStale: false);
  }

  static int? _serverTime(String body) {
    try {
      return ((json.decode(body) as Map)['serverTime'] as num?)?.toInt();
    } catch (_) {
      return null;
    }
  }

  static String? _errorCode(String body) {
    try {
      return (json.decode(body) as Map)['error'] as String?;
    } catch (_) {
      return null;
    }
  }

  Future<PushApiResult> updateToken({
    required ClientId clientId,
    required String privateKey,
    required PushToken token,
  }) {
    final data = PushApiData(
      token: token,
      clientId: clientId,
    );

    return _request(data, privateKey: privateKey);
  }

  Future<PushApiResult> updateSettings({
    PushToken? pushToken,
    required ClientId clientId,
    required String privateKey,
    required AccountId accountId,
    required PushOptions options,
    required List<String> addresses,
  }) {
    final data = PushApiData(
      token: pushToken,
      clientId: clientId,
      accountId: accountId,
      options: options,
      addresses: addresses,
    );

    return _request(data, privateKey: privateKey);
  }

  Future<PushApiResult> reset({
    required ClientId clientId,
    required String privateKey,
  }) {
    final data = PushApiData(clientId: clientId, reset: true);

    return _request(data, privateKey: privateKey);
  }
}
