import 'dart:typed_data';

import 'package:pointycastle/digests/blake2b.dart';

import '../types.dart';
import '../utils.dart';

const kTransactionHashDomain = 'TransactionHash';
const kTransactionIdDomain = 'TransactionID';
const kTransactionSigningDomain = 'TransactionSigningHash';
const kPersonalMessageSigningDomain = 'PersonalMessageSigningHash';

const kSigHashAll = 1;
const kSigHashNone = 1 << 1;
const kSigHashSingle = 1 << 2;
const kSigHashAnyOneCanPay = 1 << 7;

extension type const SigHashType._(int raw) {
  static const sigHashAll = SigHashType._(kSigHashAll);
  static const sigHashNone = SigHashType._(kSigHashNone);
  static const sigHashSingle = SigHashType._(kSigHashSingle);
  static const sigHashAnyOneCanPay = SigHashType._(kSigHashAnyOneCanPay);

  static const allowedValues = <int>{
    kSigHashAll,
    kSigHashNone,
    kSigHashSingle,
    kSigHashAll | kSigHashAnyOneCanPay,
    kSigHashNone | kSigHashAnyOneCanPay,
    kSigHashSingle | kSigHashAnyOneCanPay,
  };

  static SigHashType? tryRaw(int raw) =>
      allowedValues.contains(raw) ? ._(raw) : null;

  static const _sigHashMask = 0x07;

  bool get isSigHashAll => raw & _sigHashMask == kSigHashAll;
  bool get isSigHashNone => raw & _sigHashMask == kSigHashNone;
  bool get isSigHashSingle => raw & _sigHashMask == kSigHashSingle;
  bool get isSigHashAnyOneCanPay =>
      raw & kSigHashAnyOneCanPay == kSigHashAnyOneCanPay;

  SigHashType operator |(SigHashType other) => .tryRaw(raw | other.raw) ?? this;

  static SigHashType fromJson(int json) => .tryRaw(json) ?? .sigHashAll;
  int toJson() => raw;
}

class SigHashReusedValues {
  Uint8List? previousOutputsHash;
  Uint8List? sequencesHash;
  Uint8List? sigOpCountsHash;
  Uint8List? outputsHash;
  Uint8List? payloadHash;

  SigHashReusedValues();
}

Uint8List _blake2bHash(Uint8List data, {required String domain}) {
  final blake2b = Blake2bDigest(
    digestSize: kDomainHashSize,
    key: stringToBytesUtf8(domain),
  );
  final hash = blake2b.process(data);

  return hash;
}

Uint8List _getUint16(int value) {
  final data = ByteData(2);
  data.setUint16(0, value, .little);
  return data.buffer.asUint8List();
}

Uint8List _getUint32(int value) {
  final data = ByteData(4);
  data.setUint32(0, value, .little);
  return data.buffer.asUint8List();
}

Uint8List _getUint64(int value) {
  final data = ByteData(8);
  data.setUint64(0, value, .little);
  return data.buffer.asUint8List();
}

void _addOutpoint(Outpoint outpoint, BytesBuilder builder) {
  builder.add(hexToBytes(outpoint.transactionId));
  builder.add(_getUint32(outpoint.index));
}

void _addScriptPublicKey(
  ScriptPublicKey scriptPublicKey,
  BytesBuilder builder,
) {
  builder.add(_getUint16(scriptPublicKey.version));
  final script = scriptPublicKey.scriptPublicKey;
  builder.add(_getUint64(script.length));
  builder.add(script);
}

void _addOutput(RawOutput output, int txVersion, BytesBuilder builder) {
  // TODO - convert BigInt to bytes with fixed padding
  builder.add(output.value.toInt64().toBytes());
  _addScriptPublicKey(output.scriptPublicKey, builder);
  if (txVersion >= 1) {
    builder.addByte(output.covenant != null ? 1 : 0);
    if (output.covenant case final covenant?) {
      builder.add(_getUint16(covenant.authorizingInput));
      builder.add(covenant.covenantId);
    }
  }
}

Uint8List _getPreviousOutputsHash({
  required RawTransaction tx,
  required SigHashType hashType,
  required SigHashReusedValues reusedValues,
}) {
  if (hashType.isSigHashAnyOneCanPay) {
    return Uint8List(kDomainHashSize);
  }

  if (reusedValues.previousOutputsHash case final hash?) {
    return hash;
  }

  final builder = BytesBuilder();
  for (final txInput in tx.inputs) {
    _addOutpoint(txInput.previousOutpoint, builder);
  }

  final hash = _blake2bHash(
    builder.takeBytes(),
    domain: kTransactionSigningDomain,
  );

  reusedValues.previousOutputsHash = hash;

  return hash;
}

Uint8List _getSequencesHash({
  required RawTransaction tx,
  required SigHashType hashType,
  required SigHashReusedValues reusedValues,
}) {
  if (hashType.isSigHashSingle ||
      hashType.isSigHashAnyOneCanPay ||
      hashType.isSigHashNone) {
    return Uint8List(kDomainHashSize);
  }

  if (reusedValues.sequencesHash case final hash?) {
    return hash;
  }

  final builder = BytesBuilder();
  for (final txInput in tx.inputs) {
    builder.add(txInput.sequence.toInt64().toBytes());
  }

  final hash = _blake2bHash(
    builder.takeBytes(),
    domain: kTransactionSigningDomain,
  );

  reusedValues.sequencesHash = hash;

  return hash;
}

