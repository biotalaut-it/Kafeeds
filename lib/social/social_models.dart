import 'package:flutter/material.dart';

class KafeedsSocialConfig {
  const KafeedsSocialConfig({
    this.baseUrl,
    this.enabled = false,
  });

  final String? baseUrl;
  final bool enabled;

  bool get hasEndpoint => (baseUrl ?? '').trim().isNotEmpty;
}

class KafeedsUser {
  const KafeedsUser({
    required this.id,
    required this.username,
    this.displayName,
    this.avatarUrl,
    this.following = false,
  });

  final String id;
  final String username;
  final String? displayName;
  final String? avatarUrl;
  final bool following;

  String get label => displayName ?? username;

  String get handle {
    final value = username.trim();
    if (value.isEmpty) return '';
    return value.startsWith('@') ? value : '@$value';
  }
}

class KafeedsPost {
  const KafeedsPost({
    required this.id,
    required this.author,
    required this.text,
    required this.timestamp,
    this.replyToId,
    this.quotedPostId,
    this.urlPreviewTitle,
    this.urlPreviewHost,
    this.likes = 0,
    this.replies = 0,
    this.reposts = 0,
    this.bookmarked = false,
    this.isLiked = false,
    this.isFollowed = false,
  });

  final String id;
  final KafeedsUser author;
  final String text;
  final DateTime timestamp;
  final String? replyToId;
  final String? quotedPostId;
  final String? urlPreviewTitle;
  final String? urlPreviewHost;
  final int likes;
  final int replies;
  final int reposts;
  final bool bookmarked;
  final bool isLiked;
  final bool isFollowed;

  KafeedsPost copyWith({KafeedsUser? author}) {
    return KafeedsPost(
      id: id,
      author: author ?? this.author,
      text: text,
      timestamp: timestamp,
      replyToId: replyToId,
      quotedPostId: quotedPostId,
      urlPreviewTitle: urlPreviewTitle,
      urlPreviewHost: urlPreviewHost,
      likes: likes,
      replies: replies,
      reposts: reposts,
      bookmarked: bookmarked,
      isLiked: isLiked,
      isFollowed: isFollowed,
    );
  }

  String get timeLabel {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inMinutes < 1) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

class KafeedsNotification {
  const KafeedsNotification({
    required this.id,
    required this.type,
    required this.message,
    required this.timestamp,
    this.user,
  });

  final String id;
  final String type;
  final String message;
  final DateTime timestamp;
  final KafeedsUser? user;
}

class KafeedsProfile {
  const KafeedsProfile({
    required this.id,
    required this.username,
    this.displayName,
    this.bio,
    this.location,
    this.website,
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
    this.avatarUrl,
    this.coverUrl,
    this.birthDate,
    this.joinedAt,
  });

  final String id;
  final String username;
  final String? displayName;
  final String? bio;
  final String? location;
  final String? website;
  final int followers;
  final int following;
  final int posts;
  final String? avatarUrl;
  final String? coverUrl;
  final DateTime? birthDate;
  final DateTime? joinedAt;

  KafeedsProfile copyWith({
    String? id,
    String? username,
    String? displayName,
    String? bio,
    String? location,
    String? website,
    int? followers,
    int? following,
    int? posts,
    String? avatarUrl,
    String? coverUrl,
    DateTime? birthDate,
    DateTime? joinedAt,
  }) {
    return KafeedsProfile(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      website: website ?? this.website,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      posts: posts ?? this.posts,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      birthDate: birthDate ?? this.birthDate,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}

class KafeedsWriteResult {
  const KafeedsWriteResult({
    required this.success,
    this.transactionId,
    this.error,
  });

  final bool success;
  final String? transactionId;
  final String? error;
}

class KafeedsSocialWritePayload {
  const KafeedsSocialWritePayload({
    required this.type,
    required this.content,
    this.parentId,
    this.quoteId,
    this.metadata,
  });

  final String type;
  final String content;
  final String? parentId;
  final String? quoteId;
  final Map<String, dynamic>? metadata;
}

class KafeedsReplyContext {
  const KafeedsReplyContext({
    required this.postId,
    required this.author,
  });

  final String postId;
  final KafeedsUser author;
}

class KafeedsThemeColors {
  const KafeedsThemeColors();

  static const bg = Color(0xFF050B12);
  static const surface = Color(0xFF08131C);
  static const card = Color(0xFF0C1822);
  static const cardAlt = Color(0xFF101F2A);
  static const border = Color(0xFF18313D);
  static const primary = Color(0xFF00E5D4);
  static const secondary = Color(0xFF14B8A6);
  static const text = Color(0xFFF4F8FA);
  static const textSecondary = Color(0xFF94AAB5);
  static const textTertiary = Color(0xFF667D88);
}
