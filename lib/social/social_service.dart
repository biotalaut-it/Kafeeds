import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../fee/fee_providers.dart';
import '../kaspa/kaspa.dart';
import '../utxos/utxos_providers.dart';
import '../wallet_address/wallet_address_providers.dart';
import '../wallet_signer/wallet_signer_providers.dart';
import 'kaposts_write_service.dart';
import 'social_api.dart';
import 'social_models.dart';

class SocialService {
  SocialService({
    required this.api,
    required this.writeService,
  });

  final SocialApi api;
  final KaPostsWriteService writeService;

  Future<List<KafeedsPost>> fetchFeed({String? cursor, int limit = 20}) async {
    return api.fetchFeed(cursor: cursor, limit: limit);
  }

  Future<List<KafeedsPost>> fetchProfilePosts(
    String userId, {
    int limit = 100,
  }) async {
    return api.fetchProfilePosts(userId, limit: limit);
  }

  Future<List<KafeedsPost>> fetchReplies(
    String postId, {
    int limit = 100,
  }) async {
    return api.fetchReplies(postId, limit: limit);
  }

  Future<List<KafeedsPost>> searchPosts(String query) async {
    return api.searchPosts(query);
  }

  Future<KafeedsProfile> fetchProfile(String username) async {
    return api.fetchProfile(username);
  }

  Future<List<KafeedsNotification>> fetchNotifications() async {
    return api.fetchNotifications();
  }

  Future<KafeedsWriteResult> createPost(String text) async {
    if (text.trim().isEmpty) {
      return const KafeedsWriteResult(
        success: false,
        error: 'Post text cannot be empty.',
      );
    }

    try {
      final txId = await writeService.createPost(text);
      return KafeedsWriteResult(success: true, transactionId: txId);
    } catch (error) {
      return KafeedsWriteResult(success: false, error: error.toString());
    }
  }

  Future<KafeedsWriteResult> reply({
    required String parentId,
    required String parentAuthorPubkey,
    required String text,
  }) async {
    try {
      final txId = await writeService.reply(
        text,
        postId: parentId,
        parentAuthorPubkey: parentAuthorPubkey,
      );
      return KafeedsWriteResult(success: true, transactionId: txId);
    } catch (error) {
      return KafeedsWriteResult(success: false, error: error.toString());
    }
  }

  Future<KafeedsWriteResult> quote({
    required String quoteId,
    required String quotedAuthorPubkey,
    required String text,
  }) async {
    try {
      final txId = await writeService.quote(
        quoteId,
        quotedAuthorPubkey: quotedAuthorPubkey,
        text: text,
      );
      return KafeedsWriteResult(success: true, transactionId: txId);
    } catch (error) {
      return KafeedsWriteResult(success: false, error: error.toString());
    }
  }

  Future<KafeedsWriteResult> vote({
    required String postId,
    required String authorPubkey,
    required bool upvote,
    bool cancel = false,
  }) async {
    try {
      final txId = await writeService.vote(
        postId,
        authorPubkey: authorPubkey,
        upvote: upvote,
        cancel: cancel,
      );
      return KafeedsWriteResult(success: true, transactionId: txId);
    } catch (error) {
      return KafeedsWriteResult(success: false, error: error.toString());
    }
  }

  Future<KafeedsWriteResult> follow({
    required String userId,
    required bool follow,
  }) async {
    try {
      final txId = await writeService.follow(userId, follow: follow);
      return KafeedsWriteResult(success: true, transactionId: txId);
    } catch (error) {
      return KafeedsWriteResult(success: false, error: error.toString());
    }
  }
}

final socialApiProvider = Provider<SocialApi>((ref) {
  final addresses = ref.watch(addressNotifierProvider);
  final signer = ref.watch(walletSignerProvider);
  return KafeedsApiAdapter(
    config: SocialApiConfig(
      requesterPubkeyProvider: () async => bytesToHex(
        await signer.publicKey(addresses.receiveAddress.address),
      ),
    ),
  );
});

final socialServiceProvider = Provider<SocialService>((ref) {
  final api = ref.watch(socialApiProvider);
  final walletService = ref.watch(walletServiceProvider);
  final walletSigner = ref.watch(walletSignerProvider);
  final addresses = ref.watch(addressNotifierProvider);
  final spendableUtxos = ref.watch(spendableUtxosProvider);
  final feeRate = ref.watch(feeRateProvider);
  return SocialService(
    api: api,
    writeService: KaPostsWriteService(
      walletService: walletService,
      walletSigner: walletSigner,
      addresses: addresses,
      spendableUtxos: spendableUtxos,
      feeRate: feeRate,
    ),
  );
});

final feedProvider = FutureProvider<List<KafeedsPost>>((ref) async {
  final service = ref.watch(socialServiceProvider);
  return service.fetchFeed();
});

final postRepliesProvider = FutureProvider.family<List<KafeedsPost>, String>((
  ref,
  postId,
) async {
  final service = ref.watch(socialServiceProvider);
  return service.fetchReplies(postId);
});

final searchPostsProvider = FutureProvider.family<List<KafeedsPost>, String>(
  (ref, query) async {
    final service = ref.watch(socialServiceProvider);
    return service.searchPosts(query);
  },
);

final profileProvider = FutureProvider.family<KafeedsProfile, String>(
  (ref, username) async {
    final service = ref.watch(socialServiceProvider);
    return service.fetchProfile(username);
  },
);

final profilePostsProvider = FutureProvider.family<List<KafeedsPost>, String>(
  (ref, userId) async {
    final service = ref.watch(socialServiceProvider);
    return service.fetchProfilePosts(userId);
  },
);

final notificationsProvider = FutureProvider<List<KafeedsNotification>>((
  ref,
) async {
  final service = ref.watch(socialServiceProvider);
  return service.fetchNotifications();
});