Uint8List _getSigOpCountsHash({
  required RawTransaction tx,
  required SigHashType hashType,
  required SigHashReusedValues reusedValues,
}) {
  if (hashType.isSigHashAnyOneCanPay) {
    return Uint8List(kDomainHashSize);
  }

  if (reusedValues.sigOpCountsHash case final hash?) {
    return hash;
  }

  final builder = BytesBuilder();
  for (final txInput in tx.inputs) {
    builder.addByte(txInput.sigOpCount);
  }

  final hash = _blake2bHash(
    builder.takeBytes(),
    domain: kTransactionSigningDomain,
  );

  reusedValues.sigOpCountsHash = hash;

  return hash;
}

Uint8List _getOutputsHash({
  required RawTransaction tx,
  required int inputIndex,
  required SigHashType hashType,
  required SigHashReusedValues reusedValues,
}) {
  if (hashType.isSigHashNone) {
    return Uint8List(kDomainHashSize);
  }

  if (hashType.isSigHashSingle) {
    if (inputIndex >= tx.outputs.length) {
      return Uint8List(kDomainHashSize);
    }

    final builder = BytesBuilder();
    _addOutput(tx.outputs[inputIndex], tx.version, builder);

    final hash = _blake2bHash(
      builder.takeBytes(),
      domain: kTransactionSigningDomain,
    );
    return hash;
  }

  if (reusedValues.outputsHash case final hash?) {
    return hash;
  }

  final builder = BytesBuilder();
  for (final txOutput in tx.outputs) {
    _addOutput(txOutput, tx.version, builder);
  }

  final hash = _blake2bHash(
    builder.takeBytes(),
    domain: kTransactionSigningDomain,
  );

  reusedValues.outputsHash = hash;

  return hash;
}

Uint8List _getPayloadHash({
  required RawTransaction tx,
  required SigHashReusedValues reusedValues,
}) {
  final payload = tx.payload ?? Uint8List(0);

  if (tx.subnetworkId.hex == kSubnetworkIdNativeHex && payload.isEmpty) {
    return Uint8List(kDomainHashSize);
  }

  if (reusedValues.payloadHash case final hash?) {
    return hash;
  }

  final builder = BytesBuilder();
  builder.add(_getUint64(payload.length));
  builder.add(payload);

  final hash = _blake2bHash(
    builder.takeBytes(),
    domain: kTransactionSigningDomain,
  );

  reusedValues.payloadHash = hash;

  return hash;
}

Uint8List getSchnorrSignatureHash({
  required RawTransaction tx,
  required int inputIndex,
  required SigHashType hashType,
  required SigHashReusedValues reusedValues,
}) {
  final input = tx.inputs[inputIndex];
  final prevScriptPublicKey = input.utxoEntry.scriptPublicKey;

  final builder = BytesBuilder();

  // version
  final version = _getUint16(tx.version);
  builder.add(version);

  // previosOutputsHash
  final previousOutputsHash = _getPreviousOutputsHash(
    tx: tx,
    hashType: hashType,
    reusedValues: reusedValues,
  );
  builder.add(previousOutputsHash);

  // sequencesHash
  final sequencesHash = _getSequencesHash(
    tx: tx,
    hashType: hashType,
    reusedValues: reusedValues,
  );
  builder.add(sequencesHash);

  // sigOpCountsHash
  if (tx.version < 1) {
    final sigOpCountsHash = _getSigOpCountsHash(
      tx: tx,
      hashType: hashType,
      reusedValues: reusedValues,
    );
    builder.add(sigOpCountsHash);
  }

  // hashOutpoint
  _addOutpoint(input.previousOutpoint, builder);

  // prevScriptPublicKey
  _addScriptPublicKey(prevScriptPublicKey, builder);

  // amount
  builder.add(input.utxoEntry.amount.toInt64().toBytes());

  // sequence
  builder.add(input.sequence.toInt64().toBytes());

  // sigOpCount
  if (tx.version < 1) {
    builder.addByte(input.sigOpCount);
  }

  // outputsHash
  final outputsHash = _getOutputsHash(
    tx: tx,
    inputIndex: inputIndex,
    hashType: hashType,
    reusedValues: reusedValues,
  );
  builder.add(outputsHash);

  // lockTime
  builder.add(tx.lockTime.toInt64().toBytes());

  // subnetworkId
  builder.add(tx.subnetworkId);

  // gas
  builder.add(tx.gas.toInt64().toBytes());

  // payloadHash
  final payloadHash = _getPayloadHash(tx: tx, reusedValues: reusedValues);
  builder.add(payloadHash);

  // hashType
  builder.addByte(hashType.raw);

  final hash = _blake2bHash(
    builder.takeBytes(),
    domain: kTransactionSigningDomain,
  );

  return hash;
}

Uint8List hashPersonalMessage(String message) => _blake2bHash(
  stringToBytesUtf8(message),
  domain: kPersonalMessageSigningDomain,
);
