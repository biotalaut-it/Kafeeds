import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../app_providers.dart';
import 'push_notifications.dart';
import 'push_service.dart';
import 'push_settings_repository.dart';
import 'push_token_notifier.dart';
import 'push_types.dart';

const _kMinRetryDelay = Duration(seconds: 30);
const _kMaxRetryDelay = Duration(minutes: 10);

enum PushSyncState { disabled, idle, syncing, waitingToRetry }

class PushSyncNotifier extends AutoDisposeNotifier<PushSyncState> {
  late Logger _log;
  late PushSettingsRepository _repository;
  late PushService _service;
  late PushTokenSettingsNotifier _tokenNotifier;

  Timer? _retryTimer;
  var _retryDelay = _kMinRetryDelay;
  var _running = false;
  var _rerun = false;
  var _active = false;
  var _tokenRefreshed = false;

  PushToken? _rejectedToken;
  final _rejectedSettings = <AccountId, PushSettings>{};

  @override
  PushSyncState build() {
    _active = true;
    ref.onDispose(() {
      _active = false;
      _retryTimer?.cancel();
      _retryTimer = null;
    });

    final pushAvailable = ref.watch(pushAvailableProvider);
    if (!pushAvailable) return .disabled;

    _log = ref.read(loggerProvider);
    _repository = ref.watch(pushSettingsRepositoryProvider);
    _service = ref.watch(pushServiceProvider);
    _tokenNotifier = ref.watch(pushTokenSettingsProvider.notifier);

    ref.listen(
      addressesForPushProvider,
      (_, addresses) async {
        final notifier = ref.read(pushSettingsProvider.notifier);
        final changed = await notifier.markWatchedAddresses(addresses);
        if (changed) await sync();
      },
      fireImmediately: true,
    );

    ref.listen(pushTokenSettingsProvider, (_, settings) {
      if (!settings.published) sync();
    });

    Future.microtask(sync);

    return .idle;
  }

  Future<void> sync() async {
    if (_running) {
      _rerun = true;
      return;
    }
    _running = true;
    _retryTimer?.cancel();
    _emit(.syncing);
    try {
      if (!_tokenRefreshed || _tokenMissing) {
        _tokenRefreshed = true;
        if (_repository.anyPushEnabled) await acquirePushToken(ref);
      }
      do {
        _rerun = false;
        await _syncAccounts();
        await _publishToken();
      } while (_rerun);
    } catch (e, st) {
      _log.e('Push sync failed', error: e, stackTrace: st);
    } finally {
      _running = false;
    }
    _scheduleRetryIfPending();
  }

  bool get _tokenPending {
    final tokenSettings = _tokenNotifier.settings;
    return !tokenSettings.published &&
        tokenSettings.token.isNotEmpty &&
        tokenSettings.token != _rejectedToken &&
        _repository.anyPushEnabled;
  }

  bool get _tokenMissing =>
      _repository.anyPushEnabled && _tokenNotifier.settings.token.isEmpty;

  Iterable<PushSettings> get _pendingSettings =>
      _repository.unsyncedSettings.where(
        (settings) => _rejectedSettings[settings.accountId] != settings,
      );

  Future<void> _publishToken() async {
    if (!_tokenPending) return;

    final tokenSettings = _tokenNotifier.settings;
    final result = await _service.updateToken(
      clientId: tokenSettings.clientId,
      privateKey: tokenSettings.privateKey,
      token: tokenSettings.token,
    );
    switch (result) {
      case .success:
        await _tokenNotifier.setPublished(true);
      case .rejected:
      case .unknownClient:
        _rejectedToken = tokenSettings.token;
        _log.e('Push token rejected by the api; waiting for a new token');
      case .claimRequired:
      case .claimPending:
        _log.i('Push token claim pending; retrying on the next sweep');
      case .retryable:
        break;
    }
  }

  Future<void> _syncAccounts() async {
    for (final settings in _pendingSettings) {
      final tokenSettings = _tokenNotifier.settings;
      final result = await _service.updateSettings(
        pushToken: tokenSettings.published ? null : tokenSettings.token,
        clientId: tokenSettings.clientId,
        privateKey: tokenSettings.privateKey,
        accountId: settings.accountId,
        options: settings.options,
        addresses: settings.addresses,
      );
      switch (result) {
        case .success:
          _rejectedSettings.remove(settings.accountId);
          await _tokenNotifier.setPublished(true);
          if (settings.pushEnabled) {
            await _repository.setPushInfo(
              settings.copyWith(synced: true),
              id: settings.accountId,
            );
          } else {
            await _repository.removePushInfo(settings.accountId);
          }
        case .rejected:
          _log.e('Push settings rejected for account ${settings.accountId}');
          if (settings.pushEnabled) {
            _rejectedSettings[settings.accountId] = settings;
          } else {
            await _repository.removePushInfo(settings.accountId);
          }
        case .unknownClient:
          await _tokenNotifier.setPublished(false);
          await _repository.markEnabledUnsynced();
          if (!settings.pushEnabled) {
            await _repository.removePushInfo(settings.accountId);
            _rerun = true;
          } else if (tokenSettings.published) {
            _rerun = true;
          } else {
            _log.e('Push settings rejected for account ${settings.accountId}');
            _rejectedSettings[settings.accountId] = settings;
          }
        case .claimRequired:
        case .claimPending:
          continue;
        case .retryable:
          continue;
      }
    }
  }

  void _scheduleRetryIfPending() {
    if (!_active) return;

    if (_tokenMissing || _tokenPending || _pendingSettings.isNotEmpty) {
      _retryTimer = Timer(_retryDelay, sync);
      _retryDelay = _retryDelay * 2 < _kMaxRetryDelay
          ? _retryDelay * 2
          : _kMaxRetryDelay;
      _emit(.waitingToRetry);
    } else {
      _retryDelay = _kMinRetryDelay;
      _emit(.idle);
    }
  }

  void _emit(PushSyncState value) {
    if (_active) state = value;
  }
}
