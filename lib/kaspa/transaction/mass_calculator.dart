import 'dart:math';

import '../types.dart';
import '../utils.dart';

//1 byte for OP_DATA_65 + 64 (length of signature) + 1 byte for sig hash type
const kSignatureSize = 1 + 64 + 1;

const kScriptVectorSize = 35;

final _oneK = BigInt.from(1_000);
final _kStandardOutputSizePlusInputSize = BigInt.from(
  8 + // value (u64)
      2 + // output.ScriptPublicKey.Version (u16)
      8 + // length of script public key (u64)
      kScriptVectorSize + //max script size as per SCRIPT_VECTOR_SIZE
      148,
);
final _kStandardOutputSizePlusInputSize3x =
    _kStandardOutputSizePlusInputSize * .from(3);

BigInt _max(BigInt a, BigInt b) => a > b ? a : b;

int _utxoPlurality(ScriptPublicKey spk, bool hasCovenantId) {
  const kUtxoConstStorage =
      32 + // outpoint::tx_id
      4 + // outpoint::index
      8 + // entry amount
      8 + // entry DAA score
      1 + // entry is coinbase
      2 + // entry spk version
      8; // entry spk len

  const kUtxoUnitSize = 100;

  int size = kUtxoConstStorage + spk.scriptPublicKey.length;
  if (hasCovenantId) {
    size += kDomainHashSize;
  }

  return (size / kUtxoUnitSize).ceil();
}

extension UtxoEntryPlurality on UtxoEntry {
  int get plurality => _utxoPlurality(scriptPublicKey, covenantId != null);
}

extension RawOutputPlurality on RawOutput {
  int get plurality => _utxoPlurality(scriptPublicKey, covenant != null);
}

class MassCalculator {
  final int massPerTxByte;
  final int massPerScriptPubKeyByte;
  final int massPerSigOp;
  final BigInt storageMassParameter;

  static final MassCalculator defaultCalculator = MassCalculator(
    massPerTxByte: 1,
    massPerScriptPubKeyByte: 10,
    massPerSigOp: 1000,
    storageMassParameter: kStorageMassParameter,
  );

  const MassCalculator({
    required this.massPerTxByte,
    required this.massPerScriptPubKeyByte,
    required this.massPerSigOp,
    required this.storageMassParameter,
  });

  bool isDust(BigInt value) {
    return (value * _oneK ~/ _kStandardOutputSizePlusInputSize3x) <
        kMinimumRelayTransactionFee;
  }

  BigInt calcTxOverallMass({
    required RawTransaction tx,
    int minSignatures = 1,
  }) {
    final computeMass = calcTxComputeMass(tx: tx, minSignatures: minSignatures);
    final storageMass = calcTxStorageMass(tx: tx);
    return _max(computeMass, storageMass);
  }

  BigInt calcTxStorageMass({
    required RawTransaction tx,
  }) {
    final smp = storageMassParameter;

    /*
        In KIP-0009 terms, the canonical formula is:
            max(0, C * (|O|/H(O) - |I|/A(I))).

        We first calculate the harmonic portion for outputs in a single pass,
        accumulating:
            1) outsPlurality = Σ p(o)
            2) harmonicOuts  = Σ [C * p(o)^2 / amount(o)]
    */
    int outsPlurality = 0;
    BigInt harmonicOuts = .zero;
    for (final o in tx.outputs) {
      outsPlurality += o.plurality;
      harmonicOuts += (smp * .from(o.plurality).pow(2)) ~/ o.value;
    }

    /*
        KIP-0009 defines a relaxed formula for the cases:
            |O| = 1  or  |O| <= |I| <= 2

        The relaxed formula is:
            max(0, C · (|O| / H(O) - |I| / H(I)))

        If |I| = 1, the harmonic and arithmetic approaches coincide, so the conditions can be expressed as:
            |O| = 1 or |I| = 1 or |O| = |I| = 2
    */
    final isRelaxed = () {
      if (outsPlurality == 1) {
        return true;
      } else if (tx.inputs.length > 2) {
        return false;
      } else {
        final insPlurality = tx.inputs
            .map((input) => input.utxoEntry.plurality)
            .fold(0, (t, p) => t + p);
        return insPlurality == 1 || (outsPlurality == 2 && insPlurality == 2);
      }
    }();

    if (isRelaxed) {
      // Each input i contributes C · p(i)^2 / amount(i)
      final harmonicIns = tx.inputs
          .map((i) => i.utxoEntry)
          .map((u) => (smp * .from(u.plurality).pow(2)) ~/ u.amount)
          .fold<BigInt>(.zero, (t, a) => t + a);

      // max(0, harmonic_outs - harmonic_ins)
      return _max(.zero, harmonicOuts - harmonicIns);
    }

    // Otherwise, we calculate the arithmetic portion for inputs:
    // (ins_plurality, sum_ins) =>  (Σ plurality, Σ amounts)
    int insPlurality = 0;
    BigInt sumIns = .zero;
    for (final i in tx.inputs) {
      final utxo = i.utxoEntry;
      insPlurality += utxo.plurality;
      sumIns += utxo.amount;
    }

    // mean_ins = (Σ amounts) / (Σ plurality)
    final meanIns = sumIns ~/ .from(insPlurality);

    // arithmetic_ins:  C · (|I| / A(I)) = |I| · (C / mean_ins)
    final arithmeticIns = BigInt.from(insPlurality) * (smp ~/ meanIns);

    // max(0, harmonic_outs - arithmetic_ins)
    return _max(.zero, harmonicOuts - arithmeticIns);
  }

