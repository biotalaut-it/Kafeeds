import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../transaction/types.dart';
import '../utils.dart';
import 'address.dart';
import 'transaction.dart';

part 'raw_transaction.freezed.dart';

@freezed
sealed class RawInput with _$RawInput {
  const RawInput._();
  const factory RawInput({
    required Address address,
    required Outpoint previousOutpoint,
    required Uint8List signatureScript,
    /*uint64*/ required Int64 sequence,
    /*byte*/ required int sigOpCount,
    required UtxoEntry utxoEntry,
  }) = _RawInput;
}

@freezed
sealed class RawOutput with _$RawOutput {
  const RawOutput._();
  const factory RawOutput({
    /*uint64*/ required Int64 value,
    required ScriptPublicKey scriptPublicKey,
  }) = _RawOutput;
}

@freezed
sealed class RawTransaction with _$RawTransaction {
  const RawTransaction._();
  const factory RawTransaction({
    /*uint16*/ required int version,
    required List<RawInput> inputs,
    required List<RawOutput> outputs,
    /*uint64*/ required Int64 lockTime,
    /*byte[20]*/ required Uint8List subnetworkId,
    /*uint64*/ required Int64 gas,
    Uint8List? payload,
    /*uint64*/ Int64? fee,
    /*uint64*/ Int64? mass,
    Uint8List? id,
  }) = _Transaction;

  bool get isCoinbase => subnetworkId.hex == kSubnetworkIdCoinbaseHex;
}
