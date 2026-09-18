import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../social/social_models.dart';
import '../wallet_signer/wallet_signer.dart';
import 'kns_api_client.dart';
import 'kns_inscription_engine.dart';

const knsDeveloperFeeAddress =
    'kaspa:qrsf98hqspu7xkn87zlzaz33jdq8hvjdny6zwk3xq785rm0wjjfasth3ek465';
final knsDeveloperFeeSompi = BigInt.from(10) * kSompiPerKaspa;
const knsProfileCommitSompi = 200000000;
const knsProfileRevealSompi = 100000000;
const knsRevealPriorityFeeSompi = 2000000;

class KnsProfileService {
  KnsProfileService(this.ref) : _api = KnsApiClient();

  final Ref ref;
  final KnsApiClient _api;

  Future<KnsProfileData?> loadOwnProfile() async {
    final address = ref.read(addressNotifierProvider).receiveAddress.address;
    final assets = await _api.assetsByOwner(address.toString());
    if (assets.isEmpty) return null;
    return _api.profile(assets.first.assetId);
  }

  Future<KafeedsProfile> publish({
    required KafeedsProfile current,
    XFile? avatar,
    XFile? banner,
    required String displayName,
    required String bio,
    required String location,
    required String website,
    required void Function(String) onProgress,
  }) async {
    if (avatar == null && banner == null) {
      return current.copyWith(
        displayName: displayName,
        bio: bio,
        location: location,
        website: website,
      );
    }

    final address = ref.read(addressNotifierProvider).receiveAddress.address;
    final assets = await _api.assetsByOwner(address.toString());
    if (assets.isEmpty)
      throw StateError('No KNS domain belongs to this wallet.');
    final asset = assets.first;
    final signer = ref.read(walletSignerProvider);
    final walletService = ref.read(walletServiceProvider);
    final rpc = ref.read(kaspaRpcProvider);
    final feeRate = ref.read(feeRateProvider);
    var utxos = ref.read(spendableUtxosProvider);
    final urls = <String, String>{};

    if (avatar != null) {
      onProgress('Uploading avatar ke KNS...');
      urls['avatarUrl'] = await _upload(
        asset.assetId,
        'avatar',
        avatar,
        signer,
        address,
      );
    }
    if (banner != null) {
      onProgress('Uploading banner ke KNS...');
      urls['bannerUrl'] = await _upload(
        asset.assetId,
        'banner',
        banner,
        signer,
        address,
      );
    }

    for (final entry in urls.entries) {
      onProgress('Mempublikasikan ${entry.key} ke KNS...');
      await _publishField(
        assetId: asset.assetId,
        key: entry.key,
        value: entry.value,
        address: address,
        signer: signer,
        walletService: walletService,
        rpc: rpc,
        feeRate: feeRate,
        utxos: utxos,
      );
      utxos = await _freshUtxos(address);
    }

    onProgress('Mengirim developer fee 10 KAS...');
    await _sendDeveloperFee(walletService, utxos, feeRate, address);

    final published = await _api.profile(asset.assetId);
    if (published == null ||
        (avatar != null && published.avatarUrl != urls['avatarUrl']) ||
        (banner != null && published.bannerUrl != urls['bannerUrl'])) {
      throw StateError('KNS profile verification failed.');
    }
    return current.copyWith(
      displayName: displayName,
      bio: bio,
      location: location,
      website: website,
      avatarUrl: published.avatarUrl ?? current.avatarUrl,
      coverUrl: published.bannerUrl ?? current.coverUrl,
    );
  }

  Future<String> _upload(
    String assetId,
    String type,
    XFile file,
    WalletSigner signer,
    Address address,
  ) async {
    final bytes = await _prepareUpload(file);
    final message = jsonEncode({'assetId': assetId, 'uploadType': type});
    for (final hash in <Uint8List Function(String)>[
      hashPersonalMessage,
      (value) => Uint8List.fromList(utf8.encode(value)),
      (value) => Uint8List.fromList(sha256Bytes(utf8.encode(value))),
    ]) {
      try {
        final signature = bytesToHex(await signer.sign(hash(message), address));
        return await _api.uploadImage(
          assetId: assetId,
          uploadType: type,
          bytes: bytes,
          signature: signature,
          signMessage: message,
        );
      } catch (_) {}
    }
    throw StateError('KNS image upload failed.');
  }

  Future<Uint8List> _prepareUpload(XFile file) async {
    final decoded = img.decodeImage(await file.readAsBytes());
    if (decoded == null) throw StateError('Unable to decode selected image.');
    final longest = decoded.width > decoded.height
        ? decoded.width
        : decoded.height;
    final scale = 1400 / longest;
    final resized = scale < 1
        ? img.copyResize(decoded, width: (decoded.width * scale).round())
        : decoded;
    return Uint8List.fromList(img.encodePng(resized));
  }

