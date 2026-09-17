import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'social_models.dart';

const String kDefaultKaPostsIndexerUrl = 'https://kachat.duckdns.org';

abstract class SocialApi {
  Future<List<KafeedsPost>> fetchFeed({String? cursor, int limit = 20});

  Future<List<KafeedsPost>> searchPosts(String query);

  Future<KafeedsProfile> fetchProfile(String username);

  Future<List<KafeedsNotification>> fetchNotifications();
}

class SocialApiConfig {
  const SocialApiConfig({
    this.baseUrl = kDefaultKaPostsIndexerUrl,
    this.apiKey,
    this.enabled = true,
    this.requesterPubkeyProvider,
  });

  final String? baseUrl;
  final String? apiKey;
  final bool enabled;
  final Future<String> Function()? requesterPubkeyProvider;

  bool get hasConfiguration => (baseUrl ?? '').trim().isNotEmpty;
}

class KafeedsApiAdapter implements SocialApi {
  KafeedsApiAdapter({required this.config, http.Client? httpClient})
      : _client = httpClient ?? http.Client();

  final SocialApiConfig config;
  final http.Client _client;

  Uri _buildUri(String path, [Map<String, String>? query]) {
    final normalizedBase = (config.baseUrl ?? kDefaultKaPostsIndexerUrl).trim();
    final base = normalizedBase.endsWith('/') ? normalizedBase : '$normalizedBase/';
    final uri = Uri.parse(base + path);
    return query == null || query.isEmpty
        ? uri
        : uri.replace(queryParameters: {...uri.queryParameters, ...query});
  }

  Map<String, dynamic> _jsonObject(Object? value) => value is Map
      ? Map<String, dynamic>.from(value)
      : <String, dynamic>{};

  String _stringAt(Map<String, dynamic> json, String key, [String fallback = '']) {
    return json[key]?.toString() ?? fallback;
  }

  Future<Map<String, String>> _requesterQuery() async => switch (config.requesterPubkeyProvider) {
    final provider? => {'requesterPubkey': await provider()},
    _ => const {},
  };

  KafeedsUser _userFromJson(Map<String, dynamic>? raw) {
    if (raw == null || raw.isEmpty) {
      return const KafeedsUser(id: '', username: '@unknown');
    }
    final id = _stringAt(raw, 'id', _stringAt(raw, 'userPublicKey'));
    final username = _stringAt(raw, 'username', '@user');
    return KafeedsUser(
      id: id.isEmpty ? username : id,
      username: username.isEmpty ? '@user' : username,
      displayName: raw['display_name']?.toString() ?? raw['displayName']?.toString(),
      avatarUrl: raw['avatar_url']?.toString() ?? raw['avatarUrl']?.toString(),
    );
  }

  KafeedsPost _postFromJson(Map<String, dynamic> item) {
    final authorJson = item['author'] is Map
        ? Map<String, dynamic>.from(item['author'] as Map)
        : <String, dynamic>{
            'id': item['userPublicKey'],
            'username': item['userPublicKey'],
          };
    final encodedText = item['postContent']?.toString();
    final decodedText = encodedText == null
        ? item['text']?.toString() ?? ''
        : _decodePostContent(encodedText);
    final timestamp = _timestamp(item['timestamp']);
    return KafeedsPost(
      id: item['id']?.toString() ?? item['contentId']?.toString() ?? '',
      author: _userFromJson(authorJson),
      text: decodedText,
      timestamp: timestamp,
      replyToId: item['parent_post_id']?.toString() ?? item['parentPostId']?.toString(),
      quotedPostId: item['quoted_post_id']?.toString() ?? item['quotedPostId']?.toString(),
      urlPreviewTitle: item['preview_title']?.toString(),
      urlPreviewHost: item['preview_host']?.toString(),
      likes: int.tryParse('${item['likes'] ?? item['upVotesCount'] ?? 0}') ?? 0,
      replies: int.tryParse('${item['replies'] ?? item['repliesCount'] ?? 0}') ?? 0,
      reposts: int.tryParse('${item['reposts'] ?? item['quotesCount'] ?? 0}') ?? 0,
      isLiked: item['isUpvoted'] == true,
    );
  }

  String _decodePostContent(String encoded) {
    try {
      final decoded = utf8.decode(base64Decode(encoded));
      return decoded.startsWith('\u2060') ? decoded.substring(1) : decoded;
    } on FormatException {
      return encoded;
    }
  }

  DateTime _timestamp(Object? raw) {
    if (raw is num) return DateTime.fromMillisecondsSinceEpoch(raw.toInt(), isUtc: true).toLocal();
    return DateTime.tryParse(raw?.toString() ?? '') ?? DateTime.now();
  }

  Future<Object?> _get(String path, [Map<String, String>? query]) async {
    final uri = _buildUri(path, query);
    final response = await _client.get(uri, headers: {'Accept': 'application/json'});
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        'KaPosts request failed: ${response.statusCode} ${response.reasonPhrase}',
        uri: uri,
      );
    }
    return jsonDecode(response.body);
  }

  List<KafeedsPost> _posts(Object? body) {
    final posts = _jsonObject(body)['posts'];
    if (posts is! List) return const [];
    return posts
        .whereType<Map>()
        .map((item) => _postFromJson(Map<String, dynamic>.from(item)))
        .toList(growable: false);
  }

  @override
  Future<List<KafeedsPost>> fetchFeed({String? cursor, int limit = 20}) async {
    if (!config.enabled || !config.hasConfiguration) return const [];
    final body = await _get('get-posts-watching', {
      ...await _requesterQuery(),
      'limit': limit.toString(),
      if (cursor != null && cursor.isNotEmpty) 'before': cursor,
    });
    return _posts(body);
  }

  @override
  Future<List<KafeedsPost>> searchPosts(String query) async {
    final term = query.trim().toLowerCase();
    final posts = await fetchFeed(limit: 25);
    if (term.isEmpty) return posts;
    return posts.where((post) {
      return post.text.toLowerCase().contains(term) ||
          post.author.username.toLowerCase().contains(term);
    }).toList(growable: false);
  }

  @override
  Future<KafeedsProfile> fetchProfile(String username) async {
    final body = _jsonObject(await _get('get-user-details', {
      'user': username,
      ...await _requesterQuery(),
    }));
    return KafeedsProfile(
      id: _stringAt(body, 'userPublicKey', username),
      username: username,
      displayName: body['displayName']?.toString() ?? username,
      bio: body['bio']?.toString(),
      followers: int.tryParse('${body['followersCount'] ?? 0}') ?? 0,
      following: int.tryParse('${body['followingCount'] ?? 0}') ?? 0,
      posts: int.tryParse('${body['postsCount'] ?? 0}') ?? 0,
    );
  }

  @override
  Future<List<KafeedsNotification>> fetchNotifications() async {
    final body = _jsonObject(await _get('get-notifications', {
      'limit': '100',
      ...await _requesterQuery(),
    }));
    final notifications = body['notifications'];
    if (notifications is! List) return const [];
    return notifications.whereType<Map>().map((item) {
      final data = Map<String, dynamic>.from(item);
      final user = data['user'] is Map
          ? _userFromJson(Map<String, dynamic>.from(data['user'] as Map))
          : null;
      return KafeedsNotification(
        id: _stringAt(data, 'id'),
        type: _stringAt(data, 'contentType', 'kaPosts'),
        message: _stringAt(data, 'message', _stringAt(data, 'content', 'KaPosts notification')),
        timestamp: DateTime.tryParse(_stringAt(data, 'timestamp')) ?? DateTime.now(),
        user: user,
      );
    }).toList(growable: false);
  }
}
