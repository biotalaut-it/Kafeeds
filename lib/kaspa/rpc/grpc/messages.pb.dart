// This is a generated file - do not edit.
//
// Generated from messages.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum KaspadRequest_Payload {
  getCurrentNetworkRequest,
  submitBlockRequest,
  getBlockTemplateRequest,
  notifyBlockAddedRequest,
  getPeerAddressesRequest,
  getSinkRequest,
  getMempoolEntryRequest,
  getConnectedPeerInfoRequest,
  addPeerRequest,
  submitTransactionRequest,
  notifyVirtualChainChangedRequest,
  getBlockRequest,
  getSubnetworkRequest,
  getVirtualChainFromBlockRequest,
  getBlocksRequest,
  getBlockCountRequest,
  getBlockDagInfoRequest,
  resolveFinalityConflictRequest,
  notifyFinalityConflictRequest,
  getMempoolEntriesRequest,
  shutdownRequest,
  getHeadersRequest,
  notifyUtxosChangedRequest,
  getUtxosByAddressesRequest,
  getSinkBlueScoreRequest,
  notifySinkBlueScoreChangedRequest,
  banRequest,
  unbanRequest,
  getInfoRequest,
  stopNotifyingUtxosChangedRequest,
  notifyPruningPointUtxoSetOverrideRequest,
  stopNotifyingPruningPointUtxoSetOverrideRequest,
  estimateNetworkHashesPerSecondRequest,
  notifyVirtualDaaScoreChangedRequest,
  getBalanceByAddressRequest,
  getBalancesByAddressesRequest,
  notifyNewBlockTemplateRequest,
  getMempoolEntriesByAddressesRequest,
  getCoinSupplyRequest,
  pingRequest,
  getMetricsRequest,
  getServerInfoRequest,
  getSyncStatusRequest,
  getDaaScoreTimestampEstimateRequest,
  submitTransactionReplacementRequest,
  getConnectionsRequest,
  getSystemInfoRequest,
  getFeeEstimateRequest,
  getFeeEstimateExperimentalRequest,
  getCurrentBlockColorRequest,
  getUtxoReturnAddressRequest,
  getVirtualChainFromBlockV2Request,
  getBlockRewardInfoRequest,
  notSet
}

