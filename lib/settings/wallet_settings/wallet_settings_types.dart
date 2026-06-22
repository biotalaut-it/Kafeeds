import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_settings_types.freezed.dart';
part 'wallet_settings_types.g.dart';

@freezed
sealed class WalletSettings with _$WalletSettings {
  const factory WalletSettings() = _WalletSettings;

  factory WalletSettings.fromJson(Map<String, dynamic> json) =>
      _$WalletSettingsFromJson(json);
}
