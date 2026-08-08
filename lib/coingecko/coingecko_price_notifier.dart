import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/settings_repository.dart';
import 'coingecko_types.dart';

const _kCoinGeckoPriceKey = '_coingeckoPriceKey';

extension CoinGeckoPriceExtension on SettingsRepository {
  CoinGeckoPrice getCoinGeckoPrice() {
    try {
      return box.tryGet(
            _kCoinGeckoPriceKey,
            typeFactory: CoinGeckoPrice.fromJson,
          ) ??
          .empty;
    } catch (_) {
      return .empty;
    }
  }

  Future<void> setCoinGeckoPrice(CoinGeckoPrice price) {
    return box.set(_kCoinGeckoPriceKey, price);
  }
}

class CoinGeckoPriceNotifier extends StateNotifier<CoinGeckoPrice> {
  final SettingsRepository repository;

  CoinGeckoPrice get price => state;

  CoinGeckoPriceNotifier(this.repository)
    : super(repository.getCoinGeckoPrice());

  Future<void> updatePrice(CoinGeckoPrice price) {
    state = price;
    return repository.setCoinGeckoPrice(price);
  }
}
