import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings_repository.dart';
import 'node_types.dart';

const kNodeConfigKey = '_kNodeConfigKeyV2';

// temporary Toccata node override
final toccataNodeConfig = mainnetNodeConfig.copyWith(
  urls: ['toccata.kaspium.io'],
);

NodeConfig _toccataOverride(NodeConfig config) {
  if (config.id == mainnetNodeConfig.id) {
    return toccataNodeConfig;
  }
  return config;
}

NodeConfig _toccataRevertOverride(NodeConfig config) {
  if (config.id == toccataNodeConfig.id) {
    return mainnetNodeConfig;
  }
  return config;
}

NodeConfigSettings _settingsOverride(NodeConfigSettings settings) {
  return NodeConfigSettings(
    options: settings.options.map(_toccataOverride).toIList(),
    selected: _toccataOverride(settings.selected),
  );
}

NodeConfigSettings _settingsRevertOverride(NodeConfigSettings settings) {
  return NodeConfigSettings(
    options: settings.options.map(_toccataRevertOverride).toIList(),
    selected: _toccataRevertOverride(settings.selected),
  );
}

extension NodeSettingsExtension on SettingsRepository {
  NodeConfigSettings getNodeConfigSettings() {
    final settings =
        box.tryGet<NodeConfigSettings>(
          kNodeConfigKey,
          typeFactory: NodeConfigSettings.fromJson,
        ) ??
        const NodeConfigSettings();
    return _settingsOverride(settings);
  }

  Future<void> setNodeConfigSettings(NodeConfigSettings settings) {
    settings = _settingsRevertOverride(settings);
    return box.set(kNodeConfigKey, settings);
  }
}

class NodeSettingsNotifier extends StateNotifier<NodeConfigSettings> {
  final SettingsRepository repository;

  NodeSettingsNotifier(this.repository)
    : super(repository.getNodeConfigSettings());

  Future<void> updateSelected(NodeConfig config) {
    state = state.copyWith(selected: config);
    return repository.setNodeConfigSettings(state);
  }

  Future<void> updateOptions(IList<NodeConfig> options) {
    state = state.copyWith(
      options: options,
    );
    return repository.setNodeConfigSettings(state);
  }

  Future<bool> addOption(NodeConfig config) async {
    if (state.options.contains(config)) {
      return false;
    }
    final options = state.options.add(config);
    await updateOptions(options);
    return true;
  }

  Future<bool> removeOption(NodeConfig config) async {
    if (config == state.selected) {
      return false;
    }
    final options = state.options.remove(config);
    await updateOptions(options);
    return true;
  }
}
