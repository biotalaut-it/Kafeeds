import 'dart:convert';

import 'package:http/http.dart' as http;

const knsApiBaseUrl = 'https://api.knsdomains.org/mainnet/api/v1';

class KnsAsset {
  const KnsAsset({required this.assetId, required this.name});

  final String assetId;
  final String name;
}

class KnsProfileData {
  const KnsProfileData({
    this.bio,
    this.avatarUrl,
    this.bannerUrl,
    this.website,
  });

  final String? bio;
  final String? avatarUrl;
  final String? bannerUrl;
  final String? website;
}

class KnsApiClient {
  KnsApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<KnsAsset>> assetsByOwner(String address) async {
    final response = await _client.get(
      Uri.parse('$knsApiBaseUrl/assets').replace(
        queryParameters: {
          'owner': address,
          'type': 'domain',
          'pageSize': '100',
        },
      ),
    );
    _check(response);
    final root = jsonDecode(response.body);
    final data = root is Map && root['data'] is Map
        ? Map<String, dynamic>.from(root['data'] as Map)
        : const <String, dynamic>{};
    final entries = data['assets'];
    if (entries is! List) return const [];
    return entries
        .whereType<Map>()
        .map((raw) {
          final map = Map<String, dynamic>.from(raw);
          return KnsAsset(
            assetId: '${map['assetId'] ?? map['asset_id'] ?? ''}',
            name: '${map['asset'] ?? map['name'] ?? map['fullName'] ?? ''}',
          );
        })
        .where((asset) => asset.assetId.isNotEmpty)
        .toList(growable: false);
  }

  Future<KnsProfileData?> profile(String assetId) async {
    final response = await _client.get(
      Uri.parse('$knsApiBaseUrl/domain/$assetId/profile'),
    );
    _check(response);
    final root = jsonDecode(response.body);
    final data = root is Map && root['data'] is Map
        ? Map<String, dynamic>.from(root['data'] as Map)
        : const <String, dynamic>{};
    final profile = data['profile'];
    if (profile is! Map) return null;
    return KnsProfileData(
      bio: profile['bio']?.toString(),
      avatarUrl: profile['avatarUrl']?.toString(),
      bannerUrl: profile['bannerUrl']?.toString(),
      website: profile['website']?.toString(),
    );
  }

  Future<String> uploadImage({
    required String assetId,
    required String uploadType,
    required List<int> bytes,
    required String signature,
    required String signMessage,
  }) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$knsApiBaseUrl/upload/image'))
          ..fields['signMessage'] = signMessage
          ..fields['signature'] = signature
          ..files.add(
            http.MultipartFile.fromBytes(
              'image',
              bytes,
              filename: '$uploadType-$assetId.png',
            ),
          );
    final response = await http.Response.fromStream(await request.send());
    _check(response);
    final root = jsonDecode(response.body);
    final outer = root is Map && root['data'] is Map
        ? Map<String, dynamic>.from(root['data'] as Map)
        : const <String, dynamic>{};
    final inner = outer['data'] is Map
        ? Map<String, dynamic>.from(outer['data'] as Map)
        : const <String, dynamic>{};
    final url = inner['imageUrl'];
    if (url is! String || url.trim().isEmpty) {
      throw StateError('KNS upload response did not contain imageUrl.');
    }
    return url;
  }

  void _check(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError('KNS request failed: HTTP ${response.statusCode}.');
    }
  }
}
