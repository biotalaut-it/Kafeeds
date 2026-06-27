import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';

enum ModifyAction {
  noAction,
  output,
  input,
  computeBudget,
  sigOpCount,
  amountSpent,
  prevScriptPublicKey,
  sequence,
  payload,
  gas,
  subnetworkId,
}

class TestVector {
  final String name;
  final RawTransaction tx;
  final SigHashType hashType;
  final int inputIndex;
  final ModifyAction action;
  final int actionIndex;
  final String expectedHash;

  const TestVector({
    required this.name,
    required this.tx,
    required this.hashType,
    required this.inputIndex,
    this.action = .noAction,
    this.actionIndex = 0,
    required this.expectedHash,
  });
}

void main() {
  test('test signature hash', () {
    final prevTxId =
        "880eb9819a31821d9d2399e2f35e2433b72637e393d71ecc9b8d0250f49153c3";
    final scriptPubKey1 = ScriptPublicKey(
      version: 0,
      scriptPublicKey: hexToBytes(
        "208325613d2eeaf7176ac6c670b13c0043156c427438ed72d74b7800862ad884e8ac",
      ),
    );
    final scriptPubKey2 = ScriptPublicKey(
      version: 0,
      scriptPublicKey: hexToBytes(
        "20fcef4c106cf11135bbd70f02a726a92162d2fb8b22f0469126f800862ad884e8ac",
      ),
    );

    final address = Address.publicKey(prefix: .kaspa, publicKey: Uint8List(32));

    final nativeTx = RawTransaction(
      version: 0,
      inputs: [
        RawInput(
          address: address,
          previousOutpoint: Outpoint(transactionId: prevTxId, index: 0),
          signatureScript: Uint8List(0),
          sequence: .zero,
          sigOpCount: 0,
          utxoEntry: UtxoEntry(
            amount: .from(100),
            scriptPublicKey: scriptPubKey1,
            blockDaaScore: .zero,
            isCoinbase: false,
          ),
        ),
        RawInput(
          address: address,
          previousOutpoint: Outpoint(transactionId: prevTxId, index: 1),
          signatureScript: Uint8List(0),
          sequence: .one,
          sigOpCount: 0,
          utxoEntry: UtxoEntry(
            amount: .from(200),
            scriptPublicKey: scriptPubKey2,
            blockDaaScore: .zero,
            isCoinbase: false,
          ),
        ),
        RawInput(
          address: address,
          previousOutpoint: Outpoint(transactionId: prevTxId, index: 2),
          signatureScript: Uint8List(0),
          sequence: .from(2),
          sigOpCount: 0,
          utxoEntry: UtxoEntry(
            amount: .from(300),
            scriptPublicKey: scriptPubKey2,
            blockDaaScore: .zero,
            isCoinbase: false,
          ),
        ),
      ],
      outputs: [
        RawOutput(value: .from(300), scriptPublicKey: scriptPubKey2),
        RawOutput(value: .from(300), scriptPublicKey: scriptPubKey1),
      ],
      lockTime: .from(1615462089000),
      subnetworkId: kSubnetworkIdNative,
      gas: .zero,
      payload: Uint8List(0),
    );

    final nativeTxV1 = RawTransaction(
      version: 1,
      inputs: [
        RawInput(
          address: address,
          previousOutpoint: Outpoint(transactionId: prevTxId, index: 0),
          signatureScript: Uint8List(0),
          sequence: .zero,
          computeBudget: 11,
          utxoEntry: UtxoEntry(
            amount: .from(100),
            scriptPublicKey: scriptPubKey1,
            blockDaaScore: .zero,
            isCoinbase: false,
          ),
        ),
        RawInput(
          address: address,
          previousOutpoint: Outpoint(transactionId: prevTxId, index: 1),
          signatureScript: Uint8List(0),
          sequence: .from(1),
          computeBudget: 22,
          utxoEntry: UtxoEntry(
            amount: .from(200),
            scriptPublicKey: scriptPubKey2,
            blockDaaScore: .zero,
            isCoinbase: false,
          ),
        ),
        RawInput(
          address: address,
          previousOutpoint: Outpoint(transactionId: prevTxId, index: 2),
          signatureScript: Uint8List(0),
          sequence: .from(2),
          computeBudget: 33,
          utxoEntry: UtxoEntry(
            amount: .from(300),
            scriptPublicKey: scriptPubKey2,
            blockDaaScore: .zero,
            isCoinbase: false,
          ),
        ),
      ],
      outputs: [
        RawOutput(value: .from(300), scriptPublicKey: scriptPubKey2),
        RawOutput(value: .from(300), scriptPublicKey: scriptPubKey1),
      ],
      lockTime: .from(1615462089000),
      subnetworkId: kSubnetworkIdNative,
      gas: .zero,
      payload: Uint8List(0),
    );

    final subnetworkIdBytes = Uint8List.fromList([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ]);
    final payloadBytes = Uint8List.fromList([
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
    ]);
    final subnetworkTx = nativeTx.copyWith(
      subnetworkId: subnetworkIdBytes,
      gas: .from(250),
      payload: payloadBytes,
    );

    RawTransaction applyAction(
      RawTransaction tx,
      ModifyAction action,
      int actionIndex,
    ) {
      final inputs = tx.inputs.toList();
      final outputs = tx.outputs.toList();
      var newTx = tx;

      switch (action) {
        case .noAction:
          break;
        case .output:
          final oldOutput = outputs[actionIndex];
          outputs[actionIndex] = RawOutput(
            value: .from(100),
            scriptPublicKey: oldOutput.scriptPublicKey,
            covenant: oldOutput.covenant,
          );
          break;
        case .input:
          final oldInput = inputs[actionIndex];
          final oldOutpoint = oldInput.previousOutpoint;
          inputs[actionIndex] = oldInput.copyWith(
            previousOutpoint: Outpoint(
              transactionId: oldOutpoint.transactionId,
              index: 2,
            ),
          );
          break;
        case .computeBudget:
          inputs[actionIndex] = inputs[actionIndex].copyWith(sigOpCount: 0);
          break;
        case .sigOpCount:
          inputs[actionIndex] = inputs[actionIndex].copyWith(sigOpCount: 123);
          break;
        case .amountSpent:
          final oldUtxoEntry = inputs[actionIndex].utxoEntry;
          final newUtxoEntry = UtxoEntry(
            amount: .from(666),
            scriptPublicKey: oldUtxoEntry.scriptPublicKey,
            blockDaaScore: oldUtxoEntry.blockDaaScore,
            isCoinbase: oldUtxoEntry.isCoinbase,
          );
          inputs[actionIndex] = inputs[actionIndex].copyWith(
            utxoEntry: newUtxoEntry,
          );
          break;
        case .prevScriptPublicKey:
          final oldScriptPublicKey =
              inputs[actionIndex].utxoEntry.scriptPublicKey;
          final newScript = Uint8List.fromList([
            ...oldScriptPublicKey.scriptPublicKey,
            1,
            2,
            3,
          ]);
          final newScriptPublicKey = ScriptPublicKey(
            version: oldScriptPublicKey.version,
            scriptPublicKey: newScript,
          );
          final oldUtxoEntry = inputs[actionIndex].utxoEntry;
          final newUtxoEntry = UtxoEntry(
            amount: oldUtxoEntry.amount,
            scriptPublicKey: newScriptPublicKey,
            blockDaaScore: oldUtxoEntry.blockDaaScore,
            isCoinbase: oldUtxoEntry.isCoinbase,
          );
          inputs[actionIndex] = inputs[actionIndex].copyWith(
            utxoEntry: newUtxoEntry,
          );
          break;
        case .sequence:
          inputs[actionIndex] = inputs[actionIndex].copyWith(
            sequence: .from(12345),
          );
          break;
        case .payload:
          newTx = newTx.copyWith(
            payload: Uint8List.fromList([6, 6, 6, 4, 2, 0, 1, 3, 3, 7]),
          );
          break;
        case .gas:
          newTx = newTx.copyWith(gas: .from(1234));
          break;
        case .subnetworkId:
          newTx = newTx.copyWith(
            subnetworkId: Uint8List.fromList([
              6,
              6,
              6,
              4,
              2,
              0,
              1,
              3,
              3,
              7,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
            ]),
          );
          break;
      }

      return newTx.copyWith(inputs: inputs, outputs: outputs);
    }

    final testCases = [
      // SIG_HASH_ALL
      TestVector(
        name: "native-all-0",
        tx: nativeTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "03b7ac6927b2b67100734c3cc313ff8c2e8b3ce3e746d46dd660b706a916b1f5",
      ),
      TestVector(
        name: "native-all-0-modify-input-1",
        tx: nativeTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .input,
        actionIndex: 1,
        expectedHash:
            "a9f563d86c0ef19ec2e4f483901d202e90150580b6123c3d492e26e7965f488c",
      ),
      TestVector(
        name: "native-all-0-modify-compute-mass-1",
        tx: nativeTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .computeBudget,
        actionIndex: 1,
        expectedHash:
            "03b7ac6927b2b67100734c3cc313ff8c2e8b3ce3e746d46dd660b706a916b1f5",
      ),
      TestVector(
        name: "native-v1-all-0-modify-sigopcount-0",
        tx: nativeTxV1,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .sigOpCount,
        actionIndex: 0,
        expectedHash:
            "5b2657524be672e019897646b56da3d192b453d78ae5e6e5c07f029a69f5f075",
      ),
      TestVector(
        name: "native-v1-all-0-modify-sigopcount-1",
        tx: nativeTxV1,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .sigOpCount,
        actionIndex: 1,
        expectedHash:
            "5b2657524be672e019897646b56da3d192b453d78ae5e6e5c07f029a69f5f075",
      ),
      TestVector(
        name: "native-v1-all-0-modify-compute-budget-0",
        tx: nativeTxV1,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .computeBudget,
        actionIndex: 0,
        expectedHash:
            "5b2657524be672e019897646b56da3d192b453d78ae5e6e5c07f029a69f5f075",
      ),
      TestVector(
        name: "native-v1-all-0-modify-compute-budget-1",
        tx: nativeTxV1,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .computeBudget,
        actionIndex: 1,
        expectedHash:
            "5b2657524be672e019897646b56da3d192b453d78ae5e6e5c07f029a69f5f075",
      ),
      TestVector(
        name: "native-all-0-modify-output-1",
        tx: nativeTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .output,
        actionIndex: 1,
        expectedHash:
            "aad2b61bd2405dfcf7294fc2be85f325694f02dda22d0af30381cb50d8295e0a",
      ),
      TestVector(
        name: "native-all-0-modify-sequence-1",
        tx: nativeTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .sequence,
        actionIndex: 1,
        expectedHash:
            "0818bd0a3703638d4f01014c92cf866a8903cab36df2fa2506dc0d06b94295e8",
      ),

      // SIG_HASH_ALL_ANYONE_CAN_PAY
      TestVector(
        name: "native-all-anyonecanpay-0",
        tx: nativeTx,
        hashType: SigHashType.sigHashAll | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "24821e466e53ff8e5fa93257cb17bb06131a48be4ef282e87f59d2bdc9afebc2",
      ),
      TestVector(
        name: "native-all-anyonecanpay-0-modify-input-0",
        tx: nativeTx,
        hashType: SigHashType.sigHashAll | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .input,
        actionIndex: 0,
        expectedHash:
            "d09cb639f335ee69ac71f2ad43fd9e59052d38a7d0638de4cf989346588a7c38",
      ),
      TestVector(
        name: "native-all-anyonecanpay-0-modify-input-1",
        tx: nativeTx,
        hashType: SigHashType.sigHashAll | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .input,
        actionIndex: 1,
        expectedHash:
            "24821e466e53ff8e5fa93257cb17bb06131a48be4ef282e87f59d2bdc9afebc2",
      ),
      TestVector(
        name: "native-all-anyonecanpay-0-modify-sequence",
        tx: nativeTx,
        hashType: SigHashType.sigHashAll | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .sequence,
        actionIndex: 1,
        expectedHash:
            "24821e466e53ff8e5fa93257cb17bb06131a48be4ef282e87f59d2bdc9afebc2",
      ),

      // SIG_HASH_NONE
      TestVector(
        name: "native-none-0",
        tx: nativeTx,
        hashType: .sigHashNone,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "38ce4bc93cf9116d2e377b33ff8449c665b7b5e2f2e65303c543b9afdaa4bbba",
      ),
      TestVector(
        name: "native-none-0-modify-output-1",
        tx: nativeTx,
        hashType: .sigHashNone,
        inputIndex: 0,
        action: .output,
        actionIndex: 1,
        expectedHash:
            "38ce4bc93cf9116d2e377b33ff8449c665b7b5e2f2e65303c543b9afdaa4bbba",
      ),
      TestVector(
        name: "native-none-0-modify-sequence-0",
        tx: nativeTx,
        hashType: .sigHashNone,
        inputIndex: 0,
        action: .sequence,
        actionIndex: 0,
        expectedHash:
            "d9efdd5edaa0d3fd0133ee3ab731d8c20e0a1b9f3c0581601ae2075db1109268",
      ),
      TestVector(
        name: "native-none-0-modify-sequence-1",
        tx: nativeTx,
        hashType: .sigHashNone,
        inputIndex: 0,
        action: .sequence,
        actionIndex: 1,
        expectedHash:
            "38ce4bc93cf9116d2e377b33ff8449c665b7b5e2f2e65303c543b9afdaa4bbba",
      ),

      // SIG_HASH_NONE_ANYONE_CAN_PAY
      TestVector(
        name: "native-none-anyonecanpay-0",
        tx: nativeTx,
        hashType: SigHashType.sigHashNone | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "06aa9f4239491e07bb2b6bda6b0657b921aeae51e193d2c5bf9e81439cfeafa0",
      ),
      TestVector(
        name: "native-none-anyonecanpay-0-modify-amount-spent",
        tx: nativeTx,
        hashType: SigHashType.sigHashNone | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .amountSpent,
        actionIndex: 0,
        expectedHash:
            "f07f45f3634d3ea8c0f2cb676f56e20993edf9be07a83bf0dfdb3debcf1441bf",
      ),
      TestVector(
        name: "native-none-anyonecanpay-0-modify-script-public-key",
        tx: nativeTx,
        hashType: SigHashType.sigHashNone | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .prevScriptPublicKey,
        actionIndex: 0,
        expectedHash:
            "20a525c54dc33b2a61201f05233c086dbe8e06e9515775181ed96550b4f2d714",
      ),

      // SIG_HASH_SINGLE
      TestVector(
        name: "native-single-0",
        tx: nativeTx,
        hashType: .sigHashSingle,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "44a0b407ff7b239d447743dd503f7ad23db5b2ee4d25279bd3dffaf6b474e005",
      ),
      TestVector(
        name: "native-single-0-modify-output-1",
        tx: nativeTx,
        hashType: .sigHashSingle,
        inputIndex: 0,
        action: .output,
        actionIndex: 1,
        expectedHash:
            "44a0b407ff7b239d447743dd503f7ad23db5b2ee4d25279bd3dffaf6b474e005",
      ),
      TestVector(
        name: "native-single-0-modify-sequence-0",
        tx: nativeTx,
        hashType: .sigHashSingle,
        inputIndex: 0,
        action: .sequence,
        actionIndex: 0,
        expectedHash:
            "83796d22879718eee1165d4aace667bb6778075dab579c32c57be945f466a451",
      ),
      TestVector(
        name: "native-single-0-modify-sequence-1",
        tx: nativeTx,
        hashType: .sigHashSingle,
        inputIndex: 0,
        action: .sequence,
        actionIndex: 1,
        expectedHash:
            "44a0b407ff7b239d447743dd503f7ad23db5b2ee4d25279bd3dffaf6b474e005",
      ),
      TestVector(
        name: "native-single-2-no-corresponding-output",
        tx: nativeTx,
        hashType: .sigHashSingle,
        inputIndex: 2,
        action: .noAction,
        expectedHash:
            "022ad967192f39d8d5895d243e025ec14cc7a79708c5e364894d4eff3cecb1b0",
      ),
      TestVector(
        name: "native-single-2-no-corresponding-output-modify-output-1",
        tx: nativeTx,
        hashType: .sigHashSingle,
        inputIndex: 2,
        action: .output,
        actionIndex: 1,
        expectedHash:
            "022ad967192f39d8d5895d243e025ec14cc7a79708c5e364894d4eff3cecb1b0",
      ),

      // SIG_HASH_SINGLE_ANYONE_CAN_PAY
      TestVector(
        name: "native-single-anyonecanpay-0",
        tx: nativeTx,
        hashType: SigHashType.sigHashSingle | .sigHashAnyOneCanPay,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "43b20aba775050cf9ba8d5e48fc7ed2dc6c071d23f30382aea58b7c59cfb8ed7",
      ),
      TestVector(
        name: "native-single-anyonecanpay-2-no-corresponding-output",
        tx: nativeTx,
        hashType: SigHashType.sigHashSingle | .sigHashAnyOneCanPay,
        inputIndex: 2,
        action: .noAction,
        expectedHash:
            "846689131fb08b77f83af1d3901076732ef09d3f8fdff945be89aa4300562e5f",
      ),
      TestVector(
        name: "native-all-0-modify-payload",
        tx: nativeTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .payload,
        expectedHash:
            "72ea6c2871e0f44499f1c2b556f265d9424bfea67cca9cb343b4b040ead65525",
      ),

      // subnetwork transaction
      TestVector(
        name: "subnetwork-all-0",
        tx: subnetworkTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .noAction,
        expectedHash:
            "b2f421c933eb7e1a91f1d9e1efa3f120fe419326c0dbac487752189522550e0c",
      ),
      TestVector(
        name: "subnetwork-all-modify-payload",
        tx: subnetworkTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .payload,
        expectedHash:
            "12ab63b9aea3d58db339245a9b6e9cb6075b2253615ce0fb18104d28de4435a1",
      ),
      TestVector(
        name: "subnetwork-all-modify-gas",
        tx: subnetworkTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .gas,
        expectedHash:
            "2501edfc0068d591160c4bd98646c6e6892cdc051182a8be3ccd6d67f104fd17",
      ),
      TestVector(
        name: "subnetwork-all-subnetwork-id",
        tx: subnetworkTx,
        hashType: .sigHashAll,
        inputIndex: 0,
        action: .subnetworkId,
        expectedHash:
            "a5d1230ede0dfcfd522e04123a7bcd721462fed1d3a87352031a4f6e3c4389b6",
      ),
    ];

    for (final testCase in testCases) {
      final modifiedTx = applyAction(
        testCase.tx,
        testCase.action,
        testCase.actionIndex,
      );
      final reusedValues = SigHashReusedValues();

      final actualHashBytes = getSchnorrSignatureHash(
        tx: modifiedTx,
        inputIndex: testCase.inputIndex,
        hashType: testCase.hashType,
        reusedValues: reusedValues,
      );
      final actualHash = bytesToHex(actualHashBytes);

      expect(
        actualHash,
        testCase.expectedHash,
        reason: 'Test ${testCase.name} failed',
      );
    }
  });
}
