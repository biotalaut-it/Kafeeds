import 'dart:async';

class PushClaimInbox {
  static const claimTtl = Duration(minutes: 2);

  static final _nonceShape = RegExp(r'^[0-9a-f]{64}$');

  final DateTime Function() _now;

  ({String nonce, DateTime receivedAt})? _buffered;
  Completer<String>? _waiter;

  PushClaimInbox({DateTime Function()? now}) : _now = now ?? DateTime.now;

  void submit(String nonce) {
    if (!_nonceShape.hasMatch(nonce)) return;

    final waiter = _waiter;
    if (waiter != null && !waiter.isCompleted) {
      _waiter = null;
      waiter.complete(nonce);
      return;
    }

    _buffered = (nonce: nonce, receivedAt: _now());
  }

  Future<String?> awaitNonce({required Duration timeout}) async {
    if (_takeBuffered() case final nonce?) return nonce;
    if (_waiter != null) return null;

    final waiter = Completer<String>();
    _waiter = waiter;
    try {
      return await waiter.future.timeout(timeout);
    } on TimeoutException {
      return null;
    } finally {
      if (identical(_waiter, waiter)) _waiter = null;
    }
  }

  String? _takeBuffered() {
    final buffered = _buffered;
    if (buffered == null) return null;

    _buffered = null;
    if (_now().difference(buffered.receivedAt) > claimTtl) return null;

    return buffered.nonce;
  }
}
