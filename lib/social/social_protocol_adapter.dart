import 'dart:convert';


const kKaPostsPrefix = 'kchat:1:';
const kKaPostsMarker = '\u2060';
const kKaPostsCharacterLimit = 25000;

class KaPostsPayload {
  const KaPostsPayload({
    required this.action,
    required this.signingMessage,
    required this.wirePayload,
  });

  final String action;
  final String signingMessage;
  final String wirePayload;
}

class KaPostsProtocol {
  const KaPostsProtocol._();

  static String encodeMessage(String text) =>
      base64Encode(utf8.encode('$kKaPostsMarker$text'));

  static String mentionsJson(
    Iterable<String> pubkeys, {
    String? ownPubkey,
  }) {
    final clean = pubkeys
        .map((key) => key.toLowerCase())
        .where((key) => RegExp(r'^0[23][0-9a-f]{64}$').hasMatch(key))
        .where((key) => key != ownPubkey?.toLowerCase())
        .toSet()
        .toList();
    return jsonEncode(clean);
  }

  static String postSigningString(String b64Message, String mentions) =>
      '$b64Message:$mentions';

  static String replySigningString(
    String postId,
    String b64Message,
    String mentions,
  ) => '$postId:$b64Message:$mentions';

  static String voteSigningString(
    String postId,
    String vote,
    String authorPubkey,
  ) => '$postId:$vote:$authorPubkey';

  static String followSigningString(String action, String followedPubkey) =>
      '$action:$followedPubkey';

  static String quoteSigningString(
    String contentId,
    String b64Message,
    String quotedAuthorPubkey,
  ) => '$contentId:$b64Message:$quotedAuthorPubkey';

  static String unquoteSigningString(String contentId) => contentId;

  static KaPostsChainRecord? parseChainPayload(String payload) {
    final root = payload.startsWith(kKaPostsPrefix)
        ? kKaPostsPrefix
        : payload.startsWith('k:1:')
            ? 'k:1:'
            : null;
    if (root == null) return null;

    final fields = payload.substring(root.length).split(':');
    if (fields.length < 4) return null;
    final action = fields.first;
    final messageIndex = switch (action) {
      'post' => 3,
      'reply' || 'quote' => 4,
      _ => -1,
    };
    if (messageIndex < 0 || fields.length <= messageIndex) return null;

    try {
      final decoded = utf8.decode(base64Decode(fields[messageIndex]));
      final message = decoded.startsWith(kKaPostsMarker)
          ? decoded.substring(1).trim()
          : decoded.trim();
      return KaPostsChainRecord(
        action: action,
        authorPubkey: fields[1],
        message: message,
        referencedId: action == 'post' ? null : fields[3].isEmpty ? null : fields[3],
      );
    } on FormatException {
      return null;
    }
  }

  static String postPayload(
    String pubkey,
    String signature,
    String b64Message,
    String mentions,
  ) => '${kKaPostsPrefix}post:$pubkey:$signature:$b64Message:$mentions';

  static String replyPayload(
    String pubkey,
    String signature,
    String postId,
    String b64Message,
    String mentions,
  ) => '${kKaPostsPrefix}reply:$pubkey:$signature:$postId:$b64Message:$mentions';

  static String quotePayload(
    String pubkey,
    String signature,
    String contentId,
    String b64Message,
    String quotedAuthorPubkey,
  ) => '${kKaPostsPrefix}quote:$pubkey:$signature:$contentId:$b64Message:$quotedAuthorPubkey';

  static String votePayload(
    String pubkey,
    String signature,
    String postId,
    String vote,
    String authorPubkey,
  ) => '${kKaPostsPrefix}vote:$pubkey:$signature:$postId:$vote:$authorPubkey';

  static String followPayload(
    String pubkey,
    String signature,
    String action,
    String followedPubkey,
  ) => '${kKaPostsPrefix}follow:$pubkey:$signature:$action:$followedPubkey';

  static KaPostsPayload post({
    required String pubkey,
    required String signature,
    required String text,
    Iterable<String> mentionedPubkeys = const [],
    String? ownPubkey,
  }) {
    _checkText(text);
    final message = encodeMessage(text);
    final mentions = mentionsJson(mentionedPubkeys, ownPubkey: ownPubkey);
    return KaPostsPayload(
      action: 'post',
      signingMessage: postSigningString(message, mentions),
      wirePayload: postPayload(pubkey, signature, message, mentions),
    );
  }

  static KaPostsPayload reply({
    required String pubkey,
    required String signature,
    required String postId,
    required String text,
    String? parentAuthorPubkey,
    Iterable<String> mentionedPubkeys = const [],
    String? ownPubkey,
  }) {
    _checkText(text);
    final message = encodeMessage(text);
    final parentMention = parentAuthorPubkey == null
        ? const <String>[]
        : [parentAuthorPubkey];
    final mentions = mentionsJson([
      ...parentMention,
      ...mentionedPubkeys,
    ], ownPubkey: ownPubkey);
    return KaPostsPayload(
      action: 'reply',
      signingMessage: replySigningString(postId, message, mentions),
      wirePayload: replyPayload(pubkey, signature, postId, message, mentions),
    );
  }

  static KaPostsPayload quote({
    required String pubkey,
    required String signature,
    required String contentId,
    required String quotedAuthorPubkey,
    String text = '',
  }) {
    _checkText(text);
    final message = encodeMessage(text);
    return KaPostsPayload(
      action: 'quote',
      signingMessage: quoteSigningString(contentId, message, quotedAuthorPubkey),
      wirePayload: quotePayload(pubkey, signature, contentId, message, quotedAuthorPubkey),
    );
  }

  static KaPostsPayload vote({
    required String pubkey,
    required String signature,
    required String postId,
    required String authorPubkey,
    required bool upvote,
    bool cancel = false,
  }) {
    final vote = cancel ? 'unvote' : (upvote ? 'upvote' : 'downvote');
    return KaPostsPayload(
      action: vote,
      signingMessage: voteSigningString(postId, vote, authorPubkey),
      wirePayload: votePayload(pubkey, signature, postId, vote, authorPubkey),
    );
  }

  static KaPostsPayload follow({
    required String pubkey,
    required String signature,
    required String followedPubkey,
    required bool follow,
  }) {
    final action = follow ? 'follow' : 'unfollow';
    return KaPostsPayload(
      action: action,
      signingMessage: followSigningString(action, followedPubkey),
      wirePayload: followPayload(pubkey, signature, action, followedPubkey),
    );
  }

  static void _checkText(String text) {
    if (text.length > kKaPostsCharacterLimit) {
      throw ArgumentError('KaPosts content exceeds $kKaPostsCharacterLimit characters.');
    }
  }

}

class KaPostsChainRecord {
  const KaPostsChainRecord({
    this.txId = '',
    required this.action,
    required this.authorPubkey,
    required this.message,
    required this.referencedId,
    this.blockTimeMillis = 0,
  });

  final String txId;
  final String action;
  final String authorPubkey;
  final String message;
  final String? referencedId;
  final int blockTimeMillis;
}
