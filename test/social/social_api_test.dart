import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:kaspium_wallet/social/social_api.dart';

void main() {
  test(
    'profile requests convert socket-level failures into a user-friendly error',
    () async {
      final api = KafeedsApiAdapter(
        config: const SocialApiConfig(baseUrl: 'https://kachat.duckdns.org'),
        httpClient: MockClient((_) async {
          throw SocketException(
            'No route to host',
            address: InternetAddress.tryParse('127.0.0.1'),
            port: 45556,
          );
        }),
      );

      try {
        await api.fetchProfile('alice');
        fail('Expected fetchProfile to fail.');
      } on HttpException catch (error) {
        expect(error.message, contains('Unable to reach KaChat'));
        expect(error.message, isNot(contains('SocketException')));
        expect(error.message, isNot(contains('No route to host')));
      }
    },
  );

  test(
    'fetchFeed resolves author username from profile and not from public key',
    () async {
      const pubkey =
          '00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff';
      final api = KafeedsApiAdapter(
        config: const SocialApiConfig(baseUrl: 'https://kachat.duckdns.org'),
        httpClient: MockClient((request) async {
          if (request.url.path == '/get-posts-watching') {
            return http.Response(
              '{"posts":[{"id":"post-1","userPublicKey":"$pubkey","postContent":"${base64Encode(utf8.encode('hello'))}","timestamp":1720000000000}]}',
              200,
              headers: {'content-type': 'application/json'},
            );
          }
          if (request.url.path == '/get-user-details') {
            expect(request.url.queryParameters['user'], pubkey);
            return http.Response(
              '{"userPublicKey":"$pubkey","username":"alice","displayName":"Alice","avatar_url":"https://cdn.example.com/alice.png"}',
              200,
              headers: {'content-type': 'application/json'},
            );
          }
          throw StateError('Unexpected path: ${request.url.path}');
        }),
      );

      final posts = await api.fetchFeed();
      expect(posts, hasLength(1));
      expect(posts.first.author.id, pubkey);
      expect(posts.first.author.username, 'alice');
      expect(posts.first.author.displayName, 'Alice');
      expect(posts.first.author.avatarUrl, 'https://cdn.example.com/alice.png');
      expect(posts.first.author.handle, '@alice');
      expect(posts.first.author.label, 'Alice');
    },
  );

  test(
    'fetchFeed hydrates author avatar even when username is already present',
    () async {
      const pubkey =
          '00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff';
      final api = KafeedsApiAdapter(
        config: const SocialApiConfig(baseUrl: 'https://kachat.duckdns.org'),
        httpClient: MockClient((request) async {
          if (request.url.path == '/get-posts-watching') {
            return http.Response(
              '{"posts":[{"id":"post-2","userPublicKey":"$pubkey","username":"alice","postContent":"${base64Encode(utf8.encode('hello again'))}","timestamp":1720000000000}]}',
              200,
              headers: {'content-type': 'application/json'},
            );
          }
          if (request.url.path == '/get-user-details') {
            expect(request.url.queryParameters['user'], pubkey);
            return http.Response(
              '{"userPublicKey":"$pubkey","username":"alice","displayName":"Alice","avatar_url":"https://cdn.example.com/alice-2.png"}',
              200,
              headers: {'content-type': 'application/json'},
            );
          }
          throw StateError('Unexpected path: ${request.url.path}');
        }),
      );

      final posts = await api.fetchFeed();
      expect(posts, hasLength(1));
      expect(posts.first.author.username, 'alice');
      expect(
        posts.first.author.avatarUrl,
        'https://cdn.example.com/alice-2.png',
      );
    },
  );

  test('fetchProfile reads location and website metadata for edit-profile flow', () async {
    final api = KafeedsApiAdapter(
      config: const SocialApiConfig(baseUrl: 'https://kachat.duckdns.org'),
      httpClient: MockClient((request) async {
        if (request.url.path == '/get-user-details') {
          return http.Response(
            '{"userPublicKey":"abc123","username":"alice","displayName":"Alice","bio":"hello","location":"Kota Kaspa","website":"https://example.com","avatar_url":"https://cdn.example.com/alice.png","cover_url":"https://cdn.example.com/cover.png"}',
            200,
            headers: {'content-type': 'application/json'},
          );
        }
        throw StateError('Unexpected path: ${request.url.path}');
      }),
    );

    final profile = await api.fetchProfile('alice');
    expect(profile.displayName, 'Alice');
    expect(profile.bio, 'hello');
    expect(profile.location, 'Kota Kaspa');
    expect(profile.website, 'https://example.com');
    expect(profile.avatarUrl, 'https://cdn.example.com/alice.png');
    expect(profile.coverUrl, 'https://cdn.example.com/cover.png');
  });
}