class KaspadRequest extends $pb.GeneratedMessage {
  factory KaspadRequest({
    $fixnum.Int64? id,
    $1.GetCurrentNetworkRequestMessage? getCurrentNetworkRequest,
    $1.SubmitBlockRequestMessage? submitBlockRequest,
    $1.GetBlockTemplateRequestMessage? getBlockTemplateRequest,
    $1.NotifyBlockAddedRequestMessage? notifyBlockAddedRequest,
    $1.GetPeerAddressesRequestMessage? getPeerAddressesRequest,
    $1.GetSinkRequestMessage? getSinkRequest,
    $1.GetMempoolEntryRequestMessage? getMempoolEntryRequest,
    $1.GetConnectedPeerInfoRequestMessage? getConnectedPeerInfoRequest,
    $1.AddPeerRequestMessage? addPeerRequest,
    $1.SubmitTransactionRequestMessage? submitTransactionRequest,
    $1.NotifyVirtualChainChangedRequestMessage?
        notifyVirtualChainChangedRequest,
    $1.GetBlockRequestMessage? getBlockRequest,
    $1.GetSubnetworkRequestMessage? getSubnetworkRequest,
    $1.GetVirtualChainFromBlockRequestMessage? getVirtualChainFromBlockRequest,
    $1.GetBlocksRequestMessage? getBlocksRequest,
    $1.GetBlockCountRequestMessage? getBlockCountRequest,
    $1.GetBlockDagInfoRequestMessage? getBlockDagInfoRequest,
    $1.ResolveFinalityConflictRequestMessage? resolveFinalityConflictRequest,
    $1.NotifyFinalityConflictRequestMessage? notifyFinalityConflictRequest,
    $1.GetMempoolEntriesRequestMessage? getMempoolEntriesRequest,
    $1.ShutdownRequestMessage? shutdownRequest,
    $1.GetHeadersRequestMessage? getHeadersRequest,
    $1.NotifyUtxosChangedRequestMessage? notifyUtxosChangedRequest,
    $1.GetUtxosByAddressesRequestMessage? getUtxosByAddressesRequest,
    $1.GetSinkBlueScoreRequestMessage? getSinkBlueScoreRequest,
    $1.NotifySinkBlueScoreChangedRequestMessage?
        notifySinkBlueScoreChangedRequest,
    $1.BanRequestMessage? banRequest,
    $1.UnbanRequestMessage? unbanRequest,
    $1.GetInfoRequestMessage? getInfoRequest,
    $1.StopNotifyingUtxosChangedRequestMessage?
        stopNotifyingUtxosChangedRequest,
    $1.NotifyPruningPointUtxoSetOverrideRequestMessage?
        notifyPruningPointUtxoSetOverrideRequest,
    $1.StopNotifyingPruningPointUtxoSetOverrideRequestMessage?
        stopNotifyingPruningPointUtxoSetOverrideRequest,
    $1.EstimateNetworkHashesPerSecondRequestMessage?
        estimateNetworkHashesPerSecondRequest,
    $1.NotifyVirtualDaaScoreChangedRequestMessage?
        notifyVirtualDaaScoreChangedRequest,
    $1.GetBalanceByAddressRequestMessage? getBalanceByAddressRequest,
    $1.GetBalancesByAddressesRequestMessage? getBalancesByAddressesRequest,
    $1.NotifyNewBlockTemplateRequestMessage? notifyNewBlockTemplateRequest,
    $1.GetMempoolEntriesByAddressesRequestMessage?
        getMempoolEntriesByAddressesRequest,
    $1.GetCoinSupplyRequestMessage? getCoinSupplyRequest,
    $1.PingRequestMessage? pingRequest,
    $1.GetMetricsRequestMessage? getMetricsRequest,
    $1.GetServerInfoRequestMessage? getServerInfoRequest,
    $1.GetSyncStatusRequestMessage? getSyncStatusRequest,
    $1.GetDaaScoreTimestampEstimateRequestMessage?
        getDaaScoreTimestampEstimateRequest,
    $1.SubmitTransactionReplacementRequestMessage?
        submitTransactionReplacementRequest,
    $1.GetConnectionsRequestMessage? getConnectionsRequest,
    $1.GetSystemInfoRequestMessage? getSystemInfoRequest,
    $1.GetFeeEstimateRequestMessage? getFeeEstimateRequest,
    $1.GetFeeEstimateExperimentalRequestMessage?
        getFeeEstimateExperimentalRequest,
    $1.GetCurrentBlockColorRequestMessage? getCurrentBlockColorRequest,
    $1.GetUtxoReturnAddressRequestMessage? getUtxoReturnAddressRequest,
    $1.GetVirtualChainFromBlockV2RequestMessage?
        getVirtualChainFromBlockV2Request,
    $1.GetBlockRewardInfoRequestMessage? getBlockRewardInfoRequest,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (getCurrentNetworkRequest != null)
      result.getCurrentNetworkRequest = getCurrentNetworkRequest;
    if (submitBlockRequest != null)
      result.submitBlockRequest = submitBlockRequest;
    if (getBlockTemplateRequest != null)
      result.getBlockTemplateRequest = getBlockTemplateRequest;
    if (notifyBlockAddedRequest != null)
      result.notifyBlockAddedRequest = notifyBlockAddedRequest;
    if (getPeerAddressesRequest != null)
      result.getPeerAddressesRequest = getPeerAddressesRequest;
    if (getSinkRequest != null) result.getSinkRequest = getSinkRequest;
    if (getMempoolEntryRequest != null)
      result.getMempoolEntryRequest = getMempoolEntryRequest;
    if (getConnectedPeerInfoRequest != null)
      result.getConnectedPeerInfoRequest = getConnectedPeerInfoRequest;
    if (addPeerRequest != null) result.addPeerRequest = addPeerRequest;
    if (submitTransactionRequest != null)
      result.submitTransactionRequest = submitTransactionRequest;
    if (notifyVirtualChainChangedRequest != null)
      result.notifyVirtualChainChangedRequest =
          notifyVirtualChainChangedRequest;
    if (getBlockRequest != null) result.getBlockRequest = getBlockRequest;
    if (getSubnetworkRequest != null)
      result.getSubnetworkRequest = getSubnetworkRequest;
    if (getVirtualChainFromBlockRequest != null)
      result.getVirtualChainFromBlockRequest = getVirtualChainFromBlockRequest;
    if (getBlocksRequest != null) result.getBlocksRequest = getBlocksRequest;
    if (getBlockCountRequest != null)
      result.getBlockCountRequest = getBlockCountRequest;
    if (getBlockDagInfoRequest != null)
      result.getBlockDagInfoRequest = getBlockDagInfoRequest;
    if (resolveFinalityConflictRequest != null)
      result.resolveFinalityConflictRequest = resolveFinalityConflictRequest;
    if (notifyFinalityConflictRequest != null)
      result.notifyFinalityConflictRequest = notifyFinalityConflictRequest;
    if (getMempoolEntriesRequest != null)
      result.getMempoolEntriesRequest = getMempoolEntriesRequest;
    if (shutdownRequest != null) result.shutdownRequest = shutdownRequest;
    if (getHeadersRequest != null) result.getHeadersRequest = getHeadersRequest;
    if (notifyUtxosChangedRequest != null)
      result.notifyUtxosChangedRequest = notifyUtxosChangedRequest;
    if (getUtxosByAddressesRequest != null)
      result.getUtxosByAddressesRequest = getUtxosByAddressesRequest;
    if (getSinkBlueScoreRequest != null)
      result.getSinkBlueScoreRequest = getSinkBlueScoreRequest;
    if (notifySinkBlueScoreChangedRequest != null)
      result.notifySinkBlueScoreChangedRequest =
          notifySinkBlueScoreChangedRequest;
    if (banRequest != null) result.banRequest = banRequest;
    if (unbanRequest != null) result.unbanRequest = unbanRequest;
    if (getInfoRequest != null) result.getInfoRequest = getInfoRequest;
    if (stopNotifyingUtxosChangedRequest != null)
      result.stopNotifyingUtxosChangedRequest =
          stopNotifyingUtxosChangedRequest;
    if (notifyPruningPointUtxoSetOverrideRequest != null)
      result.notifyPruningPointUtxoSetOverrideRequest =
          notifyPruningPointUtxoSetOverrideRequest;
    if (stopNotifyingPruningPointUtxoSetOverrideRequest != null)
      result.stopNotifyingPruningPointUtxoSetOverrideRequest =
          stopNotifyingPruningPointUtxoSetOverrideRequest;
    if (estimateNetworkHashesPerSecondRequest != null)
      result.estimateNetworkHashesPerSecondRequest =
          estimateNetworkHashesPerSecondRequest;
    if (notifyVirtualDaaScoreChangedRequest != null)
      result.notifyVirtualDaaScoreChangedRequest =
          notifyVirtualDaaScoreChangedRequest;
    if (getBalanceByAddressRequest != null)
      result.getBalanceByAddressRequest = getBalanceByAddressRequest;
    if (getBalancesByAddressesRequest != null)
      result.getBalancesByAddressesRequest = getBalancesByAddressesRequest;
    if (notifyNewBlockTemplateRequest != null)
      result.notifyNewBlockTemplateRequest = notifyNewBlockTemplateRequest;
    if (getMempoolEntriesByAddressesRequest != null)
      result.getMempoolEntriesByAddressesRequest =
          getMempoolEntriesByAddressesRequest;
    if (getCoinSupplyRequest != null)
      result.getCoinSupplyRequest = getCoinSupplyRequest;
    if (pingRequest != null) result.pingRequest = pingRequest;
    if (getMetricsRequest != null) result.getMetricsRequest = getMetricsRequest;
    if (getServerInfoRequest != null)
      result.getServerInfoRequest = getServerInfoRequest;
    if (getSyncStatusRequest != null)
      result.getSyncStatusRequest = getSyncStatusRequest;
    if (getDaaScoreTimestampEstimateRequest != null)
      result.getDaaScoreTimestampEstimateRequest =
          getDaaScoreTimestampEstimateRequest;
    if (submitTransactionReplacementRequest != null)
      result.submitTransactionReplacementRequest =
          submitTransactionReplacementRequest;
    if (getConnectionsRequest != null)
      result.getConnectionsRequest = getConnectionsRequest;
    if (getSystemInfoRequest != null)
      result.getSystemInfoRequest = getSystemInfoRequest;
    if (getFeeEstimateRequest != null)
      result.getFeeEstimateRequest = getFeeEstimateRequest;
    if (getFeeEstimateExperimentalRequest != null)
      result.getFeeEstimateExperimentalRequest =
          getFeeEstimateExperimentalRequest;
    if (getCurrentBlockColorRequest != null)
      result.getCurrentBlockColorRequest = getCurrentBlockColorRequest;
    if (getUtxoReturnAddressRequest != null)
      result.getUtxoReturnAddressRequest = getUtxoReturnAddressRequest;
    if (getVirtualChainFromBlockV2Request != null)
      result.getVirtualChainFromBlockV2Request =
          getVirtualChainFromBlockV2Request;
    if (getBlockRewardInfoRequest != null)
      result.getBlockRewardInfoRequest = getBlockRewardInfoRequest;
    return result;
  }

  KaspadRequest._();

  factory KaspadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KaspadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, KaspadRequest_Payload>
      _KaspadRequest_PayloadByTag = {
    1001: KaspadRequest_Payload.getCurrentNetworkRequest,
    1003: KaspadRequest_Payload.submitBlockRequest,
    1005: KaspadRequest_Payload.getBlockTemplateRequest,
    1007: KaspadRequest_Payload.notifyBlockAddedRequest,
    1010: KaspadRequest_Payload.getPeerAddressesRequest,
    1012: KaspadRequest_Payload.getSinkRequest,
    1014: KaspadRequest_Payload.getMempoolEntryRequest,
    1016: KaspadRequest_Payload.getConnectedPeerInfoRequest,
    1018: KaspadRequest_Payload.addPeerRequest,
    1020: KaspadRequest_Payload.submitTransactionRequest,
    1022: KaspadRequest_Payload.notifyVirtualChainChangedRequest,
    1025: KaspadRequest_Payload.getBlockRequest,
    1027: KaspadRequest_Payload.getSubnetworkRequest,
    1029: KaspadRequest_Payload.getVirtualChainFromBlockRequest,
    1031: KaspadRequest_Payload.getBlocksRequest,
    1033: KaspadRequest_Payload.getBlockCountRequest,
    1035: KaspadRequest_Payload.getBlockDagInfoRequest,
    1037: KaspadRequest_Payload.resolveFinalityConflictRequest,
    1039: KaspadRequest_Payload.notifyFinalityConflictRequest,
    1043: KaspadRequest_Payload.getMempoolEntriesRequest,
    1045: KaspadRequest_Payload.shutdownRequest,
    1047: KaspadRequest_Payload.getHeadersRequest,
    1049: KaspadRequest_Payload.notifyUtxosChangedRequest,
    1052: KaspadRequest_Payload.getUtxosByAddressesRequest,
    1054: KaspadRequest_Payload.getSinkBlueScoreRequest,
    1056: KaspadRequest_Payload.notifySinkBlueScoreChangedRequest,
    1059: KaspadRequest_Payload.banRequest,
    1061: KaspadRequest_Payload.unbanRequest,
    1063: KaspadRequest_Payload.getInfoRequest,
    1065: KaspadRequest_Payload.stopNotifyingUtxosChangedRequest,
    1067: KaspadRequest_Payload.notifyPruningPointUtxoSetOverrideRequest,
    1070: KaspadRequest_Payload.stopNotifyingPruningPointUtxoSetOverrideRequest,
    1072: KaspadRequest_Payload.estimateNetworkHashesPerSecondRequest,
    1074: KaspadRequest_Payload.notifyVirtualDaaScoreChangedRequest,
    1077: KaspadRequest_Payload.getBalanceByAddressRequest,
    1079: KaspadRequest_Payload.getBalancesByAddressesRequest,
    1081: KaspadRequest_Payload.notifyNewBlockTemplateRequest,
    1084: KaspadRequest_Payload.getMempoolEntriesByAddressesRequest,
    1086: KaspadRequest_Payload.getCoinSupplyRequest,
    1088: KaspadRequest_Payload.pingRequest,
    1090: KaspadRequest_Payload.getMetricsRequest,
    1092: KaspadRequest_Payload.getServerInfoRequest,
    1094: KaspadRequest_Payload.getSyncStatusRequest,
    1096: KaspadRequest_Payload.getDaaScoreTimestampEstimateRequest,
    1100: KaspadRequest_Payload.submitTransactionReplacementRequest,
    1102: KaspadRequest_Payload.getConnectionsRequest,
    1104: KaspadRequest_Payload.getSystemInfoRequest,
    1106: KaspadRequest_Payload.getFeeEstimateRequest,
    1108: KaspadRequest_Payload.getFeeEstimateExperimentalRequest,
    1110: KaspadRequest_Payload.getCurrentBlockColorRequest,
    1112: KaspadRequest_Payload.getUtxoReturnAddressRequest,
    1114: KaspadRequest_Payload.getVirtualChainFromBlockV2Request,
    1116: KaspadRequest_Payload.getBlockRewardInfoRequest,
    0: KaspadRequest_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KaspadRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..oo(0, [
      1001,
      1003,
      1005,
      1007,
      1010,
      1012,
      1014,
      1016,
      1018,
      1020,
      1022,
      1025,
      1027,
      1029,
      1031,
      1033,
      1035,
      1037,
      1039,
      1043,
      1045,
      1047,
      1049,
      1052,
      1054,
      1056,
      1059,
      1061,
      1063,
      1065,
      1067,
      1070,
      1072,
      1074,
      1077,
      1079,
      1081,
      1084,
      1086,
      1088,
      1090,
      1092,
      1094,
      1096,
      1100,
      1102,
      1104,
      1106,
      1108,
      1110,
      1112,
      1114,
      1116
    ])
    ..a<$fixnum.Int64>(101, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.GetCurrentNetworkRequestMessage>(
        1001, _omitFieldNames ? '' : 'getCurrentNetworkRequest',
        protoName: 'getCurrentNetworkRequest',
        subBuilder: $1.GetCurrentNetworkRequestMessage.create)
    ..aOM<$1.SubmitBlockRequestMessage>(
        1003, _omitFieldNames ? '' : 'submitBlockRequest',
        protoName: 'submitBlockRequest',
        subBuilder: $1.SubmitBlockRequestMessage.create)
    ..aOM<$1.GetBlockTemplateRequestMessage>(
        1005, _omitFieldNames ? '' : 'getBlockTemplateRequest',
        protoName: 'getBlockTemplateRequest',
        subBuilder: $1.GetBlockTemplateRequestMessage.create)
    ..aOM<$1.NotifyBlockAddedRequestMessage>(
        1007, _omitFieldNames ? '' : 'notifyBlockAddedRequest',
        protoName: 'notifyBlockAddedRequest',
        subBuilder: $1.NotifyBlockAddedRequestMessage.create)
    ..aOM<$1.GetPeerAddressesRequestMessage>(
        1010, _omitFieldNames ? '' : 'getPeerAddressesRequest',
        protoName: 'getPeerAddressesRequest',
        subBuilder: $1.GetPeerAddressesRequestMessage.create)
    ..aOM<$1.GetSinkRequestMessage>(
        1012, _omitFieldNames ? '' : 'GetSinkRequest',
        protoName: 'GetSinkRequest',
        subBuilder: $1.GetSinkRequestMessage.create)
    ..aOM<$1.GetMempoolEntryRequestMessage>(
        1014, _omitFieldNames ? '' : 'getMempoolEntryRequest',
        protoName: 'getMempoolEntryRequest',
        subBuilder: $1.GetMempoolEntryRequestMessage.create)
    ..aOM<$1.GetConnectedPeerInfoRequestMessage>(
        1016, _omitFieldNames ? '' : 'getConnectedPeerInfoRequest',
        protoName: 'getConnectedPeerInfoRequest',
        subBuilder: $1.GetConnectedPeerInfoRequestMessage.create)
    ..aOM<$1.AddPeerRequestMessage>(
        1018, _omitFieldNames ? '' : 'addPeerRequest',
        protoName: 'addPeerRequest',
        subBuilder: $1.AddPeerRequestMessage.create)
    ..aOM<$1.SubmitTransactionRequestMessage>(
        1020, _omitFieldNames ? '' : 'submitTransactionRequest',
        protoName: 'submitTransactionRequest',
        subBuilder: $1.SubmitTransactionRequestMessage.create)
    ..aOM<$1.NotifyVirtualChainChangedRequestMessage>(
        1022, _omitFieldNames ? '' : 'notifyVirtualChainChangedRequest',
        protoName: 'notifyVirtualChainChangedRequest',
        subBuilder: $1.NotifyVirtualChainChangedRequestMessage.create)
    ..aOM<$1.GetBlockRequestMessage>(
        1025, _omitFieldNames ? '' : 'getBlockRequest',
        protoName: 'getBlockRequest',
        subBuilder: $1.GetBlockRequestMessage.create)
    ..aOM<$1.GetSubnetworkRequestMessage>(
        1027, _omitFieldNames ? '' : 'getSubnetworkRequest',
        protoName: 'getSubnetworkRequest',
        subBuilder: $1.GetSubnetworkRequestMessage.create)
    ..aOM<$1.GetVirtualChainFromBlockRequestMessage>(
        1029, _omitFieldNames ? '' : 'getVirtualChainFromBlockRequest',
        protoName: 'getVirtualChainFromBlockRequest',
        subBuilder: $1.GetVirtualChainFromBlockRequestMessage.create)
    ..aOM<$1.GetBlocksRequestMessage>(
        1031, _omitFieldNames ? '' : 'getBlocksRequest',
        protoName: 'getBlocksRequest',
        subBuilder: $1.GetBlocksRequestMessage.create)
    ..aOM<$1.GetBlockCountRequestMessage>(
        1033, _omitFieldNames ? '' : 'getBlockCountRequest',
        protoName: 'getBlockCountRequest',
        subBuilder: $1.GetBlockCountRequestMessage.create)
    ..aOM<$1.GetBlockDagInfoRequestMessage>(
        1035, _omitFieldNames ? '' : 'getBlockDagInfoRequest',
        protoName: 'getBlockDagInfoRequest',
        subBuilder: $1.GetBlockDagInfoRequestMessage.create)
    ..aOM<$1.ResolveFinalityConflictRequestMessage>(
        1037, _omitFieldNames ? '' : 'resolveFinalityConflictRequest',
        protoName: 'resolveFinalityConflictRequest',
        subBuilder: $1.ResolveFinalityConflictRequestMessage.create)
    ..aOM<$1.NotifyFinalityConflictRequestMessage>(
        1039, _omitFieldNames ? '' : 'notifyFinalityConflictRequest',
        protoName: 'notifyFinalityConflictRequest',
        subBuilder: $1.NotifyFinalityConflictRequestMessage.create)
    ..aOM<$1.GetMempoolEntriesRequestMessage>(
        1043, _omitFieldNames ? '' : 'getMempoolEntriesRequest',
        protoName: 'getMempoolEntriesRequest',
        subBuilder: $1.GetMempoolEntriesRequestMessage.create)
    ..aOM<$1.ShutdownRequestMessage>(
        1045, _omitFieldNames ? '' : 'shutdownRequest',
        protoName: 'shutdownRequest',
        subBuilder: $1.ShutdownRequestMessage.create)
    ..aOM<$1.GetHeadersRequestMessage>(
        1047, _omitFieldNames ? '' : 'getHeadersRequest',
        protoName: 'getHeadersRequest',
        subBuilder: $1.GetHeadersRequestMessage.create)
    ..aOM<$1.NotifyUtxosChangedRequestMessage>(
        1049, _omitFieldNames ? '' : 'notifyUtxosChangedRequest',
        protoName: 'notifyUtxosChangedRequest',
        subBuilder: $1.NotifyUtxosChangedRequestMessage.create)
    ..aOM<$1.GetUtxosByAddressesRequestMessage>(
        1052, _omitFieldNames ? '' : 'getUtxosByAddressesRequest',
        protoName: 'getUtxosByAddressesRequest',
        subBuilder: $1.GetUtxosByAddressesRequestMessage.create)
    ..aOM<$1.GetSinkBlueScoreRequestMessage>(
        1054, _omitFieldNames ? '' : 'getSinkBlueScoreRequest',
        protoName: 'getSinkBlueScoreRequest',
        subBuilder: $1.GetSinkBlueScoreRequestMessage.create)
    ..aOM<$1.NotifySinkBlueScoreChangedRequestMessage>(
        1056, _omitFieldNames ? '' : 'notifySinkBlueScoreChangedRequest',
        protoName: 'notifySinkBlueScoreChangedRequest',
        subBuilder: $1.NotifySinkBlueScoreChangedRequestMessage.create)
    ..aOM<$1.BanRequestMessage>(1059, _omitFieldNames ? '' : 'banRequest',
        protoName: 'banRequest', subBuilder: $1.BanRequestMessage.create)
    ..aOM<$1.UnbanRequestMessage>(1061, _omitFieldNames ? '' : 'unbanRequest',
        protoName: 'unbanRequest', subBuilder: $1.UnbanRequestMessage.create)
    ..aOM<$1.GetInfoRequestMessage>(
        1063, _omitFieldNames ? '' : 'getInfoRequest',
        protoName: 'getInfoRequest',
        subBuilder: $1.GetInfoRequestMessage.create)
    ..aOM<$1.StopNotifyingUtxosChangedRequestMessage>(
        1065, _omitFieldNames ? '' : 'stopNotifyingUtxosChangedRequest',
        protoName: 'stopNotifyingUtxosChangedRequest',
        subBuilder: $1.StopNotifyingUtxosChangedRequestMessage.create)
    ..aOM<$1.NotifyPruningPointUtxoSetOverrideRequestMessage>(
        1067, _omitFieldNames ? '' : 'notifyPruningPointUtxoSetOverrideRequest',
        protoName: 'notifyPruningPointUtxoSetOverrideRequest',
        subBuilder: $1.NotifyPruningPointUtxoSetOverrideRequestMessage.create)
    ..aOM<$1.StopNotifyingPruningPointUtxoSetOverrideRequestMessage>(
        1070,
        _omitFieldNames
            ? ''
            : 'stopNotifyingPruningPointUtxoSetOverrideRequest',
        protoName: 'stopNotifyingPruningPointUtxoSetOverrideRequest',
        subBuilder:
            $1.StopNotifyingPruningPointUtxoSetOverrideRequestMessage.create)
    ..aOM<$1.EstimateNetworkHashesPerSecondRequestMessage>(
        1072, _omitFieldNames ? '' : 'estimateNetworkHashesPerSecondRequest',
        protoName: 'estimateNetworkHashesPerSecondRequest',
        subBuilder: $1.EstimateNetworkHashesPerSecondRequestMessage.create)
    ..aOM<$1.NotifyVirtualDaaScoreChangedRequestMessage>(
        1074, _omitFieldNames ? '' : 'notifyVirtualDaaScoreChangedRequest',
        protoName: 'notifyVirtualDaaScoreChangedRequest',
        subBuilder: $1.NotifyVirtualDaaScoreChangedRequestMessage.create)
    ..aOM<$1.GetBalanceByAddressRequestMessage>(
        1077, _omitFieldNames ? '' : 'getBalanceByAddressRequest',
        protoName: 'getBalanceByAddressRequest',
        subBuilder: $1.GetBalanceByAddressRequestMessage.create)
    ..aOM<$1.GetBalancesByAddressesRequestMessage>(
        1079, _omitFieldNames ? '' : 'getBalancesByAddressesRequest',
        protoName: 'getBalancesByAddressesRequest',
        subBuilder: $1.GetBalancesByAddressesRequestMessage.create)
    ..aOM<$1.NotifyNewBlockTemplateRequestMessage>(
        1081, _omitFieldNames ? '' : 'notifyNewBlockTemplateRequest',
        protoName: 'notifyNewBlockTemplateRequest',
        subBuilder: $1.NotifyNewBlockTemplateRequestMessage.create)
    ..aOM<$1.GetMempoolEntriesByAddressesRequestMessage>(
        1084, _omitFieldNames ? '' : 'getMempoolEntriesByAddressesRequest',
        protoName: 'getMempoolEntriesByAddressesRequest',
        subBuilder: $1.GetMempoolEntriesByAddressesRequestMessage.create)
    ..aOM<$1.GetCoinSupplyRequestMessage>(
        1086, _omitFieldNames ? '' : 'getCoinSupplyRequest',
        protoName: 'getCoinSupplyRequest',
        subBuilder: $1.GetCoinSupplyRequestMessage.create)
    ..aOM<$1.PingRequestMessage>(1088, _omitFieldNames ? '' : 'pingRequest',
        protoName: 'pingRequest', subBuilder: $1.PingRequestMessage.create)
    ..aOM<$1.GetMetricsRequestMessage>(
        1090, _omitFieldNames ? '' : 'getMetricsRequest',
        protoName: 'getMetricsRequest',
        subBuilder: $1.GetMetricsRequestMessage.create)
    ..aOM<$1.GetServerInfoRequestMessage>(
        1092, _omitFieldNames ? '' : 'getServerInfoRequest',
        protoName: 'getServerInfoRequest',
        subBuilder: $1.GetServerInfoRequestMessage.create)
    ..aOM<$1.GetSyncStatusRequestMessage>(
        1094, _omitFieldNames ? '' : 'getSyncStatusRequest',
        protoName: 'getSyncStatusRequest',
        subBuilder: $1.GetSyncStatusRequestMessage.create)
    ..aOM<$1.GetDaaScoreTimestampEstimateRequestMessage>(
        1096, _omitFieldNames ? '' : 'getDaaScoreTimestampEstimateRequest',
        protoName: 'getDaaScoreTimestampEstimateRequest',
        subBuilder: $1.GetDaaScoreTimestampEstimateRequestMessage.create)
    ..aOM<$1.SubmitTransactionReplacementRequestMessage>(
        1100, _omitFieldNames ? '' : 'submitTransactionReplacementRequest',
        protoName: 'submitTransactionReplacementRequest',
        subBuilder: $1.SubmitTransactionReplacementRequestMessage.create)
    ..aOM<$1.GetConnectionsRequestMessage>(
        1102, _omitFieldNames ? '' : 'getConnectionsRequest',
        protoName: 'getConnectionsRequest',
        subBuilder: $1.GetConnectionsRequestMessage.create)
    ..aOM<$1.GetSystemInfoRequestMessage>(
        1104, _omitFieldNames ? '' : 'getSystemInfoRequest',
        protoName: 'getSystemInfoRequest',
        subBuilder: $1.GetSystemInfoRequestMessage.create)
    ..aOM<$1.GetFeeEstimateRequestMessage>(
        1106, _omitFieldNames ? '' : 'getFeeEstimateRequest',
        protoName: 'getFeeEstimateRequest',
        subBuilder: $1.GetFeeEstimateRequestMessage.create)
    ..aOM<$1.GetFeeEstimateExperimentalRequestMessage>(
        1108, _omitFieldNames ? '' : 'getFeeEstimateExperimentalRequest',
        protoName: 'getFeeEstimateExperimentalRequest',
        subBuilder: $1.GetFeeEstimateExperimentalRequestMessage.create)
    ..aOM<$1.GetCurrentBlockColorRequestMessage>(
        1110, _omitFieldNames ? '' : 'getCurrentBlockColorRequest',
        protoName: 'getCurrentBlockColorRequest',
        subBuilder: $1.GetCurrentBlockColorRequestMessage.create)
    ..aOM<$1.GetUtxoReturnAddressRequestMessage>(
        1112, _omitFieldNames ? '' : 'getUtxoReturnAddressRequest',
        protoName: 'getUtxoReturnAddressRequest',
        subBuilder: $1.GetUtxoReturnAddressRequestMessage.create)
    ..aOM<$1.GetVirtualChainFromBlockV2RequestMessage>(
        1114, _omitFieldNames ? '' : 'getVirtualChainFromBlockV2Request',
        protoName: 'getVirtualChainFromBlockV2Request',
        subBuilder: $1.GetVirtualChainFromBlockV2RequestMessage.create)
    ..aOM<$1.GetBlockRewardInfoRequestMessage>(
        1116, _omitFieldNames ? '' : 'getBlockRewardInfoRequest',
        protoName: 'getBlockRewardInfoRequest',
        subBuilder: $1.GetBlockRewardInfoRequestMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KaspadRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KaspadRequest copyWith(void Function(KaspadRequest) updates) =>
      super.copyWith((message) => updates(message as KaspadRequest))
          as KaspadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KaspadRequest create() => KaspadRequest._();
  @$core.override
  KaspadRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KaspadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaspadRequest>(create);
  static KaspadRequest? _defaultInstance;

  @$pb.TagNumber(1001)
  @$pb.TagNumber(1003)
  @$pb.TagNumber(1005)
  @$pb.TagNumber(1007)
  @$pb.TagNumber(1010)
  @$pb.TagNumber(1012)
  @$pb.TagNumber(1014)
  @$pb.TagNumber(1016)
  @$pb.TagNumber(1018)
  @$pb.TagNumber(1020)
  @$pb.TagNumber(1022)
  @$pb.TagNumber(1025)
  @$pb.TagNumber(1027)
  @$pb.TagNumber(1029)
  @$pb.TagNumber(1031)
  @$pb.TagNumber(1033)
  @$pb.TagNumber(1035)
  @$pb.TagNumber(1037)
  @$pb.TagNumber(1039)
  @$pb.TagNumber(1043)
  @$pb.TagNumber(1045)
  @$pb.TagNumber(1047)
  @$pb.TagNumber(1049)
  @$pb.TagNumber(1052)
  @$pb.TagNumber(1054)
  @$pb.TagNumber(1056)
  @$pb.TagNumber(1059)
  @$pb.TagNumber(1061)
  @$pb.TagNumber(1063)
  @$pb.TagNumber(1065)
  @$pb.TagNumber(1067)
  @$pb.TagNumber(1070)
  @$pb.TagNumber(1072)
  @$pb.TagNumber(1074)
  @$pb.TagNumber(1077)
  @$pb.TagNumber(1079)
  @$pb.TagNumber(1081)
  @$pb.TagNumber(1084)
  @$pb.TagNumber(1086)
  @$pb.TagNumber(1088)
  @$pb.TagNumber(1090)
  @$pb.TagNumber(1092)
  @$pb.TagNumber(1094)
  @$pb.TagNumber(1096)
  @$pb.TagNumber(1100)
  @$pb.TagNumber(1102)
  @$pb.TagNumber(1104)
  @$pb.TagNumber(1106)
  @$pb.TagNumber(1108)
  @$pb.TagNumber(1110)
  @$pb.TagNumber(1112)
  @$pb.TagNumber(1114)
  @$pb.TagNumber(1116)
  KaspadRequest_Payload whichPayload() =>
      _KaspadRequest_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1001)
  @$pb.TagNumber(1003)
  @$pb.TagNumber(1005)
  @$pb.TagNumber(1007)
  @$pb.TagNumber(1010)
  @$pb.TagNumber(1012)
  @$pb.TagNumber(1014)
  @$pb.TagNumber(1016)
  @$pb.TagNumber(1018)
  @$pb.TagNumber(1020)
  @$pb.TagNumber(1022)
  @$pb.TagNumber(1025)
  @$pb.TagNumber(1027)
  @$pb.TagNumber(1029)
  @$pb.TagNumber(1031)
  @$pb.TagNumber(1033)
  @$pb.TagNumber(1035)
  @$pb.TagNumber(1037)
  @$pb.TagNumber(1039)
  @$pb.TagNumber(1043)
  @$pb.TagNumber(1045)
  @$pb.TagNumber(1047)
  @$pb.TagNumber(1049)
  @$pb.TagNumber(1052)
  @$pb.TagNumber(1054)
  @$pb.TagNumber(1056)
  @$pb.TagNumber(1059)
  @$pb.TagNumber(1061)
  @$pb.TagNumber(1063)
  @$pb.TagNumber(1065)
  @$pb.TagNumber(1067)
  @$pb.TagNumber(1070)
  @$pb.TagNumber(1072)
  @$pb.TagNumber(1074)
  @$pb.TagNumber(1077)
  @$pb.TagNumber(1079)
  @$pb.TagNumber(1081)
  @$pb.TagNumber(1084)
  @$pb.TagNumber(1086)
  @$pb.TagNumber(1088)
  @$pb.TagNumber(1090)
  @$pb.TagNumber(1092)
  @$pb.TagNumber(1094)
  @$pb.TagNumber(1096)
  @$pb.TagNumber(1100)
  @$pb.TagNumber(1102)
  @$pb.TagNumber(1104)
  @$pb.TagNumber(1106)
  @$pb.TagNumber(1108)
  @$pb.TagNumber(1110)
  @$pb.TagNumber(1112)
  @$pb.TagNumber(1114)
  @$pb.TagNumber(1116)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(101)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(101)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(101)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(101)
  void clearId() => $_clearField(101);

  @$pb.TagNumber(1001)
  $1.GetCurrentNetworkRequestMessage get getCurrentNetworkRequest => $_getN(1);
  @$pb.TagNumber(1001)
  set getCurrentNetworkRequest($1.GetCurrentNetworkRequestMessage value) =>
      $_setField(1001, value);
  @$pb.TagNumber(1001)
  $core.bool hasGetCurrentNetworkRequest() => $_has(1);
  @$pb.TagNumber(1001)
  void clearGetCurrentNetworkRequest() => $_clearField(1001);
  @$pb.TagNumber(1001)
  $1.GetCurrentNetworkRequestMessage ensureGetCurrentNetworkRequest() =>
      $_ensure(1);

  @$pb.TagNumber(1003)
  $1.SubmitBlockRequestMessage get submitBlockRequest => $_getN(2);
  @$pb.TagNumber(1003)
  set submitBlockRequest($1.SubmitBlockRequestMessage value) =>
      $_setField(1003, value);
  @$pb.TagNumber(1003)
  $core.bool hasSubmitBlockRequest() => $_has(2);
  @$pb.TagNumber(1003)
  void clearSubmitBlockRequest() => $_clearField(1003);
  @$pb.TagNumber(1003)
  $1.SubmitBlockRequestMessage ensureSubmitBlockRequest() => $_ensure(2);

  @$pb.TagNumber(1005)
  $1.GetBlockTemplateRequestMessage get getBlockTemplateRequest => $_getN(3);
  @$pb.TagNumber(1005)
  set getBlockTemplateRequest($1.GetBlockTemplateRequestMessage value) =>
      $_setField(1005, value);
  @$pb.TagNumber(1005)
  $core.bool hasGetBlockTemplateRequest() => $_has(3);
  @$pb.TagNumber(1005)
  void clearGetBlockTemplateRequest() => $_clearField(1005);
  @$pb.TagNumber(1005)
  $1.GetBlockTemplateRequestMessage ensureGetBlockTemplateRequest() =>
      $_ensure(3);

  @$pb.TagNumber(1007)
  $1.NotifyBlockAddedRequestMessage get notifyBlockAddedRequest => $_getN(4);
  @$pb.TagNumber(1007)
  set notifyBlockAddedRequest($1.NotifyBlockAddedRequestMessage value) =>
      $_setField(1007, value);
  @$pb.TagNumber(1007)
  $core.bool hasNotifyBlockAddedRequest() => $_has(4);
  @$pb.TagNumber(1007)
  void clearNotifyBlockAddedRequest() => $_clearField(1007);
  @$pb.TagNumber(1007)
  $1.NotifyBlockAddedRequestMessage ensureNotifyBlockAddedRequest() =>
      $_ensure(4);

  /// BlockAddedNotificationMessage blockAddedNotification = 1009;
  @$pb.TagNumber(1010)
  $1.GetPeerAddressesRequestMessage get getPeerAddressesRequest => $_getN(5);
  @$pb.TagNumber(1010)
  set getPeerAddressesRequest($1.GetPeerAddressesRequestMessage value) =>
      $_setField(1010, value);
  @$pb.TagNumber(1010)
  $core.bool hasGetPeerAddressesRequest() => $_has(5);
  @$pb.TagNumber(1010)
  void clearGetPeerAddressesRequest() => $_clearField(1010);
  @$pb.TagNumber(1010)
  $1.GetPeerAddressesRequestMessage ensureGetPeerAddressesRequest() =>
      $_ensure(5);

  @$pb.TagNumber(1012)
  $1.GetSinkRequestMessage get getSinkRequest => $_getN(6);
  @$pb.TagNumber(1012)
  set getSinkRequest($1.GetSinkRequestMessage value) => $_setField(1012, value);
  @$pb.TagNumber(1012)
  $core.bool hasGetSinkRequest() => $_has(6);
  @$pb.TagNumber(1012)
  void clearGetSinkRequest() => $_clearField(1012);
  @$pb.TagNumber(1012)
  $1.GetSinkRequestMessage ensureGetSinkRequest() => $_ensure(6);

  @$pb.TagNumber(1014)
  $1.GetMempoolEntryRequestMessage get getMempoolEntryRequest => $_getN(7);
  @$pb.TagNumber(1014)
  set getMempoolEntryRequest($1.GetMempoolEntryRequestMessage value) =>
      $_setField(1014, value);
  @$pb.TagNumber(1014)
  $core.bool hasGetMempoolEntryRequest() => $_has(7);
  @$pb.TagNumber(1014)
  void clearGetMempoolEntryRequest() => $_clearField(1014);
  @$pb.TagNumber(1014)
  $1.GetMempoolEntryRequestMessage ensureGetMempoolEntryRequest() =>
      $_ensure(7);

  @$pb.TagNumber(1016)
  $1.GetConnectedPeerInfoRequestMessage get getConnectedPeerInfoRequest =>
      $_getN(8);
  @$pb.TagNumber(1016)
  set getConnectedPeerInfoRequest(
          $1.GetConnectedPeerInfoRequestMessage value) =>
      $_setField(1016, value);
  @$pb.TagNumber(1016)
  $core.bool hasGetConnectedPeerInfoRequest() => $_has(8);
  @$pb.TagNumber(1016)
  void clearGetConnectedPeerInfoRequest() => $_clearField(1016);
  @$pb.TagNumber(1016)
  $1.GetConnectedPeerInfoRequestMessage ensureGetConnectedPeerInfoRequest() =>
      $_ensure(8);

  @$pb.TagNumber(1018)
  $1.AddPeerRequestMessage get addPeerRequest => $_getN(9);
  @$pb.TagNumber(1018)
  set addPeerRequest($1.AddPeerRequestMessage value) => $_setField(1018, value);
  @$pb.TagNumber(1018)
  $core.bool hasAddPeerRequest() => $_has(9);
  @$pb.TagNumber(1018)
  void clearAddPeerRequest() => $_clearField(1018);
  @$pb.TagNumber(1018)
  $1.AddPeerRequestMessage ensureAddPeerRequest() => $_ensure(9);

  @$pb.TagNumber(1020)
  $1.SubmitTransactionRequestMessage get submitTransactionRequest => $_getN(10);
  @$pb.TagNumber(1020)
  set submitTransactionRequest($1.SubmitTransactionRequestMessage value) =>
      $_setField(1020, value);
  @$pb.TagNumber(1020)
  $core.bool hasSubmitTransactionRequest() => $_has(10);
  @$pb.TagNumber(1020)
  void clearSubmitTransactionRequest() => $_clearField(1020);
  @$pb.TagNumber(1020)
  $1.SubmitTransactionRequestMessage ensureSubmitTransactionRequest() =>
      $_ensure(10);

  @$pb.TagNumber(1022)
  $1.NotifyVirtualChainChangedRequestMessage
      get notifyVirtualChainChangedRequest => $_getN(11);
  @$pb.TagNumber(1022)
  set notifyVirtualChainChangedRequest(
          $1.NotifyVirtualChainChangedRequestMessage value) =>
      $_setField(1022, value);
  @$pb.TagNumber(1022)
  $core.bool hasNotifyVirtualChainChangedRequest() => $_has(11);
  @$pb.TagNumber(1022)
  void clearNotifyVirtualChainChangedRequest() => $_clearField(1022);
  @$pb.TagNumber(1022)
  $1.NotifyVirtualChainChangedRequestMessage
      ensureNotifyVirtualChainChangedRequest() => $_ensure(11);

  /// VirtualChainChangedNotificationMessage virtualChainChangedNotification = 1024;
  @$pb.TagNumber(1025)
  $1.GetBlockRequestMessage get getBlockRequest => $_getN(12);
  @$pb.TagNumber(1025)
  set getBlockRequest($1.GetBlockRequestMessage value) =>
      $_setField(1025, value);
  @$pb.TagNumber(1025)
  $core.bool hasGetBlockRequest() => $_has(12);
  @$pb.TagNumber(1025)
  void clearGetBlockRequest() => $_clearField(1025);
  @$pb.TagNumber(1025)
  $1.GetBlockRequestMessage ensureGetBlockRequest() => $_ensure(12);

  @$pb.TagNumber(1027)
  $1.GetSubnetworkRequestMessage get getSubnetworkRequest => $_getN(13);
  @$pb.TagNumber(1027)
  set getSubnetworkRequest($1.GetSubnetworkRequestMessage value) =>
      $_setField(1027, value);
  @$pb.TagNumber(1027)
  $core.bool hasGetSubnetworkRequest() => $_has(13);
  @$pb.TagNumber(1027)
  void clearGetSubnetworkRequest() => $_clearField(1027);
  @$pb.TagNumber(1027)
  $1.GetSubnetworkRequestMessage ensureGetSubnetworkRequest() => $_ensure(13);

  @$pb.TagNumber(1029)
  $1.GetVirtualChainFromBlockRequestMessage
      get getVirtualChainFromBlockRequest => $_getN(14);
  @$pb.TagNumber(1029)
  set getVirtualChainFromBlockRequest(
          $1.GetVirtualChainFromBlockRequestMessage value) =>
      $_setField(1029, value);
  @$pb.TagNumber(1029)
  $core.bool hasGetVirtualChainFromBlockRequest() => $_has(14);
  @$pb.TagNumber(1029)
  void clearGetVirtualChainFromBlockRequest() => $_clearField(1029);
  @$pb.TagNumber(1029)
  $1.GetVirtualChainFromBlockRequestMessage
      ensureGetVirtualChainFromBlockRequest() => $_ensure(14);

  @$pb.TagNumber(1031)
  $1.GetBlocksRequestMessage get getBlocksRequest => $_getN(15);
  @$pb.TagNumber(1031)
  set getBlocksRequest($1.GetBlocksRequestMessage value) =>
      $_setField(1031, value);
  @$pb.TagNumber(1031)
  $core.bool hasGetBlocksRequest() => $_has(15);
  @$pb.TagNumber(1031)
  void clearGetBlocksRequest() => $_clearField(1031);
  @$pb.TagNumber(1031)
  $1.GetBlocksRequestMessage ensureGetBlocksRequest() => $_ensure(15);

  @$pb.TagNumber(1033)
  $1.GetBlockCountRequestMessage get getBlockCountRequest => $_getN(16);
  @$pb.TagNumber(1033)
  set getBlockCountRequest($1.GetBlockCountRequestMessage value) =>
      $_setField(1033, value);
  @$pb.TagNumber(1033)
  $core.bool hasGetBlockCountRequest() => $_has(16);
  @$pb.TagNumber(1033)
  void clearGetBlockCountRequest() => $_clearField(1033);
  @$pb.TagNumber(1033)
  $1.GetBlockCountRequestMessage ensureGetBlockCountRequest() => $_ensure(16);

  @$pb.TagNumber(1035)
  $1.GetBlockDagInfoRequestMessage get getBlockDagInfoRequest => $_getN(17);
  @$pb.TagNumber(1035)
  set getBlockDagInfoRequest($1.GetBlockDagInfoRequestMessage value) =>
      $_setField(1035, value);
  @$pb.TagNumber(1035)
  $core.bool hasGetBlockDagInfoRequest() => $_has(17);
  @$pb.TagNumber(1035)
  void clearGetBlockDagInfoRequest() => $_clearField(1035);
  @$pb.TagNumber(1035)
  $1.GetBlockDagInfoRequestMessage ensureGetBlockDagInfoRequest() =>
      $_ensure(17);

  @$pb.TagNumber(1037)
  $1.ResolveFinalityConflictRequestMessage get resolveFinalityConflictRequest =>
      $_getN(18);
  @$pb.TagNumber(1037)
  set resolveFinalityConflictRequest(
          $1.ResolveFinalityConflictRequestMessage value) =>
      $_setField(1037, value);
  @$pb.TagNumber(1037)
  $core.bool hasResolveFinalityConflictRequest() => $_has(18);
  @$pb.TagNumber(1037)
  void clearResolveFinalityConflictRequest() => $_clearField(1037);
  @$pb.TagNumber(1037)
  $1.ResolveFinalityConflictRequestMessage
      ensureResolveFinalityConflictRequest() => $_ensure(18);

  @$pb.TagNumber(1039)
  $1.NotifyFinalityConflictRequestMessage get notifyFinalityConflictRequest =>
      $_getN(19);
  @$pb.TagNumber(1039)
  set notifyFinalityConflictRequest(
          $1.NotifyFinalityConflictRequestMessage value) =>
      $_setField(1039, value);
  @$pb.TagNumber(1039)
  $core.bool hasNotifyFinalityConflictRequest() => $_has(19);
  @$pb.TagNumber(1039)
  void clearNotifyFinalityConflictRequest() => $_clearField(1039);
  @$pb.TagNumber(1039)
  $1.NotifyFinalityConflictRequestMessage
      ensureNotifyFinalityConflictRequest() => $_ensure(19);

  /// FinalityConflictNotificationMessage finalityConflictNotification = 1041;
  /// FinalityConflictResolvedNotificationMessage finalityConflictResolvedNotification = 1042;
  @$pb.TagNumber(1043)
  $1.GetMempoolEntriesRequestMessage get getMempoolEntriesRequest => $_getN(20);
  @$pb.TagNumber(1043)
  set getMempoolEntriesRequest($1.GetMempoolEntriesRequestMessage value) =>
      $_setField(1043, value);
  @$pb.TagNumber(1043)
  $core.bool hasGetMempoolEntriesRequest() => $_has(20);
  @$pb.TagNumber(1043)
  void clearGetMempoolEntriesRequest() => $_clearField(1043);
  @$pb.TagNumber(1043)
  $1.GetMempoolEntriesRequestMessage ensureGetMempoolEntriesRequest() =>
      $_ensure(20);

  @$pb.TagNumber(1045)
  $1.ShutdownRequestMessage get shutdownRequest => $_getN(21);
  @$pb.TagNumber(1045)
  set shutdownRequest($1.ShutdownRequestMessage value) =>
      $_setField(1045, value);
  @$pb.TagNumber(1045)
  $core.bool hasShutdownRequest() => $_has(21);
  @$pb.TagNumber(1045)
  void clearShutdownRequest() => $_clearField(1045);
  @$pb.TagNumber(1045)
  $1.ShutdownRequestMessage ensureShutdownRequest() => $_ensure(21);

  @$pb.TagNumber(1047)
  $1.GetHeadersRequestMessage get getHeadersRequest => $_getN(22);
  @$pb.TagNumber(1047)
  set getHeadersRequest($1.GetHeadersRequestMessage value) =>
      $_setField(1047, value);
  @$pb.TagNumber(1047)
  $core.bool hasGetHeadersRequest() => $_has(22);
  @$pb.TagNumber(1047)
  void clearGetHeadersRequest() => $_clearField(1047);
  @$pb.TagNumber(1047)
  $1.GetHeadersRequestMessage ensureGetHeadersRequest() => $_ensure(22);

  @$pb.TagNumber(1049)
  $1.NotifyUtxosChangedRequestMessage get notifyUtxosChangedRequest =>
      $_getN(23);
  @$pb.TagNumber(1049)
  set notifyUtxosChangedRequest($1.NotifyUtxosChangedRequestMessage value) =>
      $_setField(1049, value);
  @$pb.TagNumber(1049)
  $core.bool hasNotifyUtxosChangedRequest() => $_has(23);
  @$pb.TagNumber(1049)
  void clearNotifyUtxosChangedRequest() => $_clearField(1049);
  @$pb.TagNumber(1049)
  $1.NotifyUtxosChangedRequestMessage ensureNotifyUtxosChangedRequest() =>
      $_ensure(23);

  /// UtxosChangedNotificationMessage utxosChangedNotification = 1051;
  @$pb.TagNumber(1052)
  $1.GetUtxosByAddressesRequestMessage get getUtxosByAddressesRequest =>
      $_getN(24);
  @$pb.TagNumber(1052)
  set getUtxosByAddressesRequest($1.GetUtxosByAddressesRequestMessage value) =>
      $_setField(1052, value);
  @$pb.TagNumber(1052)
  $core.bool hasGetUtxosByAddressesRequest() => $_has(24);
  @$pb.TagNumber(1052)
  void clearGetUtxosByAddressesRequest() => $_clearField(1052);
  @$pb.TagNumber(1052)
  $1.GetUtxosByAddressesRequestMessage ensureGetUtxosByAddressesRequest() =>
      $_ensure(24);

  @$pb.TagNumber(1054)
  $1.GetSinkBlueScoreRequestMessage get getSinkBlueScoreRequest => $_getN(25);
  @$pb.TagNumber(1054)
  set getSinkBlueScoreRequest($1.GetSinkBlueScoreRequestMessage value) =>
      $_setField(1054, value);
  @$pb.TagNumber(1054)
  $core.bool hasGetSinkBlueScoreRequest() => $_has(25);
  @$pb.TagNumber(1054)
  void clearGetSinkBlueScoreRequest() => $_clearField(1054);
  @$pb.TagNumber(1054)
  $1.GetSinkBlueScoreRequestMessage ensureGetSinkBlueScoreRequest() =>
      $_ensure(25);

  @$pb.TagNumber(1056)
  $1.NotifySinkBlueScoreChangedRequestMessage
      get notifySinkBlueScoreChangedRequest => $_getN(26);
  @$pb.TagNumber(1056)
  set notifySinkBlueScoreChangedRequest(
          $1.NotifySinkBlueScoreChangedRequestMessage value) =>
      $_setField(1056, value);
  @$pb.TagNumber(1056)
  $core.bool hasNotifySinkBlueScoreChangedRequest() => $_has(26);
  @$pb.TagNumber(1056)
  void clearNotifySinkBlueScoreChangedRequest() => $_clearField(1056);
  @$pb.TagNumber(1056)
  $1.NotifySinkBlueScoreChangedRequestMessage
      ensureNotifySinkBlueScoreChangedRequest() => $_ensure(26);

  /// SinkBlueScoreChangedNotificationMessage sinkBlueScoreChangedNotification = 1058;
  @$pb.TagNumber(1059)
  $1.BanRequestMessage get banRequest => $_getN(27);
  @$pb.TagNumber(1059)
  set banRequest($1.BanRequestMessage value) => $_setField(1059, value);
  @$pb.TagNumber(1059)
  $core.bool hasBanRequest() => $_has(27);
  @$pb.TagNumber(1059)
  void clearBanRequest() => $_clearField(1059);
  @$pb.TagNumber(1059)
  $1.BanRequestMessage ensureBanRequest() => $_ensure(27);

  @$pb.TagNumber(1061)
  $1.UnbanRequestMessage get unbanRequest => $_getN(28);
  @$pb.TagNumber(1061)
  set unbanRequest($1.UnbanRequestMessage value) => $_setField(1061, value);
  @$pb.TagNumber(1061)
  $core.bool hasUnbanRequest() => $_has(28);
  @$pb.TagNumber(1061)
  void clearUnbanRequest() => $_clearField(1061);
  @$pb.TagNumber(1061)
  $1.UnbanRequestMessage ensureUnbanRequest() => $_ensure(28);

  @$pb.TagNumber(1063)
  $1.GetInfoRequestMessage get getInfoRequest => $_getN(29);
  @$pb.TagNumber(1063)
  set getInfoRequest($1.GetInfoRequestMessage value) => $_setField(1063, value);
  @$pb.TagNumber(1063)
  $core.bool hasGetInfoRequest() => $_has(29);
  @$pb.TagNumber(1063)
  void clearGetInfoRequest() => $_clearField(1063);
  @$pb.TagNumber(1063)
  $1.GetInfoRequestMessage ensureGetInfoRequest() => $_ensure(29);

  @$pb.TagNumber(1065)
  $1.StopNotifyingUtxosChangedRequestMessage
      get stopNotifyingUtxosChangedRequest => $_getN(30);
  @$pb.TagNumber(1065)
  set stopNotifyingUtxosChangedRequest(
          $1.StopNotifyingUtxosChangedRequestMessage value) =>
      $_setField(1065, value);
  @$pb.TagNumber(1065)
  $core.bool hasStopNotifyingUtxosChangedRequest() => $_has(30);
  @$pb.TagNumber(1065)
  void clearStopNotifyingUtxosChangedRequest() => $_clearField(1065);
  @$pb.TagNumber(1065)
  $1.StopNotifyingUtxosChangedRequestMessage
      ensureStopNotifyingUtxosChangedRequest() => $_ensure(30);

  @$pb.TagNumber(1067)
  $1.NotifyPruningPointUtxoSetOverrideRequestMessage
      get notifyPruningPointUtxoSetOverrideRequest => $_getN(31);
  @$pb.TagNumber(1067)
  set notifyPruningPointUtxoSetOverrideRequest(
          $1.NotifyPruningPointUtxoSetOverrideRequestMessage value) =>
      $_setField(1067, value);
  @$pb.TagNumber(1067)
  $core.bool hasNotifyPruningPointUtxoSetOverrideRequest() => $_has(31);
  @$pb.TagNumber(1067)
  void clearNotifyPruningPointUtxoSetOverrideRequest() => $_clearField(1067);
  @$pb.TagNumber(1067)
  $1.NotifyPruningPointUtxoSetOverrideRequestMessage
      ensureNotifyPruningPointUtxoSetOverrideRequest() => $_ensure(31);

  /// PruningPointUtxoSetOverrideNotificationMessage pruningPointUtxoSetOverrideNotification = 1069;
  @$pb.TagNumber(1070)
  $1.StopNotifyingPruningPointUtxoSetOverrideRequestMessage
      get stopNotifyingPruningPointUtxoSetOverrideRequest => $_getN(32);
  @$pb.TagNumber(1070)
  set stopNotifyingPruningPointUtxoSetOverrideRequest(
          $1.StopNotifyingPruningPointUtxoSetOverrideRequestMessage value) =>
      $_setField(1070, value);
  @$pb.TagNumber(1070)
  $core.bool hasStopNotifyingPruningPointUtxoSetOverrideRequest() => $_has(32);
  @$pb.TagNumber(1070)
  void clearStopNotifyingPruningPointUtxoSetOverrideRequest() =>
      $_clearField(1070);
  @$pb.TagNumber(1070)
  $1.StopNotifyingPruningPointUtxoSetOverrideRequestMessage
      ensureStopNotifyingPruningPointUtxoSetOverrideRequest() => $_ensure(32);

  @$pb.TagNumber(1072)
  $1.EstimateNetworkHashesPerSecondRequestMessage
      get estimateNetworkHashesPerSecondRequest => $_getN(33);
  @$pb.TagNumber(1072)
  set estimateNetworkHashesPerSecondRequest(
          $1.EstimateNetworkHashesPerSecondRequestMessage value) =>
      $_setField(1072, value);
  @$pb.TagNumber(1072)
  $core.bool hasEstimateNetworkHashesPerSecondRequest() => $_has(33);
  @$pb.TagNumber(1072)
  void clearEstimateNetworkHashesPerSecondRequest() => $_clearField(1072);
  @$pb.TagNumber(1072)
  $1.EstimateNetworkHashesPerSecondRequestMessage
      ensureEstimateNetworkHashesPerSecondRequest() => $_ensure(33);

  @$pb.TagNumber(1074)
  $1.NotifyVirtualDaaScoreChangedRequestMessage
      get notifyVirtualDaaScoreChangedRequest => $_getN(34);
  @$pb.TagNumber(1074)
  set notifyVirtualDaaScoreChangedRequest(
          $1.NotifyVirtualDaaScoreChangedRequestMessage value) =>
      $_setField(1074, value);
  @$pb.TagNumber(1074)
  $core.bool hasNotifyVirtualDaaScoreChangedRequest() => $_has(34);
  @$pb.TagNumber(1074)
  void clearNotifyVirtualDaaScoreChangedRequest() => $_clearField(1074);
  @$pb.TagNumber(1074)
  $1.NotifyVirtualDaaScoreChangedRequestMessage
      ensureNotifyVirtualDaaScoreChangedRequest() => $_ensure(34);

  /// VirtualDaaScoreChangedNotificationMessage virtualDaaScoreChangedNotification = 1076;
  @$pb.TagNumber(1077)
  $1.GetBalanceByAddressRequestMessage get getBalanceByAddressRequest =>
      $_getN(35);
  @$pb.TagNumber(1077)
  set getBalanceByAddressRequest($1.GetBalanceByAddressRequestMessage value) =>
      $_setField(1077, value);
  @$pb.TagNumber(1077)
  $core.bool hasGetBalanceByAddressRequest() => $_has(35);
  @$pb.TagNumber(1077)
  void clearGetBalanceByAddressRequest() => $_clearField(1077);
  @$pb.TagNumber(1077)
  $1.GetBalanceByAddressRequestMessage ensureGetBalanceByAddressRequest() =>
      $_ensure(35);

  @$pb.TagNumber(1079)
  $1.GetBalancesByAddressesRequestMessage get getBalancesByAddressesRequest =>
      $_getN(36);
  @$pb.TagNumber(1079)
  set getBalancesByAddressesRequest(
          $1.GetBalancesByAddressesRequestMessage value) =>
      $_setField(1079, value);
  @$pb.TagNumber(1079)
  $core.bool hasGetBalancesByAddressesRequest() => $_has(36);
  @$pb.TagNumber(1079)
  void clearGetBalancesByAddressesRequest() => $_clearField(1079);
  @$pb.TagNumber(1079)
  $1.GetBalancesByAddressesRequestMessage
      ensureGetBalancesByAddressesRequest() => $_ensure(36);

  @$pb.TagNumber(1081)
  $1.NotifyNewBlockTemplateRequestMessage get notifyNewBlockTemplateRequest =>
      $_getN(37);
  @$pb.TagNumber(1081)
  set notifyNewBlockTemplateRequest(
          $1.NotifyNewBlockTemplateRequestMessage value) =>
      $_setField(1081, value);
  @$pb.TagNumber(1081)
  $core.bool hasNotifyNewBlockTemplateRequest() => $_has(37);
  @$pb.TagNumber(1081)
  void clearNotifyNewBlockTemplateRequest() => $_clearField(1081);
  @$pb.TagNumber(1081)
  $1.NotifyNewBlockTemplateRequestMessage
      ensureNotifyNewBlockTemplateRequest() => $_ensure(37);

  /// NewBlockTemplateNotificationMessage newBlockTemplateNotification = 1083;
  @$pb.TagNumber(1084)
  $1.GetMempoolEntriesByAddressesRequestMessage
      get getMempoolEntriesByAddressesRequest => $_getN(38);
  @$pb.TagNumber(1084)
  set getMempoolEntriesByAddressesRequest(
          $1.GetMempoolEntriesByAddressesRequestMessage value) =>
      $_setField(1084, value);
  @$pb.TagNumber(1084)
  $core.bool hasGetMempoolEntriesByAddressesRequest() => $_has(38);
  @$pb.TagNumber(1084)
  void clearGetMempoolEntriesByAddressesRequest() => $_clearField(1084);
  @$pb.TagNumber(1084)
  $1.GetMempoolEntriesByAddressesRequestMessage
      ensureGetMempoolEntriesByAddressesRequest() => $_ensure(38);

  @$pb.TagNumber(1086)
  $1.GetCoinSupplyRequestMessage get getCoinSupplyRequest => $_getN(39);
  @$pb.TagNumber(1086)
  set getCoinSupplyRequest($1.GetCoinSupplyRequestMessage value) =>
      $_setField(1086, value);
  @$pb.TagNumber(1086)
  $core.bool hasGetCoinSupplyRequest() => $_has(39);
  @$pb.TagNumber(1086)
  void clearGetCoinSupplyRequest() => $_clearField(1086);
  @$pb.TagNumber(1086)
  $1.GetCoinSupplyRequestMessage ensureGetCoinSupplyRequest() => $_ensure(39);

  @$pb.TagNumber(1088)
  $1.PingRequestMessage get pingRequest => $_getN(40);
  @$pb.TagNumber(1088)
  set pingRequest($1.PingRequestMessage value) => $_setField(1088, value);
  @$pb.TagNumber(1088)
  $core.bool hasPingRequest() => $_has(40);
  @$pb.TagNumber(1088)
  void clearPingRequest() => $_clearField(1088);
  @$pb.TagNumber(1088)
  $1.PingRequestMessage ensurePingRequest() => $_ensure(40);

  @$pb.TagNumber(1090)
  $1.GetMetricsRequestMessage get getMetricsRequest => $_getN(41);
  @$pb.TagNumber(1090)
  set getMetricsRequest($1.GetMetricsRequestMessage value) =>
      $_setField(1090, value);
  @$pb.TagNumber(1090)
  $core.bool hasGetMetricsRequest() => $_has(41);
  @$pb.TagNumber(1090)
  void clearGetMetricsRequest() => $_clearField(1090);
  @$pb.TagNumber(1090)
  $1.GetMetricsRequestMessage ensureGetMetricsRequest() => $_ensure(41);

  @$pb.TagNumber(1092)
  $1.GetServerInfoRequestMessage get getServerInfoRequest => $_getN(42);
  @$pb.TagNumber(1092)
  set getServerInfoRequest($1.GetServerInfoRequestMessage value) =>
      $_setField(1092, value);
  @$pb.TagNumber(1092)
  $core.bool hasGetServerInfoRequest() => $_has(42);
  @$pb.TagNumber(1092)
  void clearGetServerInfoRequest() => $_clearField(1092);
  @$pb.TagNumber(1092)
  $1.GetServerInfoRequestMessage ensureGetServerInfoRequest() => $_ensure(42);

  @$pb.TagNumber(1094)
  $1.GetSyncStatusRequestMessage get getSyncStatusRequest => $_getN(43);
  @$pb.TagNumber(1094)
  set getSyncStatusRequest($1.GetSyncStatusRequestMessage value) =>
      $_setField(1094, value);
  @$pb.TagNumber(1094)
  $core.bool hasGetSyncStatusRequest() => $_has(43);
  @$pb.TagNumber(1094)
  void clearGetSyncStatusRequest() => $_clearField(1094);
  @$pb.TagNumber(1094)
  $1.GetSyncStatusRequestMessage ensureGetSyncStatusRequest() => $_ensure(43);

  @$pb.TagNumber(1096)
  $1.GetDaaScoreTimestampEstimateRequestMessage
      get getDaaScoreTimestampEstimateRequest => $_getN(44);
  @$pb.TagNumber(1096)
  set getDaaScoreTimestampEstimateRequest(
          $1.GetDaaScoreTimestampEstimateRequestMessage value) =>
      $_setField(1096, value);
  @$pb.TagNumber(1096)
  $core.bool hasGetDaaScoreTimestampEstimateRequest() => $_has(44);
  @$pb.TagNumber(1096)
  void clearGetDaaScoreTimestampEstimateRequest() => $_clearField(1096);
  @$pb.TagNumber(1096)
  $1.GetDaaScoreTimestampEstimateRequestMessage
      ensureGetDaaScoreTimestampEstimateRequest() => $_ensure(44);

  @$pb.TagNumber(1100)
  $1.SubmitTransactionReplacementRequestMessage
      get submitTransactionReplacementRequest => $_getN(45);
  @$pb.TagNumber(1100)
  set submitTransactionReplacementRequest(
          $1.SubmitTransactionReplacementRequestMessage value) =>
      $_setField(1100, value);
  @$pb.TagNumber(1100)
  $core.bool hasSubmitTransactionReplacementRequest() => $_has(45);
  @$pb.TagNumber(1100)
  void clearSubmitTransactionReplacementRequest() => $_clearField(1100);
  @$pb.TagNumber(1100)
  $1.SubmitTransactionReplacementRequestMessage
      ensureSubmitTransactionReplacementRequest() => $_ensure(45);

  @$pb.TagNumber(1102)
  $1.GetConnectionsRequestMessage get getConnectionsRequest => $_getN(46);
  @$pb.TagNumber(1102)
  set getConnectionsRequest($1.GetConnectionsRequestMessage value) =>
      $_setField(1102, value);
  @$pb.TagNumber(1102)
  $core.bool hasGetConnectionsRequest() => $_has(46);
  @$pb.TagNumber(1102)
  void clearGetConnectionsRequest() => $_clearField(1102);
  @$pb.TagNumber(1102)
  $1.GetConnectionsRequestMessage ensureGetConnectionsRequest() => $_ensure(46);

  @$pb.TagNumber(1104)
  $1.GetSystemInfoRequestMessage get getSystemInfoRequest => $_getN(47);
  @$pb.TagNumber(1104)
  set getSystemInfoRequest($1.GetSystemInfoRequestMessage value) =>
      $_setField(1104, value);
  @$pb.TagNumber(1104)
  $core.bool hasGetSystemInfoRequest() => $_has(47);
  @$pb.TagNumber(1104)
  void clearGetSystemInfoRequest() => $_clearField(1104);
  @$pb.TagNumber(1104)
  $1.GetSystemInfoRequestMessage ensureGetSystemInfoRequest() => $_ensure(47);

  @$pb.TagNumber(1106)
  $1.GetFeeEstimateRequestMessage get getFeeEstimateRequest => $_getN(48);
  @$pb.TagNumber(1106)
  set getFeeEstimateRequest($1.GetFeeEstimateRequestMessage value) =>
      $_setField(1106, value);
  @$pb.TagNumber(1106)
  $core.bool hasGetFeeEstimateRequest() => $_has(48);
  @$pb.TagNumber(1106)
  void clearGetFeeEstimateRequest() => $_clearField(1106);
  @$pb.TagNumber(1106)
  $1.GetFeeEstimateRequestMessage ensureGetFeeEstimateRequest() => $_ensure(48);

  @$pb.TagNumber(1108)
  $1.GetFeeEstimateExperimentalRequestMessage
      get getFeeEstimateExperimentalRequest => $_getN(49);
  @$pb.TagNumber(1108)
  set getFeeEstimateExperimentalRequest(
          $1.GetFeeEstimateExperimentalRequestMessage value) =>
      $_setField(1108, value);
  @$pb.TagNumber(1108)
  $core.bool hasGetFeeEstimateExperimentalRequest() => $_has(49);
  @$pb.TagNumber(1108)
  void clearGetFeeEstimateExperimentalRequest() => $_clearField(1108);
  @$pb.TagNumber(1108)
  $1.GetFeeEstimateExperimentalRequestMessage
      ensureGetFeeEstimateExperimentalRequest() => $_ensure(49);

  @$pb.TagNumber(1110)
  $1.GetCurrentBlockColorRequestMessage get getCurrentBlockColorRequest =>
      $_getN(50);
  @$pb.TagNumber(1110)
  set getCurrentBlockColorRequest(
          $1.GetCurrentBlockColorRequestMessage value) =>
      $_setField(1110, value);
  @$pb.TagNumber(1110)
  $core.bool hasGetCurrentBlockColorRequest() => $_has(50);
  @$pb.TagNumber(1110)
  void clearGetCurrentBlockColorRequest() => $_clearField(1110);
  @$pb.TagNumber(1110)
  $1.GetCurrentBlockColorRequestMessage ensureGetCurrentBlockColorRequest() =>
      $_ensure(50);

  @$pb.TagNumber(1112)
  $1.GetUtxoReturnAddressRequestMessage get getUtxoReturnAddressRequest =>
      $_getN(51);
  @$pb.TagNumber(1112)
  set getUtxoReturnAddressRequest(
          $1.GetUtxoReturnAddressRequestMessage value) =>
      $_setField(1112, value);
  @$pb.TagNumber(1112)
  $core.bool hasGetUtxoReturnAddressRequest() => $_has(51);
  @$pb.TagNumber(1112)
  void clearGetUtxoReturnAddressRequest() => $_clearField(1112);
  @$pb.TagNumber(1112)
  $1.GetUtxoReturnAddressRequestMessage ensureGetUtxoReturnAddressRequest() =>
      $_ensure(51);

  @$pb.TagNumber(1114)
  $1.GetVirtualChainFromBlockV2RequestMessage
      get getVirtualChainFromBlockV2Request => $_getN(52);
  @$pb.TagNumber(1114)
  set getVirtualChainFromBlockV2Request(
          $1.GetVirtualChainFromBlockV2RequestMessage value) =>
      $_setField(1114, value);
  @$pb.TagNumber(1114)
  $core.bool hasGetVirtualChainFromBlockV2Request() => $_has(52);
  @$pb.TagNumber(1114)
  void clearGetVirtualChainFromBlockV2Request() => $_clearField(1114);
  @$pb.TagNumber(1114)
  $1.GetVirtualChainFromBlockV2RequestMessage
      ensureGetVirtualChainFromBlockV2Request() => $_ensure(52);

  @$pb.TagNumber(1116)
  $1.GetBlockRewardInfoRequestMessage get getBlockRewardInfoRequest =>
      $_getN(53);
  @$pb.TagNumber(1116)
  set getBlockRewardInfoRequest($1.GetBlockRewardInfoRequestMessage value) =>
      $_setField(1116, value);
  @$pb.TagNumber(1116)
  $core.bool hasGetBlockRewardInfoRequest() => $_has(53);
  @$pb.TagNumber(1116)
  void clearGetBlockRewardInfoRequest() => $_clearField(1116);
  @$pb.TagNumber(1116)
  $1.GetBlockRewardInfoRequestMessage ensureGetBlockRewardInfoRequest() =>
      $_ensure(53);
}

enum KaspadResponse_Payload {
  getCurrentNetworkResponse,
  submitBlockResponse,
  getBlockTemplateResponse,
  notifyBlockAddedResponse,
  blockAddedNotification,
  getPeerAddressesResponse,
  getSinkResponse,
  getMempoolEntryResponse,
  getConnectedPeerInfoResponse,
  addPeerResponse,
  submitTransactionResponse,
  notifyVirtualChainChangedResponse,
  virtualChainChangedNotification,
  getBlockResponse,
  getSubnetworkResponse,
  getVirtualChainFromBlockResponse,
  getBlocksResponse,
  getBlockCountResponse,
  getBlockDagInfoResponse,
  resolveFinalityConflictResponse,
  notifyFinalityConflictResponse,
  finalityConflictNotification,
  finalityConflictResolvedNotification,
  getMempoolEntriesResponse,
  shutdownResponse,
  getHeadersResponse,
  notifyUtxosChangedResponse,
  utxosChangedNotification,
  getUtxosByAddressesResponse,
  getSinkBlueScoreResponse,
  notifySinkBlueScoreChangedResponse,
  sinkBlueScoreChangedNotification,
  banResponse,
  unbanResponse,
  getInfoResponse,
  stopNotifyingUtxosChangedResponse,
  notifyPruningPointUtxoSetOverrideResponse,
  pruningPointUtxoSetOverrideNotification,
  stopNotifyingPruningPointUtxoSetOverrideResponse,
  estimateNetworkHashesPerSecondResponse,
  notifyVirtualDaaScoreChangedResponse,
  virtualDaaScoreChangedNotification,
  getBalanceByAddressResponse,
  getBalancesByAddressesResponse,
  notifyNewBlockTemplateResponse,
  newBlockTemplateNotification,
  getMempoolEntriesByAddressesResponse,
  getCoinSupplyResponse,
  pingResponse,
  getMetricsResponse,
  getServerInfoResponse,
  getSyncStatusResponse,
  getDaaScoreTimestampEstimateResponse,
  submitTransactionReplacementResponse,
  getConnectionsResponse,
  getSystemInfoResponse,
  getFeeEstimateResponse,
  getFeeEstimateExperimentalResponse,
  getCurrentBlockColorResponse,
  getUtxoReturnAddressResponse,
  getVirtualChainFromBlockV2Response,
  getBlockRewardInfoResponse,
  notSet
}

class KaspadResponse extends $pb.GeneratedMessage {
  factory KaspadResponse({
    $fixnum.Int64? id,
    $1.GetCurrentNetworkResponseMessage? getCurrentNetworkResponse,
    $1.SubmitBlockResponseMessage? submitBlockResponse,
    $1.GetBlockTemplateResponseMessage? getBlockTemplateResponse,
    $1.NotifyBlockAddedResponseMessage? notifyBlockAddedResponse,
    $1.BlockAddedNotificationMessage? blockAddedNotification,
    $1.GetPeerAddressesResponseMessage? getPeerAddressesResponse,
    $1.GetSinkResponseMessage? getSinkResponse,
    $1.GetMempoolEntryResponseMessage? getMempoolEntryResponse,
    $1.GetConnectedPeerInfoResponseMessage? getConnectedPeerInfoResponse,
    $1.AddPeerResponseMessage? addPeerResponse,
    $1.SubmitTransactionResponseMessage? submitTransactionResponse,
    $1.NotifyVirtualChainChangedResponseMessage?
        notifyVirtualChainChangedResponse,
    $1.VirtualChainChangedNotificationMessage? virtualChainChangedNotification,
    $1.GetBlockResponseMessage? getBlockResponse,
    $1.GetSubnetworkResponseMessage? getSubnetworkResponse,
    $1.GetVirtualChainFromBlockResponseMessage?
        getVirtualChainFromBlockResponse,
    $1.GetBlocksResponseMessage? getBlocksResponse,
    $1.GetBlockCountResponseMessage? getBlockCountResponse,
    $1.GetBlockDagInfoResponseMessage? getBlockDagInfoResponse,
    $1.ResolveFinalityConflictResponseMessage? resolveFinalityConflictResponse,
    $1.NotifyFinalityConflictResponseMessage? notifyFinalityConflictResponse,
    $1.FinalityConflictNotificationMessage? finalityConflictNotification,
    $1.FinalityConflictResolvedNotificationMessage?
        finalityConflictResolvedNotification,
    $1.GetMempoolEntriesResponseMessage? getMempoolEntriesResponse,
    $1.ShutdownResponseMessage? shutdownResponse,
    $1.GetHeadersResponseMessage? getHeadersResponse,
    $1.NotifyUtxosChangedResponseMessage? notifyUtxosChangedResponse,
    $1.UtxosChangedNotificationMessage? utxosChangedNotification,
    $1.GetUtxosByAddressesResponseMessage? getUtxosByAddressesResponse,
    $1.GetSinkBlueScoreResponseMessage? getSinkBlueScoreResponse,
    $1.NotifySinkBlueScoreChangedResponseMessage?
        notifySinkBlueScoreChangedResponse,
    $1.SinkBlueScoreChangedNotificationMessage?
        sinkBlueScoreChangedNotification,
    $1.BanResponseMessage? banResponse,
    $1.UnbanResponseMessage? unbanResponse,
    $1.GetInfoResponseMessage? getInfoResponse,
    $1.StopNotifyingUtxosChangedResponseMessage?
        stopNotifyingUtxosChangedResponse,
    $1.NotifyPruningPointUtxoSetOverrideResponseMessage?
        notifyPruningPointUtxoSetOverrideResponse,
    $1.PruningPointUtxoSetOverrideNotificationMessage?
        pruningPointUtxoSetOverrideNotification,
    $1.StopNotifyingPruningPointUtxoSetOverrideResponseMessage?
        stopNotifyingPruningPointUtxoSetOverrideResponse,
    $1.EstimateNetworkHashesPerSecondResponseMessage?
        estimateNetworkHashesPerSecondResponse,
    $1.NotifyVirtualDaaScoreChangedResponseMessage?
        notifyVirtualDaaScoreChangedResponse,
    $1.VirtualDaaScoreChangedNotificationMessage?
        virtualDaaScoreChangedNotification,
    $1.GetBalanceByAddressResponseMessage? getBalanceByAddressResponse,
    $1.GetBalancesByAddressesResponseMessage? getBalancesByAddressesResponse,
    $1.NotifyNewBlockTemplateResponseMessage? notifyNewBlockTemplateResponse,
    $1.NewBlockTemplateNotificationMessage? newBlockTemplateNotification,
    $1.GetMempoolEntriesByAddressesResponseMessage?
        getMempoolEntriesByAddressesResponse,
    $1.GetCoinSupplyResponseMessage? getCoinSupplyResponse,
    $1.PingResponseMessage? pingResponse,
    $1.GetMetricsResponseMessage? getMetricsResponse,
    $1.GetServerInfoResponseMessage? getServerInfoResponse,
    $1.GetSyncStatusResponseMessage? getSyncStatusResponse,
    $1.GetDaaScoreTimestampEstimateResponseMessage?
        getDaaScoreTimestampEstimateResponse,
    $1.SubmitTransactionReplacementResponseMessage?
        submitTransactionReplacementResponse,
    $1.GetConnectionsResponseMessage? getConnectionsResponse,
    $1.GetSystemInfoResponseMessage? getSystemInfoResponse,
    $1.GetFeeEstimateResponseMessage? getFeeEstimateResponse,
    $1.GetFeeEstimateExperimentalResponseMessage?
        getFeeEstimateExperimentalResponse,
    $1.GetCurrentBlockColorResponseMessage? getCurrentBlockColorResponse,
    $1.GetUtxoReturnAddressResponseMessage? getUtxoReturnAddressResponse,
    $1.GetVirtualChainFromBlockV2ResponseMessage?
        getVirtualChainFromBlockV2Response,
    $1.GetBlockRewardInfoResponseMessage? getBlockRewardInfoResponse,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (getCurrentNetworkResponse != null)
      result.getCurrentNetworkResponse = getCurrentNetworkResponse;
    if (submitBlockResponse != null)
      result.submitBlockResponse = submitBlockResponse;
    if (getBlockTemplateResponse != null)
      result.getBlockTemplateResponse = getBlockTemplateResponse;
    if (notifyBlockAddedResponse != null)
      result.notifyBlockAddedResponse = notifyBlockAddedResponse;
    if (blockAddedNotification != null)
      result.blockAddedNotification = blockAddedNotification;
    if (getPeerAddressesResponse != null)
      result.getPeerAddressesResponse = getPeerAddressesResponse;
    if (getSinkResponse != null) result.getSinkResponse = getSinkResponse;
    if (getMempoolEntryResponse != null)
      result.getMempoolEntryResponse = getMempoolEntryResponse;
    if (getConnectedPeerInfoResponse != null)
      result.getConnectedPeerInfoResponse = getConnectedPeerInfoResponse;
    if (addPeerResponse != null) result.addPeerResponse = addPeerResponse;
    if (submitTransactionResponse != null)
      result.submitTransactionResponse = submitTransactionResponse;
    if (notifyVirtualChainChangedResponse != null)
      result.notifyVirtualChainChangedResponse =
          notifyVirtualChainChangedResponse;
    if (virtualChainChangedNotification != null)
      result.virtualChainChangedNotification = virtualChainChangedNotification;
    if (getBlockResponse != null) result.getBlockResponse = getBlockResponse;
    if (getSubnetworkResponse != null)
      result.getSubnetworkResponse = getSubnetworkResponse;
    if (getVirtualChainFromBlockResponse != null)
      result.getVirtualChainFromBlockResponse =
          getVirtualChainFromBlockResponse;
    if (getBlocksResponse != null) result.getBlocksResponse = getBlocksResponse;
    if (getBlockCountResponse != null)
      result.getBlockCountResponse = getBlockCountResponse;
    if (getBlockDagInfoResponse != null)
      result.getBlockDagInfoResponse = getBlockDagInfoResponse;
    if (resolveFinalityConflictResponse != null)
      result.resolveFinalityConflictResponse = resolveFinalityConflictResponse;
    if (notifyFinalityConflictResponse != null)
      result.notifyFinalityConflictResponse = notifyFinalityConflictResponse;
    if (finalityConflictNotification != null)
      result.finalityConflictNotification = finalityConflictNotification;
    if (finalityConflictResolvedNotification != null)
      result.finalityConflictResolvedNotification =
          finalityConflictResolvedNotification;
    if (getMempoolEntriesResponse != null)
      result.getMempoolEntriesResponse = getMempoolEntriesResponse;
    if (shutdownResponse != null) result.shutdownResponse = shutdownResponse;
    if (getHeadersResponse != null)
      result.getHeadersResponse = getHeadersResponse;
    if (notifyUtxosChangedResponse != null)
      result.notifyUtxosChangedResponse = notifyUtxosChangedResponse;
    if (utxosChangedNotification != null)
      result.utxosChangedNotification = utxosChangedNotification;
    if (getUtxosByAddressesResponse != null)
      result.getUtxosByAddressesResponse = getUtxosByAddressesResponse;
    if (getSinkBlueScoreResponse != null)
      result.getSinkBlueScoreResponse = getSinkBlueScoreResponse;
    if (notifySinkBlueScoreChangedResponse != null)
      result.notifySinkBlueScoreChangedResponse =
          notifySinkBlueScoreChangedResponse;
    if (sinkBlueScoreChangedNotification != null)
      result.sinkBlueScoreChangedNotification =
          sinkBlueScoreChangedNotification;
    if (banResponse != null) result.banResponse = banResponse;
    if (unbanResponse != null) result.unbanResponse = unbanResponse;
    if (getInfoResponse != null) result.getInfoResponse = getInfoResponse;
    if (stopNotifyingUtxosChangedResponse != null)
      result.stopNotifyingUtxosChangedResponse =
          stopNotifyingUtxosChangedResponse;
    if (notifyPruningPointUtxoSetOverrideResponse != null)
      result.notifyPruningPointUtxoSetOverrideResponse =
          notifyPruningPointUtxoSetOverrideResponse;
    if (pruningPointUtxoSetOverrideNotification != null)
      result.pruningPointUtxoSetOverrideNotification =
          pruningPointUtxoSetOverrideNotification;
    if (stopNotifyingPruningPointUtxoSetOverrideResponse != null)
      result.stopNotifyingPruningPointUtxoSetOverrideResponse =
          stopNotifyingPruningPointUtxoSetOverrideResponse;
    if (estimateNetworkHashesPerSecondResponse != null)
      result.estimateNetworkHashesPerSecondResponse =
          estimateNetworkHashesPerSecondResponse;
    if (notifyVirtualDaaScoreChangedResponse != null)
      result.notifyVirtualDaaScoreChangedResponse =
          notifyVirtualDaaScoreChangedResponse;
    if (virtualDaaScoreChangedNotification != null)
      result.virtualDaaScoreChangedNotification =
          virtualDaaScoreChangedNotification;
    if (getBalanceByAddressResponse != null)
      result.getBalanceByAddressResponse = getBalanceByAddressResponse;
    if (getBalancesByAddressesResponse != null)
      result.getBalancesByAddressesResponse = getBalancesByAddressesResponse;
    if (notifyNewBlockTemplateResponse != null)
      result.notifyNewBlockTemplateResponse = notifyNewBlockTemplateResponse;
    if (newBlockTemplateNotification != null)
      result.newBlockTemplateNotification = newBlockTemplateNotification;
    if (getMempoolEntriesByAddressesResponse != null)
      result.getMempoolEntriesByAddressesResponse =
          getMempoolEntriesByAddressesResponse;
    if (getCoinSupplyResponse != null)
      result.getCoinSupplyResponse = getCoinSupplyResponse;
    if (pingResponse != null) result.pingResponse = pingResponse;
    if (getMetricsResponse != null)
      result.getMetricsResponse = getMetricsResponse;
    if (getServerInfoResponse != null)
      result.getServerInfoResponse = getServerInfoResponse;
    if (getSyncStatusResponse != null)
      result.getSyncStatusResponse = getSyncStatusResponse;
    if (getDaaScoreTimestampEstimateResponse != null)
      result.getDaaScoreTimestampEstimateResponse =
          getDaaScoreTimestampEstimateResponse;
    if (submitTransactionReplacementResponse != null)
      result.submitTransactionReplacementResponse =
          submitTransactionReplacementResponse;
    if (getConnectionsResponse != null)
      result.getConnectionsResponse = getConnectionsResponse;
    if (getSystemInfoResponse != null)
      result.getSystemInfoResponse = getSystemInfoResponse;
    if (getFeeEstimateResponse != null)
      result.getFeeEstimateResponse = getFeeEstimateResponse;
    if (getFeeEstimateExperimentalResponse != null)
      result.getFeeEstimateExperimentalResponse =
          getFeeEstimateExperimentalResponse;
    if (getCurrentBlockColorResponse != null)
      result.getCurrentBlockColorResponse = getCurrentBlockColorResponse;
    if (getUtxoReturnAddressResponse != null)
      result.getUtxoReturnAddressResponse = getUtxoReturnAddressResponse;
    if (getVirtualChainFromBlockV2Response != null)
      result.getVirtualChainFromBlockV2Response =
          getVirtualChainFromBlockV2Response;
    if (getBlockRewardInfoResponse != null)
      result.getBlockRewardInfoResponse = getBlockRewardInfoResponse;
    return result;
  }

  KaspadResponse._();

  factory KaspadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KaspadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, KaspadResponse_Payload>
      _KaspadResponse_PayloadByTag = {
    1002: KaspadResponse_Payload.getCurrentNetworkResponse,
    1004: KaspadResponse_Payload.submitBlockResponse,
    1006: KaspadResponse_Payload.getBlockTemplateResponse,
    1008: KaspadResponse_Payload.notifyBlockAddedResponse,
    1009: KaspadResponse_Payload.blockAddedNotification,
    1011: KaspadResponse_Payload.getPeerAddressesResponse,
    1013: KaspadResponse_Payload.getSinkResponse,
    1015: KaspadResponse_Payload.getMempoolEntryResponse,
    1017: KaspadResponse_Payload.getConnectedPeerInfoResponse,
    1019: KaspadResponse_Payload.addPeerResponse,
    1021: KaspadResponse_Payload.submitTransactionResponse,
    1023: KaspadResponse_Payload.notifyVirtualChainChangedResponse,
    1024: KaspadResponse_Payload.virtualChainChangedNotification,
    1026: KaspadResponse_Payload.getBlockResponse,
    1028: KaspadResponse_Payload.getSubnetworkResponse,
    1030: KaspadResponse_Payload.getVirtualChainFromBlockResponse,
    1032: KaspadResponse_Payload.getBlocksResponse,
    1034: KaspadResponse_Payload.getBlockCountResponse,
    1036: KaspadResponse_Payload.getBlockDagInfoResponse,
    1038: KaspadResponse_Payload.resolveFinalityConflictResponse,
    1040: KaspadResponse_Payload.notifyFinalityConflictResponse,
    1041: KaspadResponse_Payload.finalityConflictNotification,
    1042: KaspadResponse_Payload.finalityConflictResolvedNotification,
    1044: KaspadResponse_Payload.getMempoolEntriesResponse,
    1046: KaspadResponse_Payload.shutdownResponse,
    1048: KaspadResponse_Payload.getHeadersResponse,
    1050: KaspadResponse_Payload.notifyUtxosChangedResponse,
    1051: KaspadResponse_Payload.utxosChangedNotification,
    1053: KaspadResponse_Payload.getUtxosByAddressesResponse,
    1055: KaspadResponse_Payload.getSinkBlueScoreResponse,
    1057: KaspadResponse_Payload.notifySinkBlueScoreChangedResponse,
    1058: KaspadResponse_Payload.sinkBlueScoreChangedNotification,
    1060: KaspadResponse_Payload.banResponse,
    1062: KaspadResponse_Payload.unbanResponse,
    1064: KaspadResponse_Payload.getInfoResponse,
    1066: KaspadResponse_Payload.stopNotifyingUtxosChangedResponse,
    1068: KaspadResponse_Payload.notifyPruningPointUtxoSetOverrideResponse,
    1069: KaspadResponse_Payload.pruningPointUtxoSetOverrideNotification,
    1071:
        KaspadResponse_Payload.stopNotifyingPruningPointUtxoSetOverrideResponse,
    1073: KaspadResponse_Payload.estimateNetworkHashesPerSecondResponse,
    1075: KaspadResponse_Payload.notifyVirtualDaaScoreChangedResponse,
    1076: KaspadResponse_Payload.virtualDaaScoreChangedNotification,
    1078: KaspadResponse_Payload.getBalanceByAddressResponse,
    1080: KaspadResponse_Payload.getBalancesByAddressesResponse,
    1082: KaspadResponse_Payload.notifyNewBlockTemplateResponse,
    1083: KaspadResponse_Payload.newBlockTemplateNotification,
    1085: KaspadResponse_Payload.getMempoolEntriesByAddressesResponse,
    1087: KaspadResponse_Payload.getCoinSupplyResponse,
    1089: KaspadResponse_Payload.pingResponse,
    1091: KaspadResponse_Payload.getMetricsResponse,
    1093: KaspadResponse_Payload.getServerInfoResponse,
    1095: KaspadResponse_Payload.getSyncStatusResponse,
    1097: KaspadResponse_Payload.getDaaScoreTimestampEstimateResponse,
    1101: KaspadResponse_Payload.submitTransactionReplacementResponse,
    1103: KaspadResponse_Payload.getConnectionsResponse,
    1105: KaspadResponse_Payload.getSystemInfoResponse,
    1107: KaspadResponse_Payload.getFeeEstimateResponse,
    1109: KaspadResponse_Payload.getFeeEstimateExperimentalResponse,
    1111: KaspadResponse_Payload.getCurrentBlockColorResponse,
    1113: KaspadResponse_Payload.getUtxoReturnAddressResponse,
    1115: KaspadResponse_Payload.getVirtualChainFromBlockV2Response,
    1117: KaspadResponse_Payload.getBlockRewardInfoResponse,
    0: KaspadResponse_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KaspadResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..oo(0, [
      1002,
      1004,
      1006,
      1008,
      1009,
      1011,
      1013,
      1015,
      1017,
      1019,
      1021,
      1023,
      1024,
      1026,
      1028,
      1030,
      1032,
      1034,
      1036,
      1038,
      1040,
      1041,
      1042,
      1044,
      1046,
      1048,
      1050,
      1051,
      1053,
      1055,
      1057,
      1058,
      1060,
      1062,
      1064,
      1066,
      1068,
      1069,
      1071,
      1073,
      1075,
      1076,
      1078,
      1080,
      1082,
      1083,
      1085,
      1087,
      1089,
      1091,
      1093,
      1095,
      1097,
      1101,
      1103,
      1105,
      1107,
      1109,
      1111,
      1113,
      1115,
      1117
    ])
    ..a<$fixnum.Int64>(101, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.GetCurrentNetworkResponseMessage>(
        1002, _omitFieldNames ? '' : 'getCurrentNetworkResponse',
        protoName: 'getCurrentNetworkResponse',
        subBuilder: $1.GetCurrentNetworkResponseMessage.create)
    ..aOM<$1.SubmitBlockResponseMessage>(
        1004, _omitFieldNames ? '' : 'submitBlockResponse',
        protoName: 'submitBlockResponse',
        subBuilder: $1.SubmitBlockResponseMessage.create)
    ..aOM<$1.GetBlockTemplateResponseMessage>(
        1006, _omitFieldNames ? '' : 'getBlockTemplateResponse',
        protoName: 'getBlockTemplateResponse',
        subBuilder: $1.GetBlockTemplateResponseMessage.create)
    ..aOM<$1.NotifyBlockAddedResponseMessage>(
        1008, _omitFieldNames ? '' : 'notifyBlockAddedResponse',
        protoName: 'notifyBlockAddedResponse',
        subBuilder: $1.NotifyBlockAddedResponseMessage.create)
    ..aOM<$1.BlockAddedNotificationMessage>(
        1009, _omitFieldNames ? '' : 'blockAddedNotification',
        protoName: 'blockAddedNotification',
        subBuilder: $1.BlockAddedNotificationMessage.create)
    ..aOM<$1.GetPeerAddressesResponseMessage>(
        1011, _omitFieldNames ? '' : 'getPeerAddressesResponse',
        protoName: 'getPeerAddressesResponse',
        subBuilder: $1.GetPeerAddressesResponseMessage.create)
    ..aOM<$1.GetSinkResponseMessage>(
        1013, _omitFieldNames ? '' : 'GetSinkResponse',
        protoName: 'GetSinkResponse',
        subBuilder: $1.GetSinkResponseMessage.create)
    ..aOM<$1.GetMempoolEntryResponseMessage>(
        1015, _omitFieldNames ? '' : 'getMempoolEntryResponse',
        protoName: 'getMempoolEntryResponse',
        subBuilder: $1.GetMempoolEntryResponseMessage.create)
    ..aOM<$1.GetConnectedPeerInfoResponseMessage>(
        1017, _omitFieldNames ? '' : 'getConnectedPeerInfoResponse',
        protoName: 'getConnectedPeerInfoResponse',
        subBuilder: $1.GetConnectedPeerInfoResponseMessage.create)
    ..aOM<$1.AddPeerResponseMessage>(
        1019, _omitFieldNames ? '' : 'addPeerResponse',
        protoName: 'addPeerResponse',
        subBuilder: $1.AddPeerResponseMessage.create)
    ..aOM<$1.SubmitTransactionResponseMessage>(
        1021, _omitFieldNames ? '' : 'submitTransactionResponse',
        protoName: 'submitTransactionResponse',
        subBuilder: $1.SubmitTransactionResponseMessage.create)
    ..aOM<$1.NotifyVirtualChainChangedResponseMessage>(
        1023, _omitFieldNames ? '' : 'notifyVirtualChainChangedResponse',
        protoName: 'notifyVirtualChainChangedResponse',
        subBuilder: $1.NotifyVirtualChainChangedResponseMessage.create)
    ..aOM<$1.VirtualChainChangedNotificationMessage>(
        1024, _omitFieldNames ? '' : 'virtualChainChangedNotification',
        protoName: 'virtualChainChangedNotification',
        subBuilder: $1.VirtualChainChangedNotificationMessage.create)
    ..aOM<$1.GetBlockResponseMessage>(
        1026, _omitFieldNames ? '' : 'getBlockResponse',
        protoName: 'getBlockResponse',
        subBuilder: $1.GetBlockResponseMessage.create)
    ..aOM<$1.GetSubnetworkResponseMessage>(
        1028, _omitFieldNames ? '' : 'getSubnetworkResponse',
        protoName: 'getSubnetworkResponse',
        subBuilder: $1.GetSubnetworkResponseMessage.create)
    ..aOM<$1.GetVirtualChainFromBlockResponseMessage>(
        1030, _omitFieldNames ? '' : 'getVirtualChainFromBlockResponse',
        protoName: 'getVirtualChainFromBlockResponse',
        subBuilder: $1.GetVirtualChainFromBlockResponseMessage.create)
    ..aOM<$1.GetBlocksResponseMessage>(
        1032, _omitFieldNames ? '' : 'getBlocksResponse',
        protoName: 'getBlocksResponse',
        subBuilder: $1.GetBlocksResponseMessage.create)
    ..aOM<$1.GetBlockCountResponseMessage>(
        1034, _omitFieldNames ? '' : 'getBlockCountResponse',
        protoName: 'getBlockCountResponse',
        subBuilder: $1.GetBlockCountResponseMessage.create)
    ..aOM<$1.GetBlockDagInfoResponseMessage>(
        1036, _omitFieldNames ? '' : 'getBlockDagInfoResponse',
        protoName: 'getBlockDagInfoResponse',
        subBuilder: $1.GetBlockDagInfoResponseMessage.create)
    ..aOM<$1.ResolveFinalityConflictResponseMessage>(
        1038, _omitFieldNames ? '' : 'resolveFinalityConflictResponse',
        protoName: 'resolveFinalityConflictResponse',
        subBuilder: $1.ResolveFinalityConflictResponseMessage.create)
    ..aOM<$1.NotifyFinalityConflictResponseMessage>(
        1040, _omitFieldNames ? '' : 'notifyFinalityConflictResponse',
        protoName: 'notifyFinalityConflictResponse',
        subBuilder: $1.NotifyFinalityConflictResponseMessage.create)
    ..aOM<$1.FinalityConflictNotificationMessage>(
        1041, _omitFieldNames ? '' : 'finalityConflictNotification',
        protoName: 'finalityConflictNotification',
        subBuilder: $1.FinalityConflictNotificationMessage.create)
    ..aOM<$1.FinalityConflictResolvedNotificationMessage>(
        1042, _omitFieldNames ? '' : 'finalityConflictResolvedNotification',
        protoName: 'finalityConflictResolvedNotification',
        subBuilder: $1.FinalityConflictResolvedNotificationMessage.create)
    ..aOM<$1.GetMempoolEntriesResponseMessage>(
        1044, _omitFieldNames ? '' : 'getMempoolEntriesResponse',
        protoName: 'getMempoolEntriesResponse',
        subBuilder: $1.GetMempoolEntriesResponseMessage.create)
    ..aOM<$1.ShutdownResponseMessage>(
        1046, _omitFieldNames ? '' : 'shutdownResponse',
        protoName: 'shutdownResponse',
        subBuilder: $1.ShutdownResponseMessage.create)
    ..aOM<$1.GetHeadersResponseMessage>(
        1048, _omitFieldNames ? '' : 'getHeadersResponse',
        protoName: 'getHeadersResponse',
        subBuilder: $1.GetHeadersResponseMessage.create)
    ..aOM<$1.NotifyUtxosChangedResponseMessage>(
        1050, _omitFieldNames ? '' : 'notifyUtxosChangedResponse',
        protoName: 'notifyUtxosChangedResponse',
        subBuilder: $1.NotifyUtxosChangedResponseMessage.create)
    ..aOM<$1.UtxosChangedNotificationMessage>(
        1051, _omitFieldNames ? '' : 'utxosChangedNotification',
        protoName: 'utxosChangedNotification',
        subBuilder: $1.UtxosChangedNotificationMessage.create)
    ..aOM<$1.GetUtxosByAddressesResponseMessage>(
        1053, _omitFieldNames ? '' : 'getUtxosByAddressesResponse',
        protoName: 'getUtxosByAddressesResponse',
        subBuilder: $1.GetUtxosByAddressesResponseMessage.create)
    ..aOM<$1.GetSinkBlueScoreResponseMessage>(
        1055, _omitFieldNames ? '' : 'getSinkBlueScoreResponse',
        protoName: 'getSinkBlueScoreResponse',
        subBuilder: $1.GetSinkBlueScoreResponseMessage.create)
    ..aOM<$1.NotifySinkBlueScoreChangedResponseMessage>(
        1057, _omitFieldNames ? '' : 'notifySinkBlueScoreChangedResponse',
        protoName: 'notifySinkBlueScoreChangedResponse',
        subBuilder: $1.NotifySinkBlueScoreChangedResponseMessage.create)
    ..aOM<$1.SinkBlueScoreChangedNotificationMessage>(
        1058, _omitFieldNames ? '' : 'sinkBlueScoreChangedNotification',
        protoName: 'sinkBlueScoreChangedNotification',
        subBuilder: $1.SinkBlueScoreChangedNotificationMessage.create)
    ..aOM<$1.BanResponseMessage>(1060, _omitFieldNames ? '' : 'banResponse',
        protoName: 'banResponse', subBuilder: $1.BanResponseMessage.create)
    ..aOM<$1.UnbanResponseMessage>(1062, _omitFieldNames ? '' : 'unbanResponse',
        protoName: 'unbanResponse', subBuilder: $1.UnbanResponseMessage.create)
    ..aOM<$1.GetInfoResponseMessage>(
        1064, _omitFieldNames ? '' : 'getInfoResponse',
        protoName: 'getInfoResponse',
        subBuilder: $1.GetInfoResponseMessage.create)
    ..aOM<$1.StopNotifyingUtxosChangedResponseMessage>(
        1066, _omitFieldNames ? '' : 'stopNotifyingUtxosChangedResponse',
        protoName: 'stopNotifyingUtxosChangedResponse',
        subBuilder: $1.StopNotifyingUtxosChangedResponseMessage.create)
    ..aOM<$1.NotifyPruningPointUtxoSetOverrideResponseMessage>(1068,
        _omitFieldNames ? '' : 'notifyPruningPointUtxoSetOverrideResponse',
        protoName: 'notifyPruningPointUtxoSetOverrideResponse',
        subBuilder: $1.NotifyPruningPointUtxoSetOverrideResponseMessage.create)
    ..aOM<$1.PruningPointUtxoSetOverrideNotificationMessage>(
        1069, _omitFieldNames ? '' : 'pruningPointUtxoSetOverrideNotification',
        protoName: 'pruningPointUtxoSetOverrideNotification',
        subBuilder: $1.PruningPointUtxoSetOverrideNotificationMessage.create)
    ..aOM<$1.StopNotifyingPruningPointUtxoSetOverrideResponseMessage>(
        1071,
        _omitFieldNames
            ? ''
            : 'stopNotifyingPruningPointUtxoSetOverrideResponse',
        protoName: 'stopNotifyingPruningPointUtxoSetOverrideResponse',
        subBuilder:
            $1.StopNotifyingPruningPointUtxoSetOverrideResponseMessage.create)
    ..aOM<$1.EstimateNetworkHashesPerSecondResponseMessage>(
        1073, _omitFieldNames ? '' : 'estimateNetworkHashesPerSecondResponse',
        protoName: 'estimateNetworkHashesPerSecondResponse',
        subBuilder: $1.EstimateNetworkHashesPerSecondResponseMessage.create)
    ..aOM<$1.NotifyVirtualDaaScoreChangedResponseMessage>(
        1075, _omitFieldNames ? '' : 'notifyVirtualDaaScoreChangedResponse',
        protoName: 'notifyVirtualDaaScoreChangedResponse',
        subBuilder: $1.NotifyVirtualDaaScoreChangedResponseMessage.create)
    ..aOM<$1.VirtualDaaScoreChangedNotificationMessage>(
        1076, _omitFieldNames ? '' : 'virtualDaaScoreChangedNotification',
        protoName: 'virtualDaaScoreChangedNotification',
        subBuilder: $1.VirtualDaaScoreChangedNotificationMessage.create)
    ..aOM<$1.GetBalanceByAddressResponseMessage>(
        1078, _omitFieldNames ? '' : 'getBalanceByAddressResponse',
        protoName: 'getBalanceByAddressResponse',
        subBuilder: $1.GetBalanceByAddressResponseMessage.create)
    ..aOM<$1.GetBalancesByAddressesResponseMessage>(
        1080, _omitFieldNames ? '' : 'getBalancesByAddressesResponse',
        protoName: 'getBalancesByAddressesResponse',
        subBuilder: $1.GetBalancesByAddressesResponseMessage.create)
    ..aOM<$1.NotifyNewBlockTemplateResponseMessage>(
        1082, _omitFieldNames ? '' : 'notifyNewBlockTemplateResponse',
        protoName: 'notifyNewBlockTemplateResponse',
        subBuilder: $1.NotifyNewBlockTemplateResponseMessage.create)
    ..aOM<$1.NewBlockTemplateNotificationMessage>(
        1083, _omitFieldNames ? '' : 'newBlockTemplateNotification',
        protoName: 'newBlockTemplateNotification',
        subBuilder: $1.NewBlockTemplateNotificationMessage.create)
    ..aOM<$1.GetMempoolEntriesByAddressesResponseMessage>(
        1085, _omitFieldNames ? '' : 'getMempoolEntriesByAddressesResponse',
        protoName: 'getMempoolEntriesByAddressesResponse',
        subBuilder: $1.GetMempoolEntriesByAddressesResponseMessage.create)
    ..aOM<$1.GetCoinSupplyResponseMessage>(
        1087, _omitFieldNames ? '' : 'getCoinSupplyResponse',
        protoName: 'getCoinSupplyResponse',
        subBuilder: $1.GetCoinSupplyResponseMessage.create)
    ..aOM<$1.PingResponseMessage>(1089, _omitFieldNames ? '' : 'pingResponse',
        protoName: 'pingResponse', subBuilder: $1.PingResponseMessage.create)
    ..aOM<$1.GetMetricsResponseMessage>(
        1091, _omitFieldNames ? '' : 'getMetricsResponse',
        protoName: 'getMetricsResponse',
        subBuilder: $1.GetMetricsResponseMessage.create)
    ..aOM<$1.GetServerInfoResponseMessage>(
        1093, _omitFieldNames ? '' : 'getServerInfoResponse',
        protoName: 'getServerInfoResponse',
        subBuilder: $1.GetServerInfoResponseMessage.create)
    ..aOM<$1.GetSyncStatusResponseMessage>(
        1095, _omitFieldNames ? '' : 'getSyncStatusResponse',
        protoName: 'getSyncStatusResponse',
        subBuilder: $1.GetSyncStatusResponseMessage.create)
    ..aOM<$1.GetDaaScoreTimestampEstimateResponseMessage>(
        1097, _omitFieldNames ? '' : 'getDaaScoreTimestampEstimateResponse',
        protoName: 'getDaaScoreTimestampEstimateResponse',
        subBuilder: $1.GetDaaScoreTimestampEstimateResponseMessage.create)
    ..aOM<$1.SubmitTransactionReplacementResponseMessage>(
        1101, _omitFieldNames ? '' : 'submitTransactionReplacementResponse',
        protoName: 'submitTransactionReplacementResponse',
        subBuilder: $1.SubmitTransactionReplacementResponseMessage.create)
    ..aOM<$1.GetConnectionsResponseMessage>(
        1103, _omitFieldNames ? '' : 'getConnectionsResponse',
        protoName: 'getConnectionsResponse',
        subBuilder: $1.GetConnectionsResponseMessage.create)
    ..aOM<$1.GetSystemInfoResponseMessage>(
        1105, _omitFieldNames ? '' : 'getSystemInfoResponse',
        protoName: 'getSystemInfoResponse',
        subBuilder: $1.GetSystemInfoResponseMessage.create)
    ..aOM<$1.GetFeeEstimateResponseMessage>(
        1107, _omitFieldNames ? '' : 'getFeeEstimateResponse',
        protoName: 'getFeeEstimateResponse',
        subBuilder: $1.GetFeeEstimateResponseMessage.create)
    ..aOM<$1.GetFeeEstimateExperimentalResponseMessage>(
        1109, _omitFieldNames ? '' : 'getFeeEstimateExperimentalResponse',
        protoName: 'getFeeEstimateExperimentalResponse',
        subBuilder: $1.GetFeeEstimateExperimentalResponseMessage.create)
    ..aOM<$1.GetCurrentBlockColorResponseMessage>(
        1111, _omitFieldNames ? '' : 'getCurrentBlockColorResponse',
        protoName: 'getCurrentBlockColorResponse',
        subBuilder: $1.GetCurrentBlockColorResponseMessage.create)
    ..aOM<$1.GetUtxoReturnAddressResponseMessage>(
        1113, _omitFieldNames ? '' : 'getUtxoReturnAddressResponse',
        protoName: 'getUtxoReturnAddressResponse',
        subBuilder: $1.GetUtxoReturnAddressResponseMessage.create)
    ..aOM<$1.GetVirtualChainFromBlockV2ResponseMessage>(
        1115, _omitFieldNames ? '' : 'getVirtualChainFromBlockV2Response',
        protoName: 'getVirtualChainFromBlockV2Response',
        subBuilder: $1.GetVirtualChainFromBlockV2ResponseMessage.create)
    ..aOM<$1.GetBlockRewardInfoResponseMessage>(
        1117, _omitFieldNames ? '' : 'getBlockRewardInfoResponse',
        protoName: 'getBlockRewardInfoResponse',
        subBuilder: $1.GetBlockRewardInfoResponseMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KaspadResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KaspadResponse copyWith(void Function(KaspadResponse) updates) =>
      super.copyWith((message) => updates(message as KaspadResponse))
          as KaspadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KaspadResponse create() => KaspadResponse._();
  @$core.override
  KaspadResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KaspadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaspadResponse>(create);
  static KaspadResponse? _defaultInstance;

  @$pb.TagNumber(1002)
  @$pb.TagNumber(1004)
  @$pb.TagNumber(1006)
  @$pb.TagNumber(1008)
  @$pb.TagNumber(1009)
  @$pb.TagNumber(1011)
  @$pb.TagNumber(1013)
  @$pb.TagNumber(1015)
  @$pb.TagNumber(1017)
  @$pb.TagNumber(1019)
  @$pb.TagNumber(1021)
  @$pb.TagNumber(1023)
  @$pb.TagNumber(1024)
  @$pb.TagNumber(1026)
  @$pb.TagNumber(1028)
  @$pb.TagNumber(1030)
  @$pb.TagNumber(1032)
  @$pb.TagNumber(1034)
  @$pb.TagNumber(1036)
  @$pb.TagNumber(1038)
  @$pb.TagNumber(1040)
  @$pb.TagNumber(1041)
  @$pb.TagNumber(1042)
  @$pb.TagNumber(1044)
  @$pb.TagNumber(1046)
  @$pb.TagNumber(1048)
  @$pb.TagNumber(1050)
  @$pb.TagNumber(1051)
  @$pb.TagNumber(1053)
  @$pb.TagNumber(1055)
  @$pb.TagNumber(1057)
  @$pb.TagNumber(1058)
  @$pb.TagNumber(1060)
  @$pb.TagNumber(1062)
  @$pb.TagNumber(1064)
  @$pb.TagNumber(1066)
  @$pb.TagNumber(1068)
  @$pb.TagNumber(1069)
  @$pb.TagNumber(1071)
  @$pb.TagNumber(1073)
  @$pb.TagNumber(1075)
  @$pb.TagNumber(1076)
  @$pb.TagNumber(1078)
  @$pb.TagNumber(1080)
  @$pb.TagNumber(1082)
  @$pb.TagNumber(1083)
  @$pb.TagNumber(1085)
  @$pb.TagNumber(1087)
  @$pb.TagNumber(1089)
  @$pb.TagNumber(1091)
  @$pb.TagNumber(1093)
  @$pb.TagNumber(1095)
  @$pb.TagNumber(1097)
  @$pb.TagNumber(1101)
  @$pb.TagNumber(1103)
  @$pb.TagNumber(1105)
  @$pb.TagNumber(1107)
  @$pb.TagNumber(1109)
  @$pb.TagNumber(1111)
  @$pb.TagNumber(1113)
  @$pb.TagNumber(1115)
  @$pb.TagNumber(1117)
  KaspadResponse_Payload whichPayload() =>
      _KaspadResponse_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1002)
  @$pb.TagNumber(1004)
  @$pb.TagNumber(1006)
  @$pb.TagNumber(1008)
  @$pb.TagNumber(1009)
  @$pb.TagNumber(1011)
  @$pb.TagNumber(1013)
  @$pb.TagNumber(1015)
  @$pb.TagNumber(1017)
  @$pb.TagNumber(1019)
  @$pb.TagNumber(1021)
  @$pb.TagNumber(1023)
  @$pb.TagNumber(1024)
  @$pb.TagNumber(1026)
  @$pb.TagNumber(1028)
  @$pb.TagNumber(1030)
  @$pb.TagNumber(1032)
  @$pb.TagNumber(1034)
  @$pb.TagNumber(1036)
  @$pb.TagNumber(1038)
  @$pb.TagNumber(1040)
  @$pb.TagNumber(1041)
  @$pb.TagNumber(1042)
  @$pb.TagNumber(1044)
  @$pb.TagNumber(1046)
  @$pb.TagNumber(1048)
  @$pb.TagNumber(1050)
  @$pb.TagNumber(1051)
  @$pb.TagNumber(1053)
  @$pb.TagNumber(1055)
  @$pb.TagNumber(1057)
  @$pb.TagNumber(1058)
  @$pb.TagNumber(1060)
  @$pb.TagNumber(1062)
  @$pb.TagNumber(1064)
  @$pb.TagNumber(1066)
  @$pb.TagNumber(1068)
  @$pb.TagNumber(1069)
  @$pb.TagNumber(1071)
  @$pb.TagNumber(1073)
  @$pb.TagNumber(1075)
  @$pb.TagNumber(1076)
  @$pb.TagNumber(1078)
  @$pb.TagNumber(1080)
  @$pb.TagNumber(1082)
  @$pb.TagNumber(1083)
  @$pb.TagNumber(1085)
  @$pb.TagNumber(1087)
  @$pb.TagNumber(1089)
  @$pb.TagNumber(1091)
  @$pb.TagNumber(1093)
  @$pb.TagNumber(1095)
  @$pb.TagNumber(1097)
  @$pb.TagNumber(1101)
  @$pb.TagNumber(1103)
  @$pb.TagNumber(1105)
  @$pb.TagNumber(1107)
  @$pb.TagNumber(1109)
  @$pb.TagNumber(1111)
  @$pb.TagNumber(1113)
  @$pb.TagNumber(1115)
  @$pb.TagNumber(1117)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(101)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(101)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(101)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(101)
  void clearId() => $_clearField(101);

  @$pb.TagNumber(1002)
  $1.GetCurrentNetworkResponseMessage get getCurrentNetworkResponse =>
      $_getN(1);
  @$pb.TagNumber(1002)
  set getCurrentNetworkResponse($1.GetCurrentNetworkResponseMessage value) =>
      $_setField(1002, value);
  @$pb.TagNumber(1002)
  $core.bool hasGetCurrentNetworkResponse() => $_has(1);
  @$pb.TagNumber(1002)
  void clearGetCurrentNetworkResponse() => $_clearField(1002);
  @$pb.TagNumber(1002)
  $1.GetCurrentNetworkResponseMessage ensureGetCurrentNetworkResponse() =>
      $_ensure(1);

  @$pb.TagNumber(1004)
  $1.SubmitBlockResponseMessage get submitBlockResponse => $_getN(2);
  @$pb.TagNumber(1004)
  set submitBlockResponse($1.SubmitBlockResponseMessage value) =>
      $_setField(1004, value);
  @$pb.TagNumber(1004)
  $core.bool hasSubmitBlockResponse() => $_has(2);
  @$pb.TagNumber(1004)
  void clearSubmitBlockResponse() => $_clearField(1004);
  @$pb.TagNumber(1004)
  $1.SubmitBlockResponseMessage ensureSubmitBlockResponse() => $_ensure(2);

  @$pb.TagNumber(1006)
  $1.GetBlockTemplateResponseMessage get getBlockTemplateResponse => $_getN(3);
  @$pb.TagNumber(1006)
  set getBlockTemplateResponse($1.GetBlockTemplateResponseMessage value) =>
      $_setField(1006, value);
  @$pb.TagNumber(1006)
  $core.bool hasGetBlockTemplateResponse() => $_has(3);
  @$pb.TagNumber(1006)
  void clearGetBlockTemplateResponse() => $_clearField(1006);
  @$pb.TagNumber(1006)
  $1.GetBlockTemplateResponseMessage ensureGetBlockTemplateResponse() =>
      $_ensure(3);

  @$pb.TagNumber(1008)
  $1.NotifyBlockAddedResponseMessage get notifyBlockAddedResponse => $_getN(4);
  @$pb.TagNumber(1008)
  set notifyBlockAddedResponse($1.NotifyBlockAddedResponseMessage value) =>
      $_setField(1008, value);
  @$pb.TagNumber(1008)
  $core.bool hasNotifyBlockAddedResponse() => $_has(4);
  @$pb.TagNumber(1008)
  void clearNotifyBlockAddedResponse() => $_clearField(1008);
  @$pb.TagNumber(1008)
  $1.NotifyBlockAddedResponseMessage ensureNotifyBlockAddedResponse() =>
      $_ensure(4);

  @$pb.TagNumber(1009)
  $1.BlockAddedNotificationMessage get blockAddedNotification => $_getN(5);
  @$pb.TagNumber(1009)
  set blockAddedNotification($1.BlockAddedNotificationMessage value) =>
      $_setField(1009, value);
  @$pb.TagNumber(1009)
  $core.bool hasBlockAddedNotification() => $_has(5);
  @$pb.TagNumber(1009)
  void clearBlockAddedNotification() => $_clearField(1009);
  @$pb.TagNumber(1009)
  $1.BlockAddedNotificationMessage ensureBlockAddedNotification() =>
      $_ensure(5);

  @$pb.TagNumber(1011)
  $1.GetPeerAddressesResponseMessage get getPeerAddressesResponse => $_getN(6);
  @$pb.TagNumber(1011)
  set getPeerAddressesResponse($1.GetPeerAddressesResponseMessage value) =>
      $_setField(1011, value);
  @$pb.TagNumber(1011)
  $core.bool hasGetPeerAddressesResponse() => $_has(6);
  @$pb.TagNumber(1011)
  void clearGetPeerAddressesResponse() => $_clearField(1011);
  @$pb.TagNumber(1011)
  $1.GetPeerAddressesResponseMessage ensureGetPeerAddressesResponse() =>
      $_ensure(6);

  @$pb.TagNumber(1013)
  $1.GetSinkResponseMessage get getSinkResponse => $_getN(7);
  @$pb.TagNumber(1013)
  set getSinkResponse($1.GetSinkResponseMessage value) =>
      $_setField(1013, value);
  @$pb.TagNumber(1013)
  $core.bool hasGetSinkResponse() => $_has(7);
  @$pb.TagNumber(1013)
  void clearGetSinkResponse() => $_clearField(1013);
  @$pb.TagNumber(1013)
  $1.GetSinkResponseMessage ensureGetSinkResponse() => $_ensure(7);

  @$pb.TagNumber(1015)
  $1.GetMempoolEntryResponseMessage get getMempoolEntryResponse => $_getN(8);
  @$pb.TagNumber(1015)
  set getMempoolEntryResponse($1.GetMempoolEntryResponseMessage value) =>
      $_setField(1015, value);
  @$pb.TagNumber(1015)
  $core.bool hasGetMempoolEntryResponse() => $_has(8);
  @$pb.TagNumber(1015)
  void clearGetMempoolEntryResponse() => $_clearField(1015);
  @$pb.TagNumber(1015)
  $1.GetMempoolEntryResponseMessage ensureGetMempoolEntryResponse() =>
      $_ensure(8);

  @$pb.TagNumber(1017)
  $1.GetConnectedPeerInfoResponseMessage get getConnectedPeerInfoResponse =>
      $_getN(9);
  @$pb.TagNumber(1017)
  set getConnectedPeerInfoResponse(
          $1.GetConnectedPeerInfoResponseMessage value) =>
      $_setField(1017, value);
  @$pb.TagNumber(1017)
  $core.bool hasGetConnectedPeerInfoResponse() => $_has(9);
  @$pb.TagNumber(1017)
  void clearGetConnectedPeerInfoResponse() => $_clearField(1017);
  @$pb.TagNumber(1017)
  $1.GetConnectedPeerInfoResponseMessage ensureGetConnectedPeerInfoResponse() =>
      $_ensure(9);

  @$pb.TagNumber(1019)
  $1.AddPeerResponseMessage get addPeerResponse => $_getN(10);
  @$pb.TagNumber(1019)
  set addPeerResponse($1.AddPeerResponseMessage value) =>
      $_setField(1019, value);
  @$pb.TagNumber(1019)
  $core.bool hasAddPeerResponse() => $_has(10);
  @$pb.TagNumber(1019)
  void clearAddPeerResponse() => $_clearField(1019);
  @$pb.TagNumber(1019)
  $1.AddPeerResponseMessage ensureAddPeerResponse() => $_ensure(10);

  @$pb.TagNumber(1021)
  $1.SubmitTransactionResponseMessage get submitTransactionResponse =>
      $_getN(11);
  @$pb.TagNumber(1021)
  set submitTransactionResponse($1.SubmitTransactionResponseMessage value) =>
      $_setField(1021, value);
  @$pb.TagNumber(1021)
  $core.bool hasSubmitTransactionResponse() => $_has(11);
  @$pb.TagNumber(1021)
  void clearSubmitTransactionResponse() => $_clearField(1021);
  @$pb.TagNumber(1021)
  $1.SubmitTransactionResponseMessage ensureSubmitTransactionResponse() =>
      $_ensure(11);

  @$pb.TagNumber(1023)
  $1.NotifyVirtualChainChangedResponseMessage
      get notifyVirtualChainChangedResponse => $_getN(12);
  @$pb.TagNumber(1023)
  set notifyVirtualChainChangedResponse(
          $1.NotifyVirtualChainChangedResponseMessage value) =>
      $_setField(1023, value);
  @$pb.TagNumber(1023)
  $core.bool hasNotifyVirtualChainChangedResponse() => $_has(12);
  @$pb.TagNumber(1023)
  void clearNotifyVirtualChainChangedResponse() => $_clearField(1023);
  @$pb.TagNumber(1023)
  $1.NotifyVirtualChainChangedResponseMessage
      ensureNotifyVirtualChainChangedResponse() => $_ensure(12);

  @$pb.TagNumber(1024)
  $1.VirtualChainChangedNotificationMessage
      get virtualChainChangedNotification => $_getN(13);
  @$pb.TagNumber(1024)
  set virtualChainChangedNotification(
          $1.VirtualChainChangedNotificationMessage value) =>
      $_setField(1024, value);
  @$pb.TagNumber(1024)
  $core.bool hasVirtualChainChangedNotification() => $_has(13);
  @$pb.TagNumber(1024)
  void clearVirtualChainChangedNotification() => $_clearField(1024);
  @$pb.TagNumber(1024)
  $1.VirtualChainChangedNotificationMessage
      ensureVirtualChainChangedNotification() => $_ensure(13);

  @$pb.TagNumber(1026)
  $1.GetBlockResponseMessage get getBlockResponse => $_getN(14);
  @$pb.TagNumber(1026)
  set getBlockResponse($1.GetBlockResponseMessage value) =>
      $_setField(1026, value);
  @$pb.TagNumber(1026)
  $core.bool hasGetBlockResponse() => $_has(14);
  @$pb.TagNumber(1026)
  void clearGetBlockResponse() => $_clearField(1026);
  @$pb.TagNumber(1026)
  $1.GetBlockResponseMessage ensureGetBlockResponse() => $_ensure(14);

  @$pb.TagNumber(1028)
  $1.GetSubnetworkResponseMessage get getSubnetworkResponse => $_getN(15);
  @$pb.TagNumber(1028)
  set getSubnetworkResponse($1.GetSubnetworkResponseMessage value) =>
      $_setField(1028, value);
  @$pb.TagNumber(1028)
  $core.bool hasGetSubnetworkResponse() => $_has(15);
  @$pb.TagNumber(1028)
  void clearGetSubnetworkResponse() => $_clearField(1028);
  @$pb.TagNumber(1028)
  $1.GetSubnetworkResponseMessage ensureGetSubnetworkResponse() => $_ensure(15);

  @$pb.TagNumber(1030)
  $1.GetVirtualChainFromBlockResponseMessage
      get getVirtualChainFromBlockResponse => $_getN(16);
  @$pb.TagNumber(1030)
  set getVirtualChainFromBlockResponse(
          $1.GetVirtualChainFromBlockResponseMessage value) =>
      $_setField(1030, value);
  @$pb.TagNumber(1030)
  $core.bool hasGetVirtualChainFromBlockResponse() => $_has(16);
  @$pb.TagNumber(1030)
  void clearGetVirtualChainFromBlockResponse() => $_clearField(1030);
  @$pb.TagNumber(1030)
  $1.GetVirtualChainFromBlockResponseMessage
      ensureGetVirtualChainFromBlockResponse() => $_ensure(16);

  @$pb.TagNumber(1032)
  $1.GetBlocksResponseMessage get getBlocksResponse => $_getN(17);
  @$pb.TagNumber(1032)
  set getBlocksResponse($1.GetBlocksResponseMessage value) =>
      $_setField(1032, value);
  @$pb.TagNumber(1032)
  $core.bool hasGetBlocksResponse() => $_has(17);
  @$pb.TagNumber(1032)
  void clearGetBlocksResponse() => $_clearField(1032);
  @$pb.TagNumber(1032)
  $1.GetBlocksResponseMessage ensureGetBlocksResponse() => $_ensure(17);

  @$pb.TagNumber(1034)
  $1.GetBlockCountResponseMessage get getBlockCountResponse => $_getN(18);
  @$pb.TagNumber(1034)
  set getBlockCountResponse($1.GetBlockCountResponseMessage value) =>
      $_setField(1034, value);
  @$pb.TagNumber(1034)
  $core.bool hasGetBlockCountResponse() => $_has(18);
  @$pb.TagNumber(1034)
  void clearGetBlockCountResponse() => $_clearField(1034);
  @$pb.TagNumber(1034)
  $1.GetBlockCountResponseMessage ensureGetBlockCountResponse() => $_ensure(18);

  @$pb.TagNumber(1036)
  $1.GetBlockDagInfoResponseMessage get getBlockDagInfoResponse => $_getN(19);
  @$pb.TagNumber(1036)
  set getBlockDagInfoResponse($1.GetBlockDagInfoResponseMessage value) =>
      $_setField(1036, value);
  @$pb.TagNumber(1036)
  $core.bool hasGetBlockDagInfoResponse() => $_has(19);
  @$pb.TagNumber(1036)
  void clearGetBlockDagInfoResponse() => $_clearField(1036);
  @$pb.TagNumber(1036)
  $1.GetBlockDagInfoResponseMessage ensureGetBlockDagInfoResponse() =>
      $_ensure(19);

  @$pb.TagNumber(1038)
  $1.ResolveFinalityConflictResponseMessage
      get resolveFinalityConflictResponse => $_getN(20);
  @$pb.TagNumber(1038)
  set resolveFinalityConflictResponse(
          $1.ResolveFinalityConflictResponseMessage value) =>
      $_setField(1038, value);
  @$pb.TagNumber(1038)
  $core.bool hasResolveFinalityConflictResponse() => $_has(20);
  @$pb.TagNumber(1038)
  void clearResolveFinalityConflictResponse() => $_clearField(1038);
  @$pb.TagNumber(1038)
  $1.ResolveFinalityConflictResponseMessage
      ensureResolveFinalityConflictResponse() => $_ensure(20);

  @$pb.TagNumber(1040)
  $1.NotifyFinalityConflictResponseMessage get notifyFinalityConflictResponse =>
      $_getN(21);
  @$pb.TagNumber(1040)
  set notifyFinalityConflictResponse(
          $1.NotifyFinalityConflictResponseMessage value) =>
      $_setField(1040, value);
  @$pb.TagNumber(1040)
  $core.bool hasNotifyFinalityConflictResponse() => $_has(21);
  @$pb.TagNumber(1040)
  void clearNotifyFinalityConflictResponse() => $_clearField(1040);
  @$pb.TagNumber(1040)
  $1.NotifyFinalityConflictResponseMessage
      ensureNotifyFinalityConflictResponse() => $_ensure(21);

  @$pb.TagNumber(1041)
  $1.FinalityConflictNotificationMessage get finalityConflictNotification =>
      $_getN(22);
  @$pb.TagNumber(1041)
  set finalityConflictNotification(
          $1.FinalityConflictNotificationMessage value) =>
      $_setField(1041, value);
  @$pb.TagNumber(1041)
  $core.bool hasFinalityConflictNotification() => $_has(22);
  @$pb.TagNumber(1041)
  void clearFinalityConflictNotification() => $_clearField(1041);
  @$pb.TagNumber(1041)
  $1.FinalityConflictNotificationMessage ensureFinalityConflictNotification() =>
      $_ensure(22);

  @$pb.TagNumber(1042)
  $1.FinalityConflictResolvedNotificationMessage
      get finalityConflictResolvedNotification => $_getN(23);
  @$pb.TagNumber(1042)
  set finalityConflictResolvedNotification(
          $1.FinalityConflictResolvedNotificationMessage value) =>
      $_setField(1042, value);
  @$pb.TagNumber(1042)
  $core.bool hasFinalityConflictResolvedNotification() => $_has(23);
  @$pb.TagNumber(1042)
  void clearFinalityConflictResolvedNotification() => $_clearField(1042);
  @$pb.TagNumber(1042)
  $1.FinalityConflictResolvedNotificationMessage
      ensureFinalityConflictResolvedNotification() => $_ensure(23);

  @$pb.TagNumber(1044)
  $1.GetMempoolEntriesResponseMessage get getMempoolEntriesResponse =>
      $_getN(24);
  @$pb.TagNumber(1044)
  set getMempoolEntriesResponse($1.GetMempoolEntriesResponseMessage value) =>
      $_setField(1044, value);
  @$pb.TagNumber(1044)
  $core.bool hasGetMempoolEntriesResponse() => $_has(24);
  @$pb.TagNumber(1044)
  void clearGetMempoolEntriesResponse() => $_clearField(1044);
  @$pb.TagNumber(1044)
  $1.GetMempoolEntriesResponseMessage ensureGetMempoolEntriesResponse() =>
      $_ensure(24);

  @$pb.TagNumber(1046)
  $1.ShutdownResponseMessage get shutdownResponse => $_getN(25);
  @$pb.TagNumber(1046)
  set shutdownResponse($1.ShutdownResponseMessage value) =>
      $_setField(1046, value);
  @$pb.TagNumber(1046)
  $core.bool hasShutdownResponse() => $_has(25);
  @$pb.TagNumber(1046)
  void clearShutdownResponse() => $_clearField(1046);
  @$pb.TagNumber(1046)
  $1.ShutdownResponseMessage ensureShutdownResponse() => $_ensure(25);

  @$pb.TagNumber(1048)
  $1.GetHeadersResponseMessage get getHeadersResponse => $_getN(26);
  @$pb.TagNumber(1048)
  set getHeadersResponse($1.GetHeadersResponseMessage value) =>
      $_setField(1048, value);
  @$pb.TagNumber(1048)
  $core.bool hasGetHeadersResponse() => $_has(26);
  @$pb.TagNumber(1048)
  void clearGetHeadersResponse() => $_clearField(1048);
  @$pb.TagNumber(1048)
  $1.GetHeadersResponseMessage ensureGetHeadersResponse() => $_ensure(26);

  @$pb.TagNumber(1050)
  $1.NotifyUtxosChangedResponseMessage get notifyUtxosChangedResponse =>
      $_getN(27);
  @$pb.TagNumber(1050)
  set notifyUtxosChangedResponse($1.NotifyUtxosChangedResponseMessage value) =>
      $_setField(1050, value);
  @$pb.TagNumber(1050)
  $core.bool hasNotifyUtxosChangedResponse() => $_has(27);
  @$pb.TagNumber(1050)
  void clearNotifyUtxosChangedResponse() => $_clearField(1050);
  @$pb.TagNumber(1050)
  $1.NotifyUtxosChangedResponseMessage ensureNotifyUtxosChangedResponse() =>
      $_ensure(27);

  @$pb.TagNumber(1051)
  $1.UtxosChangedNotificationMessage get utxosChangedNotification => $_getN(28);
  @$pb.TagNumber(1051)
  set utxosChangedNotification($1.UtxosChangedNotificationMessage value) =>
      $_setField(1051, value);
  @$pb.TagNumber(1051)
  $core.bool hasUtxosChangedNotification() => $_has(28);
  @$pb.TagNumber(1051)
  void clearUtxosChangedNotification() => $_clearField(1051);
  @$pb.TagNumber(1051)
  $1.UtxosChangedNotificationMessage ensureUtxosChangedNotification() =>
      $_ensure(28);

  @$pb.TagNumber(1053)
  $1.GetUtxosByAddressesResponseMessage get getUtxosByAddressesResponse =>
      $_getN(29);
  @$pb.TagNumber(1053)
  set getUtxosByAddressesResponse(
          $1.GetUtxosByAddressesResponseMessage value) =>
      $_setField(1053, value);
  @$pb.TagNumber(1053)
  $core.bool hasGetUtxosByAddressesResponse() => $_has(29);
  @$pb.TagNumber(1053)
  void clearGetUtxosByAddressesResponse() => $_clearField(1053);
  @$pb.TagNumber(1053)
  $1.GetUtxosByAddressesResponseMessage ensureGetUtxosByAddressesResponse() =>
      $_ensure(29);

  @$pb.TagNumber(1055)
  $1.GetSinkBlueScoreResponseMessage get getSinkBlueScoreResponse => $_getN(30);
  @$pb.TagNumber(1055)
  set getSinkBlueScoreResponse($1.GetSinkBlueScoreResponseMessage value) =>
      $_setField(1055, value);
  @$pb.TagNumber(1055)
  $core.bool hasGetSinkBlueScoreResponse() => $_has(30);
  @$pb.TagNumber(1055)
  void clearGetSinkBlueScoreResponse() => $_clearField(1055);
  @$pb.TagNumber(1055)
  $1.GetSinkBlueScoreResponseMessage ensureGetSinkBlueScoreResponse() =>
      $_ensure(30);

  @$pb.TagNumber(1057)
  $1.NotifySinkBlueScoreChangedResponseMessage
      get notifySinkBlueScoreChangedResponse => $_getN(31);
  @$pb.TagNumber(1057)
  set notifySinkBlueScoreChangedResponse(
          $1.NotifySinkBlueScoreChangedResponseMessage value) =>
      $_setField(1057, value);
  @$pb.TagNumber(1057)
  $core.bool hasNotifySinkBlueScoreChangedResponse() => $_has(31);
  @$pb.TagNumber(1057)
  void clearNotifySinkBlueScoreChangedResponse() => $_clearField(1057);
  @$pb.TagNumber(1057)
  $1.NotifySinkBlueScoreChangedResponseMessage
      ensureNotifySinkBlueScoreChangedResponse() => $_ensure(31);

  @$pb.TagNumber(1058)
  $1.SinkBlueScoreChangedNotificationMessage
      get sinkBlueScoreChangedNotification => $_getN(32);
  @$pb.TagNumber(1058)
  set sinkBlueScoreChangedNotification(
          $1.SinkBlueScoreChangedNotificationMessage value) =>
      $_setField(1058, value);
  @$pb.TagNumber(1058)
  $core.bool hasSinkBlueScoreChangedNotification() => $_has(32);
  @$pb.TagNumber(1058)
  void clearSinkBlueScoreChangedNotification() => $_clearField(1058);
  @$pb.TagNumber(1058)
  $1.SinkBlueScoreChangedNotificationMessage
      ensureSinkBlueScoreChangedNotification() => $_ensure(32);

  @$pb.TagNumber(1060)
  $1.BanResponseMessage get banResponse => $_getN(33);
  @$pb.TagNumber(1060)
  set banResponse($1.BanResponseMessage value) => $_setField(1060, value);
  @$pb.TagNumber(1060)
  $core.bool hasBanResponse() => $_has(33);
  @$pb.TagNumber(1060)
  void clearBanResponse() => $_clearField(1060);
  @$pb.TagNumber(1060)
  $1.BanResponseMessage ensureBanResponse() => $_ensure(33);

  @$pb.TagNumber(1062)
  $1.UnbanResponseMessage get unbanResponse => $_getN(34);
  @$pb.TagNumber(1062)
  set unbanResponse($1.UnbanResponseMessage value) => $_setField(1062, value);
  @$pb.TagNumber(1062)
  $core.bool hasUnbanResponse() => $_has(34);
  @$pb.TagNumber(1062)
  void clearUnbanResponse() => $_clearField(1062);
  @$pb.TagNumber(1062)
  $1.UnbanResponseMessage ensureUnbanResponse() => $_ensure(34);

  @$pb.TagNumber(1064)
  $1.GetInfoResponseMessage get getInfoResponse => $_getN(35);
  @$pb.TagNumber(1064)
  set getInfoResponse($1.GetInfoResponseMessage value) =>
      $_setField(1064, value);
  @$pb.TagNumber(1064)
  $core.bool hasGetInfoResponse() => $_has(35);
  @$pb.TagNumber(1064)
  void clearGetInfoResponse() => $_clearField(1064);
  @$pb.TagNumber(1064)
  $1.GetInfoResponseMessage ensureGetInfoResponse() => $_ensure(35);

  @$pb.TagNumber(1066)
  $1.StopNotifyingUtxosChangedResponseMessage
      get stopNotifyingUtxosChangedResponse => $_getN(36);
  @$pb.TagNumber(1066)
  set stopNotifyingUtxosChangedResponse(
          $1.StopNotifyingUtxosChangedResponseMessage value) =>
      $_setField(1066, value);
  @$pb.TagNumber(1066)
  $core.bool hasStopNotifyingUtxosChangedResponse() => $_has(36);
  @$pb.TagNumber(1066)
  void clearStopNotifyingUtxosChangedResponse() => $_clearField(1066);
  @$pb.TagNumber(1066)
  $1.StopNotifyingUtxosChangedResponseMessage
      ensureStopNotifyingUtxosChangedResponse() => $_ensure(36);

  @$pb.TagNumber(1068)
  $1.NotifyPruningPointUtxoSetOverrideResponseMessage
      get notifyPruningPointUtxoSetOverrideResponse => $_getN(37);
  @$pb.TagNumber(1068)
  set notifyPruningPointUtxoSetOverrideResponse(
          $1.NotifyPruningPointUtxoSetOverrideResponseMessage value) =>
      $_setField(1068, value);
  @$pb.TagNumber(1068)
  $core.bool hasNotifyPruningPointUtxoSetOverrideResponse() => $_has(37);
  @$pb.TagNumber(1068)
  void clearNotifyPruningPointUtxoSetOverrideResponse() => $_clearField(1068);
  @$pb.TagNumber(1068)
  $1.NotifyPruningPointUtxoSetOverrideResponseMessage
      ensureNotifyPruningPointUtxoSetOverrideResponse() => $_ensure(37);

  @$pb.TagNumber(1069)
  $1.PruningPointUtxoSetOverrideNotificationMessage
      get pruningPointUtxoSetOverrideNotification => $_getN(38);
  @$pb.TagNumber(1069)
  set pruningPointUtxoSetOverrideNotification(
          $1.PruningPointUtxoSetOverrideNotificationMessage value) =>
      $_setField(1069, value);
  @$pb.TagNumber(1069)
  $core.bool hasPruningPointUtxoSetOverrideNotification() => $_has(38);
  @$pb.TagNumber(1069)
  void clearPruningPointUtxoSetOverrideNotification() => $_clearField(1069);
  @$pb.TagNumber(1069)
  $1.PruningPointUtxoSetOverrideNotificationMessage
      ensurePruningPointUtxoSetOverrideNotification() => $_ensure(38);

  @$pb.TagNumber(1071)
  $1.StopNotifyingPruningPointUtxoSetOverrideResponseMessage
      get stopNotifyingPruningPointUtxoSetOverrideResponse => $_getN(39);
  @$pb.TagNumber(1071)
  set stopNotifyingPruningPointUtxoSetOverrideResponse(
          $1.StopNotifyingPruningPointUtxoSetOverrideResponseMessage value) =>
      $_setField(1071, value);
  @$pb.TagNumber(1071)
  $core.bool hasStopNotifyingPruningPointUtxoSetOverrideResponse() => $_has(39);
  @$pb.TagNumber(1071)
  void clearStopNotifyingPruningPointUtxoSetOverrideResponse() =>
      $_clearField(1071);
  @$pb.TagNumber(1071)
  $1.StopNotifyingPruningPointUtxoSetOverrideResponseMessage
      ensureStopNotifyingPruningPointUtxoSetOverrideResponse() => $_ensure(39);

  @$pb.TagNumber(1073)
  $1.EstimateNetworkHashesPerSecondResponseMessage
      get estimateNetworkHashesPerSecondResponse => $_getN(40);
  @$pb.TagNumber(1073)
  set estimateNetworkHashesPerSecondResponse(
          $1.EstimateNetworkHashesPerSecondResponseMessage value) =>
      $_setField(1073, value);
  @$pb.TagNumber(1073)
  $core.bool hasEstimateNetworkHashesPerSecondResponse() => $_has(40);
  @$pb.TagNumber(1073)
  void clearEstimateNetworkHashesPerSecondResponse() => $_clearField(1073);
  @$pb.TagNumber(1073)
  $1.EstimateNetworkHashesPerSecondResponseMessage
      ensureEstimateNetworkHashesPerSecondResponse() => $_ensure(40);

  @$pb.TagNumber(1075)
  $1.NotifyVirtualDaaScoreChangedResponseMessage
      get notifyVirtualDaaScoreChangedResponse => $_getN(41);
  @$pb.TagNumber(1075)
  set notifyVirtualDaaScoreChangedResponse(
          $1.NotifyVirtualDaaScoreChangedResponseMessage value) =>
      $_setField(1075, value);
  @$pb.TagNumber(1075)
  $core.bool hasNotifyVirtualDaaScoreChangedResponse() => $_has(41);
  @$pb.TagNumber(1075)
  void clearNotifyVirtualDaaScoreChangedResponse() => $_clearField(1075);
  @$pb.TagNumber(1075)
  $1.NotifyVirtualDaaScoreChangedResponseMessage
      ensureNotifyVirtualDaaScoreChangedResponse() => $_ensure(41);

  @$pb.TagNumber(1076)
  $1.VirtualDaaScoreChangedNotificationMessage
      get virtualDaaScoreChangedNotification => $_getN(42);
  @$pb.TagNumber(1076)
  set virtualDaaScoreChangedNotification(
          $1.VirtualDaaScoreChangedNotificationMessage value) =>
      $_setField(1076, value);
  @$pb.TagNumber(1076)
  $core.bool hasVirtualDaaScoreChangedNotification() => $_has(42);
  @$pb.TagNumber(1076)
  void clearVirtualDaaScoreChangedNotification() => $_clearField(1076);
  @$pb.TagNumber(1076)
  $1.VirtualDaaScoreChangedNotificationMessage
      ensureVirtualDaaScoreChangedNotification() => $_ensure(42);

  @$pb.TagNumber(1078)
  $1.GetBalanceByAddressResponseMessage get getBalanceByAddressResponse =>
      $_getN(43);
  @$pb.TagNumber(1078)
  set getBalanceByAddressResponse(
          $1.GetBalanceByAddressResponseMessage value) =>
      $_setField(1078, value);
  @$pb.TagNumber(1078)
  $core.bool hasGetBalanceByAddressResponse() => $_has(43);
  @$pb.TagNumber(1078)
  void clearGetBalanceByAddressResponse() => $_clearField(1078);
  @$pb.TagNumber(1078)
  $1.GetBalanceByAddressResponseMessage ensureGetBalanceByAddressResponse() =>
      $_ensure(43);

  @$pb.TagNumber(1080)
  $1.GetBalancesByAddressesResponseMessage get getBalancesByAddressesResponse =>
      $_getN(44);
  @$pb.TagNumber(1080)
  set getBalancesByAddressesResponse(
          $1.GetBalancesByAddressesResponseMessage value) =>
      $_setField(1080, value);
  @$pb.TagNumber(1080)
  $core.bool hasGetBalancesByAddressesResponse() => $_has(44);
  @$pb.TagNumber(1080)
  void clearGetBalancesByAddressesResponse() => $_clearField(1080);
  @$pb.TagNumber(1080)
  $1.GetBalancesByAddressesResponseMessage
      ensureGetBalancesByAddressesResponse() => $_ensure(44);

  @$pb.TagNumber(1082)
  $1.NotifyNewBlockTemplateResponseMessage get notifyNewBlockTemplateResponse =>
      $_getN(45);
  @$pb.TagNumber(1082)
  set notifyNewBlockTemplateResponse(
          $1.NotifyNewBlockTemplateResponseMessage value) =>
      $_setField(1082, value);
  @$pb.TagNumber(1082)
  $core.bool hasNotifyNewBlockTemplateResponse() => $_has(45);
  @$pb.TagNumber(1082)
  void clearNotifyNewBlockTemplateResponse() => $_clearField(1082);
  @$pb.TagNumber(1082)
  $1.NotifyNewBlockTemplateResponseMessage
      ensureNotifyNewBlockTemplateResponse() => $_ensure(45);

  @$pb.TagNumber(1083)
  $1.NewBlockTemplateNotificationMessage get newBlockTemplateNotification =>
      $_getN(46);
  @$pb.TagNumber(1083)
  set newBlockTemplateNotification(
          $1.NewBlockTemplateNotificationMessage value) =>
      $_setField(1083, value);
  @$pb.TagNumber(1083)
  $core.bool hasNewBlockTemplateNotification() => $_has(46);
  @$pb.TagNumber(1083)
  void clearNewBlockTemplateNotification() => $_clearField(1083);
  @$pb.TagNumber(1083)
  $1.NewBlockTemplateNotificationMessage ensureNewBlockTemplateNotification() =>
      $_ensure(46);

  @$pb.TagNumber(1085)
  $1.GetMempoolEntriesByAddressesResponseMessage
      get getMempoolEntriesByAddressesResponse => $_getN(47);
  @$pb.TagNumber(1085)
  set getMempoolEntriesByAddressesResponse(
          $1.GetMempoolEntriesByAddressesResponseMessage value) =>
      $_setField(1085, value);
  @$pb.TagNumber(1085)
  $core.bool hasGetMempoolEntriesByAddressesResponse() => $_has(47);
  @$pb.TagNumber(1085)
  void clearGetMempoolEntriesByAddressesResponse() => $_clearField(1085);
  @$pb.TagNumber(1085)
  $1.GetMempoolEntriesByAddressesResponseMessage
      ensureGetMempoolEntriesByAddressesResponse() => $_ensure(47);

  @$pb.TagNumber(1087)
  $1.GetCoinSupplyResponseMessage get getCoinSupplyResponse => $_getN(48);
  @$pb.TagNumber(1087)
  set getCoinSupplyResponse($1.GetCoinSupplyResponseMessage value) =>
      $_setField(1087, value);
  @$pb.TagNumber(1087)
  $core.bool hasGetCoinSupplyResponse() => $_has(48);
  @$pb.TagNumber(1087)
  void clearGetCoinSupplyResponse() => $_clearField(1087);
  @$pb.TagNumber(1087)
  $1.GetCoinSupplyResponseMessage ensureGetCoinSupplyResponse() => $_ensure(48);

  @$pb.TagNumber(1089)
  $1.PingResponseMessage get pingResponse => $_getN(49);
  @$pb.TagNumber(1089)
  set pingResponse($1.PingResponseMessage value) => $_setField(1089, value);
  @$pb.TagNumber(1089)
  $core.bool hasPingResponse() => $_has(49);
  @$pb.TagNumber(1089)
  void clearPingResponse() => $_clearField(1089);
  @$pb.TagNumber(1089)
  $1.PingResponseMessage ensurePingResponse() => $_ensure(49);

  @$pb.TagNumber(1091)
  $1.GetMetricsResponseMessage get getMetricsResponse => $_getN(50);
  @$pb.TagNumber(1091)
  set getMetricsResponse($1.GetMetricsResponseMessage value) =>
      $_setField(1091, value);
  @$pb.TagNumber(1091)
  $core.bool hasGetMetricsResponse() => $_has(50);
  @$pb.TagNumber(1091)
  void clearGetMetricsResponse() => $_clearField(1091);
  @$pb.TagNumber(1091)
  $1.GetMetricsResponseMessage ensureGetMetricsResponse() => $_ensure(50);

  @$pb.TagNumber(1093)
  $1.GetServerInfoResponseMessage get getServerInfoResponse => $_getN(51);
  @$pb.TagNumber(1093)
  set getServerInfoResponse($1.GetServerInfoResponseMessage value) =>
      $_setField(1093, value);
  @$pb.TagNumber(1093)
  $core.bool hasGetServerInfoResponse() => $_has(51);
  @$pb.TagNumber(1093)
  void clearGetServerInfoResponse() => $_clearField(1093);
  @$pb.TagNumber(1093)
  $1.GetServerInfoResponseMessage ensureGetServerInfoResponse() => $_ensure(51);

  @$pb.TagNumber(1095)
  $1.GetSyncStatusResponseMessage get getSyncStatusResponse => $_getN(52);
  @$pb.TagNumber(1095)
  set getSyncStatusResponse($1.GetSyncStatusResponseMessage value) =>
      $_setField(1095, value);
  @$pb.TagNumber(1095)
  $core.bool hasGetSyncStatusResponse() => $_has(52);
  @$pb.TagNumber(1095)
  void clearGetSyncStatusResponse() => $_clearField(1095);
  @$pb.TagNumber(1095)
  $1.GetSyncStatusResponseMessage ensureGetSyncStatusResponse() => $_ensure(52);

  @$pb.TagNumber(1097)
  $1.GetDaaScoreTimestampEstimateResponseMessage
      get getDaaScoreTimestampEstimateResponse => $_getN(53);
  @$pb.TagNumber(1097)
  set getDaaScoreTimestampEstimateResponse(
          $1.GetDaaScoreTimestampEstimateResponseMessage value) =>
      $_setField(1097, value);
  @$pb.TagNumber(1097)
  $core.bool hasGetDaaScoreTimestampEstimateResponse() => $_has(53);
  @$pb.TagNumber(1097)
  void clearGetDaaScoreTimestampEstimateResponse() => $_clearField(1097);
  @$pb.TagNumber(1097)
  $1.GetDaaScoreTimestampEstimateResponseMessage
      ensureGetDaaScoreTimestampEstimateResponse() => $_ensure(53);

  @$pb.TagNumber(1101)
  $1.SubmitTransactionReplacementResponseMessage
      get submitTransactionReplacementResponse => $_getN(54);
  @$pb.TagNumber(1101)
  set submitTransactionReplacementResponse(
          $1.SubmitTransactionReplacementResponseMessage value) =>
      $_setField(1101, value);
  @$pb.TagNumber(1101)
  $core.bool hasSubmitTransactionReplacementResponse() => $_has(54);
  @$pb.TagNumber(1101)
  void clearSubmitTransactionReplacementResponse() => $_clearField(1101);
  @$pb.TagNumber(1101)
  $1.SubmitTransactionReplacementResponseMessage
      ensureSubmitTransactionReplacementResponse() => $_ensure(54);

  @$pb.TagNumber(1103)
  $1.GetConnectionsResponseMessage get getConnectionsResponse => $_getN(55);
  @$pb.TagNumber(1103)
  set getConnectionsResponse($1.GetConnectionsResponseMessage value) =>
      $_setField(1103, value);
  @$pb.TagNumber(1103)
  $core.bool hasGetConnectionsResponse() => $_has(55);
  @$pb.TagNumber(1103)
  void clearGetConnectionsResponse() => $_clearField(1103);
  @$pb.TagNumber(1103)
  $1.GetConnectionsResponseMessage ensureGetConnectionsResponse() =>
      $_ensure(55);

  @$pb.TagNumber(1105)
  $1.GetSystemInfoResponseMessage get getSystemInfoResponse => $_getN(56);
  @$pb.TagNumber(1105)
  set getSystemInfoResponse($1.GetSystemInfoResponseMessage value) =>
      $_setField(1105, value);
  @$pb.TagNumber(1105)
  $core.bool hasGetSystemInfoResponse() => $_has(56);
  @$pb.TagNumber(1105)
  void clearGetSystemInfoResponse() => $_clearField(1105);
  @$pb.TagNumber(1105)
  $1.GetSystemInfoResponseMessage ensureGetSystemInfoResponse() => $_ensure(56);

  @$pb.TagNumber(1107)
  $1.GetFeeEstimateResponseMessage get getFeeEstimateResponse => $_getN(57);
  @$pb.TagNumber(1107)
  set getFeeEstimateResponse($1.GetFeeEstimateResponseMessage value) =>
      $_setField(1107, value);
  @$pb.TagNumber(1107)
  $core.bool hasGetFeeEstimateResponse() => $_has(57);
  @$pb.TagNumber(1107)
  void clearGetFeeEstimateResponse() => $_clearField(1107);
  @$pb.TagNumber(1107)
  $1.GetFeeEstimateResponseMessage ensureGetFeeEstimateResponse() =>
      $_ensure(57);

  @$pb.TagNumber(1109)
  $1.GetFeeEstimateExperimentalResponseMessage
      get getFeeEstimateExperimentalResponse => $_getN(58);
  @$pb.TagNumber(1109)
  set getFeeEstimateExperimentalResponse(
          $1.GetFeeEstimateExperimentalResponseMessage value) =>
      $_setField(1109, value);
  @$pb.TagNumber(1109)
  $core.bool hasGetFeeEstimateExperimentalResponse() => $_has(58);
  @$pb.TagNumber(1109)
  void clearGetFeeEstimateExperimentalResponse() => $_clearField(1109);
  @$pb.TagNumber(1109)
  $1.GetFeeEstimateExperimentalResponseMessage
      ensureGetFeeEstimateExperimentalResponse() => $_ensure(58);

  @$pb.TagNumber(1111)
  $1.GetCurrentBlockColorResponseMessage get getCurrentBlockColorResponse =>
      $_getN(59);
  @$pb.TagNumber(1111)
  set getCurrentBlockColorResponse(
          $1.GetCurrentBlockColorResponseMessage value) =>
      $_setField(1111, value);
  @$pb.TagNumber(1111)
  $core.bool hasGetCurrentBlockColorResponse() => $_has(59);
  @$pb.TagNumber(1111)
  void clearGetCurrentBlockColorResponse() => $_clearField(1111);
  @$pb.TagNumber(1111)
  $1.GetCurrentBlockColorResponseMessage ensureGetCurrentBlockColorResponse() =>
      $_ensure(59);

  @$pb.TagNumber(1113)
  $1.GetUtxoReturnAddressResponseMessage get getUtxoReturnAddressResponse =>
      $_getN(60);
  @$pb.TagNumber(1113)
  set getUtxoReturnAddressResponse(
          $1.GetUtxoReturnAddressResponseMessage value) =>
      $_setField(1113, value);
  @$pb.TagNumber(1113)
  $core.bool hasGetUtxoReturnAddressResponse() => $_has(60);
  @$pb.TagNumber(1113)
  void clearGetUtxoReturnAddressResponse() => $_clearField(1113);
  @$pb.TagNumber(1113)
  $1.GetUtxoReturnAddressResponseMessage ensureGetUtxoReturnAddressResponse() =>
      $_ensure(60);

  @$pb.TagNumber(1115)
  $1.GetVirtualChainFromBlockV2ResponseMessage
      get getVirtualChainFromBlockV2Response => $_getN(61);
  @$pb.TagNumber(1115)
  set getVirtualChainFromBlockV2Response(
          $1.GetVirtualChainFromBlockV2ResponseMessage value) =>
      $_setField(1115, value);
  @$pb.TagNumber(1115)
  $core.bool hasGetVirtualChainFromBlockV2Response() => $_has(61);
  @$pb.TagNumber(1115)
  void clearGetVirtualChainFromBlockV2Response() => $_clearField(1115);
  @$pb.TagNumber(1115)
  $1.GetVirtualChainFromBlockV2ResponseMessage
      ensureGetVirtualChainFromBlockV2Response() => $_ensure(61);

  @$pb.TagNumber(1117)
  $1.GetBlockRewardInfoResponseMessage get getBlockRewardInfoResponse =>
      $_getN(62);
  @$pb.TagNumber(1117)
  set getBlockRewardInfoResponse($1.GetBlockRewardInfoResponseMessage value) =>
      $_setField(1117, value);
  @$pb.TagNumber(1117)
  $core.bool hasGetBlockRewardInfoResponse() => $_has(62);
  @$pb.TagNumber(1117)
  void clearGetBlockRewardInfoResponse() => $_clearField(1117);
  @$pb.TagNumber(1117)
  $1.GetBlockRewardInfoResponseMessage ensureGetBlockRewardInfoResponse() =>
      $_ensure(62);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
