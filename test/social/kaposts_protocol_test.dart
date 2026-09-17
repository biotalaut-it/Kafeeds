import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/wallet_auth/wallet_auth_notifier.dart';
import 'package:kaspium_wallet/social/social_protocol_adapter.dart';

void main() {
  final pubkey = '02${List.filled(32, '11').join()}';
  final signature = List.filled(64, 'aa').join();
  const postId = 'post-tx-id';
  final authorPubkey = '03${List.filled(32, '22').join()}';

  test('post uses KaChat marker, Base64, canonical signature, and wire payload', () {
    final message = KaPostsProtocol.encodeMessage('Hello');
    final mentions = KaPostsProtocol.mentionsJson([authorPubkey]);
    final payload = KaPostsProtocol.post(
      pubkey: pubkey,
      signature: signature,
      text: 'Hello',
      mentionedPubkeys: [authorPubkey],
    );

    expect(utf8.decode(base64Decode(message)), '\u2060Hello');
    expect(payload.signingMessage, '$message:["$authorPubkey"]');
    expect(
      payload.wirePayload,
      'kchat:1:post:$pubkey:$signature:$message:$mentions',
    );
  });

  test('reply signs and serializes the parent id and parent author mention', () {
    final message = KaPostsProtocol.encodeMessage('Reply');
    final mentions = KaPostsProtocol.mentionsJson([authorPubkey]);
    final payload = KaPostsProtocol.reply(
      pubkey: pubkey,
      signature: signature,
      postId: postId,
      text: 'Reply',
      parentAuthorPubkey: authorPubkey,
    );

    expect(payload.signingMessage, '$postId:$message:$mentions');
    expect(
      payload.wirePayload,
      'kchat:1:reply:$pubkey:$signature:$postId:$message:$mentions',
    );
  });

  test('quote, vote, and follow use the source canonical signing fields', () {
    final quoteMessage = KaPostsProtocol.encodeMessage('');
    final quote = KaPostsProtocol.quote(
      pubkey: pubkey,
      signature: signature,
      contentId: postId,
      quotedAuthorPubkey: authorPubkey,
    );
    final vote = KaPostsProtocol.vote(
      pubkey: pubkey,
      signature: signature,
      postId: postId,
      authorPubkey: authorPubkey,
      upvote: true,
    );
    final follow = KaPostsProtocol.follow(
      pubkey: pubkey,
      signature: signature,
      followedPubkey: authorPubkey,
      follow: false,
    );

    expect(quote.signingMessage, '$postId:$quoteMessage:$authorPubkey');
    expect(
      quote.wirePayload,
      'kchat:1:quote:$pubkey:$signature:$postId:$quoteMessage:$authorPubkey',
    );
    expect(vote.signingMessage, '$postId:upvote:$authorPubkey');
    expect(vote.wirePayload, 'kchat:1:vote:$pubkey:$signature:$postId:upvote:$authorPubkey');
    expect(follow.signingMessage, 'unfollow:$authorPubkey');
    expect(follow.wirePayload, 'kchat:1:follow:$pubkey:$signature:unfollow:$authorPubkey');
  });

  test('compressed sender key is derived from the same wallet private key', () {
    final seed = List.filled(64, '01').join();
    final keyPair = HdWallet.forSeedHex(seed, type: .schnorr)
        .deriveKeyPair(typeIndex: 0, index: 0);
    final compressed = compressedPublicKeyFromPrivateKey(keyPair.privateKey);
    final signature = signSchnorr(
      hash: Uint8List.fromList(List.filled(32, 7)),
      privateKey: keyPair.privateKey,
    );

    expect(compressed.length, 33);
    expect(compressed.first == 0x02 || compressed.first == 0x03, isTrue);
    expect(
      verifySchnorr(
        publicKey: bytesToHex(compressed.sublist(1)),
        hash: bytesToHex(Uint8List.fromList(List.filled(32, 7))),
        signature: bytesToHex(signature),
      ),
      isTrue,
    );
  });
}
