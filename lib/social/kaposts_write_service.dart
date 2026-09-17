import 'dart:convert';

import '../kaspa/kaspa.dart';
import '../wallet_address/wallet_address_notifier.dart';
import '../wallet_signer/wallet_signer.dart';
import 'social_protocol_adapter.dart';

class KaPostsWriteService {
  const KaPostsWriteService({
    required this.walletService,
    required this.walletSigner,
    required this.addresses,
    required this.spendableUtxos,
    required this.feeRate,
  });

  final WalletService walletService;
  final WalletSigner walletSigner;
  final WalletAddressNotifier addresses;
  final List<Utxo> spendableUtxos;
  final int feeRate;

  Address get _identityAddress => addresses.receiveAddress.address;

  Future<String> _requesterPubkey() async {
    final publicKey = await walletSigner.publicKey(_identityAddress);
    return bytesToHex(publicKey);
  }

  Future<String> createPost(
    String text, {
    Iterable<String> mentionedPubkeys = const [],
  }) async {
    final pubkey = await _requesterPubkey();
    final mentions = KaPostsProtocol.mentionsJson(
      mentionedPubkeys,
      ownPubkey: pubkey,
    );
    final message = KaPostsProtocol.encodeMessage(text);
    final signature = await _sign(KaPostsProtocol.postSigningString(message, mentions));
    final payload = KaPostsProtocol.post(
      pubkey: pubkey,
      signature: signature,
      text: text,
      mentionedPubkeys: mentionedPubkeys,
      ownPubkey: pubkey,
    );
    return _broadcast(payload.wirePayload);
  }

  Future<String> reply(
    String text, {
    required String postId,
    String? parentAuthorPubkey,
    Iterable<String> mentionedPubkeys = const [],
  }) async {
    final pubkey = await _requesterPubkey();
    final parentMention = parentAuthorPubkey == null
        ? const <String>[]
        : [parentAuthorPubkey];
    final mentions = KaPostsProtocol.mentionsJson([
      ...parentMention,
      ...mentionedPubkeys,
    ], ownPubkey: pubkey);
    final message = KaPostsProtocol.encodeMessage(text);
    final signature = await _sign(
      KaPostsProtocol.replySigningString(postId, message, mentions),
    );
    final payload = KaPostsProtocol.reply(
      pubkey: pubkey,
      signature: signature,
      postId: postId,
      text: text,
      parentAuthorPubkey: parentAuthorPubkey,
      mentionedPubkeys: mentionedPubkeys,
      ownPubkey: pubkey,
    );
    return _broadcast(payload.wirePayload);
  }

  Future<String> quote(
    String contentId, {
    required String quotedAuthorPubkey,
    String text = '',
  }) async {
    final pubkey = await _requesterPubkey();
    final message = KaPostsProtocol.encodeMessage(text);
    final signature = await _sign(
      KaPostsProtocol.quoteSigningString(contentId, message, quotedAuthorPubkey),
    );
    final payload = KaPostsProtocol.quote(
      pubkey: pubkey,
      signature: signature,
      contentId: contentId,
      quotedAuthorPubkey: quotedAuthorPubkey,
      text: text,
    );
    return _broadcast(payload.wirePayload);
  }

  Future<String> vote(
    String postId, {
    required String authorPubkey,
    required bool upvote,
    bool cancel = false,
  }) async {
    final pubkey = await _requesterPubkey();
    final vote = cancel ? 'unvote' : (upvote ? 'upvote' : 'downvote');
    final signature = await _sign(
      KaPostsProtocol.voteSigningString(postId, vote, authorPubkey),
    );
    final payload = KaPostsProtocol.vote(
      pubkey: pubkey,
      signature: signature,
      postId: postId,
      authorPubkey: authorPubkey,
      upvote: upvote,
      cancel: cancel,
    );
    return _broadcast(payload.wirePayload);
  }

  Future<String> follow(String followedPubkey, {required bool follow}) async {
    final pubkey = await _requesterPubkey();
    final action = follow ? 'follow' : 'unfollow';
    final signature = await _sign(
      KaPostsProtocol.followSigningString(action, followedPubkey),
    );
    final payload = KaPostsProtocol.follow(
      pubkey: pubkey,
      signature: signature,
      followedPubkey: followedPubkey,
      follow: follow,
    );
    return _broadcast(payload.wirePayload);
  }

  Future<String> _sign(String message) async {
    final result = await walletService.signPersonalMessage(
      message,
      address: _identityAddress,
    );
    return result.signature;
  }

  Future<String> _broadcast(String wirePayload) async {
    if (spendableUtxos.isEmpty) {
      throw StateError('No spendable UTXO is available for a KaPosts transaction.');
    }

    final changeAddress = await addresses.changeAddress;
    final sendTx = walletService.createKaPostsTx(
      selfAddress: _identityAddress,
      spendableUtxos: spendableUtxos,
      feeRate: feeRate,
      changeAddress: changeAddress.address,
      payload: Uint8List.fromList(utf8.encode(wirePayload)),
    );
    return walletService.sendTransaction(sendTx.tx);
  }
}