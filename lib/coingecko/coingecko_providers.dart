import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core_providers.dart';
import '../settings/settings_providers.dart';
import 'coingecko_price_notifier.dart';
import 'coingecko_repository.dart';
import 'coingecko_types.dart';

final _kaspaPriceCacheProvider = StateNotifierProvider((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return CoinGeckoPriceNotifier(repository);
});

final _kaspaPriceRemoteProvider = FutureProvider.autoDispose((ref) async {
  ref.watch(remoteRefreshProvider);
  ref.watch(timeProvider);

  final currency = ref.watch(currencyProvider);
  final fiat = currency.name.toLowerCase();

  final log = ref.read(loggerProvider);
  final cache = ref.read(_kaspaPriceCacheProvider.notifier);
  final cached = cache.price;

  // 60 seconds
  final maxCacheAge = 60 * 1000;
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  if (cached.currency == currency.currency &&
      timestamp - cached.timestamp < maxCacheAge) {
    return cached;
  }

  try {
    var price = currency.currency.kaspiumApiOnly
        ? null
        : await getCoinGeckoApiPrice(fiat);
    // fallback to Kaspium API if CoinGecko API fails or doesn't have the currency
    price ??= await getKaspiumApiPrice(fiat);
    if (price == null) {
      throw Exception('Failed to fetch remote exchange rate');
    }

    final result = CoinGeckoPrice(
      currency: currency.currency,
      price: .parse(price.toString()),
      timestamp: timestamp,
    );
    // Cache here rather than downstream
    cache.updatePrice(result);
    return result;
  } catch (e, st) {
    log.e('Failed to fetch KAS exchange rate', error: e, stackTrace: st);
    if (cached.currency == currency.currency) {
      return cached;
    }
    return CoinGeckoPrice(
      currency: currency.currency,
      price: .zero,
      timestamp: timestamp,
    );
  }
});

final coingeckoKaspaPriceProvider = Provider.autoDispose((ref) {
  final cached = ref.watch(_kaspaPriceCacheProvider);
  final remote = ref.watch(_kaspaPriceRemoteProvider);

  return remote.asData?.value ?? cached;
});
