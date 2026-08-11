import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/push/push_types.dart';

List<String> addresses(int count) =>
    [for (var i = count - 1; i >= 0; --i) 'address_$i'];

void main() {
  group('WatchPreferences.watchedAddresses', () {
    test('defaults to the newest addresses up to the cap', () {
      final all = addresses(120);
      final watched = const WatchPreferences().watchedAddresses(all);
      expect(watched, unorderedEquals(all.take(kMaxWatchedAddressesPerAccount)));
    });

    test('keeps every address when under the cap', () {
      final all = addresses(5);
      final watched = const WatchPreferences().watchedAddresses(all);
      expect(watched, unorderedEquals(all));
    });

    test('pinned addresses outside the window stay watched', () {
      final all = addresses(120);
      final watched = const WatchPreferences(
        pinnedAddresses: {'address_0'},
      ).watchedAddresses(all);
      expect(watched, contains('address_0'));
      expect(watched.length, kMaxWatchedAddressesPerAccount);
      expect(watched, isNot(contains('address_20')));
      expect(watched, contains('address_21'));
    });

    test('excluded addresses are skipped by the window', () {
      final all = addresses(120);
      final watched = const WatchPreferences(
        excludedAddresses: {'address_119'},
      ).watchedAddresses(all);
      expect(watched, isNot(contains('address_119')));
      expect(watched.length, kMaxWatchedAddressesPerAccount);
      expect(watched, contains('address_19'));
    });

    test('pinning dominates exclusion: states are disjoint inputs', () {
      final watched = const WatchPreferences(
        pinnedAddresses: {'address_3'},
        excludedAddresses: {'address_3'},
      ).watchedAddresses(addresses(10));
      expect(watched, contains('address_3'));
    });

    test('no window slots remain when the cap is fully pinned', () {
      final all = addresses(120);
      final pins = all.skip(10).take(kMaxWatchedAddressesPerAccount).toSet();
      final watched = WatchPreferences(
        pinnedAddresses: pins,
      ).watchedAddresses(all);
      expect(watched, unorderedEquals(pins));
    });

    test('never exceeds the cap even with too many pins', () {
      final all = addresses(120);
      final watched = WatchPreferences(
        pinnedAddresses: all.toSet(),
      ).watchedAddresses(all);
      expect(watched.length, kMaxWatchedAddressesPerAccount);
    });

    test('watches nothing when all addresses are excluded', () {
      final all = addresses(10);
      final watched = WatchPreferences(
        excludedAddresses: all.toSet(),
      ).watchedAddresses(all);
      expect(watched, isEmpty);
    });

    test('is order-canonical: pinning an in-window address changes nothing', () {
      final all = addresses(50);
      final unpinned = const WatchPreferences().watchedAddresses(all);
      final pinned = const WatchPreferences(
        pinnedAddresses: {'address_25'},
      ).watchedAddresses(all);
      expect(pinned, unpinned);
    });

    test('watches only pins when the auto watch window is off', () {
      final watched = const WatchPreferences(
        pinnedAddresses: {'address_5', 'address_50'},
        autoWatch: false,
      ).watchedAddresses(addresses(120));
      expect(watched, unorderedEquals(['address_5', 'address_50']));
    });

    test('watches nothing when the window is off and nothing is pinned', () {
      final watched = const WatchPreferences(
        autoWatch: false,
      ).watchedAddresses(addresses(20));
      expect(watched, isEmpty);
    });
  });

  group('WatchPreferences.derive', () {
    test('autoWatch while any address is neither pinned nor excluded', () {
      final all = addresses(10);
      final preferences = WatchPreferences.derive(
        addresses: all,
        pinned: {'address_9'},
        excluded: all.skip(1).take(8).toSet(),
      );
      expect(preferences.autoWatch, isTrue);
    });

    test('no autoWatch when every address is pinned or excluded', () {
      final all = addresses(10);
      final preferences = WatchPreferences.derive(
        addresses: all,
        pinned: {'address_9', 'address_8'},
        excluded: all.skip(2).toSet(),
      );
      expect(preferences.autoWatch, isFalse);
    });

    test('no autoWatch without any addresses', () {
      final preferences = WatchPreferences.derive(
        addresses: [],
        pinned: {},
        excluded: {},
      );
      expect(preferences.autoWatch, isFalse);
    });

    test('equality is by value, so an unchanged save compares equal', () {
      final all = addresses(10);
      WatchPreferences derive() => WatchPreferences.derive(
        addresses: all,
        pinned: {'address_9'},
        excluded: {'address_0'},
      );
      expect(derive(), derive());
    });
  });

  test('WatchPreferences survives a json round trip', () {
    const preferences = WatchPreferences(
      pinnedAddresses: {'address_2', 'address_1'},
      excludedAddresses: {'address_0'},
      autoWatch: false,
    );
    expect(WatchPreferences.fromJson(preferences.toJson()), preferences);
  });
}
