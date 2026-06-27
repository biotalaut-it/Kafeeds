import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_providers.dart';
import '../app_styles.dart';
import '../chain_state/chain_state.dart';
import '../database/database.dart';
import '../kaspa/kaspa.dart';
import '../main_card/main_card_notifier.dart';
import '../main_card/main_card_state.dart';
import '../util/auth_util.dart';
import '../util/biometrics.dart';
import '../util/hapticutil.dart';
import '../util/sharedprefsutil.dart';
import '../util/vault.dart';

final timeProvider = StreamProvider.autoDispose<DateTime>((ref) {
  return Stream.periodic(
    const Duration(seconds: 10),
    (ticker) => DateTime.now(),
  );
});

final lastUpdateProvider = Provider.autoDispose<DateTime>((ref) {
  ref.watch(virtualDaaScoreProvider);
  return DateTime.now();
});

final inBackgroundProvider = StateProvider<bool>((ref) => false);

final networkErrorProvider = Provider.autoDispose<bool>((ref) {
  final inBackground = ref.watch(inBackgroundProvider);
  final lastUpdate = ref.watch(lastUpdateProvider);
  final timer = ref.watch(timeProvider).asData?.value ?? DateTime.now();
  if (inBackground) {
    return false;
  }
  return timer.difference(lastUpdate) > Duration(seconds: 5);
});

final dbProvider = StateProvider((ref) => Database());

final stylesProvider = Provider((ref) {
  final theme = ref.watch(themeProvider);
  return AppStyles(theme);
});

final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final hapticUtilProvider = Provider((ref) => const HapticUtil());
final authUtilProvider = Provider((ref) => AuthUtil(ref));
final biometricUtilProvider = Provider((ref) => BiometricUtil());
final vaultProvider = Provider((ref) => Vault());
final sharedPrefsUtilProvider = Provider((ref) {
  final sharedPrefs = ref.watch(sharedPrefsProvider);
  return SharedPrefsUtil(sharedPrefs);
});
final loggerProvider = Provider(
  (ref) => Logger(
    printer: PrettyPrinter(),
    //filter: ProductionFilter(),
  ),
);

final networkProvider = Provider((ref) {
  final config = ref.watch(kaspaNodeConfigProvider);
  return config.network;
});

final networkIdProvider = Provider((ref) {
  final config = ref.watch(kaspaNodeConfigProvider);
  return config.networkId;
});

final addressPrefixProvider = Provider((ref) {
  final network = ref.watch(networkProvider);
  final prefix = addressPrefixForNetwork(network);

  return prefix;
});

final kaspaApiServiceProvider = Provider.autoDispose<ApiService>((ref) {
  final apiUrl = ref.watch(kaspaApiUrlProvider);
  return ApiService.url(apiUrl);
});

final mainCardProvider = StateNotifierProvider<MainCardNotifier, MainCardState>(
  (ref) {
    return MainCardNotifier();
  },
);

final themeProvider = Provider((ref) {
  final themeSetting = ref.watch(themeSettingProvider);
  return themeSetting.getTheme();
});

final chainStateProvider = Provider((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.getChainState();
});

final lastKnownVirtualDaaScoreProvider = StateProvider<BigInt>((ref) {
  final chainState = ref.watch(chainStateProvider);
  return chainState.virtualDaaScore;
});

final virtualDaaScoreProvider = StreamProvider.autoDispose((ref) {
  final rpc = ref.watch(kaspaRpcProvider);

  ref.onDispose(() async {
    try {
      await rpc.stopNotifyingVirtualDaaScoreChanged();
    } catch (_) {}
  });

  return rpc.notifyVirtualDaaScoreChanged().map((virtualDaaScore) {
    final lastKnown = ref.read(lastKnownVirtualDaaScoreProvider.notifier);
    lastKnown.state = virtualDaaScore;

    return virtualDaaScore;
  });
});

final virtualSelectedParentBlueScoreProvider = StateProvider<BigInt>((ref) {
  final chainState = ref.watch(chainStateProvider);
  return chainState.virtualSelectedParentBlueScore;
});

final virtualSelectedParentBlueScoreStreamProvider = StreamProvider.autoDispose(
  (ref) {
    final rpc = ref.watch(kaspaRpcProvider);

    ref.onDispose(() async {
      try {
        await rpc.stopNotifyingSinkBlueScoreChanged();
      } catch (_) {}
    });

    return rpc.notifySinkBlueScoreChanged().map((blueScore) {
      final notifier = ref.read(
        virtualSelectedParentBlueScoreProvider.notifier,
      );
      notifier.state = blueScore;

      return blueScore;
    });
  },
);

final remoteRefreshProvider = StateProvider((ref) => 0);

final lockDisabledProvider = StateProvider((ref) => false);
final privacyOverlayDisabledProvider = StateProvider((ref) => false);

final appLinkProvider = StateProvider<String?>((ref) {
  return null;
});

final fiatModeProvider = StateProvider<bool>((ref) => false);

final kasSymbolProvider = Provider((ref) {
  final network = ref.watch(networkProvider);

  return switch (network) {
    .mainnet => 'KAS',
    _ => 'TKAS',
  };
});

final symbolProvider = Provider.family<String, Amount>((ref, amount) {
  final kasSymbol = ref.watch(kasSymbolProvider);
  if (amount.tokenInfo.tokenId != TokenInfo.kaspa.tokenId) {
    return amount.symbolLabel;
  }

  return kasSymbol;
});