  Future<void> _publishField({
    required String assetId,
    required String key,
    required String value,
    required Address address,
    required WalletSigner signer,
    required WalletService walletService,
    required RpcService rpc,
    required int feeRate,
    required List<Utxo> utxos,
  }) async {
    final payload = KnsProfilePayload(
      assetId: assetId,
      key: key,
      value: value,
    ).toBytes();
    final compressedPublicKey = await signer.publicKey(address);
    final xOnlyPublicKey = compressedPublicKey.length == 33
        ? compressedPublicKey.sublist(1)
        : compressedPublicKey;
    final redeem = KnsInscriptionScript.build(
      xOnlyPublicKey,
      'kns',
      payload,
    );
    final commitAddress = Address.scriptHash(
      prefix: address.prefix,
      hash: KnsInscriptionScript.commitAddress(
        redeem,
        address.prefix.toString(),
      ),
    );
    final commitTx = walletService.createSendTx(
      toAddress: commitAddress,
      amount: .raw(BigInt.from(knsProfileCommitSompi)),
      spendableUtxos: utxos,
      feeRate: feeRate,
      changeAddress: address,
    );
    final commitId = await walletService.sendTransaction(commitTx.tx);
    final revealInput = Utxo(
      address: commitAddress.toString(),
      outpoint: Outpoint(transactionId: commitId, index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(knsProfileCommitSompi),
        scriptPublicKey: payToAddressScript(commitAddress),
        blockDaaScore: BigInt.zero,
        isCoinbase: false,
      ),
    );
    final feeEstimate = await rpc.getFeeEstimate();
    final revealFeeRate = (feeEstimate.normalBuckets.firstOrNull?.feerate ?? 100)
        .ceil();
    final available = BigInt.from(
      knsProfileCommitSompi - knsProfileRevealSompi,
    );
    final initialChange = available - BigInt.from(knsRevealPriorityFeeSompi);
    final tx = _revealTransaction(
      commitAddress: commitAddress,
      revealInput: revealInput,
      address: address,
      redeem: redeem,
      change: initialChange,
    );
    final estimatedFee =
        BigInt.from(
          MassCalculator.defaultCalculator.calcTxOverallMass(tx: tx).toInt() *
              revealFeeRate,
        ) +
        BigInt.from(knsRevealPriorityFeeSompi);
    final change = available - estimatedFee;
    if (change <= BigInt.zero)
      throw StateError('KNS reveal fee exceeds commit value.');
    final feeTx = _revealTransaction(
      commitAddress: commitAddress,
      revealInput: revealInput,
      address: address,
      redeem: redeem,
      change: change,
    );
    final hash = getSchnorrSignatureHash(
      tx: feeTx,
      inputIndex: 0,
      hashType: SigHashType.sigHashAll,
      reusedValues: SigHashReusedValues(),
    );
    final signature = await signer.sign(hash, address);
    final signedInput = feeTx.inputs.first.copyWith(
      signatureScript: Uint8List.fromList([
        signature.length + 1,
        ...signature,
        1,
        ...KnsInscriptionScript.pushRedeemScript(redeem),
      ]),
    );
    final revealId = await rpc.submitTransaction(
      feeTx.copyWith(inputs: [signedInput]),
      allowOrphan: false,
    );
    if (revealId.trim().isEmpty)
      throw StateError('KNS reveal returned no transaction id.');
  }

  RawTransaction _revealTransaction({
    required Address commitAddress,
    required Utxo revealInput,
    required Address address,
    required Uint8List redeem,
    required BigInt change,
  }) {
    final outputs = <RawOutput>[
      RawOutput(
        value: BigInt.from(knsProfileRevealSompi),
        scriptPublicKey: payToAddressScript(address),
      ),
    ];
    if (change > BigInt.zero) {
      outputs.add(
        RawOutput(value: change, scriptPublicKey: payToAddressScript(address)),
      );
    }
    return RawTransaction(
      version: 0,
      inputs: [
        RawInput(
          address: commitAddress,
          previousOutpoint: revealInput.outpoint,
          signatureScript: Uint8List(0),
          sequence: BigInt.zero,
          sigOpCount: 1,
          utxoEntry: revealInput.utxoEntry,
        ),
      ],
      outputs: outputs,
      lockTime: BigInt.zero,
      subnetworkId: kSubnetworkIdNative,
      gas: BigInt.zero,
    );
  }

  Future<List<Utxo>> _freshUtxos(Address address) async {
    final rpc = ref.read(kaspaRpcProvider);
    return (await rpc.getUtxosByAddresses([address.toString()])).toList();
  }

  Future<void> _sendDeveloperFee(
    WalletService walletService,
    List<Utxo> utxos,
    int feeRate,
    Address from,
  ) async {
    final destination = Address.decodeAddress(knsDeveloperFeeAddress);
    final tx = walletService.createSendTx(
      toAddress: destination,
      amount: .raw(knsDeveloperFeeSompi),
      spendableUtxos: utxos,
      feeRate: feeRate,
      changeAddress: from,
    );
    await walletService.sendTransaction(tx.tx);
  }
}

List<int> sha256Bytes(List<int> value) => crypto.sha256.convert(value).bytes;

final knsProfileServiceProvider = Provider.autoDispose(
  (ref) => KnsProfileService(ref),
);

final knsOwnProfileProvider = FutureProvider.autoDispose<KnsProfileData?>(
  (ref) => ref.watch(knsProfileServiceProvider).loadOwnProfile(),
);
