import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.dart';
import 'transaction.dart';

part 'raw_transaction.freezed.dart';

@freezed
sealed class CovenantBinding with _$CovenantBinding {
  const factory CovenantBinding({
    /*uint16*/ required int authorizingInput,
    required Uint8List covenantId,
  }) = _CovenantBinding;
}

@freezed
sealed class RawInput with _$RawInput {
  const RawInput._();
  const factory RawInput({
    required Address address,
    required Outpoint previousOutpoint,
    required Uint8List signatureScript,
    /*uint64*/ required BigInt sequence,
    /*byte*/ @Default(0) int sigOpCount,
    /*uint16*/ @Default(0) int computeBudget,
    required UtxoEntry utxoEntry,
  }) = _RawInput;
}

@freezed
sealed class RawOutput with _$RawOutput {
  const RawOutput._();
  const factory RawOutput({
    /*uint64*/ required BigInt value,
    required ScriptPublicKey scriptPublicKey,
    CovenantBinding? covenant,
  }) = _RawOutput;
}

@freezed
sealed class RawTransaction with _$RawTransaction {
  const RawTransaction._();
  const factory RawTransaction({
    /*uint16*/ required int version,
    required List<RawInput> inputs,
    required List<RawOutput> outputs,
    /*uint64*/ required BigInt lockTime,
    /*byte[20]*/ required Uint8List subnetworkId,
    /*uint64*/ required BigInt gas,
    Uint8List? payload,
  }) = _Transaction;

  BigInt get fee =>
      inputs.fold<BigInt>(.zero, (t, i) => t + i.utxoEntry.amount) -
      outputs.fold<BigInt>(.zero, (t, o) => t + o.value);
}
