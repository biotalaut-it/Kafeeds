import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';

void main() {
  RawTransaction generateTxFromAmounts(
    Iterable<BigInt> ins,
    Iterable<BigInt> outs,
  ) {
    final scriptPublicKey = ScriptPublicKey(
      scriptPublicKey: Uint8List(0),
      version: 0,
    );
    final prevTxId =
        '880eb9819a31821d9d2399e2f35e2433b72637e393d71ecc9b8d0250f49153c3';
    final address = Address.publicKey(prefix: .kaspa, publicKey: Uint8List(32));
    final tx = RawTransaction(
      version: 0,
      inputs: ins.indexed.map((indexed) {
        return RawInput(
          previousOutpoint: Outpoint(
            transactionId: prevTxId,
            index: indexed.$1,
          ),
          sequence: .zero,
          sigOpCount: 0,
          signatureScript: Uint8List(0),
          address: address,
          utxoEntry: UtxoEntry(
            amount: indexed.$2,
            isCoinbase: false,
            blockDaaScore: .zero,
            scriptPublicKey: scriptPublicKey,
          ),
        );
      }).toList(),
      outputs: outs.map((out) {
        return RawOutput(
          value: out,
          scriptPublicKey: scriptPublicKey,
        );
      }).toList(),
      lockTime: .from(1615462089000),
      subnetworkId: .fromList(
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      ),
      gas: .zero,
    );

    return tx;
  }

  group('Test Kip9 Beta', () {
    test('Test 2:2 transaction', () {
      final tx = generateTxFromAmounts(
        [100, 200].map(BigInt.from),
        [50, 250].map(BigInt.from),
      );
      final storageMassParameter = BigInt.from(10).pow(12);
      // Assert the formula: max( 0 , C·( |O|/H(O) - |I|/O(I) ) )

      final calculator = MassCalculator(
        massPerTxByte: 0,
        massPerScriptPubKeyByte: 0,
        massPerSigOp: 0,
        storageMassParameter: storageMassParameter,
      );
      final storageMass = calculator.calcTxStorageMass(tx: tx);
      expect(storageMass, BigInt.from(9000000000));
    });
    test('Test outputs equal to inputs', () {
      final tx = generateTxFromAmounts(
        [100, 200].map(BigInt.from),
        [100, 200].map(BigInt.from),
      );
      final storageMassParameter = BigInt.from(10).pow(12);
      // Assert the formula: max( 0 , C·( |O|/H(O) - |I|/O(I) ) )

      final calculator = MassCalculator(
        massPerTxByte: 0,
        massPerScriptPubKeyByte: 0,
        massPerSigOp: 0,
        storageMassParameter: storageMassParameter,
      );
      final storageMass = calculator.calcTxStorageMass(tx: tx);
      expect(storageMass, BigInt.zero);
    });

    test('Test mass storage one small output', () {
      final tx = generateTxFromAmounts(
        [100, 200].map(BigInt.from),
        [50].map(BigInt.from),
      );
      final storageMassParameter = BigInt.from(10).pow(12);
      // Assert the formula: max( 0 , C·( |O|/H(O) - |I|/O(I) ) )

      final calculator = MassCalculator(
        massPerTxByte: 0,
        massPerScriptPubKeyByte: 0,
        massPerSigOp: 0,
        storageMassParameter: storageMassParameter,
      );
      final storageMass = calculator.calcTxStorageMass(tx: tx);
      expect(storageMass, BigInt.from(5000000000));
    });
  });
}
