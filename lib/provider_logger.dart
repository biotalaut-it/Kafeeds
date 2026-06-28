import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  const ProviderLogger();

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      debugPrint('''
didAdd
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "value": "$value"
}''');
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      debugPrint('''
didUpdate
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue",
  "newValue": "$newValue"
}''');
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      debugPrint('''
didDispose
{
  "provider": "${provider.name ?? provider.runtimeType}"
}''');
    }
  }
}
