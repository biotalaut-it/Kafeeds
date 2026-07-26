import 'dart:async';

class AsyncLock {
  Future<void> _tail = Future.value();

  Future<T> synchronized<T>(FutureOr<T> Function() action) {
    final previous = _tail;
    final completer = Completer<void>();
    _tail = completer.future;

    return previous.then((_) => action()).whenComplete(completer.complete);
  }
}
