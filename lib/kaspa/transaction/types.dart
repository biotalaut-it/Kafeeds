import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils.dart';

part 'types.freezed.dart';

final kSompiPerKaspa = BigInt.from(100000000);
final kStorageMassParameter = kSompiPerKaspa * BigInt.from(10000);

final kMinChangeTarget = BigInt.from(20000000);
final kFeePerInput = BigInt.from(10000);
const kMaxInputsPerTransaction = 84;
final kMaximumStandardTransactionMass = BigInt.from(100000);
const kDomainHashSize = 32;
const kDomainSubnetworkIDSize = 20;

const kMaxTransactionVersion = 0;

final kSubnetworkIdNative = Uint8List(kDomainSubnetworkIDSize);
final kSubnetworkIdCoinbase = Uint8List(kDomainSubnetworkIDSize)..[0] = 1;
final kSubnetworkIdRegistry = Uint8List(kDomainSubnetworkIDSize)..[0] = 2;

final kSubnetworkIdNativeHex = kSubnetworkIdNative.hex;
final kSubnetworkIdCoinbaseHex = kSubnetworkIdCoinbase.hex;
final kSubnetworkIdRegistryHex = kSubnetworkIdRegistry.hex;

// UnacceptedDAAScore is used to for UTXOEntries that were created by transactions in the mempool, or otherwise
// not-yet-accepted transactions.
// Max Uint64 - 18446744073709551615
final kUnacceptedDAASccore = Int64(-1);

const kSigHashAll = 1;
const kSigHashNone = 1 << 1;
const kSigHashSingle = 1 << 2;
const kSigHashAnyOneCanPay = 1 << 7;

enum SigHashType {
  sigHashAll,
  sigHashNone,
  sigHashSingle,
  sigHashAnyOneCanPay;

  int get raw => switch (this) {
    .sigHashAll => kSigHashAll,
    .sigHashNone => kSigHashNone,
    .sigHashSingle => kSigHashSingle,
    .sigHashAnyOneCanPay => kSigHashAnyOneCanPay,
  };
}

@unfreezed
sealed class SighashReusedValues with _$SighashReusedValues {
  factory SighashReusedValues({
    Uint8List? previousOutputsHash,
    Uint8List? sequencesHash,
    Uint8List? sigOpCountsHash,
    Uint8List? outputsHash,
    Uint8List? payloadHash,
  }) = _SighashReusedValues;
}