  BigInt calcTxComputeMass({
    required RawTransaction tx,
    required int minSignatures,
  }) {
    final blankTx = _blankTxComputeMass();
    final payload = _payloadComputeMass(tx.payload?.length ?? 0);
    final outputs = _outputsComputeMass(tx.outputs);
    final inputs = _inputsComputeMass(tx.inputs);
    final signature = _signatureComputeMass(tx.inputs.length, minSignatures);

    return .from(blankTx + payload + outputs + inputs + signature);
  }

  int _blankTxComputeMass() => _blankTxSerializedByteSize() * massPerTxByte;

  int _payloadComputeMass(int payloadLength) {
    final kNormalizedTransientByteFactor = 2;
    return payloadLength * max(massPerTxByte, kNormalizedTransientByteFactor);
  }

  int _outputComputeMass(RawOutput output) =>
      massPerScriptPubKeyByte *
          (2 + output.scriptPublicKey.scriptPublicKey.length) +
      _txOutputSerializedByteSize(output) * massPerTxByte;

  int _outputsComputeMass(List<RawOutput> outputs) =>
      outputs.fold(0, (t, o) => t + _outputComputeMass(o));

  int _inputComputeMass(RawInput input) =>
      input.sigOpCount * massPerSigOp +
      _txInputSerializedByteSize(input) * massPerTxByte;

  int _inputsComputeMass(List<RawInput> inputs) =>
      inputs.fold(0, (t, i) => t + _inputComputeMass(i));

  int _signatureComputeMass(int noInputs, int minSignatures) {
    return kSignatureSize *
        massPerTxByte *
        max<int>(1, minSignatures) *
        noInputs;
  }

  int _outpointSerializedByteSize() {
    int size = 0;
    size += kDomainHashSize; // transaction id
    size += 4; // index
    return size;
  }

  int _txInputSerializedByteSize(RawInput input) {
    int size = 0;
    size += _outpointSerializedByteSize(); // previous outpoint
    size += 8; // signature script length
    size += input.signatureScript.length; // signature script
    size += 8; // sequence (uint64)
    return size;
  }

  int _txOutputSerializedByteSize(RawOutput output) {
    int size = 0;
    size += 8; // value (uint64)
    size += 2; // output.ScriptPublicKey.Version (uint 16)
    size += 8; // length of script public key (uint64)
    size += output.scriptPublicKey.scriptPublicKey.length;
    return size;
  }

  int _blankTxSerializedByteSize() {
    int size = 0;
    size += 2; // version
    size += 8; // number of inputs
    // ~ skip input size for blank tx
    size += 8; // number of outputs
    // ~ skip output size for blank tx
    size += 8; // lock time
    size += kDomainSubnetworkIDSize;
    size += 8; // gas (uint64)
    size += kDomainHashSize; // payload hash
    size += 8; // payload length (uint64)
    // ~ skip payload size for blank tx

    return size;
  }
}
