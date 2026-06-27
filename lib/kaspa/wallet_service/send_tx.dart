import 'package:freezed_annotation/freezed_annotation.dart';

import '../types.dart';

part 'send_tx.freezed.dart';

@freezed
sealed class SendTx with _$SendTx {
  const SendTx._();

  factory SendTx({
    required KaspaUri uri,
    required RawTransaction tx,
    required List<Utxo> utxos,
    @Default(false) bool userSelected,
    required Amount amount,
    required Amount change,
    required Address changeAddress,
    String? note,
    required BigInt mass,
  }) = _SendTx;

  Address get address => uri.address;

  Amount get fee => .raw(tx.fee);

  Uint8List? get payload => tx.payload;

  List<Utxo>? get userSelectedUtxos => userSelected ? utxos : null;

  bool get isCompoundTx =>
      tx.inputs.length > 1 &&
      tx.outputs.length == 1 &&
      address == changeAddress;
}
