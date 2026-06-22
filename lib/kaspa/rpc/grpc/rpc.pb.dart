// This is a generated file - do not edit.
//
// Generated from rpc.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'rpc.pbenum.dart';

/// RPCError represents a generic non-internal error.
///
/// Receivers of any ResponseMessage are expected to check whether its error field is not null.
class RPCError extends $pb.GeneratedMessage {
  factory RPCError({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  RPCError._();

  factory RPCError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RPCError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RPCError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RPCError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RPCError copyWith(void Function(RPCError) updates) =>
      super.copyWith((message) => updates(message as RPCError)) as RPCError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RPCError create() => RPCError._();
  @$core.override
  RPCError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RPCError getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RPCError>(create);
  static RPCError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class RpcBlock extends $pb.GeneratedMessage {
  factory RpcBlock({
    RpcBlockHeader? header,
    $core.Iterable<RpcTransaction>? transactions,
    RpcBlockVerboseData? verboseData,
  }) {
    final result = create();
    if (header != null) result.header = header;
    if (transactions != null) result.transactions.addAll(transactions);
    if (verboseData != null) result.verboseData = verboseData;
    return result;
  }

  RpcBlock._();

  factory RpcBlock.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcBlock.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcBlock',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcBlockHeader>(1, _omitFieldNames ? '' : 'header',
        subBuilder: RpcBlockHeader.create)
    ..pPM<RpcTransaction>(2, _omitFieldNames ? '' : 'transactions',
        subBuilder: RpcTransaction.create)
    ..aOM<RpcBlockVerboseData>(3, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData', subBuilder: RpcBlockVerboseData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlock clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlock copyWith(void Function(RpcBlock) updates) =>
      super.copyWith((message) => updates(message as RpcBlock)) as RpcBlock;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcBlock create() => RpcBlock._();
  @$core.override
  RpcBlock createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcBlock getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RpcBlock>(create);
  static RpcBlock? _defaultInstance;

  @$pb.TagNumber(1)
  RpcBlockHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RpcBlockHeader value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcBlockHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<RpcTransaction> get transactions => $_getList(1);

  @$pb.TagNumber(3)
  RpcBlockVerboseData get verboseData => $_getN(2);
  @$pb.TagNumber(3)
  set verboseData(RpcBlockVerboseData value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVerboseData() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerboseData() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcBlockVerboseData ensureVerboseData() => $_ensure(2);
}

class RpcBlockHeader extends $pb.GeneratedMessage {
  factory RpcBlockHeader({
    $core.int? version,
    $core.String? hashMerkleRoot,
    $core.String? acceptedIdMerkleRoot,
    $core.String? utxoCommitment,
    $fixnum.Int64? timestamp,
    $core.int? bits,
    $fixnum.Int64? nonce,
    $fixnum.Int64? daaScore,
    $core.String? blueWork,
    $core.Iterable<RpcBlockLevelParents>? parents,
    $fixnum.Int64? blueScore,
    $core.String? pruningPoint,
    $core.String? hash,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (hashMerkleRoot != null) result.hashMerkleRoot = hashMerkleRoot;
    if (acceptedIdMerkleRoot != null)
      result.acceptedIdMerkleRoot = acceptedIdMerkleRoot;
    if (utxoCommitment != null) result.utxoCommitment = utxoCommitment;
    if (timestamp != null) result.timestamp = timestamp;
    if (bits != null) result.bits = bits;
    if (nonce != null) result.nonce = nonce;
    if (daaScore != null) result.daaScore = daaScore;
    if (blueWork != null) result.blueWork = blueWork;
    if (parents != null) result.parents.addAll(parents);
    if (blueScore != null) result.blueScore = blueScore;
    if (pruningPoint != null) result.pruningPoint = pruningPoint;
    if (hash != null) result.hash = hash;
    return result;
  }

  RpcBlockHeader._();

  factory RpcBlockHeader.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcBlockHeader.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcBlockHeader',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'hashMerkleRoot',
        protoName: 'hashMerkleRoot')
    ..aOS(4, _omitFieldNames ? '' : 'acceptedIdMerkleRoot',
        protoName: 'acceptedIdMerkleRoot')
    ..aOS(5, _omitFieldNames ? '' : 'utxoCommitment',
        protoName: 'utxoCommitment')
    ..aInt64(6, _omitFieldNames ? '' : 'timestamp')
    ..aI(7, _omitFieldNames ? '' : 'bits', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'daaScore', $pb.PbFieldType.OU6,
        protoName: 'daaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(10, _omitFieldNames ? '' : 'blueWork', protoName: 'blueWork')
    ..pPM<RpcBlockLevelParents>(12, _omitFieldNames ? '' : 'parents',
        subBuilder: RpcBlockLevelParents.create)
    ..a<$fixnum.Int64>(
        13, _omitFieldNames ? '' : 'blueScore', $pb.PbFieldType.OU6,
        protoName: 'blueScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(14, _omitFieldNames ? '' : 'pruningPoint', protoName: 'pruningPoint')
    ..aOS(15, _omitFieldNames ? '' : 'hash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockHeader clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockHeader copyWith(void Function(RpcBlockHeader) updates) =>
      super.copyWith((message) => updates(message as RpcBlockHeader))
          as RpcBlockHeader;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcBlockHeader create() => RpcBlockHeader._();
  @$core.override
  RpcBlockHeader createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcBlockHeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcBlockHeader>(create);
  static RpcBlockHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get hashMerkleRoot => $_getSZ(1);
  @$pb.TagNumber(3)
  set hashMerkleRoot($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasHashMerkleRoot() => $_has(1);
  @$pb.TagNumber(3)
  void clearHashMerkleRoot() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get acceptedIdMerkleRoot => $_getSZ(2);
  @$pb.TagNumber(4)
  set acceptedIdMerkleRoot($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasAcceptedIdMerkleRoot() => $_has(2);
  @$pb.TagNumber(4)
  void clearAcceptedIdMerkleRoot() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get utxoCommitment => $_getSZ(3);
  @$pb.TagNumber(5)
  set utxoCommitment($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasUtxoCommitment() => $_has(3);
  @$pb.TagNumber(5)
  void clearUtxoCommitment() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(6)
  set timestamp($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(6)
  void clearTimestamp() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get bits => $_getIZ(5);
  @$pb.TagNumber(7)
  set bits($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(7)
  $core.bool hasBits() => $_has(5);
  @$pb.TagNumber(7)
  void clearBits() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get nonce => $_getI64(6);
  @$pb.TagNumber(8)
  set nonce($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(8)
  $core.bool hasNonce() => $_has(6);
  @$pb.TagNumber(8)
  void clearNonce() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get daaScore => $_getI64(7);
  @$pb.TagNumber(9)
  set daaScore($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(9)
  $core.bool hasDaaScore() => $_has(7);
  @$pb.TagNumber(9)
  void clearDaaScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get blueWork => $_getSZ(8);
  @$pb.TagNumber(10)
  set blueWork($core.String value) => $_setString(8, value);
  @$pb.TagNumber(10)
  $core.bool hasBlueWork() => $_has(8);
  @$pb.TagNumber(10)
  void clearBlueWork() => $_clearField(10);

  @$pb.TagNumber(12)
  $pb.PbList<RpcBlockLevelParents> get parents => $_getList(9);

  @$pb.TagNumber(13)
  $fixnum.Int64 get blueScore => $_getI64(10);
  @$pb.TagNumber(13)
  set blueScore($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(13)
  $core.bool hasBlueScore() => $_has(10);
  @$pb.TagNumber(13)
  void clearBlueScore() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get pruningPoint => $_getSZ(11);
  @$pb.TagNumber(14)
  set pruningPoint($core.String value) => $_setString(11, value);
  @$pb.TagNumber(14)
  $core.bool hasPruningPoint() => $_has(11);
  @$pb.TagNumber(14)
  void clearPruningPoint() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get hash => $_getSZ(12);
  @$pb.TagNumber(15)
  set hash($core.String value) => $_setString(12, value);
  @$pb.TagNumber(15)
  $core.bool hasHash() => $_has(12);
  @$pb.TagNumber(15)
  void clearHash() => $_clearField(15);
}

class RpcBlockLevelParents extends $pb.GeneratedMessage {
  factory RpcBlockLevelParents({
    $core.Iterable<$core.String>? parentHashes,
  }) {
    final result = create();
    if (parentHashes != null) result.parentHashes.addAll(parentHashes);
    return result;
  }

  RpcBlockLevelParents._();

  factory RpcBlockLevelParents.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcBlockLevelParents.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcBlockLevelParents',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'parentHashes', protoName: 'parentHashes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockLevelParents clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockLevelParents copyWith(void Function(RpcBlockLevelParents) updates) =>
      super.copyWith((message) => updates(message as RpcBlockLevelParents))
          as RpcBlockLevelParents;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcBlockLevelParents create() => RpcBlockLevelParents._();
  @$core.override
  RpcBlockLevelParents createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcBlockLevelParents getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcBlockLevelParents>(create);
  static RpcBlockLevelParents? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get parentHashes => $_getList(0);
}

class RpcBlockLevelRun extends $pb.GeneratedMessage {
  factory RpcBlockLevelRun({
    $core.Iterable<$core.String>? parentHashes,
    $core.int? cumulativeLevel,
  }) {
    final result = create();
    if (parentHashes != null) result.parentHashes.addAll(parentHashes);
    if (cumulativeLevel != null) result.cumulativeLevel = cumulativeLevel;
    return result;
  }

  RpcBlockLevelRun._();

  factory RpcBlockLevelRun.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcBlockLevelRun.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcBlockLevelRun',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'parentHashes', protoName: 'parentHashes')
    ..aI(2, _omitFieldNames ? '' : 'cumulativeLevel',
        protoName: 'cumulativeLevel', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockLevelRun clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockLevelRun copyWith(void Function(RpcBlockLevelRun) updates) =>
      super.copyWith((message) => updates(message as RpcBlockLevelRun))
          as RpcBlockLevelRun;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcBlockLevelRun create() => RpcBlockLevelRun._();
  @$core.override
  RpcBlockLevelRun createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcBlockLevelRun getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcBlockLevelRun>(create);
  static RpcBlockLevelRun? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get parentHashes => $_getList(0);

  /// must be <= 255 (u8)
  @$pb.TagNumber(2)
  $core.int get cumulativeLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set cumulativeLevel($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCumulativeLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearCumulativeLevel() => $_clearField(2);
}

class RpcBlockVerboseData extends $pb.GeneratedMessage {
  factory RpcBlockVerboseData({
    $core.String? hash,
    $core.double? difficulty,
    $core.String? selectedParentHash,
    $core.Iterable<$core.String>? transactionIds,
    $core.bool? isHeaderOnly,
    $fixnum.Int64? blueScore,
    $core.Iterable<$core.String>? childrenHashes,
    $core.Iterable<$core.String>? mergeSetBluesHashes,
    $core.Iterable<$core.String>? mergeSetRedsHashes,
    $core.bool? isChainBlock,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (difficulty != null) result.difficulty = difficulty;
    if (selectedParentHash != null)
      result.selectedParentHash = selectedParentHash;
    if (transactionIds != null) result.transactionIds.addAll(transactionIds);
    if (isHeaderOnly != null) result.isHeaderOnly = isHeaderOnly;
    if (blueScore != null) result.blueScore = blueScore;
    if (childrenHashes != null) result.childrenHashes.addAll(childrenHashes);
    if (mergeSetBluesHashes != null)
      result.mergeSetBluesHashes.addAll(mergeSetBluesHashes);
    if (mergeSetRedsHashes != null)
      result.mergeSetRedsHashes.addAll(mergeSetRedsHashes);
    if (isChainBlock != null) result.isChainBlock = isChainBlock;
    return result;
  }

  RpcBlockVerboseData._();

  factory RpcBlockVerboseData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcBlockVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcBlockVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hash')
    ..aD(11, _omitFieldNames ? '' : 'difficulty')
    ..aOS(13, _omitFieldNames ? '' : 'selectedParentHash',
        protoName: 'selectedParentHash')
    ..pPS(14, _omitFieldNames ? '' : 'transactionIds',
        protoName: 'transactionIds')
    ..aOB(15, _omitFieldNames ? '' : 'isHeaderOnly', protoName: 'isHeaderOnly')
    ..a<$fixnum.Int64>(
        16, _omitFieldNames ? '' : 'blueScore', $pb.PbFieldType.OU6,
        protoName: 'blueScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPS(17, _omitFieldNames ? '' : 'childrenHashes',
        protoName: 'childrenHashes')
    ..pPS(18, _omitFieldNames ? '' : 'mergeSetBluesHashes',
        protoName: 'mergeSetBluesHashes')
    ..pPS(19, _omitFieldNames ? '' : 'mergeSetRedsHashes',
        protoName: 'mergeSetRedsHashes')
    ..aOB(20, _omitFieldNames ? '' : 'isChainBlock', protoName: 'isChainBlock')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBlockVerboseData copyWith(void Function(RpcBlockVerboseData) updates) =>
      super.copyWith((message) => updates(message as RpcBlockVerboseData))
          as RpcBlockVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcBlockVerboseData create() => RpcBlockVerboseData._();
  @$core.override
  RpcBlockVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcBlockVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcBlockVerboseData>(create);
  static RpcBlockVerboseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);

  @$pb.TagNumber(11)
  $core.double get difficulty => $_getN(1);
  @$pb.TagNumber(11)
  set difficulty($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(11)
  $core.bool hasDifficulty() => $_has(1);
  @$pb.TagNumber(11)
  void clearDifficulty() => $_clearField(11);

  @$pb.TagNumber(13)
  $core.String get selectedParentHash => $_getSZ(2);
  @$pb.TagNumber(13)
  set selectedParentHash($core.String value) => $_setString(2, value);
  @$pb.TagNumber(13)
  $core.bool hasSelectedParentHash() => $_has(2);
  @$pb.TagNumber(13)
  void clearSelectedParentHash() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbList<$core.String> get transactionIds => $_getList(3);

  @$pb.TagNumber(15)
  $core.bool get isHeaderOnly => $_getBF(4);
  @$pb.TagNumber(15)
  set isHeaderOnly($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(15)
  $core.bool hasIsHeaderOnly() => $_has(4);
  @$pb.TagNumber(15)
  void clearIsHeaderOnly() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get blueScore => $_getI64(5);
  @$pb.TagNumber(16)
  set blueScore($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(16)
  $core.bool hasBlueScore() => $_has(5);
  @$pb.TagNumber(16)
  void clearBlueScore() => $_clearField(16);

  @$pb.TagNumber(17)
  $pb.PbList<$core.String> get childrenHashes => $_getList(6);

  @$pb.TagNumber(18)
  $pb.PbList<$core.String> get mergeSetBluesHashes => $_getList(7);

  @$pb.TagNumber(19)
  $pb.PbList<$core.String> get mergeSetRedsHashes => $_getList(8);

  @$pb.TagNumber(20)
  $core.bool get isChainBlock => $_getBF(9);
  @$pb.TagNumber(20)
  set isChainBlock($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(20)
  $core.bool hasIsChainBlock() => $_has(9);
  @$pb.TagNumber(20)
  void clearIsChainBlock() => $_clearField(20);
}

class RpcTransaction extends $pb.GeneratedMessage {
  factory RpcTransaction({
    $core.int? version,
    $core.Iterable<RpcTransactionInput>? inputs,
    $core.Iterable<RpcTransactionOutput>? outputs,
    $fixnum.Int64? lockTime,
    $core.String? subnetworkId,
    $fixnum.Int64? gas,
    $core.String? payload,
    RpcTransactionVerboseData? verboseData,
    $fixnum.Int64? storageMass,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    if (lockTime != null) result.lockTime = lockTime;
    if (subnetworkId != null) result.subnetworkId = subnetworkId;
    if (gas != null) result.gas = gas;
    if (payload != null) result.payload = payload;
    if (verboseData != null) result.verboseData = verboseData;
    if (storageMass != null) result.storageMass = storageMass;
    return result;
  }

  RpcTransaction._();

  factory RpcTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..pPM<RpcTransactionInput>(2, _omitFieldNames ? '' : 'inputs',
        subBuilder: RpcTransactionInput.create)
    ..pPM<RpcTransactionOutput>(3, _omitFieldNames ? '' : 'outputs',
        subBuilder: RpcTransactionOutput.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU6,
        protoName: 'lockTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'subnetworkId', protoName: 'subnetworkId')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'gas', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'payload')
    ..aOM<RpcTransactionVerboseData>(9, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData', subBuilder: RpcTransactionVerboseData.create)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'storageMass', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransaction copyWith(void Function(RpcTransaction) updates) =>
      super.copyWith((message) => updates(message as RpcTransaction))
          as RpcTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcTransaction create() => RpcTransaction._();
  @$core.override
  RpcTransaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcTransaction>(create);
  static RpcTransaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RpcTransactionInput> get inputs => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<RpcTransactionOutput> get outputs => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lockTime => $_getI64(3);
  @$pb.TagNumber(4)
  set lockTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLockTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get subnetworkId => $_getSZ(4);
  @$pb.TagNumber(5)
  set subnetworkId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSubnetworkId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubnetworkId() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get gas => $_getI64(5);
  @$pb.TagNumber(6)
  set gas($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGas() => $_has(5);
  @$pb.TagNumber(6)
  void clearGas() => $_clearField(6);

  @$pb.TagNumber(8)
  $core.String get payload => $_getSZ(6);
  @$pb.TagNumber(8)
  set payload($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasPayload() => $_has(6);
  @$pb.TagNumber(8)
  void clearPayload() => $_clearField(8);

  @$pb.TagNumber(9)
  RpcTransactionVerboseData get verboseData => $_getN(7);
  @$pb.TagNumber(9)
  set verboseData(RpcTransactionVerboseData value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasVerboseData() => $_has(7);
  @$pb.TagNumber(9)
  void clearVerboseData() => $_clearField(9);
  @$pb.TagNumber(9)
  RpcTransactionVerboseData ensureVerboseData() => $_ensure(7);

  @$pb.TagNumber(10)
  $fixnum.Int64 get storageMass => $_getI64(8);
  @$pb.TagNumber(10)
  set storageMass($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(10)
  $core.bool hasStorageMass() => $_has(8);
  @$pb.TagNumber(10)
  void clearStorageMass() => $_clearField(10);
}

class RpcTransactionVerboseData extends $pb.GeneratedMessage {
  factory RpcTransactionVerboseData({
    $core.String? transactionId,
    $core.String? hash,
    $fixnum.Int64? computeMass,
    $core.String? blockHash,
    $fixnum.Int64? blockTime,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (hash != null) result.hash = hash;
    if (computeMass != null) result.computeMass = computeMass;
    if (blockHash != null) result.blockHash = blockHash;
    if (blockTime != null) result.blockTime = blockTime;
    return result;
  }

  RpcTransactionVerboseData._();

  factory RpcTransactionVerboseData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcTransactionVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcTransactionVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId')
    ..aOS(2, _omitFieldNames ? '' : 'hash')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'computeMass', $pb.PbFieldType.OU6,
        protoName: 'computeMass', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(12, _omitFieldNames ? '' : 'blockHash', protoName: 'blockHash')
    ..a<$fixnum.Int64>(
        14, _omitFieldNames ? '' : 'blockTime', $pb.PbFieldType.OU6,
        protoName: 'blockTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionVerboseData copyWith(
          void Function(RpcTransactionVerboseData) updates) =>
      super.copyWith((message) => updates(message as RpcTransactionVerboseData))
          as RpcTransactionVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcTransactionVerboseData create() => RpcTransactionVerboseData._();
  @$core.override
  RpcTransactionVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcTransactionVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcTransactionVerboseData>(create);
  static RpcTransactionVerboseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get hash => $_getSZ(1);
  @$pb.TagNumber(2)
  set hash($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get computeMass => $_getI64(2);
  @$pb.TagNumber(4)
  set computeMass($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasComputeMass() => $_has(2);
  @$pb.TagNumber(4)
  void clearComputeMass() => $_clearField(4);

  @$pb.TagNumber(12)
  $core.String get blockHash => $_getSZ(3);
  @$pb.TagNumber(12)
  set blockHash($core.String value) => $_setString(3, value);
  @$pb.TagNumber(12)
  $core.bool hasBlockHash() => $_has(3);
  @$pb.TagNumber(12)
  void clearBlockHash() => $_clearField(12);

  @$pb.TagNumber(14)
  $fixnum.Int64 get blockTime => $_getI64(4);
  @$pb.TagNumber(14)
  set blockTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(14)
  $core.bool hasBlockTime() => $_has(4);
  @$pb.TagNumber(14)
  void clearBlockTime() => $_clearField(14);
}

class RpcTransactionInput extends $pb.GeneratedMessage {
  factory RpcTransactionInput({
    RpcOutpoint? previousOutpoint,
    $core.String? signatureScript,
    $fixnum.Int64? sequence,
    RpcTransactionInputVerboseData? verboseData,
    $core.int? sigOpCount,
    $core.int? computeBudget,
  }) {
    final result = create();
    if (previousOutpoint != null) result.previousOutpoint = previousOutpoint;
    if (signatureScript != null) result.signatureScript = signatureScript;
    if (sequence != null) result.sequence = sequence;
    if (verboseData != null) result.verboseData = verboseData;
    if (sigOpCount != null) result.sigOpCount = sigOpCount;
    if (computeBudget != null) result.computeBudget = computeBudget;
    return result;
  }

  RpcTransactionInput._();

  factory RpcTransactionInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcTransactionInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcTransactionInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcOutpoint>(1, _omitFieldNames ? '' : 'previousOutpoint',
        protoName: 'previousOutpoint', subBuilder: RpcOutpoint.create)
    ..aOS(2, _omitFieldNames ? '' : 'signatureScript',
        protoName: 'signatureScript')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcTransactionInputVerboseData>(
        4, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData',
        subBuilder: RpcTransactionInputVerboseData.create)
    ..aI(5, _omitFieldNames ? '' : 'sigOpCount',
        protoName: 'sigOpCount', fieldType: $pb.PbFieldType.OU3)
    ..aI(6, _omitFieldNames ? '' : 'computeBudget',
        protoName: 'computeBudget', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionInput copyWith(void Function(RpcTransactionInput) updates) =>
      super.copyWith((message) => updates(message as RpcTransactionInput))
          as RpcTransactionInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcTransactionInput create() => RpcTransactionInput._();
  @$core.override
  RpcTransactionInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcTransactionInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcTransactionInput>(create);
  static RpcTransactionInput? _defaultInstance;

  @$pb.TagNumber(1)
  RpcOutpoint get previousOutpoint => $_getN(0);
  @$pb.TagNumber(1)
  set previousOutpoint(RpcOutpoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPreviousOutpoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousOutpoint() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcOutpoint ensurePreviousOutpoint() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get signatureScript => $_getSZ(1);
  @$pb.TagNumber(2)
  set signatureScript($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignatureScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignatureScript() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get sequence => $_getI64(2);
  @$pb.TagNumber(3)
  set sequence($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSequence() => $_has(2);
  @$pb.TagNumber(3)
  void clearSequence() => $_clearField(3);

  @$pb.TagNumber(4)
  RpcTransactionInputVerboseData get verboseData => $_getN(3);
  @$pb.TagNumber(4)
  set verboseData(RpcTransactionInputVerboseData value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasVerboseData() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerboseData() => $_clearField(4);
  @$pb.TagNumber(4)
  RpcTransactionInputVerboseData ensureVerboseData() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get sigOpCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set sigOpCount($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSigOpCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearSigOpCount() => $_clearField(5);

  /// Replaces sigop count for tx version >= 1.
  @$pb.TagNumber(6)
  $core.int get computeBudget => $_getIZ(5);
  @$pb.TagNumber(6)
  set computeBudget($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasComputeBudget() => $_has(5);
  @$pb.TagNumber(6)
  void clearComputeBudget() => $_clearField(6);
}

class RpcTransactionInputVerboseData extends $pb.GeneratedMessage {
  factory RpcTransactionInputVerboseData({
    RpcUtxoEntry? utxoEntry,
  }) {
    final result = create();
    if (utxoEntry != null) result.utxoEntry = utxoEntry;
    return result;
  }

  RpcTransactionInputVerboseData._();

  factory RpcTransactionInputVerboseData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcTransactionInputVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcTransactionInputVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcUtxoEntry>(1, _omitFieldNames ? '' : 'utxoEntry',
        protoName: 'utxoEntry', subBuilder: RpcUtxoEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionInputVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionInputVerboseData copyWith(
          void Function(RpcTransactionInputVerboseData) updates) =>
      super.copyWith(
              (message) => updates(message as RpcTransactionInputVerboseData))
          as RpcTransactionInputVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcTransactionInputVerboseData create() =>
      RpcTransactionInputVerboseData._();
  @$core.override
  RpcTransactionInputVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcTransactionInputVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcTransactionInputVerboseData>(create);
  static RpcTransactionInputVerboseData? _defaultInstance;

  @$pb.TagNumber(1)
  RpcUtxoEntry get utxoEntry => $_getN(0);
  @$pb.TagNumber(1)
  set utxoEntry(RpcUtxoEntry value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUtxoEntry() => $_has(0);
  @$pb.TagNumber(1)
  void clearUtxoEntry() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcUtxoEntry ensureUtxoEntry() => $_ensure(0);
}

class RpcUtxoEntry extends $pb.GeneratedMessage {
  factory RpcUtxoEntry({
    $fixnum.Int64? amount,
    RpcScriptPublicKey? scriptPublicKey,
    $fixnum.Int64? blockDaaScore,
    $core.bool? isCoinbase,
    RpcUtxoEntryVerboseData? verboseData,
    $core.String? covenantId,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (scriptPublicKey != null) result.scriptPublicKey = scriptPublicKey;
    if (blockDaaScore != null) result.blockDaaScore = blockDaaScore;
    if (isCoinbase != null) result.isCoinbase = isCoinbase;
    if (verboseData != null) result.verboseData = verboseData;
    if (covenantId != null) result.covenantId = covenantId;
    return result;
  }

  RpcUtxoEntry._();

  factory RpcUtxoEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcUtxoEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcUtxoEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcScriptPublicKey>(2, _omitFieldNames ? '' : 'scriptPublicKey',
        protoName: 'scriptPublicKey', subBuilder: RpcScriptPublicKey.create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'blockDaaScore', $pb.PbFieldType.OU6,
        protoName: 'blockDaaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, _omitFieldNames ? '' : 'isCoinbase', protoName: 'isCoinbase')
    ..aOM<RpcUtxoEntryVerboseData>(5, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData', subBuilder: RpcUtxoEntryVerboseData.create)
    ..aOS(6, _omitFieldNames ? '' : 'covenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcUtxoEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcUtxoEntry copyWith(void Function(RpcUtxoEntry) updates) =>
      super.copyWith((message) => updates(message as RpcUtxoEntry))
          as RpcUtxoEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcUtxoEntry create() => RpcUtxoEntry._();
  @$core.override
  RpcUtxoEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcUtxoEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcUtxoEntry>(create);
  static RpcUtxoEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  @$pb.TagNumber(2)
  RpcScriptPublicKey get scriptPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set scriptPublicKey(RpcScriptPublicKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasScriptPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearScriptPublicKey() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcScriptPublicKey ensureScriptPublicKey() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blockDaaScore => $_getI64(2);
  @$pb.TagNumber(3)
  set blockDaaScore($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBlockDaaScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockDaaScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isCoinbase => $_getBF(3);
  @$pb.TagNumber(4)
  set isCoinbase($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsCoinbase() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsCoinbase() => $_clearField(4);

  @$pb.TagNumber(5)
  RpcUtxoEntryVerboseData get verboseData => $_getN(4);
  @$pb.TagNumber(5)
  set verboseData(RpcUtxoEntryVerboseData value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasVerboseData() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerboseData() => $_clearField(5);
  @$pb.TagNumber(5)
  RpcUtxoEntryVerboseData ensureVerboseData() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get covenantId => $_getSZ(5);
  @$pb.TagNumber(6)
  set covenantId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCovenantId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCovenantId() => $_clearField(6);
}

class RpcUtxoEntryVerboseData extends $pb.GeneratedMessage {
  factory RpcUtxoEntryVerboseData({
    $core.String? scriptPublicKeyType,
    $core.String? scriptPublicKeyAddress,
  }) {
    final result = create();
    if (scriptPublicKeyType != null)
      result.scriptPublicKeyType = scriptPublicKeyType;
    if (scriptPublicKeyAddress != null)
      result.scriptPublicKeyAddress = scriptPublicKeyAddress;
    return result;
  }

  RpcUtxoEntryVerboseData._();

  factory RpcUtxoEntryVerboseData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcUtxoEntryVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcUtxoEntryVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'scriptPublicKeyType',
        protoName: 'scriptPublicKeyType')
    ..aOS(6, _omitFieldNames ? '' : 'scriptPublicKeyAddress',
        protoName: 'scriptPublicKeyAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcUtxoEntryVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcUtxoEntryVerboseData copyWith(
          void Function(RpcUtxoEntryVerboseData) updates) =>
      super.copyWith((message) => updates(message as RpcUtxoEntryVerboseData))
          as RpcUtxoEntryVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcUtxoEntryVerboseData create() => RpcUtxoEntryVerboseData._();
  @$core.override
  RpcUtxoEntryVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcUtxoEntryVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcUtxoEntryVerboseData>(create);
  static RpcUtxoEntryVerboseData? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get scriptPublicKeyType => $_getSZ(0);
  @$pb.TagNumber(5)
  set scriptPublicKeyType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(5)
  $core.bool hasScriptPublicKeyType() => $_has(0);
  @$pb.TagNumber(5)
  void clearScriptPublicKeyType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get scriptPublicKeyAddress => $_getSZ(1);
  @$pb.TagNumber(6)
  set scriptPublicKeyAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(6)
  $core.bool hasScriptPublicKeyAddress() => $_has(1);
  @$pb.TagNumber(6)
  void clearScriptPublicKeyAddress() => $_clearField(6);
}

class RpcScriptPublicKey extends $pb.GeneratedMessage {
  factory RpcScriptPublicKey({
    $core.int? version,
    $core.String? scriptPublicKey,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (scriptPublicKey != null) result.scriptPublicKey = scriptPublicKey;
    return result;
  }

  RpcScriptPublicKey._();

  factory RpcScriptPublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcScriptPublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcScriptPublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'scriptPublicKey',
        protoName: 'scriptPublicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcScriptPublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcScriptPublicKey copyWith(void Function(RpcScriptPublicKey) updates) =>
      super.copyWith((message) => updates(message as RpcScriptPublicKey))
          as RpcScriptPublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcScriptPublicKey create() => RpcScriptPublicKey._();
  @$core.override
  RpcScriptPublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcScriptPublicKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcScriptPublicKey>(create);
  static RpcScriptPublicKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get scriptPublicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set scriptPublicKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScriptPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearScriptPublicKey() => $_clearField(2);
}

class RpcTransactionOutput extends $pb.GeneratedMessage {
  factory RpcTransactionOutput({
    $fixnum.Int64? amount,
    RpcScriptPublicKey? scriptPublicKey,
    RpcTransactionOutputVerboseData? verboseData,
    RpcCovenantBinding? covenant,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (scriptPublicKey != null) result.scriptPublicKey = scriptPublicKey;
    if (verboseData != null) result.verboseData = verboseData;
    if (covenant != null) result.covenant = covenant;
    return result;
  }

  RpcTransactionOutput._();

  factory RpcTransactionOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcTransactionOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcTransactionOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcScriptPublicKey>(2, _omitFieldNames ? '' : 'scriptPublicKey',
        protoName: 'scriptPublicKey', subBuilder: RpcScriptPublicKey.create)
    ..aOM<RpcTransactionOutputVerboseData>(
        3, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData',
        subBuilder: RpcTransactionOutputVerboseData.create)
    ..aOM<RpcCovenantBinding>(4, _omitFieldNames ? '' : 'covenant',
        subBuilder: RpcCovenantBinding.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionOutput copyWith(void Function(RpcTransactionOutput) updates) =>
      super.copyWith((message) => updates(message as RpcTransactionOutput))
          as RpcTransactionOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcTransactionOutput create() => RpcTransactionOutput._();
  @$core.override
  RpcTransactionOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcTransactionOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcTransactionOutput>(create);
  static RpcTransactionOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  @$pb.TagNumber(2)
  RpcScriptPublicKey get scriptPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set scriptPublicKey(RpcScriptPublicKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasScriptPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearScriptPublicKey() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcScriptPublicKey ensureScriptPublicKey() => $_ensure(1);

  @$pb.TagNumber(3)
  RpcTransactionOutputVerboseData get verboseData => $_getN(2);
  @$pb.TagNumber(3)
  set verboseData(RpcTransactionOutputVerboseData value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVerboseData() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerboseData() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcTransactionOutputVerboseData ensureVerboseData() => $_ensure(2);

  @$pb.TagNumber(4)
  RpcCovenantBinding get covenant => $_getN(3);
  @$pb.TagNumber(4)
  set covenant(RpcCovenantBinding value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCovenant() => $_has(3);
  @$pb.TagNumber(4)
  void clearCovenant() => $_clearField(4);
  @$pb.TagNumber(4)
  RpcCovenantBinding ensureCovenant() => $_ensure(3);
}

class RpcCovenantBinding extends $pb.GeneratedMessage {
  factory RpcCovenantBinding({
    $core.int? authorizingInput,
    $core.String? covenantId,
  }) {
    final result = create();
    if (authorizingInput != null) result.authorizingInput = authorizingInput;
    if (covenantId != null) result.covenantId = covenantId;
    return result;
  }

  RpcCovenantBinding._();

  factory RpcCovenantBinding.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcCovenantBinding.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcCovenantBinding',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'authorizingInput',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'covenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcCovenantBinding clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcCovenantBinding copyWith(void Function(RpcCovenantBinding) updates) =>
      super.copyWith((message) => updates(message as RpcCovenantBinding))
          as RpcCovenantBinding;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcCovenantBinding create() => RpcCovenantBinding._();
  @$core.override
  RpcCovenantBinding createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcCovenantBinding getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcCovenantBinding>(create);
  static RpcCovenantBinding? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get authorizingInput => $_getIZ(0);
  @$pb.TagNumber(1)
  set authorizingInput($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthorizingInput() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthorizingInput() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get covenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set covenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCovenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCovenantId() => $_clearField(2);
}

class RpcOutpoint extends $pb.GeneratedMessage {
  factory RpcOutpoint({
    $core.String? transactionId,
    $core.int? index,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (index != null) result.index = index;
    return result;
  }

  RpcOutpoint._();

  factory RpcOutpoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOutpoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOutpoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId')
    ..aI(2, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOutpoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOutpoint copyWith(void Function(RpcOutpoint) updates) =>
      super.copyWith((message) => updates(message as RpcOutpoint))
          as RpcOutpoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOutpoint create() => RpcOutpoint._();
  @$core.override
  RpcOutpoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOutpoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOutpoint>(create);
  static RpcOutpoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => $_clearField(2);
}

class RpcTransactionOutputVerboseData extends $pb.GeneratedMessage {
  factory RpcTransactionOutputVerboseData({
    $core.String? scriptPublicKeyType,
    $core.String? scriptPublicKeyAddress,
  }) {
    final result = create();
    if (scriptPublicKeyType != null)
      result.scriptPublicKeyType = scriptPublicKeyType;
    if (scriptPublicKeyAddress != null)
      result.scriptPublicKeyAddress = scriptPublicKeyAddress;
    return result;
  }

  RpcTransactionOutputVerboseData._();

  factory RpcTransactionOutputVerboseData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcTransactionOutputVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcTransactionOutputVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'scriptPublicKeyType',
        protoName: 'scriptPublicKeyType')
    ..aOS(6, _omitFieldNames ? '' : 'scriptPublicKeyAddress',
        protoName: 'scriptPublicKeyAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionOutputVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcTransactionOutputVerboseData copyWith(
          void Function(RpcTransactionOutputVerboseData) updates) =>
      super.copyWith(
              (message) => updates(message as RpcTransactionOutputVerboseData))
          as RpcTransactionOutputVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcTransactionOutputVerboseData create() =>
      RpcTransactionOutputVerboseData._();
  @$core.override
  RpcTransactionOutputVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcTransactionOutputVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcTransactionOutputVerboseData>(
          create);
  static RpcTransactionOutputVerboseData? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get scriptPublicKeyType => $_getSZ(0);
  @$pb.TagNumber(5)
  set scriptPublicKeyType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(5)
  $core.bool hasScriptPublicKeyType() => $_has(0);
  @$pb.TagNumber(5)
  void clearScriptPublicKeyType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get scriptPublicKeyAddress => $_getSZ(1);
  @$pb.TagNumber(6)
  set scriptPublicKeyAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(6)
  $core.bool hasScriptPublicKeyAddress() => $_has(1);
  @$pb.TagNumber(6)
  void clearScriptPublicKeyAddress() => $_clearField(6);
}

/// GetCurrentNetworkRequestMessage requests the network kaspad is currently running against.
///
/// Possible networks are: Mainnet, Testnet, Simnet, Devnet
class GetCurrentNetworkRequestMessage extends $pb.GeneratedMessage {
  factory GetCurrentNetworkRequestMessage() => create();

  GetCurrentNetworkRequestMessage._();

  factory GetCurrentNetworkRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentNetworkRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentNetworkRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentNetworkRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentNetworkRequestMessage copyWith(
          void Function(GetCurrentNetworkRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetCurrentNetworkRequestMessage))
          as GetCurrentNetworkRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentNetworkRequestMessage create() =>
      GetCurrentNetworkRequestMessage._();
  @$core.override
  GetCurrentNetworkRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCurrentNetworkRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentNetworkRequestMessage>(
          create);
  static GetCurrentNetworkRequestMessage? _defaultInstance;
}

class GetCurrentNetworkResponseMessage extends $pb.GeneratedMessage {
  factory GetCurrentNetworkResponseMessage({
    $core.String? currentNetwork,
    RPCError? error,
  }) {
    final result = create();
    if (currentNetwork != null) result.currentNetwork = currentNetwork;
    if (error != null) result.error = error;
    return result;
  }

  GetCurrentNetworkResponseMessage._();

  factory GetCurrentNetworkResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentNetworkResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentNetworkResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentNetwork',
        protoName: 'currentNetwork')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentNetworkResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentNetworkResponseMessage copyWith(
          void Function(GetCurrentNetworkResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetCurrentNetworkResponseMessage))
          as GetCurrentNetworkResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentNetworkResponseMessage create() =>
      GetCurrentNetworkResponseMessage._();
  @$core.override
  GetCurrentNetworkResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCurrentNetworkResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentNetworkResponseMessage>(
          create);
  static GetCurrentNetworkResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentNetwork => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentNetwork($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentNetwork() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentNetwork() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// SubmitBlockRequestMessage requests to submit a block into the DAG.
/// Blocks are generally expected to have been generated using the getBlockTemplate call.
///
/// See: GetBlockTemplateRequestMessage
class SubmitBlockRequestMessage extends $pb.GeneratedMessage {
  factory SubmitBlockRequestMessage({
    RpcBlock? block,
    $core.bool? allowNonDAABlocks,
  }) {
    final result = create();
    if (block != null) result.block = block;
    if (allowNonDAABlocks != null) result.allowNonDAABlocks = allowNonDAABlocks;
    return result;
  }

  SubmitBlockRequestMessage._();

  factory SubmitBlockRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitBlockRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitBlockRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcBlock>(2, _omitFieldNames ? '' : 'block',
        subBuilder: RpcBlock.create)
    ..aOB(3, _omitFieldNames ? '' : 'allowNonDAABlocks',
        protoName: 'allowNonDAABlocks')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockRequestMessage copyWith(
          void Function(SubmitBlockRequestMessage) updates) =>
      super.copyWith((message) => updates(message as SubmitBlockRequestMessage))
          as SubmitBlockRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitBlockRequestMessage create() => SubmitBlockRequestMessage._();
  @$core.override
  SubmitBlockRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitBlockRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitBlockRequestMessage>(create);
  static SubmitBlockRequestMessage? _defaultInstance;

  @$pb.TagNumber(2)
  RpcBlock get block => $_getN(0);
  @$pb.TagNumber(2)
  set block(RpcBlock value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(2)
  void clearBlock() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcBlock ensureBlock() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.bool get allowNonDAABlocks => $_getBF(1);
  @$pb.TagNumber(3)
  set allowNonDAABlocks($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowNonDAABlocks() => $_has(1);
  @$pb.TagNumber(3)
  void clearAllowNonDAABlocks() => $_clearField(3);
}

class SubmitBlockResponseMessage extends $pb.GeneratedMessage {
  factory SubmitBlockResponseMessage({
    SubmitBlockResponseMessage_RejectReason? rejectReason,
    RPCError? error,
  }) {
    final result = create();
    if (rejectReason != null) result.rejectReason = rejectReason;
    if (error != null) result.error = error;
    return result;
  }

  SubmitBlockResponseMessage._();

  factory SubmitBlockResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitBlockResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitBlockResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<SubmitBlockResponseMessage_RejectReason>(
        1, _omitFieldNames ? '' : 'rejectReason',
        protoName: 'rejectReason',
        enumValues: SubmitBlockResponseMessage_RejectReason.values)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockResponseMessage copyWith(
          void Function(SubmitBlockResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitBlockResponseMessage))
          as SubmitBlockResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitBlockResponseMessage create() => SubmitBlockResponseMessage._();
  @$core.override
  SubmitBlockResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitBlockResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitBlockResponseMessage>(create);
  static SubmitBlockResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  SubmitBlockResponseMessage_RejectReason get rejectReason => $_getN(0);
  @$pb.TagNumber(1)
  set rejectReason(SubmitBlockResponseMessage_RejectReason value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRejectReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearRejectReason() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// GetBlockTemplateRequestMessage requests a current block template.
/// Callers are expected to solve the block template and submit it using the submitBlock call
///
/// See: SubmitBlockRequestMessage
class GetBlockTemplateRequestMessage extends $pb.GeneratedMessage {
  factory GetBlockTemplateRequestMessage({
    $core.String? payAddress,
    $core.String? extraData,
  }) {
    final result = create();
    if (payAddress != null) result.payAddress = payAddress;
    if (extraData != null) result.extraData = extraData;
    return result;
  }

  GetBlockTemplateRequestMessage._();

  factory GetBlockTemplateRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockTemplateRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockTemplateRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payAddress', protoName: 'payAddress')
    ..aOS(2, _omitFieldNames ? '' : 'extraData', protoName: 'extraData')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockTemplateRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockTemplateRequestMessage copyWith(
          void Function(GetBlockTemplateRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockTemplateRequestMessage))
          as GetBlockTemplateRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockTemplateRequestMessage create() =>
      GetBlockTemplateRequestMessage._();
  @$core.override
  GetBlockTemplateRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockTemplateRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockTemplateRequestMessage>(create);
  static GetBlockTemplateRequestMessage? _defaultInstance;

  /// Which kaspa address should the coinbase block reward transaction pay into
  @$pb.TagNumber(1)
  $core.String get payAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set payAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPayAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get extraData => $_getSZ(1);
  @$pb.TagNumber(2)
  set extraData($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExtraData() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtraData() => $_clearField(2);
}

class GetBlockTemplateResponseMessage extends $pb.GeneratedMessage {
  factory GetBlockTemplateResponseMessage({
    $core.bool? isSynced,
    RpcBlock? block,
    RPCError? error,
  }) {
    final result = create();
    if (isSynced != null) result.isSynced = isSynced;
    if (block != null) result.block = block;
    if (error != null) result.error = error;
    return result;
  }

  GetBlockTemplateResponseMessage._();

  factory GetBlockTemplateResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockTemplateResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockTemplateResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(2, _omitFieldNames ? '' : 'isSynced', protoName: 'isSynced')
    ..aOM<RpcBlock>(3, _omitFieldNames ? '' : 'block',
        subBuilder: RpcBlock.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockTemplateResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockTemplateResponseMessage copyWith(
          void Function(GetBlockTemplateResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockTemplateResponseMessage))
          as GetBlockTemplateResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockTemplateResponseMessage create() =>
      GetBlockTemplateResponseMessage._();
  @$core.override
  GetBlockTemplateResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockTemplateResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockTemplateResponseMessage>(
          create);
  static GetBlockTemplateResponseMessage? _defaultInstance;

  /// Whether kaspad thinks that it's synced.
  /// Callers are discouraged (but not forbidden) from solving blocks when kaspad is not synced.
  /// That is because when kaspad isn't in sync with the rest of the network there's a high
  /// chance the block will never be accepted, thus the solving effort would have been wasted.
  @$pb.TagNumber(2)
  $core.bool get isSynced => $_getBF(0);
  @$pb.TagNumber(2)
  set isSynced($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(2)
  $core.bool hasIsSynced() => $_has(0);
  @$pb.TagNumber(2)
  void clearIsSynced() => $_clearField(2);

  @$pb.TagNumber(3)
  RpcBlock get block => $_getN(1);
  @$pb.TagNumber(3)
  set block(RpcBlock value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBlock() => $_has(1);
  @$pb.TagNumber(3)
  void clearBlock() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcBlock ensureBlock() => $_ensure(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

/// NotifyBlockAddedRequestMessage registers this connection for blockAdded notifications.
///
/// See: BlockAddedNotificationMessage
class NotifyBlockAddedRequestMessage extends $pb.GeneratedMessage {
  factory NotifyBlockAddedRequestMessage({
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (command != null) result.command = command;
    return result;
  }

  NotifyBlockAddedRequestMessage._();

  factory NotifyBlockAddedRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyBlockAddedRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyBlockAddedRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyBlockAddedRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyBlockAddedRequestMessage copyWith(
          void Function(NotifyBlockAddedRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as NotifyBlockAddedRequestMessage))
          as NotifyBlockAddedRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyBlockAddedRequestMessage create() =>
      NotifyBlockAddedRequestMessage._();
  @$core.override
  NotifyBlockAddedRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyBlockAddedRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotifyBlockAddedRequestMessage>(create);
  static NotifyBlockAddedRequestMessage? _defaultInstance;

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(0);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyBlockAddedResponseMessage extends $pb.GeneratedMessage {
  factory NotifyBlockAddedResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyBlockAddedResponseMessage._();

  factory NotifyBlockAddedResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyBlockAddedResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyBlockAddedResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyBlockAddedResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyBlockAddedResponseMessage copyWith(
          void Function(NotifyBlockAddedResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as NotifyBlockAddedResponseMessage))
          as NotifyBlockAddedResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyBlockAddedResponseMessage create() =>
      NotifyBlockAddedResponseMessage._();
  @$core.override
  NotifyBlockAddedResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyBlockAddedResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotifyBlockAddedResponseMessage>(
          create);
  static NotifyBlockAddedResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// BlockAddedNotificationMessage is sent whenever a blocks has been added (NOT accepted)
/// into the DAG.
///
/// See: NotifyBlockAddedRequestMessage
class BlockAddedNotificationMessage extends $pb.GeneratedMessage {
  factory BlockAddedNotificationMessage({
    RpcBlock? block,
  }) {
    final result = create();
    if (block != null) result.block = block;
    return result;
  }

  BlockAddedNotificationMessage._();

  factory BlockAddedNotificationMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockAddedNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockAddedNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcBlock>(3, _omitFieldNames ? '' : 'block',
        subBuilder: RpcBlock.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockAddedNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockAddedNotificationMessage copyWith(
          void Function(BlockAddedNotificationMessage) updates) =>
      super.copyWith(
              (message) => updates(message as BlockAddedNotificationMessage))
          as BlockAddedNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockAddedNotificationMessage create() =>
      BlockAddedNotificationMessage._();
  @$core.override
  BlockAddedNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockAddedNotificationMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockAddedNotificationMessage>(create);
  static BlockAddedNotificationMessage? _defaultInstance;

  @$pb.TagNumber(3)
  RpcBlock get block => $_getN(0);
  @$pb.TagNumber(3)
  set block(RpcBlock value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(3)
  void clearBlock() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcBlock ensureBlock() => $_ensure(0);
}

/// GetPeerAddressesRequestMessage requests the list of known kaspad addresses in the
/// current network. (mainnet, testnet, etc.)
class GetPeerAddressesRequestMessage extends $pb.GeneratedMessage {
  factory GetPeerAddressesRequestMessage() => create();

  GetPeerAddressesRequestMessage._();

  factory GetPeerAddressesRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPeerAddressesRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPeerAddressesRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPeerAddressesRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPeerAddressesRequestMessage copyWith(
          void Function(GetPeerAddressesRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetPeerAddressesRequestMessage))
          as GetPeerAddressesRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPeerAddressesRequestMessage create() =>
      GetPeerAddressesRequestMessage._();
  @$core.override
  GetPeerAddressesRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPeerAddressesRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPeerAddressesRequestMessage>(create);
  static GetPeerAddressesRequestMessage? _defaultInstance;
}

class GetPeerAddressesResponseMessage extends $pb.GeneratedMessage {
  factory GetPeerAddressesResponseMessage({
    $core.Iterable<GetPeerAddressesKnownAddressMessage>? addresses,
    $core.Iterable<GetPeerAddressesKnownAddressMessage>? bannedAddresses,
    RPCError? error,
  }) {
    final result = create();
    if (addresses != null) result.addresses.addAll(addresses);
    if (bannedAddresses != null) result.bannedAddresses.addAll(bannedAddresses);
    if (error != null) result.error = error;
    return result;
  }

  GetPeerAddressesResponseMessage._();

  factory GetPeerAddressesResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPeerAddressesResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPeerAddressesResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<GetPeerAddressesKnownAddressMessage>(
        1, _omitFieldNames ? '' : 'addresses',
        subBuilder: GetPeerAddressesKnownAddressMessage.create)
    ..pPM<GetPeerAddressesKnownAddressMessage>(
        2, _omitFieldNames ? '' : 'bannedAddresses',
        protoName: 'bannedAddresses',
        subBuilder: GetPeerAddressesKnownAddressMessage.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPeerAddressesResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPeerAddressesResponseMessage copyWith(
          void Function(GetPeerAddressesResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetPeerAddressesResponseMessage))
          as GetPeerAddressesResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPeerAddressesResponseMessage create() =>
      GetPeerAddressesResponseMessage._();
  @$core.override
  GetPeerAddressesResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPeerAddressesResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPeerAddressesResponseMessage>(
          create);
  static GetPeerAddressesResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GetPeerAddressesKnownAddressMessage> get addresses => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<GetPeerAddressesKnownAddressMessage> get bannedAddresses =>
      $_getList(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

class GetPeerAddressesKnownAddressMessage extends $pb.GeneratedMessage {
  factory GetPeerAddressesKnownAddressMessage({
    $core.String? addr,
  }) {
    final result = create();
    if (addr != null) result.addr = addr;
    return result;
  }

  GetPeerAddressesKnownAddressMessage._();

  factory GetPeerAddressesKnownAddressMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPeerAddressesKnownAddressMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPeerAddressesKnownAddressMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Addr', protoName: 'Addr')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPeerAddressesKnownAddressMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPeerAddressesKnownAddressMessage copyWith(
          void Function(GetPeerAddressesKnownAddressMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetPeerAddressesKnownAddressMessage))
          as GetPeerAddressesKnownAddressMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPeerAddressesKnownAddressMessage create() =>
      GetPeerAddressesKnownAddressMessage._();
  @$core.override
  GetPeerAddressesKnownAddressMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPeerAddressesKnownAddressMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetPeerAddressesKnownAddressMessage>(create);
  static GetPeerAddressesKnownAddressMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get addr => $_getSZ(0);
  @$pb.TagNumber(1)
  set addr($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddr() => $_clearField(1);
}

/// GetSinkRequestMessage requests the hash of the current virtual's
/// selected parent.
class GetSinkRequestMessage extends $pb.GeneratedMessage {
  factory GetSinkRequestMessage() => create();

  GetSinkRequestMessage._();

  factory GetSinkRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSinkRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSinkRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkRequestMessage copyWith(
          void Function(GetSinkRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetSinkRequestMessage))
          as GetSinkRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSinkRequestMessage create() => GetSinkRequestMessage._();
  @$core.override
  GetSinkRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSinkRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSinkRequestMessage>(create);
  static GetSinkRequestMessage? _defaultInstance;
}

class GetSinkResponseMessage extends $pb.GeneratedMessage {
  factory GetSinkResponseMessage({
    $core.String? sink,
    RPCError? error,
  }) {
    final result = create();
    if (sink != null) result.sink = sink;
    if (error != null) result.error = error;
    return result;
  }

  GetSinkResponseMessage._();

  factory GetSinkResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSinkResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSinkResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sink')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkResponseMessage copyWith(
          void Function(GetSinkResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetSinkResponseMessage))
          as GetSinkResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSinkResponseMessage create() => GetSinkResponseMessage._();
  @$core.override
  GetSinkResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSinkResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSinkResponseMessage>(create);
  static GetSinkResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sink => $_getSZ(0);
  @$pb.TagNumber(1)
  set sink($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSink() => $_has(0);
  @$pb.TagNumber(1)
  void clearSink() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// GetMempoolEntryRequestMessage requests information about a specific transaction
/// in the mempool.
class GetMempoolEntryRequestMessage extends $pb.GeneratedMessage {
  factory GetMempoolEntryRequestMessage({
    $core.String? txId,
    $core.bool? includeOrphanPool,
    $core.bool? filterTransactionPool,
  }) {
    final result = create();
    if (txId != null) result.txId = txId;
    if (includeOrphanPool != null) result.includeOrphanPool = includeOrphanPool;
    if (filterTransactionPool != null)
      result.filterTransactionPool = filterTransactionPool;
    return result;
  }

  GetMempoolEntryRequestMessage._();

  factory GetMempoolEntryRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMempoolEntryRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMempoolEntryRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txId', protoName: 'txId')
    ..aOB(2, _omitFieldNames ? '' : 'includeOrphanPool',
        protoName: 'includeOrphanPool')
    ..aOB(3, _omitFieldNames ? '' : 'filterTransactionPool',
        protoName: 'filterTransactionPool')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntryRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntryRequestMessage copyWith(
          void Function(GetMempoolEntryRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetMempoolEntryRequestMessage))
          as GetMempoolEntryRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMempoolEntryRequestMessage create() =>
      GetMempoolEntryRequestMessage._();
  @$core.override
  GetMempoolEntryRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMempoolEntryRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMempoolEntryRequestMessage>(create);
  static GetMempoolEntryRequestMessage? _defaultInstance;

  /// The transaction's TransactionID.
  @$pb.TagNumber(1)
  $core.String get txId => $_getSZ(0);
  @$pb.TagNumber(1)
  set txId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeOrphanPool => $_getBF(1);
  @$pb.TagNumber(2)
  set includeOrphanPool($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeOrphanPool() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeOrphanPool() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get filterTransactionPool => $_getBF(2);
  @$pb.TagNumber(3)
  set filterTransactionPool($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilterTransactionPool() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilterTransactionPool() => $_clearField(3);
}

class GetMempoolEntryResponseMessage extends $pb.GeneratedMessage {
  factory GetMempoolEntryResponseMessage({
    RpcMempoolEntry? entry,
    RPCError? error,
  }) {
    final result = create();
    if (entry != null) result.entry = entry;
    if (error != null) result.error = error;
    return result;
  }

  GetMempoolEntryResponseMessage._();

  factory GetMempoolEntryResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMempoolEntryResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMempoolEntryResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcMempoolEntry>(1, _omitFieldNames ? '' : 'entry',
        subBuilder: RpcMempoolEntry.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntryResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntryResponseMessage copyWith(
          void Function(GetMempoolEntryResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetMempoolEntryResponseMessage))
          as GetMempoolEntryResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMempoolEntryResponseMessage create() =>
      GetMempoolEntryResponseMessage._();
  @$core.override
  GetMempoolEntryResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMempoolEntryResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMempoolEntryResponseMessage>(create);
  static GetMempoolEntryResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RpcMempoolEntry get entry => $_getN(0);
  @$pb.TagNumber(1)
  set entry(RpcMempoolEntry value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEntry() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntry() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcMempoolEntry ensureEntry() => $_ensure(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// GetMempoolEntriesRequestMessage requests information about all the transactions
/// currently in the mempool.
class GetMempoolEntriesRequestMessage extends $pb.GeneratedMessage {
  factory GetMempoolEntriesRequestMessage({
    $core.bool? includeOrphanPool,
    $core.bool? filterTransactionPool,
  }) {
    final result = create();
    if (includeOrphanPool != null) result.includeOrphanPool = includeOrphanPool;
    if (filterTransactionPool != null)
      result.filterTransactionPool = filterTransactionPool;
    return result;
  }

  GetMempoolEntriesRequestMessage._();

  factory GetMempoolEntriesRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMempoolEntriesRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMempoolEntriesRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'includeOrphanPool',
        protoName: 'includeOrphanPool')
    ..aOB(2, _omitFieldNames ? '' : 'filterTransactionPool',
        protoName: 'filterTransactionPool')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesRequestMessage copyWith(
          void Function(GetMempoolEntriesRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetMempoolEntriesRequestMessage))
          as GetMempoolEntriesRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesRequestMessage create() =>
      GetMempoolEntriesRequestMessage._();
  @$core.override
  GetMempoolEntriesRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMempoolEntriesRequestMessage>(
          create);
  static GetMempoolEntriesRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeOrphanPool => $_getBF(0);
  @$pb.TagNumber(1)
  set includeOrphanPool($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIncludeOrphanPool() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeOrphanPool() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get filterTransactionPool => $_getBF(1);
  @$pb.TagNumber(2)
  set filterTransactionPool($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilterTransactionPool() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilterTransactionPool() => $_clearField(2);
}

class GetMempoolEntriesResponseMessage extends $pb.GeneratedMessage {
  factory GetMempoolEntriesResponseMessage({
    $core.Iterable<RpcMempoolEntry>? entries,
    RPCError? error,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    if (error != null) result.error = error;
    return result;
  }

  GetMempoolEntriesResponseMessage._();

  factory GetMempoolEntriesResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMempoolEntriesResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMempoolEntriesResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<RpcMempoolEntry>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: RpcMempoolEntry.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesResponseMessage copyWith(
          void Function(GetMempoolEntriesResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetMempoolEntriesResponseMessage))
          as GetMempoolEntriesResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesResponseMessage create() =>
      GetMempoolEntriesResponseMessage._();
  @$core.override
  GetMempoolEntriesResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMempoolEntriesResponseMessage>(
          create);
  static GetMempoolEntriesResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RpcMempoolEntry> get entries => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class RpcMempoolEntry extends $pb.GeneratedMessage {
  factory RpcMempoolEntry({
    $fixnum.Int64? fee,
    RpcTransaction? transaction,
    $core.bool? isOrphan,
  }) {
    final result = create();
    if (fee != null) result.fee = fee;
    if (transaction != null) result.transaction = transaction;
    if (isOrphan != null) result.isOrphan = isOrphan;
    return result;
  }

  RpcMempoolEntry._();

  factory RpcMempoolEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcMempoolEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcMempoolEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcTransaction>(3, _omitFieldNames ? '' : 'transaction',
        subBuilder: RpcTransaction.create)
    ..aOB(4, _omitFieldNames ? '' : 'isOrphan', protoName: 'isOrphan')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcMempoolEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcMempoolEntry copyWith(void Function(RpcMempoolEntry) updates) =>
      super.copyWith((message) => updates(message as RpcMempoolEntry))
          as RpcMempoolEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcMempoolEntry create() => RpcMempoolEntry._();
  @$core.override
  RpcMempoolEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcMempoolEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcMempoolEntry>(create);
  static RpcMempoolEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => $_clearField(1);

  @$pb.TagNumber(3)
  RpcTransaction get transaction => $_getN(1);
  @$pb.TagNumber(3)
  set transaction(RpcTransaction value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransaction() => $_has(1);
  @$pb.TagNumber(3)
  void clearTransaction() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcTransaction ensureTransaction() => $_ensure(1);

  @$pb.TagNumber(4)
  $core.bool get isOrphan => $_getBF(2);
  @$pb.TagNumber(4)
  set isOrphan($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(4)
  $core.bool hasIsOrphan() => $_has(2);
  @$pb.TagNumber(4)
  void clearIsOrphan() => $_clearField(4);
}

/// GetConnectedPeerInfoRequestMessage requests information about all the p2p peers
/// currently connected to this kaspad.
class GetConnectedPeerInfoRequestMessage extends $pb.GeneratedMessage {
  factory GetConnectedPeerInfoRequestMessage() => create();

  GetConnectedPeerInfoRequestMessage._();

  factory GetConnectedPeerInfoRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetConnectedPeerInfoRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetConnectedPeerInfoRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectedPeerInfoRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectedPeerInfoRequestMessage copyWith(
          void Function(GetConnectedPeerInfoRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetConnectedPeerInfoRequestMessage))
          as GetConnectedPeerInfoRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConnectedPeerInfoRequestMessage create() =>
      GetConnectedPeerInfoRequestMessage._();
  @$core.override
  GetConnectedPeerInfoRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetConnectedPeerInfoRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetConnectedPeerInfoRequestMessage>(
          create);
  static GetConnectedPeerInfoRequestMessage? _defaultInstance;
}

class GetConnectedPeerInfoResponseMessage extends $pb.GeneratedMessage {
  factory GetConnectedPeerInfoResponseMessage({
    $core.Iterable<GetConnectedPeerInfoMessage>? infos,
    RPCError? error,
  }) {
    final result = create();
    if (infos != null) result.infos.addAll(infos);
    if (error != null) result.error = error;
    return result;
  }

  GetConnectedPeerInfoResponseMessage._();

  factory GetConnectedPeerInfoResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetConnectedPeerInfoResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetConnectedPeerInfoResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<GetConnectedPeerInfoMessage>(1, _omitFieldNames ? '' : 'infos',
        subBuilder: GetConnectedPeerInfoMessage.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectedPeerInfoResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectedPeerInfoResponseMessage copyWith(
          void Function(GetConnectedPeerInfoResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetConnectedPeerInfoResponseMessage))
          as GetConnectedPeerInfoResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConnectedPeerInfoResponseMessage create() =>
      GetConnectedPeerInfoResponseMessage._();
  @$core.override
  GetConnectedPeerInfoResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetConnectedPeerInfoResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetConnectedPeerInfoResponseMessage>(create);
  static GetConnectedPeerInfoResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GetConnectedPeerInfoMessage> get infos => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class GetConnectedPeerInfoMessage extends $pb.GeneratedMessage {
  factory GetConnectedPeerInfoMessage({
    $core.String? id,
    $core.String? address,
    $fixnum.Int64? lastPingDuration,
    $core.bool? isOutbound,
    $fixnum.Int64? timeOffset,
    $core.String? userAgent,
    $core.int? advertisedProtocolVersion,
    $fixnum.Int64? timeConnected,
    $core.bool? isIbdPeer,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (address != null) result.address = address;
    if (lastPingDuration != null) result.lastPingDuration = lastPingDuration;
    if (isOutbound != null) result.isOutbound = isOutbound;
    if (timeOffset != null) result.timeOffset = timeOffset;
    if (userAgent != null) result.userAgent = userAgent;
    if (advertisedProtocolVersion != null)
      result.advertisedProtocolVersion = advertisedProtocolVersion;
    if (timeConnected != null) result.timeConnected = timeConnected;
    if (isIbdPeer != null) result.isIbdPeer = isIbdPeer;
    return result;
  }

  GetConnectedPeerInfoMessage._();

  factory GetConnectedPeerInfoMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetConnectedPeerInfoMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetConnectedPeerInfoMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aInt64(3, _omitFieldNames ? '' : 'lastPingDuration',
        protoName: 'lastPingDuration')
    ..aOB(6, _omitFieldNames ? '' : 'isOutbound', protoName: 'isOutbound')
    ..aInt64(7, _omitFieldNames ? '' : 'timeOffset', protoName: 'timeOffset')
    ..aOS(8, _omitFieldNames ? '' : 'userAgent', protoName: 'userAgent')
    ..aI(9, _omitFieldNames ? '' : 'advertisedProtocolVersion',
        protoName: 'advertisedProtocolVersion', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(10, _omitFieldNames ? '' : 'timeConnected',
        protoName: 'timeConnected')
    ..aOB(11, _omitFieldNames ? '' : 'isIbdPeer', protoName: 'isIbdPeer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectedPeerInfoMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectedPeerInfoMessage copyWith(
          void Function(GetConnectedPeerInfoMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetConnectedPeerInfoMessage))
          as GetConnectedPeerInfoMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConnectedPeerInfoMessage create() =>
      GetConnectedPeerInfoMessage._();
  @$core.override
  GetConnectedPeerInfoMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetConnectedPeerInfoMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetConnectedPeerInfoMessage>(create);
  static GetConnectedPeerInfoMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  /// How long did the last ping/pong exchange take
  @$pb.TagNumber(3)
  $fixnum.Int64 get lastPingDuration => $_getI64(2);
  @$pb.TagNumber(3)
  set lastPingDuration($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastPingDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastPingDuration() => $_clearField(3);

  /// Whether this kaspad initiated the connection
  @$pb.TagNumber(6)
  $core.bool get isOutbound => $_getBF(3);
  @$pb.TagNumber(6)
  set isOutbound($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(6)
  $core.bool hasIsOutbound() => $_has(3);
  @$pb.TagNumber(6)
  void clearIsOutbound() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get timeOffset => $_getI64(4);
  @$pb.TagNumber(7)
  set timeOffset($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(7)
  $core.bool hasTimeOffset() => $_has(4);
  @$pb.TagNumber(7)
  void clearTimeOffset() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get userAgent => $_getSZ(5);
  @$pb.TagNumber(8)
  set userAgent($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasUserAgent() => $_has(5);
  @$pb.TagNumber(8)
  void clearUserAgent() => $_clearField(8);

  /// The protocol version that this peer claims to support
  @$pb.TagNumber(9)
  $core.int get advertisedProtocolVersion => $_getIZ(6);
  @$pb.TagNumber(9)
  set advertisedProtocolVersion($core.int value) =>
      $_setUnsignedInt32(6, value);
  @$pb.TagNumber(9)
  $core.bool hasAdvertisedProtocolVersion() => $_has(6);
  @$pb.TagNumber(9)
  void clearAdvertisedProtocolVersion() => $_clearField(9);

  /// The timestamp of when this peer connected to this kaspad
  @$pb.TagNumber(10)
  $fixnum.Int64 get timeConnected => $_getI64(7);
  @$pb.TagNumber(10)
  set timeConnected($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(10)
  $core.bool hasTimeConnected() => $_has(7);
  @$pb.TagNumber(10)
  void clearTimeConnected() => $_clearField(10);

  /// Whether this peer is the IBD peer (if IBD is running)
  @$pb.TagNumber(11)
  $core.bool get isIbdPeer => $_getBF(8);
  @$pb.TagNumber(11)
  set isIbdPeer($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(11)
  $core.bool hasIsIbdPeer() => $_has(8);
  @$pb.TagNumber(11)
  void clearIsIbdPeer() => $_clearField(11);
}

/// AddPeerRequestMessage adds a peer to kaspad's outgoing connection list.
/// This will, in most cases, result in kaspad connecting to said peer.
class AddPeerRequestMessage extends $pb.GeneratedMessage {
  factory AddPeerRequestMessage({
    $core.String? address,
    $core.bool? isPermanent,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (isPermanent != null) result.isPermanent = isPermanent;
    return result;
  }

  AddPeerRequestMessage._();

  factory AddPeerRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddPeerRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddPeerRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aOB(2, _omitFieldNames ? '' : 'isPermanent', protoName: 'isPermanent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddPeerRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddPeerRequestMessage copyWith(
          void Function(AddPeerRequestMessage) updates) =>
      super.copyWith((message) => updates(message as AddPeerRequestMessage))
          as AddPeerRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPeerRequestMessage create() => AddPeerRequestMessage._();
  @$core.override
  AddPeerRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddPeerRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddPeerRequestMessage>(create);
  static AddPeerRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// Whether to keep attempting to connect to this peer after disconnection
  @$pb.TagNumber(2)
  $core.bool get isPermanent => $_getBF(1);
  @$pb.TagNumber(2)
  set isPermanent($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsPermanent() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsPermanent() => $_clearField(2);
}

class AddPeerResponseMessage extends $pb.GeneratedMessage {
  factory AddPeerResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  AddPeerResponseMessage._();

  factory AddPeerResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddPeerResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddPeerResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddPeerResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddPeerResponseMessage copyWith(
          void Function(AddPeerResponseMessage) updates) =>
      super.copyWith((message) => updates(message as AddPeerResponseMessage))
          as AddPeerResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPeerResponseMessage create() => AddPeerResponseMessage._();
  @$core.override
  AddPeerResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddPeerResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddPeerResponseMessage>(create);
  static AddPeerResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// SubmitTransactionRequestMessage submits a transaction to the mempool
class SubmitTransactionRequestMessage extends $pb.GeneratedMessage {
  factory SubmitTransactionRequestMessage({
    RpcTransaction? transaction,
    $core.bool? allowOrphan,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    if (allowOrphan != null) result.allowOrphan = allowOrphan;
    return result;
  }

  SubmitTransactionRequestMessage._();

  factory SubmitTransactionRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitTransactionRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitTransactionRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcTransaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: RpcTransaction.create)
    ..aOB(2, _omitFieldNames ? '' : 'allowOrphan', protoName: 'allowOrphan')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionRequestMessage copyWith(
          void Function(SubmitTransactionRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitTransactionRequestMessage))
          as SubmitTransactionRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitTransactionRequestMessage create() =>
      SubmitTransactionRequestMessage._();
  @$core.override
  SubmitTransactionRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitTransactionRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitTransactionRequestMessage>(
          create);
  static SubmitTransactionRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RpcTransaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(RpcTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcTransaction ensureTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get allowOrphan => $_getBF(1);
  @$pb.TagNumber(2)
  set allowOrphan($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAllowOrphan() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowOrphan() => $_clearField(2);
}

class SubmitTransactionResponseMessage extends $pb.GeneratedMessage {
  factory SubmitTransactionResponseMessage({
    $core.String? transactionId,
    RPCError? error,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (error != null) result.error = error;
    return result;
  }

  SubmitTransactionResponseMessage._();

  factory SubmitTransactionResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitTransactionResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitTransactionResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionResponseMessage copyWith(
          void Function(SubmitTransactionResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitTransactionResponseMessage))
          as SubmitTransactionResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitTransactionResponseMessage create() =>
      SubmitTransactionResponseMessage._();
  @$core.override
  SubmitTransactionResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitTransactionResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitTransactionResponseMessage>(
          create);
  static SubmitTransactionResponseMessage? _defaultInstance;

  /// The transaction ID of the submitted transaction
  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// SubmitTransactionReplacementRequestMessage submits a transaction to the mempool, applying a mandatory Replace by Fee policy
class SubmitTransactionReplacementRequestMessage extends $pb.GeneratedMessage {
  factory SubmitTransactionReplacementRequestMessage({
    RpcTransaction? transaction,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    return result;
  }

  SubmitTransactionReplacementRequestMessage._();

  factory SubmitTransactionReplacementRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitTransactionReplacementRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitTransactionReplacementRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcTransaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: RpcTransaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionReplacementRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionReplacementRequestMessage copyWith(
          void Function(SubmitTransactionReplacementRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as SubmitTransactionReplacementRequestMessage))
          as SubmitTransactionReplacementRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitTransactionReplacementRequestMessage create() =>
      SubmitTransactionReplacementRequestMessage._();
  @$core.override
  SubmitTransactionReplacementRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitTransactionReplacementRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SubmitTransactionReplacementRequestMessage>(create);
  static SubmitTransactionReplacementRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RpcTransaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(RpcTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcTransaction ensureTransaction() => $_ensure(0);
}

class SubmitTransactionReplacementResponseMessage extends $pb.GeneratedMessage {
  factory SubmitTransactionReplacementResponseMessage({
    $core.String? transactionId,
    RpcTransaction? replacedTransaction,
    RPCError? error,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (replacedTransaction != null)
      result.replacedTransaction = replacedTransaction;
    if (error != null) result.error = error;
    return result;
  }

  SubmitTransactionReplacementResponseMessage._();

  factory SubmitTransactionReplacementResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitTransactionReplacementResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitTransactionReplacementResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId')
    ..aOM<RpcTransaction>(2, _omitFieldNames ? '' : 'replacedTransaction',
        protoName: 'replacedTransaction', subBuilder: RpcTransaction.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionReplacementResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitTransactionReplacementResponseMessage copyWith(
          void Function(SubmitTransactionReplacementResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as SubmitTransactionReplacementResponseMessage))
          as SubmitTransactionReplacementResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitTransactionReplacementResponseMessage create() =>
      SubmitTransactionReplacementResponseMessage._();
  @$core.override
  SubmitTransactionReplacementResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitTransactionReplacementResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SubmitTransactionReplacementResponseMessage>(create);
  static SubmitTransactionReplacementResponseMessage? _defaultInstance;

  /// The transaction ID of the submitted transaction
  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);

  /// The previous transaction replaced in the mempool by the newly submitted one
  @$pb.TagNumber(2)
  RpcTransaction get replacedTransaction => $_getN(1);
  @$pb.TagNumber(2)
  set replacedTransaction(RpcTransaction value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReplacedTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplacedTransaction() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcTransaction ensureReplacedTransaction() => $_ensure(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

/// NotifyVirtualChainChangedRequestMessage registers this connection for virtualChainChanged notifications.
///
/// See: VirtualChainChangedNotificationMessage
class NotifyVirtualChainChangedRequestMessage extends $pb.GeneratedMessage {
  factory NotifyVirtualChainChangedRequestMessage({
    $core.bool? includeAcceptedTransactionIds,
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (includeAcceptedTransactionIds != null)
      result.includeAcceptedTransactionIds = includeAcceptedTransactionIds;
    if (command != null) result.command = command;
    return result;
  }

  NotifyVirtualChainChangedRequestMessage._();

  factory NotifyVirtualChainChangedRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyVirtualChainChangedRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyVirtualChainChangedRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'includeAcceptedTransactionIds',
        protoName: 'includeAcceptedTransactionIds')
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualChainChangedRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualChainChangedRequestMessage copyWith(
          void Function(NotifyVirtualChainChangedRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyVirtualChainChangedRequestMessage))
          as NotifyVirtualChainChangedRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyVirtualChainChangedRequestMessage create() =>
      NotifyVirtualChainChangedRequestMessage._();
  @$core.override
  NotifyVirtualChainChangedRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyVirtualChainChangedRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyVirtualChainChangedRequestMessage>(create);
  static NotifyVirtualChainChangedRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeAcceptedTransactionIds => $_getBF(0);
  @$pb.TagNumber(1)
  set includeAcceptedTransactionIds($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIncludeAcceptedTransactionIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeAcceptedTransactionIds() => $_clearField(1);

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(1);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(1);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyVirtualChainChangedResponseMessage extends $pb.GeneratedMessage {
  factory NotifyVirtualChainChangedResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyVirtualChainChangedResponseMessage._();

  factory NotifyVirtualChainChangedResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyVirtualChainChangedResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyVirtualChainChangedResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualChainChangedResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualChainChangedResponseMessage copyWith(
          void Function(NotifyVirtualChainChangedResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyVirtualChainChangedResponseMessage))
          as NotifyVirtualChainChangedResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyVirtualChainChangedResponseMessage create() =>
      NotifyVirtualChainChangedResponseMessage._();
  @$core.override
  NotifyVirtualChainChangedResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyVirtualChainChangedResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyVirtualChainChangedResponseMessage>(create);
  static NotifyVirtualChainChangedResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// VirtualChainChangedNotificationMessage is sent whenever the DAG's selected parent
/// chain had changed.
///
/// See: NotifyVirtualChainChangedRequestMessage
class VirtualChainChangedNotificationMessage extends $pb.GeneratedMessage {
  factory VirtualChainChangedNotificationMessage({
    $core.Iterable<$core.String>? removedChainBlockHashes,
    $core.Iterable<RpcAcceptedTransactionIds>? acceptedTransactionIds,
    $core.Iterable<$core.String>? addedChainBlockHashes,
  }) {
    final result = create();
    if (removedChainBlockHashes != null)
      result.removedChainBlockHashes.addAll(removedChainBlockHashes);
    if (acceptedTransactionIds != null)
      result.acceptedTransactionIds.addAll(acceptedTransactionIds);
    if (addedChainBlockHashes != null)
      result.addedChainBlockHashes.addAll(addedChainBlockHashes);
    return result;
  }

  VirtualChainChangedNotificationMessage._();

  factory VirtualChainChangedNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VirtualChainChangedNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VirtualChainChangedNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'removedChainBlockHashes',
        protoName: 'removedChainBlockHashes')
    ..pPM<RpcAcceptedTransactionIds>(
        2, _omitFieldNames ? '' : 'acceptedTransactionIds',
        protoName: 'acceptedTransactionIds',
        subBuilder: RpcAcceptedTransactionIds.create)
    ..pPS(3, _omitFieldNames ? '' : 'addedChainBlockHashes',
        protoName: 'addedChainBlockHashes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VirtualChainChangedNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VirtualChainChangedNotificationMessage copyWith(
          void Function(VirtualChainChangedNotificationMessage) updates) =>
      super.copyWith((message) =>
              updates(message as VirtualChainChangedNotificationMessage))
          as VirtualChainChangedNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VirtualChainChangedNotificationMessage create() =>
      VirtualChainChangedNotificationMessage._();
  @$core.override
  VirtualChainChangedNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VirtualChainChangedNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VirtualChainChangedNotificationMessage>(create);
  static VirtualChainChangedNotificationMessage? _defaultInstance;

  /// The chain blocks that were removed, in high-to-low order
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get removedChainBlockHashes => $_getList(0);

  /// Will be filled only if `includeAcceptedTransactionIds = true` in the notify request.
  @$pb.TagNumber(2)
  $pb.PbList<RpcAcceptedTransactionIds> get acceptedTransactionIds =>
      $_getList(1);

  /// The chain blocks that were added, in low-to-high order
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get addedChainBlockHashes => $_getList(2);
}

/// GetBlockRequestMessage requests information about a specific block
class GetBlockRequestMessage extends $pb.GeneratedMessage {
  factory GetBlockRequestMessage({
    $core.String? hash,
    $core.bool? includeTransactions,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (includeTransactions != null)
      result.includeTransactions = includeTransactions;
    return result;
  }

  GetBlockRequestMessage._();

  factory GetBlockRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hash')
    ..aOB(3, _omitFieldNames ? '' : 'includeTransactions',
        protoName: 'includeTransactions')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockRequestMessage copyWith(
          void Function(GetBlockRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetBlockRequestMessage))
          as GetBlockRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockRequestMessage create() => GetBlockRequestMessage._();
  @$core.override
  GetBlockRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockRequestMessage>(create);
  static GetBlockRequestMessage? _defaultInstance;

  /// The hash of the requested block
  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);

  /// Whether to include transaction data in the response
  @$pb.TagNumber(3)
  $core.bool get includeTransactions => $_getBF(1);
  @$pb.TagNumber(3)
  set includeTransactions($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(3)
  $core.bool hasIncludeTransactions() => $_has(1);
  @$pb.TagNumber(3)
  void clearIncludeTransactions() => $_clearField(3);
}

class GetBlockResponseMessage extends $pb.GeneratedMessage {
  factory GetBlockResponseMessage({
    RpcBlock? block,
    RPCError? error,
  }) {
    final result = create();
    if (block != null) result.block = block;
    if (error != null) result.error = error;
    return result;
  }

  GetBlockResponseMessage._();

  factory GetBlockResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcBlock>(3, _omitFieldNames ? '' : 'block',
        subBuilder: RpcBlock.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockResponseMessage copyWith(
          void Function(GetBlockResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetBlockResponseMessage))
          as GetBlockResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockResponseMessage create() => GetBlockResponseMessage._();
  @$core.override
  GetBlockResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockResponseMessage>(create);
  static GetBlockResponseMessage? _defaultInstance;

  @$pb.TagNumber(3)
  RpcBlock get block => $_getN(0);
  @$pb.TagNumber(3)
  set block(RpcBlock value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(3)
  void clearBlock() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcBlock ensureBlock() => $_ensure(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// GetSubnetworkRequestMessage requests information about a specific subnetwork
///
/// Currently unimplemented
class GetSubnetworkRequestMessage extends $pb.GeneratedMessage {
  factory GetSubnetworkRequestMessage({
    $core.String? subnetworkId,
  }) {
    final result = create();
    if (subnetworkId != null) result.subnetworkId = subnetworkId;
    return result;
  }

  GetSubnetworkRequestMessage._();

  factory GetSubnetworkRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSubnetworkRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSubnetworkRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subnetworkId', protoName: 'subnetworkId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSubnetworkRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSubnetworkRequestMessage copyWith(
          void Function(GetSubnetworkRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSubnetworkRequestMessage))
          as GetSubnetworkRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSubnetworkRequestMessage create() =>
      GetSubnetworkRequestMessage._();
  @$core.override
  GetSubnetworkRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSubnetworkRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSubnetworkRequestMessage>(create);
  static GetSubnetworkRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subnetworkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subnetworkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubnetworkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubnetworkId() => $_clearField(1);
}

class GetSubnetworkResponseMessage extends $pb.GeneratedMessage {
  factory GetSubnetworkResponseMessage({
    $fixnum.Int64? gasLimit,
    RPCError? error,
  }) {
    final result = create();
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (error != null) result.error = error;
    return result;
  }

  GetSubnetworkResponseMessage._();

  factory GetSubnetworkResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSubnetworkResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSubnetworkResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'gasLimit', $pb.PbFieldType.OU6,
        protoName: 'gasLimit', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSubnetworkResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSubnetworkResponseMessage copyWith(
          void Function(GetSubnetworkResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSubnetworkResponseMessage))
          as GetSubnetworkResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSubnetworkResponseMessage create() =>
      GetSubnetworkResponseMessage._();
  @$core.override
  GetSubnetworkResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSubnetworkResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSubnetworkResponseMessage>(create);
  static GetSubnetworkResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gasLimit => $_getI64(0);
  @$pb.TagNumber(1)
  set gasLimit($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearGasLimit() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// / GetVirtualChainFromBlockRequestMessage requests the virtual selected
/// / parent chain from some startHash to this kaspad's current virtual
/// / Note:
/// /     this call batches the response to:
/// /         a. the network's `mergeset size limit * 10` amount of added chain blocks, if `includeAcceptedTransactionIds = false`
/// /         b. or `mergeset size limit * 10` amount of merged blocks, if `includeAcceptedTransactionIds = true`
/// /         c. it does not batch the removed chain blocks, only the added ones.
class GetVirtualChainFromBlockRequestMessage extends $pb.GeneratedMessage {
  factory GetVirtualChainFromBlockRequestMessage({
    $core.String? startHash,
    $core.bool? includeAcceptedTransactionIds,
    $fixnum.Int64? minConfirmationCount,
  }) {
    final result = create();
    if (startHash != null) result.startHash = startHash;
    if (includeAcceptedTransactionIds != null)
      result.includeAcceptedTransactionIds = includeAcceptedTransactionIds;
    if (minConfirmationCount != null)
      result.minConfirmationCount = minConfirmationCount;
    return result;
  }

  GetVirtualChainFromBlockRequestMessage._();

  factory GetVirtualChainFromBlockRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVirtualChainFromBlockRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVirtualChainFromBlockRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startHash', protoName: 'startHash')
    ..aOB(2, _omitFieldNames ? '' : 'includeAcceptedTransactionIds',
        protoName: 'includeAcceptedTransactionIds')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'minConfirmationCount', $pb.PbFieldType.OU6,
        protoName: 'minConfirmationCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockRequestMessage copyWith(
          void Function(GetVirtualChainFromBlockRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetVirtualChainFromBlockRequestMessage))
          as GetVirtualChainFromBlockRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockRequestMessage create() =>
      GetVirtualChainFromBlockRequestMessage._();
  @$core.override
  GetVirtualChainFromBlockRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetVirtualChainFromBlockRequestMessage>(create);
  static GetVirtualChainFromBlockRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set startHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeAcceptedTransactionIds => $_getBF(1);
  @$pb.TagNumber(2)
  set includeAcceptedTransactionIds($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeAcceptedTransactionIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeAcceptedTransactionIds() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get minConfirmationCount => $_getI64(2);
  @$pb.TagNumber(3)
  set minConfirmationCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinConfirmationCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinConfirmationCount() => $_clearField(3);
}

class RpcAcceptedTransactionIds extends $pb.GeneratedMessage {
  factory RpcAcceptedTransactionIds({
    $core.String? acceptingBlockHash,
    $core.Iterable<$core.String>? acceptedTransactionIds,
  }) {
    final result = create();
    if (acceptingBlockHash != null)
      result.acceptingBlockHash = acceptingBlockHash;
    if (acceptedTransactionIds != null)
      result.acceptedTransactionIds.addAll(acceptedTransactionIds);
    return result;
  }

  RpcAcceptedTransactionIds._();

  factory RpcAcceptedTransactionIds.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcAcceptedTransactionIds.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcAcceptedTransactionIds',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'acceptingBlockHash',
        protoName: 'acceptingBlockHash')
    ..pPS(2, _omitFieldNames ? '' : 'acceptedTransactionIds',
        protoName: 'acceptedTransactionIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcAcceptedTransactionIds clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcAcceptedTransactionIds copyWith(
          void Function(RpcAcceptedTransactionIds) updates) =>
      super.copyWith((message) => updates(message as RpcAcceptedTransactionIds))
          as RpcAcceptedTransactionIds;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcAcceptedTransactionIds create() => RpcAcceptedTransactionIds._();
  @$core.override
  RpcAcceptedTransactionIds createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcAcceptedTransactionIds getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcAcceptedTransactionIds>(create);
  static RpcAcceptedTransactionIds? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get acceptingBlockHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set acceptingBlockHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAcceptingBlockHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearAcceptingBlockHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get acceptedTransactionIds => $_getList(1);
}

class GetVirtualChainFromBlockResponseMessage extends $pb.GeneratedMessage {
  factory GetVirtualChainFromBlockResponseMessage({
    $core.Iterable<$core.String>? removedChainBlockHashes,
    $core.Iterable<RpcAcceptedTransactionIds>? acceptedTransactionIds,
    $core.Iterable<$core.String>? addedChainBlockHashes,
    RPCError? error,
  }) {
    final result = create();
    if (removedChainBlockHashes != null)
      result.removedChainBlockHashes.addAll(removedChainBlockHashes);
    if (acceptedTransactionIds != null)
      result.acceptedTransactionIds.addAll(acceptedTransactionIds);
    if (addedChainBlockHashes != null)
      result.addedChainBlockHashes.addAll(addedChainBlockHashes);
    if (error != null) result.error = error;
    return result;
  }

  GetVirtualChainFromBlockResponseMessage._();

  factory GetVirtualChainFromBlockResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVirtualChainFromBlockResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVirtualChainFromBlockResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'removedChainBlockHashes',
        protoName: 'removedChainBlockHashes')
    ..pPM<RpcAcceptedTransactionIds>(
        2, _omitFieldNames ? '' : 'acceptedTransactionIds',
        protoName: 'acceptedTransactionIds',
        subBuilder: RpcAcceptedTransactionIds.create)
    ..pPS(3, _omitFieldNames ? '' : 'addedChainBlockHashes',
        protoName: 'addedChainBlockHashes')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockResponseMessage copyWith(
          void Function(GetVirtualChainFromBlockResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetVirtualChainFromBlockResponseMessage))
          as GetVirtualChainFromBlockResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockResponseMessage create() =>
      GetVirtualChainFromBlockResponseMessage._();
  @$core.override
  GetVirtualChainFromBlockResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetVirtualChainFromBlockResponseMessage>(create);
  static GetVirtualChainFromBlockResponseMessage? _defaultInstance;

  /// The chain blocks that were removed, in high-to-low order
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get removedChainBlockHashes => $_getList(0);

  /// The transactions accepted by each block in addedChainBlockHashes.
  /// Will be filled only if `includeAcceptedTransactionIds = true` in the request.
  @$pb.TagNumber(2)
  $pb.PbList<RpcAcceptedTransactionIds> get acceptedTransactionIds =>
      $_getList(1);

  /// The chain blocks that were added, in low-to-high order
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get addedChainBlockHashes => $_getList(2);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(3);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(3);
}

/// GetBlocksRequestMessage requests blocks between a certain block lowHash up to this
/// kaspad's current virtual.
class GetBlocksRequestMessage extends $pb.GeneratedMessage {
  factory GetBlocksRequestMessage({
    $core.String? lowHash,
    $core.bool? includeBlocks,
    $core.bool? includeTransactions,
  }) {
    final result = create();
    if (lowHash != null) result.lowHash = lowHash;
    if (includeBlocks != null) result.includeBlocks = includeBlocks;
    if (includeTransactions != null)
      result.includeTransactions = includeTransactions;
    return result;
  }

  GetBlocksRequestMessage._();

  factory GetBlocksRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlocksRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlocksRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lowHash', protoName: 'lowHash')
    ..aOB(2, _omitFieldNames ? '' : 'includeBlocks', protoName: 'includeBlocks')
    ..aOB(3, _omitFieldNames ? '' : 'includeTransactions',
        protoName: 'includeTransactions')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlocksRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlocksRequestMessage copyWith(
          void Function(GetBlocksRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetBlocksRequestMessage))
          as GetBlocksRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlocksRequestMessage create() => GetBlocksRequestMessage._();
  @$core.override
  GetBlocksRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlocksRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlocksRequestMessage>(create);
  static GetBlocksRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lowHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set lowHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLowHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearLowHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeBlocks => $_getBF(1);
  @$pb.TagNumber(2)
  set includeBlocks($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeBlocks() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeBlocks() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get includeTransactions => $_getBF(2);
  @$pb.TagNumber(3)
  set includeTransactions($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIncludeTransactions() => $_has(2);
  @$pb.TagNumber(3)
  void clearIncludeTransactions() => $_clearField(3);
}

class GetBlocksResponseMessage extends $pb.GeneratedMessage {
  factory GetBlocksResponseMessage({
    $core.Iterable<RpcBlock>? blocks,
    $core.Iterable<$core.String>? blockHashes,
    RPCError? error,
  }) {
    final result = create();
    if (blocks != null) result.blocks.addAll(blocks);
    if (blockHashes != null) result.blockHashes.addAll(blockHashes);
    if (error != null) result.error = error;
    return result;
  }

  GetBlocksResponseMessage._();

  factory GetBlocksResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlocksResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlocksResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<RpcBlock>(3, _omitFieldNames ? '' : 'blocks',
        subBuilder: RpcBlock.create)
    ..pPS(4, _omitFieldNames ? '' : 'blockHashes', protoName: 'blockHashes')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlocksResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlocksResponseMessage copyWith(
          void Function(GetBlocksResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetBlocksResponseMessage))
          as GetBlocksResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlocksResponseMessage create() => GetBlocksResponseMessage._();
  @$core.override
  GetBlocksResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlocksResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlocksResponseMessage>(create);
  static GetBlocksResponseMessage? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<RpcBlock> get blocks => $_getList(0);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get blockHashes => $_getList(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

/// GetBlockCountRequestMessage requests the current number of blocks in this kaspad.
/// Note that this number may decrease as pruning occurs.
class GetBlockCountRequestMessage extends $pb.GeneratedMessage {
  factory GetBlockCountRequestMessage() => create();

  GetBlockCountRequestMessage._();

  factory GetBlockCountRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockCountRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockCountRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockCountRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockCountRequestMessage copyWith(
          void Function(GetBlockCountRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockCountRequestMessage))
          as GetBlockCountRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockCountRequestMessage create() =>
      GetBlockCountRequestMessage._();
  @$core.override
  GetBlockCountRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockCountRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockCountRequestMessage>(create);
  static GetBlockCountRequestMessage? _defaultInstance;
}

class GetBlockCountResponseMessage extends $pb.GeneratedMessage {
  factory GetBlockCountResponseMessage({
    $fixnum.Int64? blockCount,
    $fixnum.Int64? headerCount,
    RPCError? error,
  }) {
    final result = create();
    if (blockCount != null) result.blockCount = blockCount;
    if (headerCount != null) result.headerCount = headerCount;
    if (error != null) result.error = error;
    return result;
  }

  GetBlockCountResponseMessage._();

  factory GetBlockCountResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockCountResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockCountResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'blockCount', $pb.PbFieldType.OU6,
        protoName: 'blockCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'headerCount', $pb.PbFieldType.OU6,
        protoName: 'headerCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockCountResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockCountResponseMessage copyWith(
          void Function(GetBlockCountResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockCountResponseMessage))
          as GetBlockCountResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockCountResponseMessage create() =>
      GetBlockCountResponseMessage._();
  @$core.override
  GetBlockCountResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockCountResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockCountResponseMessage>(create);
  static GetBlockCountResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockCount => $_getI64(0);
  @$pb.TagNumber(1)
  set blockCount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBlockCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get headerCount => $_getI64(1);
  @$pb.TagNumber(2)
  set headerCount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHeaderCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeaderCount() => $_clearField(2);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

/// GetBlockDagInfoRequestMessage requests general information about the current state
/// of this kaspad's DAG.
class GetBlockDagInfoRequestMessage extends $pb.GeneratedMessage {
  factory GetBlockDagInfoRequestMessage() => create();

  GetBlockDagInfoRequestMessage._();

  factory GetBlockDagInfoRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockDagInfoRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockDagInfoRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockDagInfoRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockDagInfoRequestMessage copyWith(
          void Function(GetBlockDagInfoRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockDagInfoRequestMessage))
          as GetBlockDagInfoRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockDagInfoRequestMessage create() =>
      GetBlockDagInfoRequestMessage._();
  @$core.override
  GetBlockDagInfoRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockDagInfoRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockDagInfoRequestMessage>(create);
  static GetBlockDagInfoRequestMessage? _defaultInstance;
}

class GetBlockDagInfoResponseMessage extends $pb.GeneratedMessage {
  factory GetBlockDagInfoResponseMessage({
    $core.String? networkName,
    $fixnum.Int64? blockCount,
    $fixnum.Int64? headerCount,
    $core.Iterable<$core.String>? tipHashes,
    $core.double? difficulty,
    $fixnum.Int64? pastMedianTime,
    $core.Iterable<$core.String>? virtualParentHashes,
    $core.String? pruningPointHash,
    $fixnum.Int64? virtualDaaScore,
    $core.String? sink,
    RPCError? error,
  }) {
    final result = create();
    if (networkName != null) result.networkName = networkName;
    if (blockCount != null) result.blockCount = blockCount;
    if (headerCount != null) result.headerCount = headerCount;
    if (tipHashes != null) result.tipHashes.addAll(tipHashes);
    if (difficulty != null) result.difficulty = difficulty;
    if (pastMedianTime != null) result.pastMedianTime = pastMedianTime;
    if (virtualParentHashes != null)
      result.virtualParentHashes.addAll(virtualParentHashes);
    if (pruningPointHash != null) result.pruningPointHash = pruningPointHash;
    if (virtualDaaScore != null) result.virtualDaaScore = virtualDaaScore;
    if (sink != null) result.sink = sink;
    if (error != null) result.error = error;
    return result;
  }

  GetBlockDagInfoResponseMessage._();

  factory GetBlockDagInfoResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockDagInfoResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockDagInfoResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'networkName', protoName: 'networkName')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'blockCount', $pb.PbFieldType.OU6,
        protoName: 'blockCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'headerCount', $pb.PbFieldType.OU6,
        protoName: 'headerCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPS(4, _omitFieldNames ? '' : 'tipHashes', protoName: 'tipHashes')
    ..aD(5, _omitFieldNames ? '' : 'difficulty')
    ..aInt64(6, _omitFieldNames ? '' : 'pastMedianTime',
        protoName: 'pastMedianTime')
    ..pPS(7, _omitFieldNames ? '' : 'virtualParentHashes',
        protoName: 'virtualParentHashes')
    ..aOS(8, _omitFieldNames ? '' : 'pruningPointHash',
        protoName: 'pruningPointHash')
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'virtualDaaScore', $pb.PbFieldType.OU6,
        protoName: 'virtualDaaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(10, _omitFieldNames ? '' : 'sink')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockDagInfoResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockDagInfoResponseMessage copyWith(
          void Function(GetBlockDagInfoResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockDagInfoResponseMessage))
          as GetBlockDagInfoResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockDagInfoResponseMessage create() =>
      GetBlockDagInfoResponseMessage._();
  @$core.override
  GetBlockDagInfoResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockDagInfoResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockDagInfoResponseMessage>(create);
  static GetBlockDagInfoResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get networkName => $_getSZ(0);
  @$pb.TagNumber(1)
  set networkName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNetworkName() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetworkName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blockCount => $_getI64(1);
  @$pb.TagNumber(2)
  set blockCount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBlockCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get headerCount => $_getI64(2);
  @$pb.TagNumber(3)
  set headerCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHeaderCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeaderCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get tipHashes => $_getList(3);

  @$pb.TagNumber(5)
  $core.double get difficulty => $_getN(4);
  @$pb.TagNumber(5)
  set difficulty($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDifficulty() => $_has(4);
  @$pb.TagNumber(5)
  void clearDifficulty() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get pastMedianTime => $_getI64(5);
  @$pb.TagNumber(6)
  set pastMedianTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPastMedianTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearPastMedianTime() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get virtualParentHashes => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get pruningPointHash => $_getSZ(7);
  @$pb.TagNumber(8)
  set pruningPointHash($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPruningPointHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearPruningPointHash() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get virtualDaaScore => $_getI64(8);
  @$pb.TagNumber(9)
  set virtualDaaScore($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasVirtualDaaScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearVirtualDaaScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get sink => $_getSZ(9);
  @$pb.TagNumber(10)
  set sink($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSink() => $_has(9);
  @$pb.TagNumber(10)
  void clearSink() => $_clearField(10);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(10);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(10);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(10);
}

class ResolveFinalityConflictRequestMessage extends $pb.GeneratedMessage {
  factory ResolveFinalityConflictRequestMessage({
    $core.String? finalityBlockHash,
  }) {
    final result = create();
    if (finalityBlockHash != null) result.finalityBlockHash = finalityBlockHash;
    return result;
  }

  ResolveFinalityConflictRequestMessage._();

  factory ResolveFinalityConflictRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveFinalityConflictRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveFinalityConflictRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'finalityBlockHash',
        protoName: 'finalityBlockHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveFinalityConflictRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveFinalityConflictRequestMessage copyWith(
          void Function(ResolveFinalityConflictRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as ResolveFinalityConflictRequestMessage))
          as ResolveFinalityConflictRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveFinalityConflictRequestMessage create() =>
      ResolveFinalityConflictRequestMessage._();
  @$core.override
  ResolveFinalityConflictRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveFinalityConflictRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ResolveFinalityConflictRequestMessage>(create);
  static ResolveFinalityConflictRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get finalityBlockHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set finalityBlockHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalityBlockHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalityBlockHash() => $_clearField(1);
}

class ResolveFinalityConflictResponseMessage extends $pb.GeneratedMessage {
  factory ResolveFinalityConflictResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  ResolveFinalityConflictResponseMessage._();

  factory ResolveFinalityConflictResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveFinalityConflictResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveFinalityConflictResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveFinalityConflictResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveFinalityConflictResponseMessage copyWith(
          void Function(ResolveFinalityConflictResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as ResolveFinalityConflictResponseMessage))
          as ResolveFinalityConflictResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveFinalityConflictResponseMessage create() =>
      ResolveFinalityConflictResponseMessage._();
  @$core.override
  ResolveFinalityConflictResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveFinalityConflictResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ResolveFinalityConflictResponseMessage>(create);
  static ResolveFinalityConflictResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

class NotifyFinalityConflictRequestMessage extends $pb.GeneratedMessage {
  factory NotifyFinalityConflictRequestMessage({
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (command != null) result.command = command;
    return result;
  }

  NotifyFinalityConflictRequestMessage._();

  factory NotifyFinalityConflictRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyFinalityConflictRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyFinalityConflictRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyFinalityConflictRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyFinalityConflictRequestMessage copyWith(
          void Function(NotifyFinalityConflictRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyFinalityConflictRequestMessage))
          as NotifyFinalityConflictRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyFinalityConflictRequestMessage create() =>
      NotifyFinalityConflictRequestMessage._();
  @$core.override
  NotifyFinalityConflictRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyFinalityConflictRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyFinalityConflictRequestMessage>(create);
  static NotifyFinalityConflictRequestMessage? _defaultInstance;

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(0);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyFinalityConflictResponseMessage extends $pb.GeneratedMessage {
  factory NotifyFinalityConflictResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyFinalityConflictResponseMessage._();

  factory NotifyFinalityConflictResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyFinalityConflictResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyFinalityConflictResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyFinalityConflictResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyFinalityConflictResponseMessage copyWith(
          void Function(NotifyFinalityConflictResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyFinalityConflictResponseMessage))
          as NotifyFinalityConflictResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyFinalityConflictResponseMessage create() =>
      NotifyFinalityConflictResponseMessage._();
  @$core.override
  NotifyFinalityConflictResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyFinalityConflictResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyFinalityConflictResponseMessage>(create);
  static NotifyFinalityConflictResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

class FinalityConflictNotificationMessage extends $pb.GeneratedMessage {
  factory FinalityConflictNotificationMessage({
    $core.String? violatingBlockHash,
  }) {
    final result = create();
    if (violatingBlockHash != null)
      result.violatingBlockHash = violatingBlockHash;
    return result;
  }

  FinalityConflictNotificationMessage._();

  factory FinalityConflictNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalityConflictNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalityConflictNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'violatingBlockHash',
        protoName: 'violatingBlockHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalityConflictNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalityConflictNotificationMessage copyWith(
          void Function(FinalityConflictNotificationMessage) updates) =>
      super.copyWith((message) =>
              updates(message as FinalityConflictNotificationMessage))
          as FinalityConflictNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalityConflictNotificationMessage create() =>
      FinalityConflictNotificationMessage._();
  @$core.override
  FinalityConflictNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalityConflictNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          FinalityConflictNotificationMessage>(create);
  static FinalityConflictNotificationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get violatingBlockHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set violatingBlockHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasViolatingBlockHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearViolatingBlockHash() => $_clearField(1);
}

class FinalityConflictResolvedNotificationMessage extends $pb.GeneratedMessage {
  factory FinalityConflictResolvedNotificationMessage({
    $core.String? finalityBlockHash,
  }) {
    final result = create();
    if (finalityBlockHash != null) result.finalityBlockHash = finalityBlockHash;
    return result;
  }

  FinalityConflictResolvedNotificationMessage._();

  factory FinalityConflictResolvedNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalityConflictResolvedNotificationMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalityConflictResolvedNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'finalityBlockHash',
        protoName: 'finalityBlockHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalityConflictResolvedNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalityConflictResolvedNotificationMessage copyWith(
          void Function(FinalityConflictResolvedNotificationMessage) updates) =>
      super.copyWith((message) =>
              updates(message as FinalityConflictResolvedNotificationMessage))
          as FinalityConflictResolvedNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalityConflictResolvedNotificationMessage create() =>
      FinalityConflictResolvedNotificationMessage._();
  @$core.override
  FinalityConflictResolvedNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalityConflictResolvedNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          FinalityConflictResolvedNotificationMessage>(create);
  static FinalityConflictResolvedNotificationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get finalityBlockHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set finalityBlockHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalityBlockHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalityBlockHash() => $_clearField(1);
}

/// ShutdownRequestMessage shuts down this kaspad.
class ShutdownRequestMessage extends $pb.GeneratedMessage {
  factory ShutdownRequestMessage() => create();

  ShutdownRequestMessage._();

  factory ShutdownRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShutdownRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShutdownRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShutdownRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShutdownRequestMessage copyWith(
          void Function(ShutdownRequestMessage) updates) =>
      super.copyWith((message) => updates(message as ShutdownRequestMessage))
          as ShutdownRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShutdownRequestMessage create() => ShutdownRequestMessage._();
  @$core.override
  ShutdownRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShutdownRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShutdownRequestMessage>(create);
  static ShutdownRequestMessage? _defaultInstance;
}

class ShutdownResponseMessage extends $pb.GeneratedMessage {
  factory ShutdownResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  ShutdownResponseMessage._();

  factory ShutdownResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShutdownResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShutdownResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShutdownResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShutdownResponseMessage copyWith(
          void Function(ShutdownResponseMessage) updates) =>
      super.copyWith((message) => updates(message as ShutdownResponseMessage))
          as ShutdownResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShutdownResponseMessage create() => ShutdownResponseMessage._();
  @$core.override
  ShutdownResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShutdownResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShutdownResponseMessage>(create);
  static ShutdownResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// GetHeadersRequestMessage requests headers between the given startHash and the
/// current virtual, up to the given limit.
class GetHeadersRequestMessage extends $pb.GeneratedMessage {
  factory GetHeadersRequestMessage({
    $core.String? startHash,
    $fixnum.Int64? limit,
    $core.bool? isAscending,
  }) {
    final result = create();
    if (startHash != null) result.startHash = startHash;
    if (limit != null) result.limit = limit;
    if (isAscending != null) result.isAscending = isAscending;
    return result;
  }

  GetHeadersRequestMessage._();

  factory GetHeadersRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetHeadersRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetHeadersRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startHash', protoName: 'startHash')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(3, _omitFieldNames ? '' : 'isAscending', protoName: 'isAscending')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHeadersRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHeadersRequestMessage copyWith(
          void Function(GetHeadersRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetHeadersRequestMessage))
          as GetHeadersRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHeadersRequestMessage create() => GetHeadersRequestMessage._();
  @$core.override
  GetHeadersRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetHeadersRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetHeadersRequestMessage>(create);
  static GetHeadersRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set startHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAscending => $_getBF(2);
  @$pb.TagNumber(3)
  set isAscending($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsAscending() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAscending() => $_clearField(3);
}

class GetHeadersResponseMessage extends $pb.GeneratedMessage {
  factory GetHeadersResponseMessage({
    $core.Iterable<$core.String>? headers,
    RPCError? error,
  }) {
    final result = create();
    if (headers != null) result.headers.addAll(headers);
    if (error != null) result.error = error;
    return result;
  }

  GetHeadersResponseMessage._();

  factory GetHeadersResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetHeadersResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetHeadersResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'headers')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHeadersResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHeadersResponseMessage copyWith(
          void Function(GetHeadersResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetHeadersResponseMessage))
          as GetHeadersResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHeadersResponseMessage create() => GetHeadersResponseMessage._();
  @$core.override
  GetHeadersResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetHeadersResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetHeadersResponseMessage>(create);
  static GetHeadersResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get headers => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// NotifyUtxosChangedRequestMessage registers this connection for utxoChanged notifications
/// for the given addresses.
///
/// This call is only available when this kaspad was started with `--utxoindex`
///
/// See: UtxosChangedNotificationMessage
class NotifyUtxosChangedRequestMessage extends $pb.GeneratedMessage {
  factory NotifyUtxosChangedRequestMessage({
    $core.Iterable<$core.String>? addresses,
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (addresses != null) result.addresses.addAll(addresses);
    if (command != null) result.command = command;
    return result;
  }

  NotifyUtxosChangedRequestMessage._();

  factory NotifyUtxosChangedRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyUtxosChangedRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyUtxosChangedRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'addresses')
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyUtxosChangedRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyUtxosChangedRequestMessage copyWith(
          void Function(NotifyUtxosChangedRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as NotifyUtxosChangedRequestMessage))
          as NotifyUtxosChangedRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyUtxosChangedRequestMessage create() =>
      NotifyUtxosChangedRequestMessage._();
  @$core.override
  NotifyUtxosChangedRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyUtxosChangedRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotifyUtxosChangedRequestMessage>(
          create);
  static NotifyUtxosChangedRequestMessage? _defaultInstance;

  /// UTXOs addresses to start/stop getting notified about
  /// Leave empty to start/stop all updates
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get addresses => $_getList(0);

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(1);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(1);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyUtxosChangedResponseMessage extends $pb.GeneratedMessage {
  factory NotifyUtxosChangedResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyUtxosChangedResponseMessage._();

  factory NotifyUtxosChangedResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyUtxosChangedResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyUtxosChangedResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyUtxosChangedResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyUtxosChangedResponseMessage copyWith(
          void Function(NotifyUtxosChangedResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyUtxosChangedResponseMessage))
          as NotifyUtxosChangedResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyUtxosChangedResponseMessage create() =>
      NotifyUtxosChangedResponseMessage._();
  @$core.override
  NotifyUtxosChangedResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyUtxosChangedResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotifyUtxosChangedResponseMessage>(
          create);
  static NotifyUtxosChangedResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// UtxosChangedNotificationMessage is sent whenever the UTXO index had been updated.
///
/// See: NotifyUtxosChangedRequestMessage
class UtxosChangedNotificationMessage extends $pb.GeneratedMessage {
  factory UtxosChangedNotificationMessage({
    $core.Iterable<RpcUtxosByAddressesEntry>? added,
    $core.Iterable<RpcUtxosByAddressesEntry>? removed,
  }) {
    final result = create();
    if (added != null) result.added.addAll(added);
    if (removed != null) result.removed.addAll(removed);
    return result;
  }

  UtxosChangedNotificationMessage._();

  factory UtxosChangedNotificationMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UtxosChangedNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UtxosChangedNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<RpcUtxosByAddressesEntry>(1, _omitFieldNames ? '' : 'added',
        subBuilder: RpcUtxosByAddressesEntry.create)
    ..pPM<RpcUtxosByAddressesEntry>(2, _omitFieldNames ? '' : 'removed',
        subBuilder: RpcUtxosByAddressesEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxosChangedNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxosChangedNotificationMessage copyWith(
          void Function(UtxosChangedNotificationMessage) updates) =>
      super.copyWith(
              (message) => updates(message as UtxosChangedNotificationMessage))
          as UtxosChangedNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UtxosChangedNotificationMessage create() =>
      UtxosChangedNotificationMessage._();
  @$core.override
  UtxosChangedNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UtxosChangedNotificationMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UtxosChangedNotificationMessage>(
          create);
  static UtxosChangedNotificationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RpcUtxosByAddressesEntry> get added => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<RpcUtxosByAddressesEntry> get removed => $_getList(1);
}

class RpcUtxosByAddressesEntry extends $pb.GeneratedMessage {
  factory RpcUtxosByAddressesEntry({
    $core.String? address,
    RpcOutpoint? outpoint,
    RpcUtxoEntry? utxoEntry,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (outpoint != null) result.outpoint = outpoint;
    if (utxoEntry != null) result.utxoEntry = utxoEntry;
    return result;
  }

  RpcUtxosByAddressesEntry._();

  factory RpcUtxosByAddressesEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcUtxosByAddressesEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcUtxosByAddressesEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aOM<RpcOutpoint>(2, _omitFieldNames ? '' : 'outpoint',
        subBuilder: RpcOutpoint.create)
    ..aOM<RpcUtxoEntry>(3, _omitFieldNames ? '' : 'utxoEntry',
        protoName: 'utxoEntry', subBuilder: RpcUtxoEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcUtxosByAddressesEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcUtxosByAddressesEntry copyWith(
          void Function(RpcUtxosByAddressesEntry) updates) =>
      super.copyWith((message) => updates(message as RpcUtxosByAddressesEntry))
          as RpcUtxosByAddressesEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcUtxosByAddressesEntry create() => RpcUtxosByAddressesEntry._();
  @$core.override
  RpcUtxosByAddressesEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcUtxosByAddressesEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcUtxosByAddressesEntry>(create);
  static RpcUtxosByAddressesEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  RpcOutpoint get outpoint => $_getN(1);
  @$pb.TagNumber(2)
  set outpoint(RpcOutpoint value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOutpoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutpoint() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcOutpoint ensureOutpoint() => $_ensure(1);

  @$pb.TagNumber(3)
  RpcUtxoEntry get utxoEntry => $_getN(2);
  @$pb.TagNumber(3)
  set utxoEntry(RpcUtxoEntry value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUtxoEntry() => $_has(2);
  @$pb.TagNumber(3)
  void clearUtxoEntry() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcUtxoEntry ensureUtxoEntry() => $_ensure(2);
}

/// StopNotifyingUtxosChangedRequestMessage unregisters this connection for utxoChanged notifications
/// for the given addresses.
///
/// This call is only available when this kaspad was started with `--utxoindex`
///
/// See: UtxosChangedNotificationMessage
///
/// This message only exists for backward compatibility reason with kaspad and is deprecated.
/// Use instead UtxosChangedNotificationMessage with command = NOTIFY_STOP.
class StopNotifyingUtxosChangedRequestMessage extends $pb.GeneratedMessage {
  factory StopNotifyingUtxosChangedRequestMessage({
    $core.Iterable<$core.String>? addresses,
  }) {
    final result = create();
    if (addresses != null) result.addresses.addAll(addresses);
    return result;
  }

  StopNotifyingUtxosChangedRequestMessage._();

  factory StopNotifyingUtxosChangedRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopNotifyingUtxosChangedRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopNotifyingUtxosChangedRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'addresses')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingUtxosChangedRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingUtxosChangedRequestMessage copyWith(
          void Function(StopNotifyingUtxosChangedRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as StopNotifyingUtxosChangedRequestMessage))
          as StopNotifyingUtxosChangedRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopNotifyingUtxosChangedRequestMessage create() =>
      StopNotifyingUtxosChangedRequestMessage._();
  @$core.override
  StopNotifyingUtxosChangedRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StopNotifyingUtxosChangedRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          StopNotifyingUtxosChangedRequestMessage>(create);
  static StopNotifyingUtxosChangedRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get addresses => $_getList(0);
}

class StopNotifyingUtxosChangedResponseMessage extends $pb.GeneratedMessage {
  factory StopNotifyingUtxosChangedResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  StopNotifyingUtxosChangedResponseMessage._();

  factory StopNotifyingUtxosChangedResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopNotifyingUtxosChangedResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopNotifyingUtxosChangedResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingUtxosChangedResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingUtxosChangedResponseMessage copyWith(
          void Function(StopNotifyingUtxosChangedResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as StopNotifyingUtxosChangedResponseMessage))
          as StopNotifyingUtxosChangedResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopNotifyingUtxosChangedResponseMessage create() =>
      StopNotifyingUtxosChangedResponseMessage._();
  @$core.override
  StopNotifyingUtxosChangedResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StopNotifyingUtxosChangedResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          StopNotifyingUtxosChangedResponseMessage>(create);
  static StopNotifyingUtxosChangedResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// GetUtxosByAddressesRequestMessage requests all current UTXOs for the given kaspad addresses
///
/// This call is only available when this kaspad was started with `--utxoindex`
class GetUtxosByAddressesRequestMessage extends $pb.GeneratedMessage {
  factory GetUtxosByAddressesRequestMessage({
    $core.Iterable<$core.String>? addresses,
  }) {
    final result = create();
    if (addresses != null) result.addresses.addAll(addresses);
    return result;
  }

  GetUtxosByAddressesRequestMessage._();

  factory GetUtxosByAddressesRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxosByAddressesRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxosByAddressesRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'addresses')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosByAddressesRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosByAddressesRequestMessage copyWith(
          void Function(GetUtxosByAddressesRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetUtxosByAddressesRequestMessage))
          as GetUtxosByAddressesRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxosByAddressesRequestMessage create() =>
      GetUtxosByAddressesRequestMessage._();
  @$core.override
  GetUtxosByAddressesRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxosByAddressesRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxosByAddressesRequestMessage>(
          create);
  static GetUtxosByAddressesRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get addresses => $_getList(0);
}

class GetUtxosByAddressesResponseMessage extends $pb.GeneratedMessage {
  factory GetUtxosByAddressesResponseMessage({
    $core.Iterable<RpcUtxosByAddressesEntry>? entries,
    RPCError? error,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    if (error != null) result.error = error;
    return result;
  }

  GetUtxosByAddressesResponseMessage._();

  factory GetUtxosByAddressesResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxosByAddressesResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxosByAddressesResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<RpcUtxosByAddressesEntry>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: RpcUtxosByAddressesEntry.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosByAddressesResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosByAddressesResponseMessage copyWith(
          void Function(GetUtxosByAddressesResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetUtxosByAddressesResponseMessage))
          as GetUtxosByAddressesResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxosByAddressesResponseMessage create() =>
      GetUtxosByAddressesResponseMessage._();
  @$core.override
  GetUtxosByAddressesResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxosByAddressesResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxosByAddressesResponseMessage>(
          create);
  static GetUtxosByAddressesResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RpcUtxosByAddressesEntry> get entries => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// GetBalanceByAddressRequest returns the total balance in unspent transactions towards a given address
///
/// This call is only available when this kaspad was started with `--utxoindex`
class GetBalanceByAddressRequestMessage extends $pb.GeneratedMessage {
  factory GetBalanceByAddressRequestMessage({
    $core.String? address,
  }) {
    final result = create();
    if (address != null) result.address = address;
    return result;
  }

  GetBalanceByAddressRequestMessage._();

  factory GetBalanceByAddressRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBalanceByAddressRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBalanceByAddressRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalanceByAddressRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalanceByAddressRequestMessage copyWith(
          void Function(GetBalanceByAddressRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetBalanceByAddressRequestMessage))
          as GetBalanceByAddressRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBalanceByAddressRequestMessage create() =>
      GetBalanceByAddressRequestMessage._();
  @$core.override
  GetBalanceByAddressRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBalanceByAddressRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBalanceByAddressRequestMessage>(
          create);
  static GetBalanceByAddressRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);
}

class GetBalanceByAddressResponseMessage extends $pb.GeneratedMessage {
  factory GetBalanceByAddressResponseMessage({
    $fixnum.Int64? balance,
    RPCError? error,
  }) {
    final result = create();
    if (balance != null) result.balance = balance;
    if (error != null) result.error = error;
    return result;
  }

  GetBalanceByAddressResponseMessage._();

  factory GetBalanceByAddressResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBalanceByAddressResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBalanceByAddressResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalanceByAddressResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalanceByAddressResponseMessage copyWith(
          void Function(GetBalanceByAddressResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetBalanceByAddressResponseMessage))
          as GetBalanceByAddressResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBalanceByAddressResponseMessage create() =>
      GetBalanceByAddressResponseMessage._();
  @$core.override
  GetBalanceByAddressResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBalanceByAddressResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBalanceByAddressResponseMessage>(
          create);
  static GetBalanceByAddressResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class GetBalancesByAddressesRequestMessage extends $pb.GeneratedMessage {
  factory GetBalancesByAddressesRequestMessage({
    $core.Iterable<$core.String>? addresses,
  }) {
    final result = create();
    if (addresses != null) result.addresses.addAll(addresses);
    return result;
  }

  GetBalancesByAddressesRequestMessage._();

  factory GetBalancesByAddressesRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBalancesByAddressesRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBalancesByAddressesRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'addresses')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalancesByAddressesRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalancesByAddressesRequestMessage copyWith(
          void Function(GetBalancesByAddressesRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetBalancesByAddressesRequestMessage))
          as GetBalancesByAddressesRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBalancesByAddressesRequestMessage create() =>
      GetBalancesByAddressesRequestMessage._();
  @$core.override
  GetBalancesByAddressesRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBalancesByAddressesRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetBalancesByAddressesRequestMessage>(create);
  static GetBalancesByAddressesRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get addresses => $_getList(0);
}

class RpcBalancesByAddressesEntry extends $pb.GeneratedMessage {
  factory RpcBalancesByAddressesEntry({
    $core.String? address,
    $fixnum.Int64? balance,
    RPCError? error,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (balance != null) result.balance = balance;
    if (error != null) result.error = error;
    return result;
  }

  RpcBalancesByAddressesEntry._();

  factory RpcBalancesByAddressesEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcBalancesByAddressesEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcBalancesByAddressesEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBalancesByAddressesEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcBalancesByAddressesEntry copyWith(
          void Function(RpcBalancesByAddressesEntry) updates) =>
      super.copyWith(
              (message) => updates(message as RpcBalancesByAddressesEntry))
          as RpcBalancesByAddressesEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcBalancesByAddressesEntry create() =>
      RpcBalancesByAddressesEntry._();
  @$core.override
  RpcBalancesByAddressesEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcBalancesByAddressesEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcBalancesByAddressesEntry>(create);
  static RpcBalancesByAddressesEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get balance => $_getI64(1);
  @$pb.TagNumber(2)
  set balance($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalance() => $_clearField(2);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

class GetBalancesByAddressesResponseMessage extends $pb.GeneratedMessage {
  factory GetBalancesByAddressesResponseMessage({
    $core.Iterable<RpcBalancesByAddressesEntry>? entries,
    RPCError? error,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    if (error != null) result.error = error;
    return result;
  }

  GetBalancesByAddressesResponseMessage._();

  factory GetBalancesByAddressesResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBalancesByAddressesResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBalancesByAddressesResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<RpcBalancesByAddressesEntry>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: RpcBalancesByAddressesEntry.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalancesByAddressesResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBalancesByAddressesResponseMessage copyWith(
          void Function(GetBalancesByAddressesResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetBalancesByAddressesResponseMessage))
          as GetBalancesByAddressesResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBalancesByAddressesResponseMessage create() =>
      GetBalancesByAddressesResponseMessage._();
  @$core.override
  GetBalancesByAddressesResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBalancesByAddressesResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetBalancesByAddressesResponseMessage>(create);
  static GetBalancesByAddressesResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RpcBalancesByAddressesEntry> get entries => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// GetSinkBlueScoreRequestMessage requests the blue score of the current selected parent
/// of the virtual block.
class GetSinkBlueScoreRequestMessage extends $pb.GeneratedMessage {
  factory GetSinkBlueScoreRequestMessage() => create();

  GetSinkBlueScoreRequestMessage._();

  factory GetSinkBlueScoreRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSinkBlueScoreRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSinkBlueScoreRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkBlueScoreRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkBlueScoreRequestMessage copyWith(
          void Function(GetSinkBlueScoreRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSinkBlueScoreRequestMessage))
          as GetSinkBlueScoreRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSinkBlueScoreRequestMessage create() =>
      GetSinkBlueScoreRequestMessage._();
  @$core.override
  GetSinkBlueScoreRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSinkBlueScoreRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSinkBlueScoreRequestMessage>(create);
  static GetSinkBlueScoreRequestMessage? _defaultInstance;
}

class GetSinkBlueScoreResponseMessage extends $pb.GeneratedMessage {
  factory GetSinkBlueScoreResponseMessage({
    $fixnum.Int64? blueScore,
    RPCError? error,
  }) {
    final result = create();
    if (blueScore != null) result.blueScore = blueScore;
    if (error != null) result.error = error;
    return result;
  }

  GetSinkBlueScoreResponseMessage._();

  factory GetSinkBlueScoreResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSinkBlueScoreResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSinkBlueScoreResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'blueScore', $pb.PbFieldType.OU6,
        protoName: 'blueScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkBlueScoreResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSinkBlueScoreResponseMessage copyWith(
          void Function(GetSinkBlueScoreResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSinkBlueScoreResponseMessage))
          as GetSinkBlueScoreResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSinkBlueScoreResponseMessage create() =>
      GetSinkBlueScoreResponseMessage._();
  @$core.override
  GetSinkBlueScoreResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSinkBlueScoreResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSinkBlueScoreResponseMessage>(
          create);
  static GetSinkBlueScoreResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blueScore => $_getI64(0);
  @$pb.TagNumber(1)
  set blueScore($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBlueScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlueScore() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// NotifySinkBlueScoreChangedRequestMessage registers this connection for
/// sinkBlueScoreChanged notifications.
///
/// See: SinkBlueScoreChangedNotificationMessage
class NotifySinkBlueScoreChangedRequestMessage extends $pb.GeneratedMessage {
  factory NotifySinkBlueScoreChangedRequestMessage({
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (command != null) result.command = command;
    return result;
  }

  NotifySinkBlueScoreChangedRequestMessage._();

  factory NotifySinkBlueScoreChangedRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifySinkBlueScoreChangedRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifySinkBlueScoreChangedRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifySinkBlueScoreChangedRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifySinkBlueScoreChangedRequestMessage copyWith(
          void Function(NotifySinkBlueScoreChangedRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifySinkBlueScoreChangedRequestMessage))
          as NotifySinkBlueScoreChangedRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifySinkBlueScoreChangedRequestMessage create() =>
      NotifySinkBlueScoreChangedRequestMessage._();
  @$core.override
  NotifySinkBlueScoreChangedRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifySinkBlueScoreChangedRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifySinkBlueScoreChangedRequestMessage>(create);
  static NotifySinkBlueScoreChangedRequestMessage? _defaultInstance;

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(0);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifySinkBlueScoreChangedResponseMessage extends $pb.GeneratedMessage {
  factory NotifySinkBlueScoreChangedResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifySinkBlueScoreChangedResponseMessage._();

  factory NotifySinkBlueScoreChangedResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifySinkBlueScoreChangedResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifySinkBlueScoreChangedResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifySinkBlueScoreChangedResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifySinkBlueScoreChangedResponseMessage copyWith(
          void Function(NotifySinkBlueScoreChangedResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifySinkBlueScoreChangedResponseMessage))
          as NotifySinkBlueScoreChangedResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifySinkBlueScoreChangedResponseMessage create() =>
      NotifySinkBlueScoreChangedResponseMessage._();
  @$core.override
  NotifySinkBlueScoreChangedResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifySinkBlueScoreChangedResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifySinkBlueScoreChangedResponseMessage>(create);
  static NotifySinkBlueScoreChangedResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// SinkBlueScoreChangedNotificationMessage is sent whenever the blue score
/// of the virtual's selected parent changes.
///
/// See NotifySinkBlueScoreChangedRequestMessage
class SinkBlueScoreChangedNotificationMessage extends $pb.GeneratedMessage {
  factory SinkBlueScoreChangedNotificationMessage({
    $fixnum.Int64? sinkBlueScore,
  }) {
    final result = create();
    if (sinkBlueScore != null) result.sinkBlueScore = sinkBlueScore;
    return result;
  }

  SinkBlueScoreChangedNotificationMessage._();

  factory SinkBlueScoreChangedNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SinkBlueScoreChangedNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SinkBlueScoreChangedNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sinkBlueScore', $pb.PbFieldType.OU6,
        protoName: 'sinkBlueScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SinkBlueScoreChangedNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SinkBlueScoreChangedNotificationMessage copyWith(
          void Function(SinkBlueScoreChangedNotificationMessage) updates) =>
      super.copyWith((message) =>
              updates(message as SinkBlueScoreChangedNotificationMessage))
          as SinkBlueScoreChangedNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SinkBlueScoreChangedNotificationMessage create() =>
      SinkBlueScoreChangedNotificationMessage._();
  @$core.override
  SinkBlueScoreChangedNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SinkBlueScoreChangedNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SinkBlueScoreChangedNotificationMessage>(create);
  static SinkBlueScoreChangedNotificationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sinkBlueScore => $_getI64(0);
  @$pb.TagNumber(1)
  set sinkBlueScore($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSinkBlueScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearSinkBlueScore() => $_clearField(1);
}

/// NotifyVirtualDaaScoreChangedRequestMessage registers this connection for
/// virtualDaaScoreChanged notifications.
///
/// See: VirtualDaaScoreChangedNotificationMessage
class NotifyVirtualDaaScoreChangedRequestMessage extends $pb.GeneratedMessage {
  factory NotifyVirtualDaaScoreChangedRequestMessage({
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (command != null) result.command = command;
    return result;
  }

  NotifyVirtualDaaScoreChangedRequestMessage._();

  factory NotifyVirtualDaaScoreChangedRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyVirtualDaaScoreChangedRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyVirtualDaaScoreChangedRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualDaaScoreChangedRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualDaaScoreChangedRequestMessage copyWith(
          void Function(NotifyVirtualDaaScoreChangedRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyVirtualDaaScoreChangedRequestMessage))
          as NotifyVirtualDaaScoreChangedRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyVirtualDaaScoreChangedRequestMessage create() =>
      NotifyVirtualDaaScoreChangedRequestMessage._();
  @$core.override
  NotifyVirtualDaaScoreChangedRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyVirtualDaaScoreChangedRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyVirtualDaaScoreChangedRequestMessage>(create);
  static NotifyVirtualDaaScoreChangedRequestMessage? _defaultInstance;

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(0);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyVirtualDaaScoreChangedResponseMessage extends $pb.GeneratedMessage {
  factory NotifyVirtualDaaScoreChangedResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyVirtualDaaScoreChangedResponseMessage._();

  factory NotifyVirtualDaaScoreChangedResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyVirtualDaaScoreChangedResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyVirtualDaaScoreChangedResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualDaaScoreChangedResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyVirtualDaaScoreChangedResponseMessage copyWith(
          void Function(NotifyVirtualDaaScoreChangedResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyVirtualDaaScoreChangedResponseMessage))
          as NotifyVirtualDaaScoreChangedResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyVirtualDaaScoreChangedResponseMessage create() =>
      NotifyVirtualDaaScoreChangedResponseMessage._();
  @$core.override
  NotifyVirtualDaaScoreChangedResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyVirtualDaaScoreChangedResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyVirtualDaaScoreChangedResponseMessage>(create);
  static NotifyVirtualDaaScoreChangedResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// VirtualDaaScoreChangedNotificationMessage is sent whenever the DAA score
/// of the virtual changes.
///
/// See NotifyVirtualDaaScoreChangedRequestMessage
class VirtualDaaScoreChangedNotificationMessage extends $pb.GeneratedMessage {
  factory VirtualDaaScoreChangedNotificationMessage({
    $fixnum.Int64? virtualDaaScore,
  }) {
    final result = create();
    if (virtualDaaScore != null) result.virtualDaaScore = virtualDaaScore;
    return result;
  }

  VirtualDaaScoreChangedNotificationMessage._();

  factory VirtualDaaScoreChangedNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VirtualDaaScoreChangedNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VirtualDaaScoreChangedNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'virtualDaaScore', $pb.PbFieldType.OU6,
        protoName: 'virtualDaaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VirtualDaaScoreChangedNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VirtualDaaScoreChangedNotificationMessage copyWith(
          void Function(VirtualDaaScoreChangedNotificationMessage) updates) =>
      super.copyWith((message) =>
              updates(message as VirtualDaaScoreChangedNotificationMessage))
          as VirtualDaaScoreChangedNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VirtualDaaScoreChangedNotificationMessage create() =>
      VirtualDaaScoreChangedNotificationMessage._();
  @$core.override
  VirtualDaaScoreChangedNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VirtualDaaScoreChangedNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VirtualDaaScoreChangedNotificationMessage>(create);
  static VirtualDaaScoreChangedNotificationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get virtualDaaScore => $_getI64(0);
  @$pb.TagNumber(1)
  set virtualDaaScore($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVirtualDaaScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearVirtualDaaScore() => $_clearField(1);
}

/// NotifyPruningPointUtxoSetOverrideRequestMessage registers this connection for
/// pruning point UTXO set override notifications.
///
/// This call is only available when this kaspad was started with `--utxoindex`
///
/// See: NotifyPruningPointUtxoSetOverrideResponseMessage
class NotifyPruningPointUtxoSetOverrideRequestMessage
    extends $pb.GeneratedMessage {
  factory NotifyPruningPointUtxoSetOverrideRequestMessage({
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (command != null) result.command = command;
    return result;
  }

  NotifyPruningPointUtxoSetOverrideRequestMessage._();

  factory NotifyPruningPointUtxoSetOverrideRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyPruningPointUtxoSetOverrideRequestMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'NotifyPruningPointUtxoSetOverrideRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyPruningPointUtxoSetOverrideRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyPruningPointUtxoSetOverrideRequestMessage copyWith(
          void Function(NotifyPruningPointUtxoSetOverrideRequestMessage)
              updates) =>
      super.copyWith((message) => updates(
              message as NotifyPruningPointUtxoSetOverrideRequestMessage))
          as NotifyPruningPointUtxoSetOverrideRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyPruningPointUtxoSetOverrideRequestMessage create() =>
      NotifyPruningPointUtxoSetOverrideRequestMessage._();
  @$core.override
  NotifyPruningPointUtxoSetOverrideRequestMessage createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static NotifyPruningPointUtxoSetOverrideRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyPruningPointUtxoSetOverrideRequestMessage>(create);
  static NotifyPruningPointUtxoSetOverrideRequestMessage? _defaultInstance;

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(0);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyPruningPointUtxoSetOverrideResponseMessage
    extends $pb.GeneratedMessage {
  factory NotifyPruningPointUtxoSetOverrideResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyPruningPointUtxoSetOverrideResponseMessage._();

  factory NotifyPruningPointUtxoSetOverrideResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyPruningPointUtxoSetOverrideResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'NotifyPruningPointUtxoSetOverrideResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyPruningPointUtxoSetOverrideResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyPruningPointUtxoSetOverrideResponseMessage copyWith(
          void Function(NotifyPruningPointUtxoSetOverrideResponseMessage)
              updates) =>
      super.copyWith((message) => updates(
              message as NotifyPruningPointUtxoSetOverrideResponseMessage))
          as NotifyPruningPointUtxoSetOverrideResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyPruningPointUtxoSetOverrideResponseMessage create() =>
      NotifyPruningPointUtxoSetOverrideResponseMessage._();
  @$core.override
  NotifyPruningPointUtxoSetOverrideResponseMessage createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static NotifyPruningPointUtxoSetOverrideResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyPruningPointUtxoSetOverrideResponseMessage>(create);
  static NotifyPruningPointUtxoSetOverrideResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// PruningPointUtxoSetOverrideNotificationMessage is sent whenever the UTXO index
/// resets due to pruning point change via IBD.
///
/// See NotifyPruningPointUtxoSetOverrideRequestMessage
class PruningPointUtxoSetOverrideNotificationMessage
    extends $pb.GeneratedMessage {
  factory PruningPointUtxoSetOverrideNotificationMessage() => create();

  PruningPointUtxoSetOverrideNotificationMessage._();

  factory PruningPointUtxoSetOverrideNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PruningPointUtxoSetOverrideNotificationMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PruningPointUtxoSetOverrideNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PruningPointUtxoSetOverrideNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PruningPointUtxoSetOverrideNotificationMessage copyWith(
          void Function(PruningPointUtxoSetOverrideNotificationMessage)
              updates) =>
      super.copyWith((message) => updates(
              message as PruningPointUtxoSetOverrideNotificationMessage))
          as PruningPointUtxoSetOverrideNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PruningPointUtxoSetOverrideNotificationMessage create() =>
      PruningPointUtxoSetOverrideNotificationMessage._();
  @$core.override
  PruningPointUtxoSetOverrideNotificationMessage createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static PruningPointUtxoSetOverrideNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          PruningPointUtxoSetOverrideNotificationMessage>(create);
  static PruningPointUtxoSetOverrideNotificationMessage? _defaultInstance;
}

/// StopNotifyingPruningPointUtxoSetOverrideRequestMessage unregisters this connection for
/// pruning point UTXO set override notifications.
///
/// This call is only available when this kaspad was started with `--utxoindex`
///
/// See: PruningPointUtxoSetOverrideNotificationMessage
///
/// This message only exists for backward compatibility reason with kaspad and is deprecated.
/// Use instead NotifyPruningPointUtxoSetOverrideRequestMessage with command = NOTIFY_STOP.
class StopNotifyingPruningPointUtxoSetOverrideRequestMessage
    extends $pb.GeneratedMessage {
  factory StopNotifyingPruningPointUtxoSetOverrideRequestMessage() => create();

  StopNotifyingPruningPointUtxoSetOverrideRequestMessage._();

  factory StopNotifyingPruningPointUtxoSetOverrideRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopNotifyingPruningPointUtxoSetOverrideRequestMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'StopNotifyingPruningPointUtxoSetOverrideRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingPruningPointUtxoSetOverrideRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingPruningPointUtxoSetOverrideRequestMessage copyWith(
          void Function(StopNotifyingPruningPointUtxoSetOverrideRequestMessage)
              updates) =>
      super.copyWith((message) => updates(message
              as StopNotifyingPruningPointUtxoSetOverrideRequestMessage))
          as StopNotifyingPruningPointUtxoSetOverrideRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopNotifyingPruningPointUtxoSetOverrideRequestMessage create() =>
      StopNotifyingPruningPointUtxoSetOverrideRequestMessage._();
  @$core.override
  StopNotifyingPruningPointUtxoSetOverrideRequestMessage
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StopNotifyingPruningPointUtxoSetOverrideRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          StopNotifyingPruningPointUtxoSetOverrideRequestMessage>(create);
  static StopNotifyingPruningPointUtxoSetOverrideRequestMessage?
      _defaultInstance;
}

class StopNotifyingPruningPointUtxoSetOverrideResponseMessage
    extends $pb.GeneratedMessage {
  factory StopNotifyingPruningPointUtxoSetOverrideResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  StopNotifyingPruningPointUtxoSetOverrideResponseMessage._();

  factory StopNotifyingPruningPointUtxoSetOverrideResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopNotifyingPruningPointUtxoSetOverrideResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'StopNotifyingPruningPointUtxoSetOverrideResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingPruningPointUtxoSetOverrideResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopNotifyingPruningPointUtxoSetOverrideResponseMessage copyWith(
          void Function(StopNotifyingPruningPointUtxoSetOverrideResponseMessage)
              updates) =>
      super.copyWith((message) => updates(message
              as StopNotifyingPruningPointUtxoSetOverrideResponseMessage))
          as StopNotifyingPruningPointUtxoSetOverrideResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopNotifyingPruningPointUtxoSetOverrideResponseMessage create() =>
      StopNotifyingPruningPointUtxoSetOverrideResponseMessage._();
  @$core.override
  StopNotifyingPruningPointUtxoSetOverrideResponseMessage
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StopNotifyingPruningPointUtxoSetOverrideResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          StopNotifyingPruningPointUtxoSetOverrideResponseMessage>(create);
  static StopNotifyingPruningPointUtxoSetOverrideResponseMessage?
      _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// BanRequestMessage bans the given ip.
class BanRequestMessage extends $pb.GeneratedMessage {
  factory BanRequestMessage({
    $core.String? ip,
  }) {
    final result = create();
    if (ip != null) result.ip = ip;
    return result;
  }

  BanRequestMessage._();

  factory BanRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BanRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BanRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ip')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanRequestMessage copyWith(void Function(BanRequestMessage) updates) =>
      super.copyWith((message) => updates(message as BanRequestMessage))
          as BanRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanRequestMessage create() => BanRequestMessage._();
  @$core.override
  BanRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BanRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BanRequestMessage>(create);
  static BanRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ip => $_getSZ(0);
  @$pb.TagNumber(1)
  set ip($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIp() => $_has(0);
  @$pb.TagNumber(1)
  void clearIp() => $_clearField(1);
}

class BanResponseMessage extends $pb.GeneratedMessage {
  factory BanResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  BanResponseMessage._();

  factory BanResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BanResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BanResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanResponseMessage copyWith(void Function(BanResponseMessage) updates) =>
      super.copyWith((message) => updates(message as BanResponseMessage))
          as BanResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanResponseMessage create() => BanResponseMessage._();
  @$core.override
  BanResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BanResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BanResponseMessage>(create);
  static BanResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// UnbanRequestMessage unbans the given ip.
class UnbanRequestMessage extends $pb.GeneratedMessage {
  factory UnbanRequestMessage({
    $core.String? ip,
  }) {
    final result = create();
    if (ip != null) result.ip = ip;
    return result;
  }

  UnbanRequestMessage._();

  factory UnbanRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnbanRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnbanRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ip')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbanRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbanRequestMessage copyWith(void Function(UnbanRequestMessage) updates) =>
      super.copyWith((message) => updates(message as UnbanRequestMessage))
          as UnbanRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnbanRequestMessage create() => UnbanRequestMessage._();
  @$core.override
  UnbanRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnbanRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnbanRequestMessage>(create);
  static UnbanRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ip => $_getSZ(0);
  @$pb.TagNumber(1)
  set ip($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIp() => $_has(0);
  @$pb.TagNumber(1)
  void clearIp() => $_clearField(1);
}

class UnbanResponseMessage extends $pb.GeneratedMessage {
  factory UnbanResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  UnbanResponseMessage._();

  factory UnbanResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnbanResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnbanResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbanResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbanResponseMessage copyWith(void Function(UnbanResponseMessage) updates) =>
      super.copyWith((message) => updates(message as UnbanResponseMessage))
          as UnbanResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnbanResponseMessage create() => UnbanResponseMessage._();
  @$core.override
  UnbanResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnbanResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnbanResponseMessage>(create);
  static UnbanResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// GetInfoRequestMessage returns info about the node.
class GetInfoRequestMessage extends $pb.GeneratedMessage {
  factory GetInfoRequestMessage() => create();

  GetInfoRequestMessage._();

  factory GetInfoRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInfoRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInfoRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInfoRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInfoRequestMessage copyWith(
          void Function(GetInfoRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetInfoRequestMessage))
          as GetInfoRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInfoRequestMessage create() => GetInfoRequestMessage._();
  @$core.override
  GetInfoRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInfoRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInfoRequestMessage>(create);
  static GetInfoRequestMessage? _defaultInstance;
}

class GetInfoResponseMessage extends $pb.GeneratedMessage {
  factory GetInfoResponseMessage({
    $core.String? p2pId,
    $fixnum.Int64? mempoolSize,
    $core.String? serverVersion,
    $core.bool? isUtxoIndexed,
    $core.bool? isSynced,
    $core.bool? hasNotifyCommand,
    $core.bool? hasMessageId,
    RPCError? error,
  }) {
    final result = create();
    if (p2pId != null) result.p2pId = p2pId;
    if (mempoolSize != null) result.mempoolSize = mempoolSize;
    if (serverVersion != null) result.serverVersion = serverVersion;
    if (isUtxoIndexed != null) result.isUtxoIndexed = isUtxoIndexed;
    if (isSynced != null) result.isSynced = isSynced;
    if (hasNotifyCommand != null) result.hasNotifyCommand = hasNotifyCommand;
    if (hasMessageId != null) result.hasMessageId = hasMessageId;
    if (error != null) result.error = error;
    return result;
  }

  GetInfoResponseMessage._();

  factory GetInfoResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInfoResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInfoResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'p2pId', protoName: 'p2pId')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'mempoolSize', $pb.PbFieldType.OU6,
        protoName: 'mempoolSize', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'serverVersion', protoName: 'serverVersion')
    ..aOB(4, _omitFieldNames ? '' : 'isUtxoIndexed', protoName: 'isUtxoIndexed')
    ..aOB(5, _omitFieldNames ? '' : 'isSynced', protoName: 'isSynced')
    ..aOB(11, _omitFieldNames ? '' : 'hasNotifyCommand',
        protoName: 'hasNotifyCommand')
    ..aOB(12, _omitFieldNames ? '' : 'hasMessageId', protoName: 'hasMessageId')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInfoResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInfoResponseMessage copyWith(
          void Function(GetInfoResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetInfoResponseMessage))
          as GetInfoResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInfoResponseMessage create() => GetInfoResponseMessage._();
  @$core.override
  GetInfoResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInfoResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInfoResponseMessage>(create);
  static GetInfoResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get p2pId => $_getSZ(0);
  @$pb.TagNumber(1)
  set p2pId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasP2pId() => $_has(0);
  @$pb.TagNumber(1)
  void clearP2pId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mempoolSize => $_getI64(1);
  @$pb.TagNumber(2)
  set mempoolSize($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMempoolSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearMempoolSize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get serverVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set serverVersion($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isUtxoIndexed => $_getBF(3);
  @$pb.TagNumber(4)
  set isUtxoIndexed($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsUtxoIndexed() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsUtxoIndexed() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isSynced => $_getBF(4);
  @$pb.TagNumber(5)
  set isSynced($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsSynced() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsSynced() => $_clearField(5);

  @$pb.TagNumber(11)
  $core.bool get hasNotifyCommand => $_getBF(5);
  @$pb.TagNumber(11)
  set hasNotifyCommand($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(11)
  $core.bool hasHasNotifyCommand() => $_has(5);
  @$pb.TagNumber(11)
  void clearHasNotifyCommand() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get hasMessageId => $_getBF(6);
  @$pb.TagNumber(12)
  set hasMessageId($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(12)
  $core.bool hasHasMessageId() => $_has(6);
  @$pb.TagNumber(12)
  void clearHasMessageId() => $_clearField(12);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(7);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(7);
}

class EstimateNetworkHashesPerSecondRequestMessage
    extends $pb.GeneratedMessage {
  factory EstimateNetworkHashesPerSecondRequestMessage({
    $core.int? windowSize,
    $core.String? startHash,
  }) {
    final result = create();
    if (windowSize != null) result.windowSize = windowSize;
    if (startHash != null) result.startHash = startHash;
    return result;
  }

  EstimateNetworkHashesPerSecondRequestMessage._();

  factory EstimateNetworkHashesPerSecondRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EstimateNetworkHashesPerSecondRequestMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstimateNetworkHashesPerSecondRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'windowSize',
        protoName: 'windowSize', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'startHash', protoName: 'startHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstimateNetworkHashesPerSecondRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstimateNetworkHashesPerSecondRequestMessage copyWith(
          void Function(EstimateNetworkHashesPerSecondRequestMessage)
              updates) =>
      super.copyWith((message) =>
              updates(message as EstimateNetworkHashesPerSecondRequestMessage))
          as EstimateNetworkHashesPerSecondRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EstimateNetworkHashesPerSecondRequestMessage create() =>
      EstimateNetworkHashesPerSecondRequestMessage._();
  @$core.override
  EstimateNetworkHashesPerSecondRequestMessage createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static EstimateNetworkHashesPerSecondRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          EstimateNetworkHashesPerSecondRequestMessage>(create);
  static EstimateNetworkHashesPerSecondRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get windowSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set windowSize($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWindowSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearWindowSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get startHash => $_getSZ(1);
  @$pb.TagNumber(2)
  set startHash($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartHash() => $_clearField(2);
}

class EstimateNetworkHashesPerSecondResponseMessage
    extends $pb.GeneratedMessage {
  factory EstimateNetworkHashesPerSecondResponseMessage({
    $fixnum.Int64? networkHashesPerSecond,
    RPCError? error,
  }) {
    final result = create();
    if (networkHashesPerSecond != null)
      result.networkHashesPerSecond = networkHashesPerSecond;
    if (error != null) result.error = error;
    return result;
  }

  EstimateNetworkHashesPerSecondResponseMessage._();

  factory EstimateNetworkHashesPerSecondResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EstimateNetworkHashesPerSecondResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstimateNetworkHashesPerSecondResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'networkHashesPerSecond', $pb.PbFieldType.OU6,
        protoName: 'networkHashesPerSecond', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstimateNetworkHashesPerSecondResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstimateNetworkHashesPerSecondResponseMessage copyWith(
          void Function(EstimateNetworkHashesPerSecondResponseMessage)
              updates) =>
      super.copyWith((message) =>
              updates(message as EstimateNetworkHashesPerSecondResponseMessage))
          as EstimateNetworkHashesPerSecondResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EstimateNetworkHashesPerSecondResponseMessage create() =>
      EstimateNetworkHashesPerSecondResponseMessage._();
  @$core.override
  EstimateNetworkHashesPerSecondResponseMessage createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static EstimateNetworkHashesPerSecondResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          EstimateNetworkHashesPerSecondResponseMessage>(create);
  static EstimateNetworkHashesPerSecondResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get networkHashesPerSecond => $_getI64(0);
  @$pb.TagNumber(1)
  set networkHashesPerSecond($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNetworkHashesPerSecond() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetworkHashesPerSecond() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

/// NotifyNewBlockTemplateRequestMessage registers this connection for
/// NewBlockTemplate notifications.
///
/// See: NewBlockTemplateNotificationMessage
class NotifyNewBlockTemplateRequestMessage extends $pb.GeneratedMessage {
  factory NotifyNewBlockTemplateRequestMessage({
    RpcNotifyCommand? command,
  }) {
    final result = create();
    if (command != null) result.command = command;
    return result;
  }

  NotifyNewBlockTemplateRequestMessage._();

  factory NotifyNewBlockTemplateRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyNewBlockTemplateRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyNewBlockTemplateRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aE<RpcNotifyCommand>(101, _omitFieldNames ? '' : 'command',
        enumValues: RpcNotifyCommand.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyNewBlockTemplateRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyNewBlockTemplateRequestMessage copyWith(
          void Function(NotifyNewBlockTemplateRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyNewBlockTemplateRequestMessage))
          as NotifyNewBlockTemplateRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyNewBlockTemplateRequestMessage create() =>
      NotifyNewBlockTemplateRequestMessage._();
  @$core.override
  NotifyNewBlockTemplateRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyNewBlockTemplateRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyNewBlockTemplateRequestMessage>(create);
  static NotifyNewBlockTemplateRequestMessage? _defaultInstance;

  @$pb.TagNumber(101)
  RpcNotifyCommand get command => $_getN(0);
  @$pb.TagNumber(101)
  set command(RpcNotifyCommand value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(101)
  void clearCommand() => $_clearField(101);
}

class NotifyNewBlockTemplateResponseMessage extends $pb.GeneratedMessage {
  factory NotifyNewBlockTemplateResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  NotifyNewBlockTemplateResponseMessage._();

  factory NotifyNewBlockTemplateResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyNewBlockTemplateResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyNewBlockTemplateResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyNewBlockTemplateResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyNewBlockTemplateResponseMessage copyWith(
          void Function(NotifyNewBlockTemplateResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NotifyNewBlockTemplateResponseMessage))
          as NotifyNewBlockTemplateResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyNewBlockTemplateResponseMessage create() =>
      NotifyNewBlockTemplateResponseMessage._();
  @$core.override
  NotifyNewBlockTemplateResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifyNewBlockTemplateResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NotifyNewBlockTemplateResponseMessage>(create);
  static NotifyNewBlockTemplateResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

/// NewBlockTemplateNotificationMessage is sent whenever a new updated block template is
/// available for miners.
///
/// See NotifyNewBlockTemplateRequestMessage
class NewBlockTemplateNotificationMessage extends $pb.GeneratedMessage {
  factory NewBlockTemplateNotificationMessage() => create();

  NewBlockTemplateNotificationMessage._();

  factory NewBlockTemplateNotificationMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewBlockTemplateNotificationMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewBlockTemplateNotificationMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewBlockTemplateNotificationMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewBlockTemplateNotificationMessage copyWith(
          void Function(NewBlockTemplateNotificationMessage) updates) =>
      super.copyWith((message) =>
              updates(message as NewBlockTemplateNotificationMessage))
          as NewBlockTemplateNotificationMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewBlockTemplateNotificationMessage create() =>
      NewBlockTemplateNotificationMessage._();
  @$core.override
  NewBlockTemplateNotificationMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewBlockTemplateNotificationMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NewBlockTemplateNotificationMessage>(create);
  static NewBlockTemplateNotificationMessage? _defaultInstance;
}

class RpcMempoolEntryByAddress extends $pb.GeneratedMessage {
  factory RpcMempoolEntryByAddress({
    $core.String? address,
    $core.Iterable<RpcMempoolEntry>? sending,
    $core.Iterable<RpcMempoolEntry>? receiving,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (sending != null) result.sending.addAll(sending);
    if (receiving != null) result.receiving.addAll(receiving);
    return result;
  }

  RpcMempoolEntryByAddress._();

  factory RpcMempoolEntryByAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcMempoolEntryByAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcMempoolEntryByAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..pPM<RpcMempoolEntry>(2, _omitFieldNames ? '' : 'sending',
        subBuilder: RpcMempoolEntry.create)
    ..pPM<RpcMempoolEntry>(3, _omitFieldNames ? '' : 'receiving',
        subBuilder: RpcMempoolEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcMempoolEntryByAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcMempoolEntryByAddress copyWith(
          void Function(RpcMempoolEntryByAddress) updates) =>
      super.copyWith((message) => updates(message as RpcMempoolEntryByAddress))
          as RpcMempoolEntryByAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcMempoolEntryByAddress create() => RpcMempoolEntryByAddress._();
  @$core.override
  RpcMempoolEntryByAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcMempoolEntryByAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcMempoolEntryByAddress>(create);
  static RpcMempoolEntryByAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RpcMempoolEntry> get sending => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<RpcMempoolEntry> get receiving => $_getList(2);
}

class GetMempoolEntriesByAddressesRequestMessage extends $pb.GeneratedMessage {
  factory GetMempoolEntriesByAddressesRequestMessage({
    $core.Iterable<$core.String>? addresses,
    $core.bool? includeOrphanPool,
    $core.bool? filterTransactionPool,
  }) {
    final result = create();
    if (addresses != null) result.addresses.addAll(addresses);
    if (includeOrphanPool != null) result.includeOrphanPool = includeOrphanPool;
    if (filterTransactionPool != null)
      result.filterTransactionPool = filterTransactionPool;
    return result;
  }

  GetMempoolEntriesByAddressesRequestMessage._();

  factory GetMempoolEntriesByAddressesRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMempoolEntriesByAddressesRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMempoolEntriesByAddressesRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'addresses')
    ..aOB(2, _omitFieldNames ? '' : 'includeOrphanPool',
        protoName: 'includeOrphanPool')
    ..aOB(3, _omitFieldNames ? '' : 'filterTransactionPool',
        protoName: 'filterTransactionPool')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesByAddressesRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesByAddressesRequestMessage copyWith(
          void Function(GetMempoolEntriesByAddressesRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetMempoolEntriesByAddressesRequestMessage))
          as GetMempoolEntriesByAddressesRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesByAddressesRequestMessage create() =>
      GetMempoolEntriesByAddressesRequestMessage._();
  @$core.override
  GetMempoolEntriesByAddressesRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesByAddressesRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetMempoolEntriesByAddressesRequestMessage>(create);
  static GetMempoolEntriesByAddressesRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get addresses => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get includeOrphanPool => $_getBF(1);
  @$pb.TagNumber(2)
  set includeOrphanPool($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeOrphanPool() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeOrphanPool() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get filterTransactionPool => $_getBF(2);
  @$pb.TagNumber(3)
  set filterTransactionPool($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilterTransactionPool() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilterTransactionPool() => $_clearField(3);
}

class GetMempoolEntriesByAddressesResponseMessage extends $pb.GeneratedMessage {
  factory GetMempoolEntriesByAddressesResponseMessage({
    $core.Iterable<RpcMempoolEntryByAddress>? entries,
    RPCError? error,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    if (error != null) result.error = error;
    return result;
  }

  GetMempoolEntriesByAddressesResponseMessage._();

  factory GetMempoolEntriesByAddressesResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMempoolEntriesByAddressesResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMempoolEntriesByAddressesResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPM<RpcMempoolEntryByAddress>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: RpcMempoolEntryByAddress.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesByAddressesResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMempoolEntriesByAddressesResponseMessage copyWith(
          void Function(GetMempoolEntriesByAddressesResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetMempoolEntriesByAddressesResponseMessage))
          as GetMempoolEntriesByAddressesResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesByAddressesResponseMessage create() =>
      GetMempoolEntriesByAddressesResponseMessage._();
  @$core.override
  GetMempoolEntriesByAddressesResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMempoolEntriesByAddressesResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetMempoolEntriesByAddressesResponseMessage>(create);
  static GetMempoolEntriesByAddressesResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RpcMempoolEntryByAddress> get entries => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class GetCoinSupplyRequestMessage extends $pb.GeneratedMessage {
  factory GetCoinSupplyRequestMessage() => create();

  GetCoinSupplyRequestMessage._();

  factory GetCoinSupplyRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCoinSupplyRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCoinSupplyRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoinSupplyRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoinSupplyRequestMessage copyWith(
          void Function(GetCoinSupplyRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetCoinSupplyRequestMessage))
          as GetCoinSupplyRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCoinSupplyRequestMessage create() =>
      GetCoinSupplyRequestMessage._();
  @$core.override
  GetCoinSupplyRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCoinSupplyRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCoinSupplyRequestMessage>(create);
  static GetCoinSupplyRequestMessage? _defaultInstance;
}

class GetCoinSupplyResponseMessage extends $pb.GeneratedMessage {
  factory GetCoinSupplyResponseMessage({
    $fixnum.Int64? maxSompi,
    $fixnum.Int64? circulatingSompi,
    RPCError? error,
  }) {
    final result = create();
    if (maxSompi != null) result.maxSompi = maxSompi;
    if (circulatingSompi != null) result.circulatingSompi = circulatingSompi;
    if (error != null) result.error = error;
    return result;
  }

  GetCoinSupplyResponseMessage._();

  factory GetCoinSupplyResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCoinSupplyResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCoinSupplyResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'maxSompi', $pb.PbFieldType.OU6,
        protoName: 'maxSompi', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'circulatingSompi', $pb.PbFieldType.OU6,
        protoName: 'circulatingSompi', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoinSupplyResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoinSupplyResponseMessage copyWith(
          void Function(GetCoinSupplyResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetCoinSupplyResponseMessage))
          as GetCoinSupplyResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCoinSupplyResponseMessage create() =>
      GetCoinSupplyResponseMessage._();
  @$core.override
  GetCoinSupplyResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCoinSupplyResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCoinSupplyResponseMessage>(create);
  static GetCoinSupplyResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get maxSompi => $_getI64(0);
  @$pb.TagNumber(1)
  set maxSompi($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMaxSompi() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxSompi() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get circulatingSompi => $_getI64(1);
  @$pb.TagNumber(2)
  set circulatingSompi($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCirculatingSompi() => $_has(1);
  @$pb.TagNumber(2)
  void clearCirculatingSompi() => $_clearField(2);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

class PingRequestMessage extends $pb.GeneratedMessage {
  factory PingRequestMessage() => create();

  PingRequestMessage._();

  factory PingRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PingRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PingRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PingRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PingRequestMessage copyWith(void Function(PingRequestMessage) updates) =>
      super.copyWith((message) => updates(message as PingRequestMessage))
          as PingRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingRequestMessage create() => PingRequestMessage._();
  @$core.override
  PingRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PingRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PingRequestMessage>(create);
  static PingRequestMessage? _defaultInstance;
}

class PingResponseMessage extends $pb.GeneratedMessage {
  factory PingResponseMessage({
    RPCError? error,
  }) {
    final result = create();
    if (error != null) result.error = error;
    return result;
  }

  PingResponseMessage._();

  factory PingResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PingResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PingResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PingResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PingResponseMessage copyWith(void Function(PingResponseMessage) updates) =>
      super.copyWith((message) => updates(message as PingResponseMessage))
          as PingResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingResponseMessage create() => PingResponseMessage._();
  @$core.override
  PingResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PingResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PingResponseMessage>(create);
  static PingResponseMessage? _defaultInstance;

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(0);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(0);
}

class ProcessMetrics extends $pb.GeneratedMessage {
  factory ProcessMetrics({
    $fixnum.Int64? residentSetSize,
    $fixnum.Int64? virtualMemorySize,
    $core.int? coreNum,
    $core.double? cpuUsage,
    $core.int? fdNum,
    $fixnum.Int64? diskIoReadBytes,
    $fixnum.Int64? diskIoWriteBytes,
    $core.double? diskIoReadPerSec,
    $core.double? diskIoWritePerSec,
  }) {
    final result = create();
    if (residentSetSize != null) result.residentSetSize = residentSetSize;
    if (virtualMemorySize != null) result.virtualMemorySize = virtualMemorySize;
    if (coreNum != null) result.coreNum = coreNum;
    if (cpuUsage != null) result.cpuUsage = cpuUsage;
    if (fdNum != null) result.fdNum = fdNum;
    if (diskIoReadBytes != null) result.diskIoReadBytes = diskIoReadBytes;
    if (diskIoWriteBytes != null) result.diskIoWriteBytes = diskIoWriteBytes;
    if (diskIoReadPerSec != null) result.diskIoReadPerSec = diskIoReadPerSec;
    if (diskIoWritePerSec != null) result.diskIoWritePerSec = diskIoWritePerSec;
    return result;
  }

  ProcessMetrics._();

  factory ProcessMetrics.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProcessMetrics.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProcessMetrics',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'residentSetSize', $pb.PbFieldType.OU6,
        protoName: 'residentSetSize', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'virtualMemorySize', $pb.PbFieldType.OU6,
        protoName: 'virtualMemorySize', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'coreNum',
        protoName: 'coreNum', fieldType: $pb.PbFieldType.OU3)
    ..aD(4, _omitFieldNames ? '' : 'cpuUsage',
        protoName: 'cpuUsage', fieldType: $pb.PbFieldType.OF)
    ..aI(5, _omitFieldNames ? '' : 'fdNum',
        protoName: 'fdNum', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'diskIoReadBytes', $pb.PbFieldType.OU6,
        protoName: 'diskIoReadBytes', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'diskIoWriteBytes', $pb.PbFieldType.OU6,
        protoName: 'diskIoWriteBytes', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(8, _omitFieldNames ? '' : 'diskIoReadPerSec',
        protoName: 'diskIoReadPerSec', fieldType: $pb.PbFieldType.OF)
    ..aD(9, _omitFieldNames ? '' : 'diskIoWritePerSec',
        protoName: 'diskIoWritePerSec', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessMetrics clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessMetrics copyWith(void Function(ProcessMetrics) updates) =>
      super.copyWith((message) => updates(message as ProcessMetrics))
          as ProcessMetrics;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcessMetrics create() => ProcessMetrics._();
  @$core.override
  ProcessMetrics createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProcessMetrics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcessMetrics>(create);
  static ProcessMetrics? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get residentSetSize => $_getI64(0);
  @$pb.TagNumber(1)
  set residentSetSize($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResidentSetSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearResidentSetSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get virtualMemorySize => $_getI64(1);
  @$pb.TagNumber(2)
  set virtualMemorySize($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVirtualMemorySize() => $_has(1);
  @$pb.TagNumber(2)
  void clearVirtualMemorySize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get coreNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set coreNum($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoreNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoreNum() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get cpuUsage => $_getN(3);
  @$pb.TagNumber(4)
  set cpuUsage($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCpuUsage() => $_has(3);
  @$pb.TagNumber(4)
  void clearCpuUsage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get fdNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set fdNum($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFdNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearFdNum() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get diskIoReadBytes => $_getI64(5);
  @$pb.TagNumber(6)
  set diskIoReadBytes($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDiskIoReadBytes() => $_has(5);
  @$pb.TagNumber(6)
  void clearDiskIoReadBytes() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get diskIoWriteBytes => $_getI64(6);
  @$pb.TagNumber(7)
  set diskIoWriteBytes($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDiskIoWriteBytes() => $_has(6);
  @$pb.TagNumber(7)
  void clearDiskIoWriteBytes() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get diskIoReadPerSec => $_getN(7);
  @$pb.TagNumber(8)
  set diskIoReadPerSec($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDiskIoReadPerSec() => $_has(7);
  @$pb.TagNumber(8)
  void clearDiskIoReadPerSec() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get diskIoWritePerSec => $_getN(8);
  @$pb.TagNumber(9)
  set diskIoWritePerSec($core.double value) => $_setFloat(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDiskIoWritePerSec() => $_has(8);
  @$pb.TagNumber(9)
  void clearDiskIoWritePerSec() => $_clearField(9);
}

class ConnectionMetrics extends $pb.GeneratedMessage {
  factory ConnectionMetrics({
    $core.int? borshLiveConnections,
    $fixnum.Int64? borshConnectionAttempts,
    $fixnum.Int64? borshHandshakeFailures,
    $core.int? jsonLiveConnections,
    $fixnum.Int64? jsonConnectionAttempts,
    $fixnum.Int64? jsonHandshakeFailures,
    $core.int? activePeers,
  }) {
    final result = create();
    if (borshLiveConnections != null)
      result.borshLiveConnections = borshLiveConnections;
    if (borshConnectionAttempts != null)
      result.borshConnectionAttempts = borshConnectionAttempts;
    if (borshHandshakeFailures != null)
      result.borshHandshakeFailures = borshHandshakeFailures;
    if (jsonLiveConnections != null)
      result.jsonLiveConnections = jsonLiveConnections;
    if (jsonConnectionAttempts != null)
      result.jsonConnectionAttempts = jsonConnectionAttempts;
    if (jsonHandshakeFailures != null)
      result.jsonHandshakeFailures = jsonHandshakeFailures;
    if (activePeers != null) result.activePeers = activePeers;
    return result;
  }

  ConnectionMetrics._();

  factory ConnectionMetrics.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectionMetrics.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectionMetrics',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(31, _omitFieldNames ? '' : 'borshLiveConnections',
        protoName: 'borshLiveConnections', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(32, _omitFieldNames ? '' : 'borshConnectionAttempts',
        $pb.PbFieldType.OU6,
        protoName: 'borshConnectionAttempts',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(33, _omitFieldNames ? '' : 'borshHandshakeFailures',
        $pb.PbFieldType.OU6,
        protoName: 'borshHandshakeFailures', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(41, _omitFieldNames ? '' : 'jsonLiveConnections',
        protoName: 'jsonLiveConnections', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(42, _omitFieldNames ? '' : 'jsonConnectionAttempts',
        $pb.PbFieldType.OU6,
        protoName: 'jsonConnectionAttempts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        43, _omitFieldNames ? '' : 'jsonHandshakeFailures', $pb.PbFieldType.OU6,
        protoName: 'jsonHandshakeFailures', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(51, _omitFieldNames ? '' : 'activePeers',
        protoName: 'activePeers', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionMetrics clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionMetrics copyWith(void Function(ConnectionMetrics) updates) =>
      super.copyWith((message) => updates(message as ConnectionMetrics))
          as ConnectionMetrics;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionMetrics create() => ConnectionMetrics._();
  @$core.override
  ConnectionMetrics createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectionMetrics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionMetrics>(create);
  static ConnectionMetrics? _defaultInstance;

  @$pb.TagNumber(31)
  $core.int get borshLiveConnections => $_getIZ(0);
  @$pb.TagNumber(31)
  set borshLiveConnections($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(31)
  $core.bool hasBorshLiveConnections() => $_has(0);
  @$pb.TagNumber(31)
  void clearBorshLiveConnections() => $_clearField(31);

  @$pb.TagNumber(32)
  $fixnum.Int64 get borshConnectionAttempts => $_getI64(1);
  @$pb.TagNumber(32)
  set borshConnectionAttempts($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(32)
  $core.bool hasBorshConnectionAttempts() => $_has(1);
  @$pb.TagNumber(32)
  void clearBorshConnectionAttempts() => $_clearField(32);

  @$pb.TagNumber(33)
  $fixnum.Int64 get borshHandshakeFailures => $_getI64(2);
  @$pb.TagNumber(33)
  set borshHandshakeFailures($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(33)
  $core.bool hasBorshHandshakeFailures() => $_has(2);
  @$pb.TagNumber(33)
  void clearBorshHandshakeFailures() => $_clearField(33);

  @$pb.TagNumber(41)
  $core.int get jsonLiveConnections => $_getIZ(3);
  @$pb.TagNumber(41)
  set jsonLiveConnections($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(41)
  $core.bool hasJsonLiveConnections() => $_has(3);
  @$pb.TagNumber(41)
  void clearJsonLiveConnections() => $_clearField(41);

  @$pb.TagNumber(42)
  $fixnum.Int64 get jsonConnectionAttempts => $_getI64(4);
  @$pb.TagNumber(42)
  set jsonConnectionAttempts($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(42)
  $core.bool hasJsonConnectionAttempts() => $_has(4);
  @$pb.TagNumber(42)
  void clearJsonConnectionAttempts() => $_clearField(42);

  @$pb.TagNumber(43)
  $fixnum.Int64 get jsonHandshakeFailures => $_getI64(5);
  @$pb.TagNumber(43)
  set jsonHandshakeFailures($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(43)
  $core.bool hasJsonHandshakeFailures() => $_has(5);
  @$pb.TagNumber(43)
  void clearJsonHandshakeFailures() => $_clearField(43);

  @$pb.TagNumber(51)
  $core.int get activePeers => $_getIZ(6);
  @$pb.TagNumber(51)
  set activePeers($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(51)
  $core.bool hasActivePeers() => $_has(6);
  @$pb.TagNumber(51)
  void clearActivePeers() => $_clearField(51);
}

class BandwidthMetrics extends $pb.GeneratedMessage {
  factory BandwidthMetrics({
    $fixnum.Int64? borshBytesTx,
    $fixnum.Int64? borshBytesRx,
    $fixnum.Int64? jsonBytesTx,
    $fixnum.Int64? jsonBytesRx,
    $fixnum.Int64? grpcP2pBytesTx,
    $fixnum.Int64? grpcP2pBytesRx,
    $fixnum.Int64? grpcUserBytesTx,
    $fixnum.Int64? grpcUserBytesRx,
  }) {
    final result = create();
    if (borshBytesTx != null) result.borshBytesTx = borshBytesTx;
    if (borshBytesRx != null) result.borshBytesRx = borshBytesRx;
    if (jsonBytesTx != null) result.jsonBytesTx = jsonBytesTx;
    if (jsonBytesRx != null) result.jsonBytesRx = jsonBytesRx;
    if (grpcP2pBytesTx != null) result.grpcP2pBytesTx = grpcP2pBytesTx;
    if (grpcP2pBytesRx != null) result.grpcP2pBytesRx = grpcP2pBytesRx;
    if (grpcUserBytesTx != null) result.grpcUserBytesTx = grpcUserBytesTx;
    if (grpcUserBytesRx != null) result.grpcUserBytesRx = grpcUserBytesRx;
    return result;
  }

  BandwidthMetrics._();

  factory BandwidthMetrics.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthMetrics.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BandwidthMetrics',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        61, _omitFieldNames ? '' : 'borshBytesTx', $pb.PbFieldType.OU6,
        protoName: 'borshBytesTx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        62, _omitFieldNames ? '' : 'borshBytesRx', $pb.PbFieldType.OU6,
        protoName: 'borshBytesRx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        63, _omitFieldNames ? '' : 'jsonBytesTx', $pb.PbFieldType.OU6,
        protoName: 'jsonBytesTx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        64, _omitFieldNames ? '' : 'jsonBytesRx', $pb.PbFieldType.OU6,
        protoName: 'jsonBytesRx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        65, _omitFieldNames ? '' : 'grpcP2pBytesTx', $pb.PbFieldType.OU6,
        protoName: 'grpcP2pBytesTx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        66, _omitFieldNames ? '' : 'grpcP2pBytesRx', $pb.PbFieldType.OU6,
        protoName: 'grpcP2pBytesRx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        67, _omitFieldNames ? '' : 'grpcUserBytesTx', $pb.PbFieldType.OU6,
        protoName: 'grpcUserBytesTx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        68, _omitFieldNames ? '' : 'grpcUserBytesRx', $pb.PbFieldType.OU6,
        protoName: 'grpcUserBytesRx', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthMetrics clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthMetrics copyWith(void Function(BandwidthMetrics) updates) =>
      super.copyWith((message) => updates(message as BandwidthMetrics))
          as BandwidthMetrics;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthMetrics create() => BandwidthMetrics._();
  @$core.override
  BandwidthMetrics createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthMetrics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BandwidthMetrics>(create);
  static BandwidthMetrics? _defaultInstance;

  @$pb.TagNumber(61)
  $fixnum.Int64 get borshBytesTx => $_getI64(0);
  @$pb.TagNumber(61)
  set borshBytesTx($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(61)
  $core.bool hasBorshBytesTx() => $_has(0);
  @$pb.TagNumber(61)
  void clearBorshBytesTx() => $_clearField(61);

  @$pb.TagNumber(62)
  $fixnum.Int64 get borshBytesRx => $_getI64(1);
  @$pb.TagNumber(62)
  set borshBytesRx($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(62)
  $core.bool hasBorshBytesRx() => $_has(1);
  @$pb.TagNumber(62)
  void clearBorshBytesRx() => $_clearField(62);

  @$pb.TagNumber(63)
  $fixnum.Int64 get jsonBytesTx => $_getI64(2);
  @$pb.TagNumber(63)
  set jsonBytesTx($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(63)
  $core.bool hasJsonBytesTx() => $_has(2);
  @$pb.TagNumber(63)
  void clearJsonBytesTx() => $_clearField(63);

  @$pb.TagNumber(64)
  $fixnum.Int64 get jsonBytesRx => $_getI64(3);
  @$pb.TagNumber(64)
  set jsonBytesRx($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(64)
  $core.bool hasJsonBytesRx() => $_has(3);
  @$pb.TagNumber(64)
  void clearJsonBytesRx() => $_clearField(64);

  @$pb.TagNumber(65)
  $fixnum.Int64 get grpcP2pBytesTx => $_getI64(4);
  @$pb.TagNumber(65)
  set grpcP2pBytesTx($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(65)
  $core.bool hasGrpcP2pBytesTx() => $_has(4);
  @$pb.TagNumber(65)
  void clearGrpcP2pBytesTx() => $_clearField(65);

  @$pb.TagNumber(66)
  $fixnum.Int64 get grpcP2pBytesRx => $_getI64(5);
  @$pb.TagNumber(66)
  set grpcP2pBytesRx($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(66)
  $core.bool hasGrpcP2pBytesRx() => $_has(5);
  @$pb.TagNumber(66)
  void clearGrpcP2pBytesRx() => $_clearField(66);

  @$pb.TagNumber(67)
  $fixnum.Int64 get grpcUserBytesTx => $_getI64(6);
  @$pb.TagNumber(67)
  set grpcUserBytesTx($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(67)
  $core.bool hasGrpcUserBytesTx() => $_has(6);
  @$pb.TagNumber(67)
  void clearGrpcUserBytesTx() => $_clearField(67);

  @$pb.TagNumber(68)
  $fixnum.Int64 get grpcUserBytesRx => $_getI64(7);
  @$pb.TagNumber(68)
  set grpcUserBytesRx($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(68)
  $core.bool hasGrpcUserBytesRx() => $_has(7);
  @$pb.TagNumber(68)
  void clearGrpcUserBytesRx() => $_clearField(68);
}

class ConsensusMetrics extends $pb.GeneratedMessage {
  factory ConsensusMetrics({
    $fixnum.Int64? blocksSubmitted,
    $fixnum.Int64? headerCounts,
    $fixnum.Int64? depCounts,
    $fixnum.Int64? bodyCounts,
    $fixnum.Int64? txsCounts,
    $fixnum.Int64? chainBlockCounts,
    $fixnum.Int64? massCounts,
    $fixnum.Int64? blockCount,
    $fixnum.Int64? headerCount,
    $fixnum.Int64? mempoolSize,
    $core.int? tipHashesCount,
    $core.double? difficulty,
    $fixnum.Int64? pastMedianTime,
    $core.int? virtualParentHashesCount,
    $fixnum.Int64? virtualDaaScore,
  }) {
    final result = create();
    if (blocksSubmitted != null) result.blocksSubmitted = blocksSubmitted;
    if (headerCounts != null) result.headerCounts = headerCounts;
    if (depCounts != null) result.depCounts = depCounts;
    if (bodyCounts != null) result.bodyCounts = bodyCounts;
    if (txsCounts != null) result.txsCounts = txsCounts;
    if (chainBlockCounts != null) result.chainBlockCounts = chainBlockCounts;
    if (massCounts != null) result.massCounts = massCounts;
    if (blockCount != null) result.blockCount = blockCount;
    if (headerCount != null) result.headerCount = headerCount;
    if (mempoolSize != null) result.mempoolSize = mempoolSize;
    if (tipHashesCount != null) result.tipHashesCount = tipHashesCount;
    if (difficulty != null) result.difficulty = difficulty;
    if (pastMedianTime != null) result.pastMedianTime = pastMedianTime;
    if (virtualParentHashesCount != null)
      result.virtualParentHashesCount = virtualParentHashesCount;
    if (virtualDaaScore != null) result.virtualDaaScore = virtualDaaScore;
    return result;
  }

  ConsensusMetrics._();

  factory ConsensusMetrics.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConsensusMetrics.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConsensusMetrics',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'blocksSubmitted', $pb.PbFieldType.OU6,
        protoName: 'blocksSubmitted', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'headerCounts', $pb.PbFieldType.OU6,
        protoName: 'headerCounts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'depCounts', $pb.PbFieldType.OU6,
        protoName: 'depCounts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'bodyCounts', $pb.PbFieldType.OU6,
        protoName: 'bodyCounts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'txsCounts', $pb.PbFieldType.OU6,
        protoName: 'txsCounts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'chainBlockCounts', $pb.PbFieldType.OU6,
        protoName: 'chainBlockCounts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'massCounts', $pb.PbFieldType.OU6,
        protoName: 'massCounts', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'blockCount', $pb.PbFieldType.OU6,
        protoName: 'blockCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        12, _omitFieldNames ? '' : 'headerCount', $pb.PbFieldType.OU6,
        protoName: 'headerCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        13, _omitFieldNames ? '' : 'mempoolSize', $pb.PbFieldType.OU6,
        protoName: 'mempoolSize', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(14, _omitFieldNames ? '' : 'tipHashesCount',
        protoName: 'tipHashesCount', fieldType: $pb.PbFieldType.OU3)
    ..aD(15, _omitFieldNames ? '' : 'difficulty')
    ..a<$fixnum.Int64>(
        16, _omitFieldNames ? '' : 'pastMedianTime', $pb.PbFieldType.OU6,
        protoName: 'pastMedianTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(17, _omitFieldNames ? '' : 'virtualParentHashesCount',
        protoName: 'virtualParentHashesCount', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        18, _omitFieldNames ? '' : 'virtualDaaScore', $pb.PbFieldType.OU6,
        protoName: 'virtualDaaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConsensusMetrics clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConsensusMetrics copyWith(void Function(ConsensusMetrics) updates) =>
      super.copyWith((message) => updates(message as ConsensusMetrics))
          as ConsensusMetrics;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConsensusMetrics create() => ConsensusMetrics._();
  @$core.override
  ConsensusMetrics createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConsensusMetrics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConsensusMetrics>(create);
  static ConsensusMetrics? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blocksSubmitted => $_getI64(0);
  @$pb.TagNumber(1)
  set blocksSubmitted($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBlocksSubmitted() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlocksSubmitted() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get headerCounts => $_getI64(1);
  @$pb.TagNumber(2)
  set headerCounts($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHeaderCounts() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeaderCounts() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get depCounts => $_getI64(2);
  @$pb.TagNumber(3)
  set depCounts($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDepCounts() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepCounts() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get bodyCounts => $_getI64(3);
  @$pb.TagNumber(4)
  set bodyCounts($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBodyCounts() => $_has(3);
  @$pb.TagNumber(4)
  void clearBodyCounts() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get txsCounts => $_getI64(4);
  @$pb.TagNumber(5)
  set txsCounts($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTxsCounts() => $_has(4);
  @$pb.TagNumber(5)
  void clearTxsCounts() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get chainBlockCounts => $_getI64(5);
  @$pb.TagNumber(6)
  set chainBlockCounts($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChainBlockCounts() => $_has(5);
  @$pb.TagNumber(6)
  void clearChainBlockCounts() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get massCounts => $_getI64(6);
  @$pb.TagNumber(7)
  set massCounts($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMassCounts() => $_has(6);
  @$pb.TagNumber(7)
  void clearMassCounts() => $_clearField(7);

  @$pb.TagNumber(11)
  $fixnum.Int64 get blockCount => $_getI64(7);
  @$pb.TagNumber(11)
  set blockCount($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(11)
  $core.bool hasBlockCount() => $_has(7);
  @$pb.TagNumber(11)
  void clearBlockCount() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get headerCount => $_getI64(8);
  @$pb.TagNumber(12)
  set headerCount($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(12)
  $core.bool hasHeaderCount() => $_has(8);
  @$pb.TagNumber(12)
  void clearHeaderCount() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get mempoolSize => $_getI64(9);
  @$pb.TagNumber(13)
  set mempoolSize($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(13)
  $core.bool hasMempoolSize() => $_has(9);
  @$pb.TagNumber(13)
  void clearMempoolSize() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get tipHashesCount => $_getIZ(10);
  @$pb.TagNumber(14)
  set tipHashesCount($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(14)
  $core.bool hasTipHashesCount() => $_has(10);
  @$pb.TagNumber(14)
  void clearTipHashesCount() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.double get difficulty => $_getN(11);
  @$pb.TagNumber(15)
  set difficulty($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(15)
  $core.bool hasDifficulty() => $_has(11);
  @$pb.TagNumber(15)
  void clearDifficulty() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get pastMedianTime => $_getI64(12);
  @$pb.TagNumber(16)
  set pastMedianTime($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(16)
  $core.bool hasPastMedianTime() => $_has(12);
  @$pb.TagNumber(16)
  void clearPastMedianTime() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get virtualParentHashesCount => $_getIZ(13);
  @$pb.TagNumber(17)
  set virtualParentHashesCount($core.int value) =>
      $_setUnsignedInt32(13, value);
  @$pb.TagNumber(17)
  $core.bool hasVirtualParentHashesCount() => $_has(13);
  @$pb.TagNumber(17)
  void clearVirtualParentHashesCount() => $_clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get virtualDaaScore => $_getI64(14);
  @$pb.TagNumber(18)
  set virtualDaaScore($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(18)
  $core.bool hasVirtualDaaScore() => $_has(14);
  @$pb.TagNumber(18)
  void clearVirtualDaaScore() => $_clearField(18);
}

class StorageMetrics extends $pb.GeneratedMessage {
  factory StorageMetrics({
    $fixnum.Int64? storageSizeBytes,
  }) {
    final result = create();
    if (storageSizeBytes != null) result.storageSizeBytes = storageSizeBytes;
    return result;
  }

  StorageMetrics._();

  factory StorageMetrics.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StorageMetrics.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StorageMetrics',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'storageSizeBytes', $pb.PbFieldType.OU6,
        protoName: 'storageSizeBytes', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorageMetrics clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorageMetrics copyWith(void Function(StorageMetrics) updates) =>
      super.copyWith((message) => updates(message as StorageMetrics))
          as StorageMetrics;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorageMetrics create() => StorageMetrics._();
  @$core.override
  StorageMetrics createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StorageMetrics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorageMetrics>(create);
  static StorageMetrics? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get storageSizeBytes => $_getI64(0);
  @$pb.TagNumber(1)
  set storageSizeBytes($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStorageSizeBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearStorageSizeBytes() => $_clearField(1);
}

class GetConnectionsRequestMessage extends $pb.GeneratedMessage {
  factory GetConnectionsRequestMessage({
    $core.bool? includeProfileData,
  }) {
    final result = create();
    if (includeProfileData != null)
      result.includeProfileData = includeProfileData;
    return result;
  }

  GetConnectionsRequestMessage._();

  factory GetConnectionsRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetConnectionsRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetConnectionsRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'includeProfileData',
        protoName: 'includeProfileData')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectionsRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectionsRequestMessage copyWith(
          void Function(GetConnectionsRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetConnectionsRequestMessage))
          as GetConnectionsRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConnectionsRequestMessage create() =>
      GetConnectionsRequestMessage._();
  @$core.override
  GetConnectionsRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetConnectionsRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetConnectionsRequestMessage>(create);
  static GetConnectionsRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeProfileData => $_getBF(0);
  @$pb.TagNumber(1)
  set includeProfileData($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIncludeProfileData() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeProfileData() => $_clearField(1);
}

class ConnectionsProfileData extends $pb.GeneratedMessage {
  factory ConnectionsProfileData({
    $core.double? cpuUsage,
    $fixnum.Int64? memoryUsage,
  }) {
    final result = create();
    if (cpuUsage != null) result.cpuUsage = cpuUsage;
    if (memoryUsage != null) result.memoryUsage = memoryUsage;
    return result;
  }

  ConnectionsProfileData._();

  factory ConnectionsProfileData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectionsProfileData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectionsProfileData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'cpuUsage', protoName: 'cpuUsage')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'memoryUsage', $pb.PbFieldType.OU6,
        protoName: 'memoryUsage', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionsProfileData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionsProfileData copyWith(
          void Function(ConnectionsProfileData) updates) =>
      super.copyWith((message) => updates(message as ConnectionsProfileData))
          as ConnectionsProfileData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionsProfileData create() => ConnectionsProfileData._();
  @$core.override
  ConnectionsProfileData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectionsProfileData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionsProfileData>(create);
  static ConnectionsProfileData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get cpuUsage => $_getN(0);
  @$pb.TagNumber(1)
  set cpuUsage($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCpuUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCpuUsage() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get memoryUsage => $_getI64(1);
  @$pb.TagNumber(2)
  set memoryUsage($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMemoryUsage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMemoryUsage() => $_clearField(2);
}

class GetConnectionsResponseMessage extends $pb.GeneratedMessage {
  factory GetConnectionsResponseMessage({
    $core.int? clients,
    $core.int? peers,
    ConnectionsProfileData? profileData,
    RPCError? error,
  }) {
    final result = create();
    if (clients != null) result.clients = clients;
    if (peers != null) result.peers = peers;
    if (profileData != null) result.profileData = profileData;
    if (error != null) result.error = error;
    return result;
  }

  GetConnectionsResponseMessage._();

  factory GetConnectionsResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetConnectionsResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetConnectionsResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'clients', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'peers', fieldType: $pb.PbFieldType.OU3)
    ..aOM<ConnectionsProfileData>(3, _omitFieldNames ? '' : 'profileData',
        protoName: 'profileData', subBuilder: ConnectionsProfileData.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectionsResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetConnectionsResponseMessage copyWith(
          void Function(GetConnectionsResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetConnectionsResponseMessage))
          as GetConnectionsResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetConnectionsResponseMessage create() =>
      GetConnectionsResponseMessage._();
  @$core.override
  GetConnectionsResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetConnectionsResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetConnectionsResponseMessage>(create);
  static GetConnectionsResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clients => $_getIZ(0);
  @$pb.TagNumber(1)
  set clients($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClients() => $_has(0);
  @$pb.TagNumber(1)
  void clearClients() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get peers => $_getIZ(1);
  @$pb.TagNumber(2)
  set peers($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPeers() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeers() => $_clearField(2);

  @$pb.TagNumber(3)
  ConnectionsProfileData get profileData => $_getN(2);
  @$pb.TagNumber(3)
  set profileData(ConnectionsProfileData value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProfileData() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileData() => $_clearField(3);
  @$pb.TagNumber(3)
  ConnectionsProfileData ensureProfileData() => $_ensure(2);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(3);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(3);
}

class GetSystemInfoRequestMessage extends $pb.GeneratedMessage {
  factory GetSystemInfoRequestMessage() => create();

  GetSystemInfoRequestMessage._();

  factory GetSystemInfoRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSystemInfoRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSystemInfoRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSystemInfoRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSystemInfoRequestMessage copyWith(
          void Function(GetSystemInfoRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSystemInfoRequestMessage))
          as GetSystemInfoRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSystemInfoRequestMessage create() =>
      GetSystemInfoRequestMessage._();
  @$core.override
  GetSystemInfoRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSystemInfoRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSystemInfoRequestMessage>(create);
  static GetSystemInfoRequestMessage? _defaultInstance;
}

class GetSystemInfoResponseMessage extends $pb.GeneratedMessage {
  factory GetSystemInfoResponseMessage({
    $core.String? version,
    $core.String? systemId,
    $core.String? gitHash,
    $core.int? coreNum,
    $fixnum.Int64? totalMemory,
    $core.int? fdLimit,
    $core.int? proxySocketLimitPerCpuCore,
    RPCError? error,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (systemId != null) result.systemId = systemId;
    if (gitHash != null) result.gitHash = gitHash;
    if (coreNum != null) result.coreNum = coreNum;
    if (totalMemory != null) result.totalMemory = totalMemory;
    if (fdLimit != null) result.fdLimit = fdLimit;
    if (proxySocketLimitPerCpuCore != null)
      result.proxySocketLimitPerCpuCore = proxySocketLimitPerCpuCore;
    if (error != null) result.error = error;
    return result;
  }

  GetSystemInfoResponseMessage._();

  factory GetSystemInfoResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSystemInfoResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSystemInfoResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'version')
    ..aOS(2, _omitFieldNames ? '' : 'systemId', protoName: 'systemId')
    ..aOS(3, _omitFieldNames ? '' : 'gitHash', protoName: 'gitHash')
    ..aI(4, _omitFieldNames ? '' : 'coreNum',
        protoName: 'coreNum', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'totalMemory', $pb.PbFieldType.OU6,
        protoName: 'totalMemory', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'fdLimit',
        protoName: 'fdLimit', fieldType: $pb.PbFieldType.OU3)
    ..aI(7, _omitFieldNames ? '' : 'proxySocketLimitPerCpuCore',
        protoName: 'proxySocketLimitPerCpuCore', fieldType: $pb.PbFieldType.OU3)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSystemInfoResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSystemInfoResponseMessage copyWith(
          void Function(GetSystemInfoResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSystemInfoResponseMessage))
          as GetSystemInfoResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSystemInfoResponseMessage create() =>
      GetSystemInfoResponseMessage._();
  @$core.override
  GetSystemInfoResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSystemInfoResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSystemInfoResponseMessage>(create);
  static GetSystemInfoResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get systemId => $_getSZ(1);
  @$pb.TagNumber(2)
  set systemId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSystemId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSystemId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gitHash => $_getSZ(2);
  @$pb.TagNumber(3)
  set gitHash($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGitHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearGitHash() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get coreNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set coreNum($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoreNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoreNum() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get totalMemory => $_getI64(4);
  @$pb.TagNumber(5)
  set totalMemory($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalMemory() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalMemory() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get fdLimit => $_getIZ(5);
  @$pb.TagNumber(6)
  set fdLimit($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFdLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearFdLimit() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get proxySocketLimitPerCpuCore => $_getIZ(6);
  @$pb.TagNumber(7)
  set proxySocketLimitPerCpuCore($core.int value) =>
      $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasProxySocketLimitPerCpuCore() => $_has(6);
  @$pb.TagNumber(7)
  void clearProxySocketLimitPerCpuCore() => $_clearField(7);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(7);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(7);
}

class GetMetricsRequestMessage extends $pb.GeneratedMessage {
  factory GetMetricsRequestMessage({
    $core.bool? processMetrics,
    $core.bool? connectionMetrics,
    $core.bool? bandwidthMetrics,
    $core.bool? consensusMetrics,
    $core.bool? storageMetrics,
    $core.bool? customMetrics,
  }) {
    final result = create();
    if (processMetrics != null) result.processMetrics = processMetrics;
    if (connectionMetrics != null) result.connectionMetrics = connectionMetrics;
    if (bandwidthMetrics != null) result.bandwidthMetrics = bandwidthMetrics;
    if (consensusMetrics != null) result.consensusMetrics = consensusMetrics;
    if (storageMetrics != null) result.storageMetrics = storageMetrics;
    if (customMetrics != null) result.customMetrics = customMetrics;
    return result;
  }

  GetMetricsRequestMessage._();

  factory GetMetricsRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMetricsRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMetricsRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'processMetrics',
        protoName: 'processMetrics')
    ..aOB(2, _omitFieldNames ? '' : 'connectionMetrics',
        protoName: 'connectionMetrics')
    ..aOB(3, _omitFieldNames ? '' : 'bandwidthMetrics',
        protoName: 'bandwidthMetrics')
    ..aOB(4, _omitFieldNames ? '' : 'consensusMetrics',
        protoName: 'consensusMetrics')
    ..aOB(5, _omitFieldNames ? '' : 'storageMetrics',
        protoName: 'storageMetrics')
    ..aOB(6, _omitFieldNames ? '' : 'customMetrics', protoName: 'customMetrics')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetricsRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetricsRequestMessage copyWith(
          void Function(GetMetricsRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetMetricsRequestMessage))
          as GetMetricsRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMetricsRequestMessage create() => GetMetricsRequestMessage._();
  @$core.override
  GetMetricsRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMetricsRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMetricsRequestMessage>(create);
  static GetMetricsRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get processMetrics => $_getBF(0);
  @$pb.TagNumber(1)
  set processMetrics($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProcessMetrics() => $_has(0);
  @$pb.TagNumber(1)
  void clearProcessMetrics() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get connectionMetrics => $_getBF(1);
  @$pb.TagNumber(2)
  set connectionMetrics($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConnectionMetrics() => $_has(1);
  @$pb.TagNumber(2)
  void clearConnectionMetrics() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get bandwidthMetrics => $_getBF(2);
  @$pb.TagNumber(3)
  set bandwidthMetrics($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBandwidthMetrics() => $_has(2);
  @$pb.TagNumber(3)
  void clearBandwidthMetrics() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get consensusMetrics => $_getBF(3);
  @$pb.TagNumber(4)
  set consensusMetrics($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConsensusMetrics() => $_has(3);
  @$pb.TagNumber(4)
  void clearConsensusMetrics() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get storageMetrics => $_getBF(4);
  @$pb.TagNumber(5)
  set storageMetrics($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStorageMetrics() => $_has(4);
  @$pb.TagNumber(5)
  void clearStorageMetrics() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get customMetrics => $_getBF(5);
  @$pb.TagNumber(6)
  set customMetrics($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCustomMetrics() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomMetrics() => $_clearField(6);
}

class GetMetricsResponseMessage extends $pb.GeneratedMessage {
  factory GetMetricsResponseMessage({
    $fixnum.Int64? serverTime,
    ProcessMetrics? processMetrics,
    ConnectionMetrics? connectionMetrics,
    BandwidthMetrics? bandwidthMetrics,
    ConsensusMetrics? consensusMetrics,
    StorageMetrics? storageMetrics,
    RPCError? error,
  }) {
    final result = create();
    if (serverTime != null) result.serverTime = serverTime;
    if (processMetrics != null) result.processMetrics = processMetrics;
    if (connectionMetrics != null) result.connectionMetrics = connectionMetrics;
    if (bandwidthMetrics != null) result.bandwidthMetrics = bandwidthMetrics;
    if (consensusMetrics != null) result.consensusMetrics = consensusMetrics;
    if (storageMetrics != null) result.storageMetrics = storageMetrics;
    if (error != null) result.error = error;
    return result;
  }

  GetMetricsResponseMessage._();

  factory GetMetricsResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMetricsResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMetricsResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'serverTime', $pb.PbFieldType.OU6,
        protoName: 'serverTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<ProcessMetrics>(11, _omitFieldNames ? '' : 'processMetrics',
        protoName: 'processMetrics', subBuilder: ProcessMetrics.create)
    ..aOM<ConnectionMetrics>(12, _omitFieldNames ? '' : 'connectionMetrics',
        protoName: 'connectionMetrics', subBuilder: ConnectionMetrics.create)
    ..aOM<BandwidthMetrics>(13, _omitFieldNames ? '' : 'bandwidthMetrics',
        protoName: 'bandwidthMetrics', subBuilder: BandwidthMetrics.create)
    ..aOM<ConsensusMetrics>(14, _omitFieldNames ? '' : 'consensusMetrics',
        protoName: 'consensusMetrics', subBuilder: ConsensusMetrics.create)
    ..aOM<StorageMetrics>(15, _omitFieldNames ? '' : 'storageMetrics',
        protoName: 'storageMetrics', subBuilder: StorageMetrics.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetricsResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetricsResponseMessage copyWith(
          void Function(GetMetricsResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetMetricsResponseMessage))
          as GetMetricsResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMetricsResponseMessage create() => GetMetricsResponseMessage._();
  @$core.override
  GetMetricsResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMetricsResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMetricsResponseMessage>(create);
  static GetMetricsResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get serverTime => $_getI64(0);
  @$pb.TagNumber(1)
  set serverTime($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerTime() => $_clearField(1);

  @$pb.TagNumber(11)
  ProcessMetrics get processMetrics => $_getN(1);
  @$pb.TagNumber(11)
  set processMetrics(ProcessMetrics value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasProcessMetrics() => $_has(1);
  @$pb.TagNumber(11)
  void clearProcessMetrics() => $_clearField(11);
  @$pb.TagNumber(11)
  ProcessMetrics ensureProcessMetrics() => $_ensure(1);

  @$pb.TagNumber(12)
  ConnectionMetrics get connectionMetrics => $_getN(2);
  @$pb.TagNumber(12)
  set connectionMetrics(ConnectionMetrics value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasConnectionMetrics() => $_has(2);
  @$pb.TagNumber(12)
  void clearConnectionMetrics() => $_clearField(12);
  @$pb.TagNumber(12)
  ConnectionMetrics ensureConnectionMetrics() => $_ensure(2);

  @$pb.TagNumber(13)
  BandwidthMetrics get bandwidthMetrics => $_getN(3);
  @$pb.TagNumber(13)
  set bandwidthMetrics(BandwidthMetrics value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasBandwidthMetrics() => $_has(3);
  @$pb.TagNumber(13)
  void clearBandwidthMetrics() => $_clearField(13);
  @$pb.TagNumber(13)
  BandwidthMetrics ensureBandwidthMetrics() => $_ensure(3);

  @$pb.TagNumber(14)
  ConsensusMetrics get consensusMetrics => $_getN(4);
  @$pb.TagNumber(14)
  set consensusMetrics(ConsensusMetrics value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasConsensusMetrics() => $_has(4);
  @$pb.TagNumber(14)
  void clearConsensusMetrics() => $_clearField(14);
  @$pb.TagNumber(14)
  ConsensusMetrics ensureConsensusMetrics() => $_ensure(4);

  @$pb.TagNumber(15)
  StorageMetrics get storageMetrics => $_getN(5);
  @$pb.TagNumber(15)
  set storageMetrics(StorageMetrics value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasStorageMetrics() => $_has(5);
  @$pb.TagNumber(15)
  void clearStorageMetrics() => $_clearField(15);
  @$pb.TagNumber(15)
  StorageMetrics ensureStorageMetrics() => $_ensure(5);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(6);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(6);
}

class GetServerInfoRequestMessage extends $pb.GeneratedMessage {
  factory GetServerInfoRequestMessage() => create();

  GetServerInfoRequestMessage._();

  factory GetServerInfoRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetServerInfoRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetServerInfoRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetServerInfoRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetServerInfoRequestMessage copyWith(
          void Function(GetServerInfoRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetServerInfoRequestMessage))
          as GetServerInfoRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServerInfoRequestMessage create() =>
      GetServerInfoRequestMessage._();
  @$core.override
  GetServerInfoRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetServerInfoRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetServerInfoRequestMessage>(create);
  static GetServerInfoRequestMessage? _defaultInstance;
}

class GetServerInfoResponseMessage extends $pb.GeneratedMessage {
  factory GetServerInfoResponseMessage({
    $core.int? rpcApiVersion,
    $core.int? rpcApiRevision,
    $core.String? serverVersion,
    $core.String? networkId,
    $core.bool? hasUtxoIndex,
    $core.bool? isSynced,
    $fixnum.Int64? virtualDaaScore,
    RPCError? error,
  }) {
    final result = create();
    if (rpcApiVersion != null) result.rpcApiVersion = rpcApiVersion;
    if (rpcApiRevision != null) result.rpcApiRevision = rpcApiRevision;
    if (serverVersion != null) result.serverVersion = serverVersion;
    if (networkId != null) result.networkId = networkId;
    if (hasUtxoIndex != null) result.hasUtxoIndex = hasUtxoIndex;
    if (isSynced != null) result.isSynced = isSynced;
    if (virtualDaaScore != null) result.virtualDaaScore = virtualDaaScore;
    if (error != null) result.error = error;
    return result;
  }

  GetServerInfoResponseMessage._();

  factory GetServerInfoResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetServerInfoResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetServerInfoResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'rpcApiVersion',
        protoName: 'rpcApiVersion', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'rpcApiRevision',
        protoName: 'rpcApiRevision', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'serverVersion', protoName: 'serverVersion')
    ..aOS(4, _omitFieldNames ? '' : 'networkId', protoName: 'networkId')
    ..aOB(5, _omitFieldNames ? '' : 'hasUtxoIndex', protoName: 'hasUtxoIndex')
    ..aOB(6, _omitFieldNames ? '' : 'isSynced', protoName: 'isSynced')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'virtualDaaScore', $pb.PbFieldType.OU6,
        protoName: 'virtualDaaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetServerInfoResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetServerInfoResponseMessage copyWith(
          void Function(GetServerInfoResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetServerInfoResponseMessage))
          as GetServerInfoResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServerInfoResponseMessage create() =>
      GetServerInfoResponseMessage._();
  @$core.override
  GetServerInfoResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetServerInfoResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetServerInfoResponseMessage>(create);
  static GetServerInfoResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rpcApiVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set rpcApiVersion($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRpcApiVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearRpcApiVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get rpcApiRevision => $_getIZ(1);
  @$pb.TagNumber(2)
  set rpcApiRevision($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRpcApiRevision() => $_has(1);
  @$pb.TagNumber(2)
  void clearRpcApiRevision() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get serverVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set serverVersion($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get networkId => $_getSZ(3);
  @$pb.TagNumber(4)
  set networkId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNetworkId() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetworkId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hasUtxoIndex => $_getBF(4);
  @$pb.TagNumber(5)
  set hasUtxoIndex($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHasUtxoIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasUtxoIndex() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isSynced => $_getBF(5);
  @$pb.TagNumber(6)
  set isSynced($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsSynced() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsSynced() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get virtualDaaScore => $_getI64(6);
  @$pb.TagNumber(7)
  set virtualDaaScore($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVirtualDaaScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearVirtualDaaScore() => $_clearField(7);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(7);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(7);
}

class GetSyncStatusRequestMessage extends $pb.GeneratedMessage {
  factory GetSyncStatusRequestMessage() => create();

  GetSyncStatusRequestMessage._();

  factory GetSyncStatusRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSyncStatusRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSyncStatusRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncStatusRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncStatusRequestMessage copyWith(
          void Function(GetSyncStatusRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSyncStatusRequestMessage))
          as GetSyncStatusRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSyncStatusRequestMessage create() =>
      GetSyncStatusRequestMessage._();
  @$core.override
  GetSyncStatusRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSyncStatusRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSyncStatusRequestMessage>(create);
  static GetSyncStatusRequestMessage? _defaultInstance;
}

class GetSyncStatusResponseMessage extends $pb.GeneratedMessage {
  factory GetSyncStatusResponseMessage({
    $core.bool? isSynced,
    RPCError? error,
  }) {
    final result = create();
    if (isSynced != null) result.isSynced = isSynced;
    if (error != null) result.error = error;
    return result;
  }

  GetSyncStatusResponseMessage._();

  factory GetSyncStatusResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSyncStatusResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSyncStatusResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSynced', protoName: 'isSynced')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncStatusResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncStatusResponseMessage copyWith(
          void Function(GetSyncStatusResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetSyncStatusResponseMessage))
          as GetSyncStatusResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSyncStatusResponseMessage create() =>
      GetSyncStatusResponseMessage._();
  @$core.override
  GetSyncStatusResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSyncStatusResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSyncStatusResponseMessage>(create);
  static GetSyncStatusResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSynced => $_getBF(0);
  @$pb.TagNumber(1)
  set isSynced($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsSynced() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSynced() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class GetDaaScoreTimestampEstimateRequestMessage extends $pb.GeneratedMessage {
  factory GetDaaScoreTimestampEstimateRequestMessage({
    $core.Iterable<$fixnum.Int64>? daaScores,
  }) {
    final result = create();
    if (daaScores != null) result.daaScores.addAll(daaScores);
    return result;
  }

  GetDaaScoreTimestampEstimateRequestMessage._();

  factory GetDaaScoreTimestampEstimateRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDaaScoreTimestampEstimateRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDaaScoreTimestampEstimateRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'daaScores', $pb.PbFieldType.KU6,
        protoName: 'daaScores')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDaaScoreTimestampEstimateRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDaaScoreTimestampEstimateRequestMessage copyWith(
          void Function(GetDaaScoreTimestampEstimateRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetDaaScoreTimestampEstimateRequestMessage))
          as GetDaaScoreTimestampEstimateRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDaaScoreTimestampEstimateRequestMessage create() =>
      GetDaaScoreTimestampEstimateRequestMessage._();
  @$core.override
  GetDaaScoreTimestampEstimateRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDaaScoreTimestampEstimateRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetDaaScoreTimestampEstimateRequestMessage>(create);
  static GetDaaScoreTimestampEstimateRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get daaScores => $_getList(0);
}

class GetDaaScoreTimestampEstimateResponseMessage extends $pb.GeneratedMessage {
  factory GetDaaScoreTimestampEstimateResponseMessage({
    $core.Iterable<$fixnum.Int64>? timestamps,
    RPCError? error,
  }) {
    final result = create();
    if (timestamps != null) result.timestamps.addAll(timestamps);
    if (error != null) result.error = error;
    return result;
  }

  GetDaaScoreTimestampEstimateResponseMessage._();

  factory GetDaaScoreTimestampEstimateResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDaaScoreTimestampEstimateResponseMessage.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDaaScoreTimestampEstimateResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'timestamps', $pb.PbFieldType.KU6)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDaaScoreTimestampEstimateResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDaaScoreTimestampEstimateResponseMessage copyWith(
          void Function(GetDaaScoreTimestampEstimateResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetDaaScoreTimestampEstimateResponseMessage))
          as GetDaaScoreTimestampEstimateResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDaaScoreTimestampEstimateResponseMessage create() =>
      GetDaaScoreTimestampEstimateResponseMessage._();
  @$core.override
  GetDaaScoreTimestampEstimateResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDaaScoreTimestampEstimateResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetDaaScoreTimestampEstimateResponseMessage>(create);
  static GetDaaScoreTimestampEstimateResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get timestamps => $_getList(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class RpcFeerateBucket extends $pb.GeneratedMessage {
  factory RpcFeerateBucket({
    $core.double? feerate,
    $core.double? estimatedSeconds,
  }) {
    final result = create();
    if (feerate != null) result.feerate = feerate;
    if (estimatedSeconds != null) result.estimatedSeconds = estimatedSeconds;
    return result;
  }

  RpcFeerateBucket._();

  factory RpcFeerateBucket.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcFeerateBucket.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcFeerateBucket',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'feerate')
    ..aD(2, _omitFieldNames ? '' : 'estimatedSeconds',
        protoName: 'estimatedSeconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcFeerateBucket clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcFeerateBucket copyWith(void Function(RpcFeerateBucket) updates) =>
      super.copyWith((message) => updates(message as RpcFeerateBucket))
          as RpcFeerateBucket;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcFeerateBucket create() => RpcFeerateBucket._();
  @$core.override
  RpcFeerateBucket createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcFeerateBucket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcFeerateBucket>(create);
  static RpcFeerateBucket? _defaultInstance;

  /// Fee/mass of a transaction in `sompi/gram` units
  @$pb.TagNumber(1)
  $core.double get feerate => $_getN(0);
  @$pb.TagNumber(1)
  set feerate($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFeerate() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeerate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get estimatedSeconds => $_getN(1);
  @$pb.TagNumber(2)
  set estimatedSeconds($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEstimatedSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearEstimatedSeconds() => $_clearField(2);
}

/// Data required for making fee estimates.
///
/// Feerate values represent fee/mass of a transaction in `sompi/gram` units.
/// Given a feerate value recommendation, calculate the required fee by
/// taking the transaction mass and multiplying it by feerate: `fee = feerate * mass(tx)`
class RpcFeeEstimate extends $pb.GeneratedMessage {
  factory RpcFeeEstimate({
    RpcFeerateBucket? priorityBucket,
    $core.Iterable<RpcFeerateBucket>? normalBuckets,
    $core.Iterable<RpcFeerateBucket>? lowBuckets,
  }) {
    final result = create();
    if (priorityBucket != null) result.priorityBucket = priorityBucket;
    if (normalBuckets != null) result.normalBuckets.addAll(normalBuckets);
    if (lowBuckets != null) result.lowBuckets.addAll(lowBuckets);
    return result;
  }

  RpcFeeEstimate._();

  factory RpcFeeEstimate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcFeeEstimate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcFeeEstimate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcFeerateBucket>(1, _omitFieldNames ? '' : 'priorityBucket',
        protoName: 'priorityBucket', subBuilder: RpcFeerateBucket.create)
    ..pPM<RpcFeerateBucket>(2, _omitFieldNames ? '' : 'normalBuckets',
        protoName: 'normalBuckets', subBuilder: RpcFeerateBucket.create)
    ..pPM<RpcFeerateBucket>(3, _omitFieldNames ? '' : 'lowBuckets',
        protoName: 'lowBuckets', subBuilder: RpcFeerateBucket.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcFeeEstimate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcFeeEstimate copyWith(void Function(RpcFeeEstimate) updates) =>
      super.copyWith((message) => updates(message as RpcFeeEstimate))
          as RpcFeeEstimate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcFeeEstimate create() => RpcFeeEstimate._();
  @$core.override
  RpcFeeEstimate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcFeeEstimate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcFeeEstimate>(create);
  static RpcFeeEstimate? _defaultInstance;

  /// Top-priority feerate bucket. Provides an estimation of the feerate required for sub-second DAG inclusion.
  @$pb.TagNumber(1)
  RpcFeerateBucket get priorityBucket => $_getN(0);
  @$pb.TagNumber(1)
  set priorityBucket(RpcFeerateBucket value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPriorityBucket() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriorityBucket() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcFeerateBucket ensurePriorityBucket() => $_ensure(0);

  /// A vector of *normal* priority feerate values. The first value of this vector is guaranteed to exist and
  /// provide an estimation for sub-*minute* DAG inclusion. All other values will have shorter estimation
  /// times than all `lowBucket` values. Therefor by chaining `[priority] | normal | low` and interpolating
  /// between them, one can compose a complete feerate function on the client side. The API makes an effort
  /// to sample enough "interesting" points on the feerate-to-time curve, so that the interpolation is meaningful.
  @$pb.TagNumber(2)
  $pb.PbList<RpcFeerateBucket> get normalBuckets => $_getList(1);

  /// A vector of *low* priority feerate values. The first value of this vector is guaranteed to
  /// exist and provide an estimation for sub-*hour* DAG inclusion.
  @$pb.TagNumber(3)
  $pb.PbList<RpcFeerateBucket> get lowBuckets => $_getList(2);
}

class RpcFeeEstimateVerboseExperimentalData extends $pb.GeneratedMessage {
  factory RpcFeeEstimateVerboseExperimentalData({
    $fixnum.Int64? mempoolReadyTransactionsCount,
    $fixnum.Int64? mempoolReadyTransactionsTotalMass,
    $fixnum.Int64? networkMassPerSecond,
    $core.double? nextBlockTemplateFeerateMin,
    $core.double? nextBlockTemplateFeerateMedian,
    $core.double? nextBlockTemplateFeerateMax,
  }) {
    final result = create();
    if (mempoolReadyTransactionsCount != null)
      result.mempoolReadyTransactionsCount = mempoolReadyTransactionsCount;
    if (mempoolReadyTransactionsTotalMass != null)
      result.mempoolReadyTransactionsTotalMass =
          mempoolReadyTransactionsTotalMass;
    if (networkMassPerSecond != null)
      result.networkMassPerSecond = networkMassPerSecond;
    if (nextBlockTemplateFeerateMin != null)
      result.nextBlockTemplateFeerateMin = nextBlockTemplateFeerateMin;
    if (nextBlockTemplateFeerateMedian != null)
      result.nextBlockTemplateFeerateMedian = nextBlockTemplateFeerateMedian;
    if (nextBlockTemplateFeerateMax != null)
      result.nextBlockTemplateFeerateMax = nextBlockTemplateFeerateMax;
    return result;
  }

  RpcFeeEstimateVerboseExperimentalData._();

  factory RpcFeeEstimateVerboseExperimentalData.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcFeeEstimateVerboseExperimentalData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcFeeEstimateVerboseExperimentalData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        _omitFieldNames ? '' : 'mempoolReadyTransactionsCount',
        $pb.PbFieldType.OU6,
        protoName: 'mempoolReadyTransactionsCount',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2,
        _omitFieldNames ? '' : 'mempoolReadyTransactionsTotalMass',
        $pb.PbFieldType.OU6,
        protoName: 'mempoolReadyTransactionsTotalMass',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'networkMassPerSecond', $pb.PbFieldType.OU6,
        protoName: 'networkMassPerSecond', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(11, _omitFieldNames ? '' : 'nextBlockTemplateFeerateMin',
        protoName: 'nextBlockTemplateFeerateMin')
    ..aD(12, _omitFieldNames ? '' : 'nextBlockTemplateFeerateMedian',
        protoName: 'nextBlockTemplateFeerateMedian')
    ..aD(13, _omitFieldNames ? '' : 'nextBlockTemplateFeerateMax',
        protoName: 'nextBlockTemplateFeerateMax')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcFeeEstimateVerboseExperimentalData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcFeeEstimateVerboseExperimentalData copyWith(
          void Function(RpcFeeEstimateVerboseExperimentalData) updates) =>
      super.copyWith((message) =>
              updates(message as RpcFeeEstimateVerboseExperimentalData))
          as RpcFeeEstimateVerboseExperimentalData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcFeeEstimateVerboseExperimentalData create() =>
      RpcFeeEstimateVerboseExperimentalData._();
  @$core.override
  RpcFeeEstimateVerboseExperimentalData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcFeeEstimateVerboseExperimentalData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RpcFeeEstimateVerboseExperimentalData>(create);
  static RpcFeeEstimateVerboseExperimentalData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get mempoolReadyTransactionsCount => $_getI64(0);
  @$pb.TagNumber(1)
  set mempoolReadyTransactionsCount($fixnum.Int64 value) =>
      $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMempoolReadyTransactionsCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearMempoolReadyTransactionsCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mempoolReadyTransactionsTotalMass => $_getI64(1);
  @$pb.TagNumber(2)
  set mempoolReadyTransactionsTotalMass($fixnum.Int64 value) =>
      $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMempoolReadyTransactionsTotalMass() => $_has(1);
  @$pb.TagNumber(2)
  void clearMempoolReadyTransactionsTotalMass() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get networkMassPerSecond => $_getI64(2);
  @$pb.TagNumber(3)
  set networkMassPerSecond($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNetworkMassPerSecond() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetworkMassPerSecond() => $_clearField(3);

  @$pb.TagNumber(11)
  $core.double get nextBlockTemplateFeerateMin => $_getN(3);
  @$pb.TagNumber(11)
  set nextBlockTemplateFeerateMin($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(11)
  $core.bool hasNextBlockTemplateFeerateMin() => $_has(3);
  @$pb.TagNumber(11)
  void clearNextBlockTemplateFeerateMin() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get nextBlockTemplateFeerateMedian => $_getN(4);
  @$pb.TagNumber(12)
  set nextBlockTemplateFeerateMedian($core.double value) =>
      $_setDouble(4, value);
  @$pb.TagNumber(12)
  $core.bool hasNextBlockTemplateFeerateMedian() => $_has(4);
  @$pb.TagNumber(12)
  void clearNextBlockTemplateFeerateMedian() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get nextBlockTemplateFeerateMax => $_getN(5);
  @$pb.TagNumber(13)
  set nextBlockTemplateFeerateMax($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(13)
  $core.bool hasNextBlockTemplateFeerateMax() => $_has(5);
  @$pb.TagNumber(13)
  void clearNextBlockTemplateFeerateMax() => $_clearField(13);
}

class GetFeeEstimateRequestMessage extends $pb.GeneratedMessage {
  factory GetFeeEstimateRequestMessage() => create();

  GetFeeEstimateRequestMessage._();

  factory GetFeeEstimateRequestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFeeEstimateRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFeeEstimateRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateRequestMessage copyWith(
          void Function(GetFeeEstimateRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetFeeEstimateRequestMessage))
          as GetFeeEstimateRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateRequestMessage create() =>
      GetFeeEstimateRequestMessage._();
  @$core.override
  GetFeeEstimateRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFeeEstimateRequestMessage>(create);
  static GetFeeEstimateRequestMessage? _defaultInstance;
}

class GetFeeEstimateResponseMessage extends $pb.GeneratedMessage {
  factory GetFeeEstimateResponseMessage({
    RpcFeeEstimate? estimate,
    RPCError? error,
  }) {
    final result = create();
    if (estimate != null) result.estimate = estimate;
    if (error != null) result.error = error;
    return result;
  }

  GetFeeEstimateResponseMessage._();

  factory GetFeeEstimateResponseMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFeeEstimateResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFeeEstimateResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcFeeEstimate>(1, _omitFieldNames ? '' : 'estimate',
        subBuilder: RpcFeeEstimate.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateResponseMessage copyWith(
          void Function(GetFeeEstimateResponseMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetFeeEstimateResponseMessage))
          as GetFeeEstimateResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateResponseMessage create() =>
      GetFeeEstimateResponseMessage._();
  @$core.override
  GetFeeEstimateResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFeeEstimateResponseMessage>(create);
  static GetFeeEstimateResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RpcFeeEstimate get estimate => $_getN(0);
  @$pb.TagNumber(1)
  set estimate(RpcFeeEstimate value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEstimate() => $_has(0);
  @$pb.TagNumber(1)
  void clearEstimate() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcFeeEstimate ensureEstimate() => $_ensure(0);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class GetFeeEstimateExperimentalRequestMessage extends $pb.GeneratedMessage {
  factory GetFeeEstimateExperimentalRequestMessage({
    $core.bool? verbose,
  }) {
    final result = create();
    if (verbose != null) result.verbose = verbose;
    return result;
  }

  GetFeeEstimateExperimentalRequestMessage._();

  factory GetFeeEstimateExperimentalRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFeeEstimateExperimentalRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFeeEstimateExperimentalRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'verbose')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateExperimentalRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateExperimentalRequestMessage copyWith(
          void Function(GetFeeEstimateExperimentalRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetFeeEstimateExperimentalRequestMessage))
          as GetFeeEstimateExperimentalRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateExperimentalRequestMessage create() =>
      GetFeeEstimateExperimentalRequestMessage._();
  @$core.override
  GetFeeEstimateExperimentalRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateExperimentalRequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetFeeEstimateExperimentalRequestMessage>(create);
  static GetFeeEstimateExperimentalRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get verbose => $_getBF(0);
  @$pb.TagNumber(1)
  set verbose($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVerbose() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerbose() => $_clearField(1);
}

class GetFeeEstimateExperimentalResponseMessage extends $pb.GeneratedMessage {
  factory GetFeeEstimateExperimentalResponseMessage({
    RpcFeeEstimate? estimate,
    RpcFeeEstimateVerboseExperimentalData? verbose,
    RPCError? error,
  }) {
    final result = create();
    if (estimate != null) result.estimate = estimate;
    if (verbose != null) result.verbose = verbose;
    if (error != null) result.error = error;
    return result;
  }

  GetFeeEstimateExperimentalResponseMessage._();

  factory GetFeeEstimateExperimentalResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFeeEstimateExperimentalResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFeeEstimateExperimentalResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcFeeEstimate>(1, _omitFieldNames ? '' : 'estimate',
        subBuilder: RpcFeeEstimate.create)
    ..aOM<RpcFeeEstimateVerboseExperimentalData>(
        2, _omitFieldNames ? '' : 'verbose',
        subBuilder: RpcFeeEstimateVerboseExperimentalData.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateExperimentalResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFeeEstimateExperimentalResponseMessage copyWith(
          void Function(GetFeeEstimateExperimentalResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetFeeEstimateExperimentalResponseMessage))
          as GetFeeEstimateExperimentalResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateExperimentalResponseMessage create() =>
      GetFeeEstimateExperimentalResponseMessage._();
  @$core.override
  GetFeeEstimateExperimentalResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetFeeEstimateExperimentalResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetFeeEstimateExperimentalResponseMessage>(create);
  static GetFeeEstimateExperimentalResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RpcFeeEstimate get estimate => $_getN(0);
  @$pb.TagNumber(1)
  set estimate(RpcFeeEstimate value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEstimate() => $_has(0);
  @$pb.TagNumber(1)
  void clearEstimate() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcFeeEstimate ensureEstimate() => $_ensure(0);

  @$pb.TagNumber(2)
  RpcFeeEstimateVerboseExperimentalData get verbose => $_getN(1);
  @$pb.TagNumber(2)
  set verbose(RpcFeeEstimateVerboseExperimentalData value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVerbose() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerbose() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcFeeEstimateVerboseExperimentalData ensureVerbose() => $_ensure(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(2);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(2);
}

class GetUtxoReturnAddressRequestMessage extends $pb.GeneratedMessage {
  factory GetUtxoReturnAddressRequestMessage({
    $core.String? txid,
    $fixnum.Int64? acceptingBlockDaaScore,
  }) {
    final result = create();
    if (txid != null) result.txid = txid;
    if (acceptingBlockDaaScore != null)
      result.acceptingBlockDaaScore = acceptingBlockDaaScore;
    return result;
  }

  GetUtxoReturnAddressRequestMessage._();

  factory GetUtxoReturnAddressRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxoReturnAddressRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxoReturnAddressRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txid')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'acceptingBlockDaaScore', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxoReturnAddressRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxoReturnAddressRequestMessage copyWith(
          void Function(GetUtxoReturnAddressRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetUtxoReturnAddressRequestMessage))
          as GetUtxoReturnAddressRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxoReturnAddressRequestMessage create() =>
      GetUtxoReturnAddressRequestMessage._();
  @$core.override
  GetUtxoReturnAddressRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxoReturnAddressRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxoReturnAddressRequestMessage>(
          create);
  static GetUtxoReturnAddressRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txid => $_getSZ(0);
  @$pb.TagNumber(1)
  set txid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get acceptingBlockDaaScore => $_getI64(1);
  @$pb.TagNumber(2)
  set acceptingBlockDaaScore($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAcceptingBlockDaaScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearAcceptingBlockDaaScore() => $_clearField(2);
}

class GetUtxoReturnAddressResponseMessage extends $pb.GeneratedMessage {
  factory GetUtxoReturnAddressResponseMessage({
    $core.String? returnAddress,
    RPCError? error,
  }) {
    final result = create();
    if (returnAddress != null) result.returnAddress = returnAddress;
    if (error != null) result.error = error;
    return result;
  }

  GetUtxoReturnAddressResponseMessage._();

  factory GetUtxoReturnAddressResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxoReturnAddressResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxoReturnAddressResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnAddress')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxoReturnAddressResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxoReturnAddressResponseMessage copyWith(
          void Function(GetUtxoReturnAddressResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetUtxoReturnAddressResponseMessage))
          as GetUtxoReturnAddressResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxoReturnAddressResponseMessage create() =>
      GetUtxoReturnAddressResponseMessage._();
  @$core.override
  GetUtxoReturnAddressResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxoReturnAddressResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetUtxoReturnAddressResponseMessage>(create);
  static GetUtxoReturnAddressResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get returnAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnAddress() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class RpcOptionalHeader extends $pb.GeneratedMessage {
  factory RpcOptionalHeader({
    $core.String? hash,
    $core.int? version,
    $core.Iterable<RpcBlockLevelRun>? parentsByLevel,
    $core.String? hashMerkleRoot,
    $core.String? acceptedIdMerkleRoot,
    $core.String? utxoCommitment,
    $fixnum.Int64? timestamp,
    $core.int? bits,
    $fixnum.Int64? nonce,
    $fixnum.Int64? daaScore,
    $core.String? blueWork,
    $fixnum.Int64? blueScore,
    $core.String? pruningPoint,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (version != null) result.version = version;
    if (parentsByLevel != null) result.parentsByLevel.addAll(parentsByLevel);
    if (hashMerkleRoot != null) result.hashMerkleRoot = hashMerkleRoot;
    if (acceptedIdMerkleRoot != null)
      result.acceptedIdMerkleRoot = acceptedIdMerkleRoot;
    if (utxoCommitment != null) result.utxoCommitment = utxoCommitment;
    if (timestamp != null) result.timestamp = timestamp;
    if (bits != null) result.bits = bits;
    if (nonce != null) result.nonce = nonce;
    if (daaScore != null) result.daaScore = daaScore;
    if (blueWork != null) result.blueWork = blueWork;
    if (blueScore != null) result.blueScore = blueScore;
    if (pruningPoint != null) result.pruningPoint = pruningPoint;
    return result;
  }

  RpcOptionalHeader._();

  factory RpcOptionalHeader.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalHeader.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalHeader',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'hash')
    ..aI(3, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..pPM<RpcBlockLevelRun>(4, _omitFieldNames ? '' : 'parentsByLevel',
        protoName: 'parentsByLevel', subBuilder: RpcBlockLevelRun.create)
    ..aOS(5, _omitFieldNames ? '' : 'hashMerkleRoot',
        protoName: 'hashMerkleRoot')
    ..aOS(6, _omitFieldNames ? '' : 'acceptedIdMerkleRoot',
        protoName: 'acceptedIdMerkleRoot')
    ..aOS(7, _omitFieldNames ? '' : 'utxoCommitment',
        protoName: 'utxoCommitment')
    ..aInt64(8, _omitFieldNames ? '' : 'timestamp')
    ..aI(9, _omitFieldNames ? '' : 'bits', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'daaScore', $pb.PbFieldType.OU6,
        protoName: 'daaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(12, _omitFieldNames ? '' : 'blueWork', protoName: 'blueWork')
    ..a<$fixnum.Int64>(
        13, _omitFieldNames ? '' : 'blueScore', $pb.PbFieldType.OU6,
        protoName: 'blueScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(14, _omitFieldNames ? '' : 'pruningPoint', protoName: 'pruningPoint')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalHeader clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalHeader copyWith(void Function(RpcOptionalHeader) updates) =>
      super.copyWith((message) => updates(message as RpcOptionalHeader))
          as RpcOptionalHeader;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalHeader create() => RpcOptionalHeader._();
  @$core.override
  RpcOptionalHeader createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalHeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalHeader>(create);
  static RpcOptionalHeader? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(2)
  set hash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(3)
  set version($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<RpcBlockLevelRun> get parentsByLevel => $_getList(2);

  @$pb.TagNumber(5)
  $core.String get hashMerkleRoot => $_getSZ(3);
  @$pb.TagNumber(5)
  set hashMerkleRoot($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasHashMerkleRoot() => $_has(3);
  @$pb.TagNumber(5)
  void clearHashMerkleRoot() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get acceptedIdMerkleRoot => $_getSZ(4);
  @$pb.TagNumber(6)
  set acceptedIdMerkleRoot($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasAcceptedIdMerkleRoot() => $_has(4);
  @$pb.TagNumber(6)
  void clearAcceptedIdMerkleRoot() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get utxoCommitment => $_getSZ(5);
  @$pb.TagNumber(7)
  set utxoCommitment($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasUtxoCommitment() => $_has(5);
  @$pb.TagNumber(7)
  void clearUtxoCommitment() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get timestamp => $_getI64(6);
  @$pb.TagNumber(8)
  set timestamp($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(8)
  void clearTimestamp() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get bits => $_getIZ(7);
  @$pb.TagNumber(9)
  set bits($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(9)
  $core.bool hasBits() => $_has(7);
  @$pb.TagNumber(9)
  void clearBits() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get nonce => $_getI64(8);
  @$pb.TagNumber(10)
  set nonce($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(10)
  $core.bool hasNonce() => $_has(8);
  @$pb.TagNumber(10)
  void clearNonce() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get daaScore => $_getI64(9);
  @$pb.TagNumber(11)
  set daaScore($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(11)
  $core.bool hasDaaScore() => $_has(9);
  @$pb.TagNumber(11)
  void clearDaaScore() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get blueWork => $_getSZ(10);
  @$pb.TagNumber(12)
  set blueWork($core.String value) => $_setString(10, value);
  @$pb.TagNumber(12)
  $core.bool hasBlueWork() => $_has(10);
  @$pb.TagNumber(12)
  void clearBlueWork() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get blueScore => $_getI64(11);
  @$pb.TagNumber(13)
  set blueScore($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(13)
  $core.bool hasBlueScore() => $_has(11);
  @$pb.TagNumber(13)
  void clearBlueScore() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get pruningPoint => $_getSZ(12);
  @$pb.TagNumber(14)
  set pruningPoint($core.String value) => $_setString(12, value);
  @$pb.TagNumber(14)
  $core.bool hasPruningPoint() => $_has(12);
  @$pb.TagNumber(14)
  void clearPruningPoint() => $_clearField(14);
}

class RpcOptionalTransactionOutpoint extends $pb.GeneratedMessage {
  factory RpcOptionalTransactionOutpoint({
    $core.String? transactionId,
    $core.int? index,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (index != null) result.index = index;
    return result;
  }

  RpcOptionalTransactionOutpoint._();

  factory RpcOptionalTransactionOutpoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransactionOutpoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransactionOutpoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId')
    ..aI(3, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionOutpoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionOutpoint copyWith(
          void Function(RpcOptionalTransactionOutpoint) updates) =>
      super.copyWith(
              (message) => updates(message as RpcOptionalTransactionOutpoint))
          as RpcOptionalTransactionOutpoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionOutpoint create() =>
      RpcOptionalTransactionOutpoint._();
  @$core.override
  RpcOptionalTransactionOutpoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionOutpoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalTransactionOutpoint>(create);
  static RpcOptionalTransactionOutpoint? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(2)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(2)
  void clearTransactionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(3)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(3)
  void clearIndex() => $_clearField(3);
}

class RpcOptionalUtxoEntryVerboseData extends $pb.GeneratedMessage {
  factory RpcOptionalUtxoEntryVerboseData({
    $core.String? scriptPublicKeyType,
    $core.String? scriptPublicKeyAddress,
  }) {
    final result = create();
    if (scriptPublicKeyType != null)
      result.scriptPublicKeyType = scriptPublicKeyType;
    if (scriptPublicKeyAddress != null)
      result.scriptPublicKeyAddress = scriptPublicKeyAddress;
    return result;
  }

  RpcOptionalUtxoEntryVerboseData._();

  factory RpcOptionalUtxoEntryVerboseData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalUtxoEntryVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalUtxoEntryVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'scriptPublicKeyType',
        protoName: 'scriptPublicKeyType')
    ..aOS(3, _omitFieldNames ? '' : 'scriptPublicKeyAddress',
        protoName: 'scriptPublicKeyAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalUtxoEntryVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalUtxoEntryVerboseData copyWith(
          void Function(RpcOptionalUtxoEntryVerboseData) updates) =>
      super.copyWith(
              (message) => updates(message as RpcOptionalUtxoEntryVerboseData))
          as RpcOptionalUtxoEntryVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalUtxoEntryVerboseData create() =>
      RpcOptionalUtxoEntryVerboseData._();
  @$core.override
  RpcOptionalUtxoEntryVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalUtxoEntryVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalUtxoEntryVerboseData>(
          create);
  static RpcOptionalUtxoEntryVerboseData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get scriptPublicKeyType => $_getSZ(0);
  @$pb.TagNumber(2)
  set scriptPublicKeyType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasScriptPublicKeyType() => $_has(0);
  @$pb.TagNumber(2)
  void clearScriptPublicKeyType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get scriptPublicKeyAddress => $_getSZ(1);
  @$pb.TagNumber(3)
  set scriptPublicKeyAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasScriptPublicKeyAddress() => $_has(1);
  @$pb.TagNumber(3)
  void clearScriptPublicKeyAddress() => $_clearField(3);
}

class RpcOptionalUtxoEntry extends $pb.GeneratedMessage {
  factory RpcOptionalUtxoEntry({
    $fixnum.Int64? amount,
    RpcScriptPublicKey? scriptPublicKey,
    $fixnum.Int64? blockDaaScore,
    $core.bool? isCoinbase,
    RpcOptionalUtxoEntryVerboseData? verboseData,
    $core.String? covenantId,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (scriptPublicKey != null) result.scriptPublicKey = scriptPublicKey;
    if (blockDaaScore != null) result.blockDaaScore = blockDaaScore;
    if (isCoinbase != null) result.isCoinbase = isCoinbase;
    if (verboseData != null) result.verboseData = verboseData;
    if (covenantId != null) result.covenantId = covenantId;
    return result;
  }

  RpcOptionalUtxoEntry._();

  factory RpcOptionalUtxoEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalUtxoEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalUtxoEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcScriptPublicKey>(3, _omitFieldNames ? '' : 'scriptPublicKey',
        protoName: 'scriptPublicKey', subBuilder: RpcScriptPublicKey.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'blockDaaScore', $pb.PbFieldType.OU6,
        protoName: 'blockDaaScore', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(5, _omitFieldNames ? '' : 'isCoinbase', protoName: 'isCoinbase')
    ..aOM<RpcOptionalUtxoEntryVerboseData>(
        6, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData',
        subBuilder: RpcOptionalUtxoEntryVerboseData.create)
    ..aOS(7, _omitFieldNames ? '' : 'CovenantId', protoName: 'CovenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalUtxoEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalUtxoEntry copyWith(void Function(RpcOptionalUtxoEntry) updates) =>
      super.copyWith((message) => updates(message as RpcOptionalUtxoEntry))
          as RpcOptionalUtxoEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalUtxoEntry create() => RpcOptionalUtxoEntry._();
  @$core.override
  RpcOptionalUtxoEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalUtxoEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalUtxoEntry>(create);
  static RpcOptionalUtxoEntry? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  RpcScriptPublicKey get scriptPublicKey => $_getN(1);
  @$pb.TagNumber(3)
  set scriptPublicKey(RpcScriptPublicKey value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasScriptPublicKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearScriptPublicKey() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcScriptPublicKey ensureScriptPublicKey() => $_ensure(1);

  @$pb.TagNumber(4)
  $fixnum.Int64 get blockDaaScore => $_getI64(2);
  @$pb.TagNumber(4)
  set blockDaaScore($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasBlockDaaScore() => $_has(2);
  @$pb.TagNumber(4)
  void clearBlockDaaScore() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isCoinbase => $_getBF(3);
  @$pb.TagNumber(5)
  set isCoinbase($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(5)
  $core.bool hasIsCoinbase() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsCoinbase() => $_clearField(5);

  @$pb.TagNumber(6)
  RpcOptionalUtxoEntryVerboseData get verboseData => $_getN(4);
  @$pb.TagNumber(6)
  set verboseData(RpcOptionalUtxoEntryVerboseData value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasVerboseData() => $_has(4);
  @$pb.TagNumber(6)
  void clearVerboseData() => $_clearField(6);
  @$pb.TagNumber(6)
  RpcOptionalUtxoEntryVerboseData ensureVerboseData() => $_ensure(4);

  @$pb.TagNumber(7)
  $core.String get covenantId => $_getSZ(5);
  @$pb.TagNumber(7)
  set covenantId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasCovenantId() => $_has(5);
  @$pb.TagNumber(7)
  void clearCovenantId() => $_clearField(7);
}

class RpcOptionalTransactionInputVerboseData extends $pb.GeneratedMessage {
  factory RpcOptionalTransactionInputVerboseData({
    RpcOptionalUtxoEntry? utxoEntry,
  }) {
    final result = create();
    if (utxoEntry != null) result.utxoEntry = utxoEntry;
    return result;
  }

  RpcOptionalTransactionInputVerboseData._();

  factory RpcOptionalTransactionInputVerboseData.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransactionInputVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransactionInputVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcOptionalUtxoEntry>(2, _omitFieldNames ? '' : 'utxoEntry',
        protoName: 'utxoEntry', subBuilder: RpcOptionalUtxoEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionInputVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionInputVerboseData copyWith(
          void Function(RpcOptionalTransactionInputVerboseData) updates) =>
      super.copyWith((message) =>
              updates(message as RpcOptionalTransactionInputVerboseData))
          as RpcOptionalTransactionInputVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionInputVerboseData create() =>
      RpcOptionalTransactionInputVerboseData._();
  @$core.override
  RpcOptionalTransactionInputVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionInputVerboseData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RpcOptionalTransactionInputVerboseData>(create);
  static RpcOptionalTransactionInputVerboseData? _defaultInstance;

  @$pb.TagNumber(2)
  RpcOptionalUtxoEntry get utxoEntry => $_getN(0);
  @$pb.TagNumber(2)
  set utxoEntry(RpcOptionalUtxoEntry value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUtxoEntry() => $_has(0);
  @$pb.TagNumber(2)
  void clearUtxoEntry() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcOptionalUtxoEntry ensureUtxoEntry() => $_ensure(0);
}

class RpcOptionalTransactionInput extends $pb.GeneratedMessage {
  factory RpcOptionalTransactionInput({
    RpcOptionalTransactionOutpoint? previousOutpoint,
    $core.String? signatureScript,
    $fixnum.Int64? sequence,
    $core.int? sigOpCount,
    RpcOptionalTransactionInputVerboseData? verboseData,
    $core.int? computeBudget,
  }) {
    final result = create();
    if (previousOutpoint != null) result.previousOutpoint = previousOutpoint;
    if (signatureScript != null) result.signatureScript = signatureScript;
    if (sequence != null) result.sequence = sequence;
    if (sigOpCount != null) result.sigOpCount = sigOpCount;
    if (verboseData != null) result.verboseData = verboseData;
    if (computeBudget != null) result.computeBudget = computeBudget;
    return result;
  }

  RpcOptionalTransactionInput._();

  factory RpcOptionalTransactionInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransactionInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransactionInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcOptionalTransactionOutpoint>(
        2, _omitFieldNames ? '' : 'previousOutpoint',
        protoName: 'previousOutpoint',
        subBuilder: RpcOptionalTransactionOutpoint.create)
    ..aOS(3, _omitFieldNames ? '' : 'signatureScript',
        protoName: 'signatureScript')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(5, _omitFieldNames ? '' : 'sigOpCount',
        protoName: 'sigOpCount', fieldType: $pb.PbFieldType.OU3)
    ..aOM<RpcOptionalTransactionInputVerboseData>(
        6, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData',
        subBuilder: RpcOptionalTransactionInputVerboseData.create)
    ..aI(7, _omitFieldNames ? '' : 'computeBudget',
        protoName: 'computeBudget', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionInput copyWith(
          void Function(RpcOptionalTransactionInput) updates) =>
      super.copyWith(
              (message) => updates(message as RpcOptionalTransactionInput))
          as RpcOptionalTransactionInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionInput create() =>
      RpcOptionalTransactionInput._();
  @$core.override
  RpcOptionalTransactionInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalTransactionInput>(create);
  static RpcOptionalTransactionInput? _defaultInstance;

  @$pb.TagNumber(2)
  RpcOptionalTransactionOutpoint get previousOutpoint => $_getN(0);
  @$pb.TagNumber(2)
  set previousOutpoint(RpcOptionalTransactionOutpoint value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPreviousOutpoint() => $_has(0);
  @$pb.TagNumber(2)
  void clearPreviousOutpoint() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcOptionalTransactionOutpoint ensurePreviousOutpoint() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get signatureScript => $_getSZ(1);
  @$pb.TagNumber(3)
  set signatureScript($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasSignatureScript() => $_has(1);
  @$pb.TagNumber(3)
  void clearSignatureScript() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sequence => $_getI64(2);
  @$pb.TagNumber(4)
  set sequence($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(2);
  @$pb.TagNumber(4)
  void clearSequence() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get sigOpCount => $_getIZ(3);
  @$pb.TagNumber(5)
  set sigOpCount($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(5)
  $core.bool hasSigOpCount() => $_has(3);
  @$pb.TagNumber(5)
  void clearSigOpCount() => $_clearField(5);

  @$pb.TagNumber(6)
  RpcOptionalTransactionInputVerboseData get verboseData => $_getN(4);
  @$pb.TagNumber(6)
  set verboseData(RpcOptionalTransactionInputVerboseData value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasVerboseData() => $_has(4);
  @$pb.TagNumber(6)
  void clearVerboseData() => $_clearField(6);
  @$pb.TagNumber(6)
  RpcOptionalTransactionInputVerboseData ensureVerboseData() => $_ensure(4);

  /// Replaces sigop count for tx version >= 1.
  @$pb.TagNumber(7)
  $core.int get computeBudget => $_getIZ(5);
  @$pb.TagNumber(7)
  set computeBudget($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(7)
  $core.bool hasComputeBudget() => $_has(5);
  @$pb.TagNumber(7)
  void clearComputeBudget() => $_clearField(7);
}

class RpcOptionalTransactionOutputVerboseData extends $pb.GeneratedMessage {
  factory RpcOptionalTransactionOutputVerboseData({
    $core.String? scriptPublicKeyType,
    $core.String? scriptPublicKeyAddress,
  }) {
    final result = create();
    if (scriptPublicKeyType != null)
      result.scriptPublicKeyType = scriptPublicKeyType;
    if (scriptPublicKeyAddress != null)
      result.scriptPublicKeyAddress = scriptPublicKeyAddress;
    return result;
  }

  RpcOptionalTransactionOutputVerboseData._();

  factory RpcOptionalTransactionOutputVerboseData.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransactionOutputVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransactionOutputVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'scriptPublicKeyType',
        protoName: 'scriptPublicKeyType')
    ..aOS(3, _omitFieldNames ? '' : 'scriptPublicKeyAddress',
        protoName: 'scriptPublicKeyAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionOutputVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionOutputVerboseData copyWith(
          void Function(RpcOptionalTransactionOutputVerboseData) updates) =>
      super.copyWith((message) =>
              updates(message as RpcOptionalTransactionOutputVerboseData))
          as RpcOptionalTransactionOutputVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionOutputVerboseData create() =>
      RpcOptionalTransactionOutputVerboseData._();
  @$core.override
  RpcOptionalTransactionOutputVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionOutputVerboseData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RpcOptionalTransactionOutputVerboseData>(create);
  static RpcOptionalTransactionOutputVerboseData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get scriptPublicKeyType => $_getSZ(0);
  @$pb.TagNumber(2)
  set scriptPublicKeyType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasScriptPublicKeyType() => $_has(0);
  @$pb.TagNumber(2)
  void clearScriptPublicKeyType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get scriptPublicKeyAddress => $_getSZ(1);
  @$pb.TagNumber(3)
  set scriptPublicKeyAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasScriptPublicKeyAddress() => $_has(1);
  @$pb.TagNumber(3)
  void clearScriptPublicKeyAddress() => $_clearField(3);
}

class RpcNullableCovenantBinding extends $pb.GeneratedMessage {
  factory RpcNullableCovenantBinding({
    RpcCovenantBinding? covenant,
  }) {
    final result = create();
    if (covenant != null) result.covenant = covenant;
    return result;
  }

  RpcNullableCovenantBinding._();

  factory RpcNullableCovenantBinding.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcNullableCovenantBinding.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcNullableCovenantBinding',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcCovenantBinding>(1, _omitFieldNames ? '' : 'covenant',
        subBuilder: RpcCovenantBinding.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcNullableCovenantBinding clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcNullableCovenantBinding copyWith(
          void Function(RpcNullableCovenantBinding) updates) =>
      super.copyWith(
              (message) => updates(message as RpcNullableCovenantBinding))
          as RpcNullableCovenantBinding;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcNullableCovenantBinding create() => RpcNullableCovenantBinding._();
  @$core.override
  RpcNullableCovenantBinding createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcNullableCovenantBinding getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcNullableCovenantBinding>(create);
  static RpcNullableCovenantBinding? _defaultInstance;

  @$pb.TagNumber(1)
  RpcCovenantBinding get covenant => $_getN(0);
  @$pb.TagNumber(1)
  set covenant(RpcCovenantBinding value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCovenant() => $_has(0);
  @$pb.TagNumber(1)
  void clearCovenant() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcCovenantBinding ensureCovenant() => $_ensure(0);
}

class RpcOptionalTransactionOutput extends $pb.GeneratedMessage {
  factory RpcOptionalTransactionOutput({
    $fixnum.Int64? value,
    RpcScriptPublicKey? scriptPublicKey,
    RpcOptionalTransactionOutputVerboseData? verboseData,
    RpcNullableCovenantBinding? covenant,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (scriptPublicKey != null) result.scriptPublicKey = scriptPublicKey;
    if (verboseData != null) result.verboseData = verboseData;
    if (covenant != null) result.covenant = covenant;
    return result;
  }

  RpcOptionalTransactionOutput._();

  factory RpcOptionalTransactionOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransactionOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransactionOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcScriptPublicKey>(3, _omitFieldNames ? '' : 'scriptPublicKey',
        protoName: 'scriptPublicKey', subBuilder: RpcScriptPublicKey.create)
    ..aOM<RpcOptionalTransactionOutputVerboseData>(
        4, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData',
        subBuilder: RpcOptionalTransactionOutputVerboseData.create)
    ..aOM<RpcNullableCovenantBinding>(5, _omitFieldNames ? '' : 'covenant',
        subBuilder: RpcNullableCovenantBinding.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionOutput copyWith(
          void Function(RpcOptionalTransactionOutput) updates) =>
      super.copyWith(
              (message) => updates(message as RpcOptionalTransactionOutput))
          as RpcOptionalTransactionOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionOutput create() =>
      RpcOptionalTransactionOutput._();
  @$core.override
  RpcOptionalTransactionOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalTransactionOutput>(create);
  static RpcOptionalTransactionOutput? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  RpcScriptPublicKey get scriptPublicKey => $_getN(1);
  @$pb.TagNumber(3)
  set scriptPublicKey(RpcScriptPublicKey value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasScriptPublicKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearScriptPublicKey() => $_clearField(3);
  @$pb.TagNumber(3)
  RpcScriptPublicKey ensureScriptPublicKey() => $_ensure(1);

  @$pb.TagNumber(4)
  RpcOptionalTransactionOutputVerboseData get verboseData => $_getN(2);
  @$pb.TagNumber(4)
  set verboseData(RpcOptionalTransactionOutputVerboseData value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasVerboseData() => $_has(2);
  @$pb.TagNumber(4)
  void clearVerboseData() => $_clearField(4);
  @$pb.TagNumber(4)
  RpcOptionalTransactionOutputVerboseData ensureVerboseData() => $_ensure(2);

  @$pb.TagNumber(5)
  RpcNullableCovenantBinding get covenant => $_getN(3);
  @$pb.TagNumber(5)
  set covenant(RpcNullableCovenantBinding value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCovenant() => $_has(3);
  @$pb.TagNumber(5)
  void clearCovenant() => $_clearField(5);
  @$pb.TagNumber(5)
  RpcNullableCovenantBinding ensureCovenant() => $_ensure(3);
}

class RpcOptionalTransactionVerboseData extends $pb.GeneratedMessage {
  factory RpcOptionalTransactionVerboseData({
    $core.String? transactionId,
    $core.String? hash,
    $fixnum.Int64? computeMass,
    $core.String? blockHash,
    $fixnum.Int64? blockTime,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (hash != null) result.hash = hash;
    if (computeMass != null) result.computeMass = computeMass;
    if (blockHash != null) result.blockHash = blockHash;
    if (blockTime != null) result.blockTime = blockTime;
    return result;
  }

  RpcOptionalTransactionVerboseData._();

  factory RpcOptionalTransactionVerboseData.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransactionVerboseData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransactionVerboseData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId')
    ..aOS(3, _omitFieldNames ? '' : 'hash')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'computeMass', $pb.PbFieldType.OU6,
        protoName: 'computeMass', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'blockHash', protoName: 'blockHash')
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'blockTime', $pb.PbFieldType.OU6,
        protoName: 'blockTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionVerboseData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransactionVerboseData copyWith(
          void Function(RpcOptionalTransactionVerboseData) updates) =>
      super.copyWith((message) =>
              updates(message as RpcOptionalTransactionVerboseData))
          as RpcOptionalTransactionVerboseData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionVerboseData create() =>
      RpcOptionalTransactionVerboseData._();
  @$core.override
  RpcOptionalTransactionVerboseData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransactionVerboseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalTransactionVerboseData>(
          create);
  static RpcOptionalTransactionVerboseData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(2)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(2)
  void clearTransactionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hash => $_getSZ(1);
  @$pb.TagNumber(3)
  set hash($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(3)
  void clearHash() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get computeMass => $_getI64(2);
  @$pb.TagNumber(4)
  set computeMass($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasComputeMass() => $_has(2);
  @$pb.TagNumber(4)
  void clearComputeMass() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get blockHash => $_getSZ(3);
  @$pb.TagNumber(5)
  set blockHash($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasBlockHash() => $_has(3);
  @$pb.TagNumber(5)
  void clearBlockHash() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get blockTime => $_getI64(4);
  @$pb.TagNumber(6)
  set blockTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(6)
  $core.bool hasBlockTime() => $_has(4);
  @$pb.TagNumber(6)
  void clearBlockTime() => $_clearField(6);
}

class RpcOptionalTransaction extends $pb.GeneratedMessage {
  factory RpcOptionalTransaction({
    $core.int? version,
    $core.Iterable<RpcOptionalTransactionInput>? inputs,
    $core.Iterable<RpcOptionalTransactionOutput>? outputs,
    $fixnum.Int64? lockTime,
    $core.String? subnetworkId,
    $fixnum.Int64? gas,
    $core.String? payload,
    $fixnum.Int64? mass,
    RpcOptionalTransactionVerboseData? verboseData,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    if (lockTime != null) result.lockTime = lockTime;
    if (subnetworkId != null) result.subnetworkId = subnetworkId;
    if (gas != null) result.gas = gas;
    if (payload != null) result.payload = payload;
    if (mass != null) result.mass = mass;
    if (verboseData != null) result.verboseData = verboseData;
    return result;
  }

  RpcOptionalTransaction._();

  factory RpcOptionalTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcOptionalTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcOptionalTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aI(2, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..pPM<RpcOptionalTransactionInput>(3, _omitFieldNames ? '' : 'inputs',
        subBuilder: RpcOptionalTransactionInput.create)
    ..pPM<RpcOptionalTransactionOutput>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: RpcOptionalTransactionOutput.create)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU6,
        protoName: 'lockTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'subnetworkId', protoName: 'subnetworkId')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'gas', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'payload')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'mass', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RpcOptionalTransactionVerboseData>(
        10, _omitFieldNames ? '' : 'verboseData',
        protoName: 'verboseData',
        subBuilder: RpcOptionalTransactionVerboseData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcOptionalTransaction copyWith(
          void Function(RpcOptionalTransaction) updates) =>
      super.copyWith((message) => updates(message as RpcOptionalTransaction))
          as RpcOptionalTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransaction create() => RpcOptionalTransaction._();
  @$core.override
  RpcOptionalTransaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcOptionalTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcOptionalTransaction>(create);
  static RpcOptionalTransaction? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(2)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<RpcOptionalTransactionInput> get inputs => $_getList(1);

  @$pb.TagNumber(4)
  $pb.PbList<RpcOptionalTransactionOutput> get outputs => $_getList(2);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lockTime => $_getI64(3);
  @$pb.TagNumber(5)
  set lockTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(5)
  $core.bool hasLockTime() => $_has(3);
  @$pb.TagNumber(5)
  void clearLockTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get subnetworkId => $_getSZ(4);
  @$pb.TagNumber(6)
  set subnetworkId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasSubnetworkId() => $_has(4);
  @$pb.TagNumber(6)
  void clearSubnetworkId() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get gas => $_getI64(5);
  @$pb.TagNumber(7)
  set gas($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(7)
  $core.bool hasGas() => $_has(5);
  @$pb.TagNumber(7)
  void clearGas() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get payload => $_getSZ(6);
  @$pb.TagNumber(8)
  set payload($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasPayload() => $_has(6);
  @$pb.TagNumber(8)
  void clearPayload() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get mass => $_getI64(7);
  @$pb.TagNumber(9)
  set mass($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(9)
  $core.bool hasMass() => $_has(7);
  @$pb.TagNumber(9)
  void clearMass() => $_clearField(9);

  @$pb.TagNumber(10)
  RpcOptionalTransactionVerboseData get verboseData => $_getN(8);
  @$pb.TagNumber(10)
  set verboseData(RpcOptionalTransactionVerboseData value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasVerboseData() => $_has(8);
  @$pb.TagNumber(10)
  void clearVerboseData() => $_clearField(10);
  @$pb.TagNumber(10)
  RpcOptionalTransactionVerboseData ensureVerboseData() => $_ensure(8);
}

class RpcChainBlockAcceptedTransactions extends $pb.GeneratedMessage {
  factory RpcChainBlockAcceptedTransactions({
    RpcOptionalHeader? chainBlockHeader,
    $core.Iterable<RpcOptionalTransaction>? acceptedTransactions,
  }) {
    final result = create();
    if (chainBlockHeader != null) result.chainBlockHeader = chainBlockHeader;
    if (acceptedTransactions != null)
      result.acceptedTransactions.addAll(acceptedTransactions);
    return result;
  }

  RpcChainBlockAcceptedTransactions._();

  factory RpcChainBlockAcceptedTransactions.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RpcChainBlockAcceptedTransactions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RpcChainBlockAcceptedTransactions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcOptionalHeader>(2, _omitFieldNames ? '' : 'chainBlockHeader',
        protoName: 'chainBlockHeader', subBuilder: RpcOptionalHeader.create)
    ..pPM<RpcOptionalTransaction>(
        3, _omitFieldNames ? '' : 'acceptedTransactions',
        protoName: 'acceptedTransactions',
        subBuilder: RpcOptionalTransaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcChainBlockAcceptedTransactions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RpcChainBlockAcceptedTransactions copyWith(
          void Function(RpcChainBlockAcceptedTransactions) updates) =>
      super.copyWith((message) =>
              updates(message as RpcChainBlockAcceptedTransactions))
          as RpcChainBlockAcceptedTransactions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RpcChainBlockAcceptedTransactions create() =>
      RpcChainBlockAcceptedTransactions._();
  @$core.override
  RpcChainBlockAcceptedTransactions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RpcChainBlockAcceptedTransactions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcChainBlockAcceptedTransactions>(
          create);
  static RpcChainBlockAcceptedTransactions? _defaultInstance;

  @$pb.TagNumber(2)
  RpcOptionalHeader get chainBlockHeader => $_getN(0);
  @$pb.TagNumber(2)
  set chainBlockHeader(RpcOptionalHeader value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasChainBlockHeader() => $_has(0);
  @$pb.TagNumber(2)
  void clearChainBlockHeader() => $_clearField(2);
  @$pb.TagNumber(2)
  RpcOptionalHeader ensureChainBlockHeader() => $_ensure(0);

  @$pb.TagNumber(3)
  $pb.PbList<RpcOptionalTransaction> get acceptedTransactions => $_getList(1);
}

/// / GetVirtualChainFromBlockV2RequestMessage requests the virtual selected
/// / parent chain from some startHash to this kaspad's current virtual
class GetVirtualChainFromBlockV2RequestMessage extends $pb.GeneratedMessage {
  factory GetVirtualChainFromBlockV2RequestMessage({
    $core.String? startHash,
    RpcDataVerbosityLevel? dataVerbosityLevel,
    $fixnum.Int64? minConfirmationCount,
  }) {
    final result = create();
    if (startHash != null) result.startHash = startHash;
    if (dataVerbosityLevel != null)
      result.dataVerbosityLevel = dataVerbosityLevel;
    if (minConfirmationCount != null)
      result.minConfirmationCount = minConfirmationCount;
    return result;
  }

  GetVirtualChainFromBlockV2RequestMessage._();

  factory GetVirtualChainFromBlockV2RequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVirtualChainFromBlockV2RequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVirtualChainFromBlockV2RequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startHash', protoName: 'startHash')
    ..aE<RpcDataVerbosityLevel>(2, _omitFieldNames ? '' : 'dataVerbosityLevel',
        protoName: 'dataVerbosityLevel',
        enumValues: RpcDataVerbosityLevel.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'minConfirmationCount', $pb.PbFieldType.OU6,
        protoName: 'minConfirmationCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockV2RequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockV2RequestMessage copyWith(
          void Function(GetVirtualChainFromBlockV2RequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetVirtualChainFromBlockV2RequestMessage))
          as GetVirtualChainFromBlockV2RequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockV2RequestMessage create() =>
      GetVirtualChainFromBlockV2RequestMessage._();
  @$core.override
  GetVirtualChainFromBlockV2RequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockV2RequestMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetVirtualChainFromBlockV2RequestMessage>(create);
  static GetVirtualChainFromBlockV2RequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set startHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartHash() => $_clearField(1);

  @$pb.TagNumber(2)
  RpcDataVerbosityLevel get dataVerbosityLevel => $_getN(1);
  @$pb.TagNumber(2)
  set dataVerbosityLevel(RpcDataVerbosityLevel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDataVerbosityLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearDataVerbosityLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get minConfirmationCount => $_getI64(2);
  @$pb.TagNumber(3)
  set minConfirmationCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinConfirmationCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinConfirmationCount() => $_clearField(3);
}

class GetVirtualChainFromBlockV2ResponseMessage extends $pb.GeneratedMessage {
  factory GetVirtualChainFromBlockV2ResponseMessage({
    $core.Iterable<$core.String>? removedChainBlockHashes,
    $core.Iterable<$core.String>? addedChainBlockHashes,
    $core.Iterable<RpcChainBlockAcceptedTransactions>?
        chainBlockAcceptedTransactions,
    RPCError? error,
  }) {
    final result = create();
    if (removedChainBlockHashes != null)
      result.removedChainBlockHashes.addAll(removedChainBlockHashes);
    if (addedChainBlockHashes != null)
      result.addedChainBlockHashes.addAll(addedChainBlockHashes);
    if (chainBlockAcceptedTransactions != null)
      result.chainBlockAcceptedTransactions
          .addAll(chainBlockAcceptedTransactions);
    if (error != null) result.error = error;
    return result;
  }

  GetVirtualChainFromBlockV2ResponseMessage._();

  factory GetVirtualChainFromBlockV2ResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVirtualChainFromBlockV2ResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVirtualChainFromBlockV2ResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'removedChainBlockHashes',
        protoName: 'removedChainBlockHashes')
    ..pPS(2, _omitFieldNames ? '' : 'addedChainBlockHashes',
        protoName: 'addedChainBlockHashes')
    ..pPM<RpcChainBlockAcceptedTransactions>(
        3, _omitFieldNames ? '' : 'chainBlockAcceptedTransactions',
        protoName: 'chainBlockAcceptedTransactions',
        subBuilder: RpcChainBlockAcceptedTransactions.create)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockV2ResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVirtualChainFromBlockV2ResponseMessage copyWith(
          void Function(GetVirtualChainFromBlockV2ResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetVirtualChainFromBlockV2ResponseMessage))
          as GetVirtualChainFromBlockV2ResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockV2ResponseMessage create() =>
      GetVirtualChainFromBlockV2ResponseMessage._();
  @$core.override
  GetVirtualChainFromBlockV2ResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetVirtualChainFromBlockV2ResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetVirtualChainFromBlockV2ResponseMessage>(create);
  static GetVirtualChainFromBlockV2ResponseMessage? _defaultInstance;

  /// The chain blocks that were removed, in high-to-low order
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get removedChainBlockHashes => $_getList(0);

  /// The chain blocks that were added, in low-to-high order
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get addedChainBlockHashes => $_getList(1);

  /// Will be filled depending on the supplied RpcDataVerbosityLevel.
  @$pb.TagNumber(3)
  $pb.PbList<RpcChainBlockAcceptedTransactions>
      get chainBlockAcceptedTransactions => $_getList(2);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(3);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(3);
}

class GetCurrentBlockColorRequestMessage extends $pb.GeneratedMessage {
  factory GetCurrentBlockColorRequestMessage({
    $core.String? hash,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    return result;
  }

  GetCurrentBlockColorRequestMessage._();

  factory GetCurrentBlockColorRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentBlockColorRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentBlockColorRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentBlockColorRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentBlockColorRequestMessage copyWith(
          void Function(GetCurrentBlockColorRequestMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetCurrentBlockColorRequestMessage))
          as GetCurrentBlockColorRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentBlockColorRequestMessage create() =>
      GetCurrentBlockColorRequestMessage._();
  @$core.override
  GetCurrentBlockColorRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCurrentBlockColorRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentBlockColorRequestMessage>(
          create);
  static GetCurrentBlockColorRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);
}

class GetCurrentBlockColorResponseMessage extends $pb.GeneratedMessage {
  factory GetCurrentBlockColorResponseMessage({
    $core.bool? blue,
    RPCError? error,
  }) {
    final result = create();
    if (blue != null) result.blue = blue;
    if (error != null) result.error = error;
    return result;
  }

  GetCurrentBlockColorResponseMessage._();

  factory GetCurrentBlockColorResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentBlockColorResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentBlockColorResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'blue')
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentBlockColorResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentBlockColorResponseMessage copyWith(
          void Function(GetCurrentBlockColorResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetCurrentBlockColorResponseMessage))
          as GetCurrentBlockColorResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentBlockColorResponseMessage create() =>
      GetCurrentBlockColorResponseMessage._();
  @$core.override
  GetCurrentBlockColorResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCurrentBlockColorResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetCurrentBlockColorResponseMessage>(create);
  static GetCurrentBlockColorResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get blue => $_getBF(0);
  @$pb.TagNumber(1)
  set blue($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBlue() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlue() => $_clearField(1);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(1);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(1);
}

class GetBlockRewardInfoRequestMessage extends $pb.GeneratedMessage {
  factory GetBlockRewardInfoRequestMessage({
    $core.String? hash,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    return result;
  }

  GetBlockRewardInfoRequestMessage._();

  factory GetBlockRewardInfoRequestMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockRewardInfoRequestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockRewardInfoRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockRewardInfoRequestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockRewardInfoRequestMessage copyWith(
          void Function(GetBlockRewardInfoRequestMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GetBlockRewardInfoRequestMessage))
          as GetBlockRewardInfoRequestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockRewardInfoRequestMessage create() =>
      GetBlockRewardInfoRequestMessage._();
  @$core.override
  GetBlockRewardInfoRequestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockRewardInfoRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockRewardInfoRequestMessage>(
          create);
  static GetBlockRewardInfoRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);
}

class GetBlockRewardInfoResponseMessage extends $pb.GeneratedMessage {
  factory GetBlockRewardInfoResponseMessage({
    RpcBlockHeader? header,
    BlockColor? blockColor,
    $fixnum.Int64? confirmationCount,
    $core.String? mergingChainBlockHash,
    $fixnum.Int64? rewardAmount,
    RPCError? error,
  }) {
    final result = create();
    if (header != null) result.header = header;
    if (blockColor != null) result.blockColor = blockColor;
    if (confirmationCount != null) result.confirmationCount = confirmationCount;
    if (mergingChainBlockHash != null)
      result.mergingChainBlockHash = mergingChainBlockHash;
    if (rewardAmount != null) result.rewardAmount = rewardAmount;
    if (error != null) result.error = error;
    return result;
  }

  GetBlockRewardInfoResponseMessage._();

  factory GetBlockRewardInfoResponseMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlockRewardInfoResponseMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlockRewardInfoResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protowire'),
      createEmptyInstance: create)
    ..aOM<RpcBlockHeader>(1, _omitFieldNames ? '' : 'header',
        subBuilder: RpcBlockHeader.create)
    ..aE<BlockColor>(2, _omitFieldNames ? '' : 'blockColor',
        protoName: 'blockColor', enumValues: BlockColor.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'confirmationCount', $pb.PbFieldType.OU6,
        protoName: 'confirmationCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'mergingChainBlockHash',
        protoName: 'mergingChainBlockHash')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'rewardAmount', $pb.PbFieldType.OU6,
        protoName: 'rewardAmount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RPCError>(1000, _omitFieldNames ? '' : 'error',
        subBuilder: RPCError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockRewardInfoResponseMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlockRewardInfoResponseMessage copyWith(
          void Function(GetBlockRewardInfoResponseMessage) updates) =>
      super.copyWith((message) =>
              updates(message as GetBlockRewardInfoResponseMessage))
          as GetBlockRewardInfoResponseMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockRewardInfoResponseMessage create() =>
      GetBlockRewardInfoResponseMessage._();
  @$core.override
  GetBlockRewardInfoResponseMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlockRewardInfoResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlockRewardInfoResponseMessage>(
          create);
  static GetBlockRewardInfoResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RpcBlockHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(RpcBlockHeader value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => $_clearField(1);
  @$pb.TagNumber(1)
  RpcBlockHeader ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  BlockColor get blockColor => $_getN(1);
  @$pb.TagNumber(2)
  set blockColor(BlockColor value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBlockColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockColor() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get confirmationCount => $_getI64(2);
  @$pb.TagNumber(3)
  set confirmationCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasConfirmationCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfirmationCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mergingChainBlockHash => $_getSZ(3);
  @$pb.TagNumber(4)
  set mergingChainBlockHash($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMergingChainBlockHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearMergingChainBlockHash() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get rewardAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set rewardAmount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRewardAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRewardAmount() => $_clearField(5);

  @$pb.TagNumber(1000)
  RPCError get error => $_getN(5);
  @$pb.TagNumber(1000)
  set error(RPCError value) => $_setField(1000, value);
  @$pb.TagNumber(1000)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(1000)
  void clearError() => $_clearField(1000);
  @$pb.TagNumber(1000)
  RPCError ensureError() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
