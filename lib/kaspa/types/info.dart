import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.freezed.dart';

@freezed
sealed class ServerInfo with _$ServerInfo {
  const ServerInfo._();
  const factory ServerInfo({
    required int rpcApiVersion,
    required int rpcApiRevision,
    required String serverVersion,
    required String networkId,
    required bool hasUtxoIndex,
    required bool isSynced,
    required int virtualDaaScore,
  }) = _ServerInfo;
}
