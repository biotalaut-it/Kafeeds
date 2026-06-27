import 'dart:collection';

import '../types.dart';
import '../utils.dart';
import 'mass_calculator.dart';
import 'txscript.dart';

BigInt _min(BigInt a, BigInt b) => a < b ? a : b;
BigInt _max(BigInt a, BigInt b) => a > b ? a : b;

typedef Payment = (Address address, BigInt amount);

class TxBuilder {
  final List<Utxo> utxos;
  final Address changeAddress;
  final Uint8List? payload;
  final BigInt feeRate;
  final BigInt minFee;
  final MassCalculator massCalculator;

  List<Utxo> _selectedUtxos = <Utxo>[];
  List<Utxo> get selectedUtxos => UnmodifiableListView(_selectedUtxos);

  BigInt _amount = .zero;
  BigInt get amount => _amount;

  BigInt _change = .zero;
  BigInt get change => _change;

  BigInt _mass = .zero;
  BigInt get mass => _mass;

  TxBuilder({
    required this.utxos,
    required this.changeAddress,
    this.payload,
    required this.feeRate,
    required this.minFee,
    MassCalculator? massCalculator,
  }) : massCalculator = massCalculator ?? .defaultCalculator;

  RawTransaction createTx({
    required Address address,
    required BigInt amount,
    List<Utxo>? selectedUtxos,
  }) {
    if (selectedUtxos case final selectedUtxos? when selectedUtxos.isNotEmpty) {
      _selectedUtxos = selectedUtxos
          .take(kMaxInputsPerTransaction)
          .toList(growable: false);
    } else {
      _selectedUtxos = _selectUtxos(amount: amount);
    }

    return _createTxForSelectedUtxos(address: address, amount: amount);
  }

  RawTransaction createCompoundTx() {
    _selectedUtxos = utxos
        .take(kMaxInputsPerTransaction)
        .toList(growable: false);

    return _createCompoundTx();
  }

  late final BigInt _available = _selectedUtxos
      .map((u) => u.utxoEntry.amount)
      .fold(.zero, (t, a) => t + a);

  late final _maxFee = _max(
    minFee,
    kMaximumStandardTransactionMass * feeRate,
  );

  BigInt _minChangeFor(BigInt amount) => _min(kMinChangeTarget, amount ~/ .two);

  bool _isValidChange(BigInt change, BigInt amount) =>
      change >= _minChangeFor(amount) && !massCalculator.isDust(change);

  (BigInt, bool) _computeFeeFor({
    required BigInt amount,
    bool allowChange = true,
  }) {
    BigInt computedFee = _maxFee;
    bool hasChange = allowChange;

    final kMaxSteps = 7;
    int step = 0;
    do {
      final required = amount + computedFee;
      final change = _available - required;

      hasChange = allowChange && _isValidChange(change, amount);

      final tx = _createRawTx(
        payments: [
          // use change address as placeholder
          (changeAddress, amount),
          if (hasChange) (changeAddress, change),
        ],
      );

      final mass = massCalculator.calcTxOverallMass(tx: tx);

      if (mass > kMaximumStandardTransactionMass) {
        if (hasChange && change < kMinChangeTarget) {
          // try without change
          return _computeFeeFor(amount: amount, allowChange: false);
        }

        throw Exception('Transaction mass too large');
      }

      final newFee = _max(minFee, mass * feeRate);
      if (newFee == computedFee) break;
      computedFee = newFee;
    } while (step++ < kMaxSteps);

    return (computedFee, hasChange);
  }

  RawTransaction _createCompoundTx() {
    final available = _available;
    final (fee, _) = _computeFeeFor(amount: available, allowChange: false);

    final target = available - fee;
    if (target <= .zero) {
      throw Exception('Not enough funds');
    }

    final tx = _createRawTx(
      payments: [
        (changeAddress, target),
      ],
    );

    _amount = target;
    _mass = massCalculator.calcTxOverallMass(tx: tx);
    _change = .zero;

    return tx;
  }

  RawTransaction _createTxForSelectedUtxos({
    required Address address,
    required BigInt amount,
  }) {
    final (fee, hasChange) = _computeFeeFor(amount: amount);

    final change = _available - amount - fee;

    if (change < .zero) {
      throw Exception('Not enough funds');
    }

    final tx = _createRawTx(
      payments: [
        (address, amount),
        if (hasChange) (changeAddress, change),
      ],
    );

    _amount = amount;
    _change = hasChange ? change : .zero;
    _mass = massCalculator.calcTxOverallMass(tx: tx);

    return tx;
  }

  RawTransaction _createRawTx({
    required List<Payment> payments,
  }) {
    final inputs = _selectedUtxos.map((utxo) {
      return RawInput(
        address: .decodeAddress(utxo.address),
        previousOutpoint: utxo.outpoint,
        signatureScript: Uint8List(64 + 2),
        sequence: .zero,
        sigOpCount: 1,
        utxoEntry: utxo.utxoEntry,
      );
    });

    final outputs = payments.map((e) {
      return RawOutput(
        value: e.$2,
        scriptPublicKey: payToAddressScript(e.$1),
      );
    });

    final tx = RawTransaction(
      version: 0,
      inputs: inputs.toList(growable: false),
      outputs: outputs.toList(growable: false),
      lockTime: .zero,
      subnetworkId: kSubnetworkIdNative,
      gas: .zero,
      payload: payload,
    );

    return tx;
  }

  List<Utxo> _selectUtxos({required BigInt amount}) {
    final minChange = _minChangeFor(amount);
    final target = amount + minChange + _maxFee;

    final selectedUtxos = <Utxo>[];
    BigInt available = .zero;

    for (final utxo in utxos) {
      selectedUtxos.add(utxo);
      available += utxo.utxoEntry.amount;

      final count = selectedUtxos.length;
      if ((available >= target && count > 1) ||
          count == kMaxInputsPerTransaction) {
        break;
      }
    }

    return selectedUtxos;
  }
}
