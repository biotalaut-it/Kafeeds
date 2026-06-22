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

import 'package:protobuf/protobuf.dart' as $pb;

class RpcNotifyCommand extends $pb.ProtobufEnum {
  static const RpcNotifyCommand NOTIFY_START =
      RpcNotifyCommand._(0, _omitEnumNames ? '' : 'NOTIFY_START');
  static const RpcNotifyCommand NOTIFY_STOP =
      RpcNotifyCommand._(1, _omitEnumNames ? '' : 'NOTIFY_STOP');

  static const $core.List<RpcNotifyCommand> values = <RpcNotifyCommand>[
    NOTIFY_START,
    NOTIFY_STOP,
  ];

  static final $core.List<RpcNotifyCommand?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static RpcNotifyCommand? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RpcNotifyCommand._(super.value, super.name);
}

class RpcDataVerbosityLevel extends $pb.ProtobufEnum {
  static const RpcDataVerbosityLevel NONE =
      RpcDataVerbosityLevel._(0, _omitEnumNames ? '' : 'NONE');
  static const RpcDataVerbosityLevel LOW =
      RpcDataVerbosityLevel._(1, _omitEnumNames ? '' : 'LOW');
  static const RpcDataVerbosityLevel HIGH =
      RpcDataVerbosityLevel._(2, _omitEnumNames ? '' : 'HIGH');
  static const RpcDataVerbosityLevel FULL =
      RpcDataVerbosityLevel._(3, _omitEnumNames ? '' : 'FULL');

  static const $core.List<RpcDataVerbosityLevel> values =
      <RpcDataVerbosityLevel>[
    NONE,
    LOW,
    HIGH,
    FULL,
  ];

  static final $core.List<RpcDataVerbosityLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RpcDataVerbosityLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RpcDataVerbosityLevel._(super.value, super.name);
}

class BlockColor extends $pb.ProtobufEnum {
  static const BlockColor UNKNOWN =
      BlockColor._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const BlockColor BLUE = BlockColor._(1, _omitEnumNames ? '' : 'BLUE');
  static const BlockColor RED = BlockColor._(2, _omitEnumNames ? '' : 'RED');

  static const $core.List<BlockColor> values = <BlockColor>[
    UNKNOWN,
    BLUE,
    RED,
  ];

  static final $core.List<BlockColor?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockColor? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockColor._(super.value, super.name);
}

class SubmitBlockResponseMessage_RejectReason extends $pb.ProtobufEnum {
  static const SubmitBlockResponseMessage_RejectReason NONE =
      SubmitBlockResponseMessage_RejectReason._(
          0, _omitEnumNames ? '' : 'NONE');
  static const SubmitBlockResponseMessage_RejectReason BLOCK_INVALID =
      SubmitBlockResponseMessage_RejectReason._(
          1, _omitEnumNames ? '' : 'BLOCK_INVALID');
  static const SubmitBlockResponseMessage_RejectReason IS_IN_IBD =
      SubmitBlockResponseMessage_RejectReason._(
          2, _omitEnumNames ? '' : 'IS_IN_IBD');

  static const $core.List<SubmitBlockResponseMessage_RejectReason> values =
      <SubmitBlockResponseMessage_RejectReason>[
    NONE,
    BLOCK_INVALID,
    IS_IN_IBD,
  ];

  static final $core.List<SubmitBlockResponseMessage_RejectReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SubmitBlockResponseMessage_RejectReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SubmitBlockResponseMessage_RejectReason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
