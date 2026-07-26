import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:kaspium_wallet/kaspa/api/json_client.dart';
import 'package:retry/retry.dart';

const kBaseUrl = 'https://api.kaspa.org';

class FakeHttp {
  final List<http.Response> responses;

  final sentAt = <DateTime>[];

  FakeHttp(this.responses);

  late final client = MockClient((_) async {
    sentAt.add(DateTime.now());
    return responses.length > 1 ? responses.removeAt(0) : responses.first;
  });

  int get requests => sentAt.length;

  Duration get span => sentAt.last.difference(sentAt.first);
}

http.Response _ok() => http.Response('{}', 200);

http.Response _refusal(int status, {Map<String, String> headers = const {}}) =>
    http.Response('{"detail":"no"}', status, headers: headers);

void main() {
  JsonClient clientFor(
    FakeHttp server, {
    Duration minRequestGap = Duration.zero,
    Duration rateLimitBackoff = const Duration(milliseconds: 20),
    int maxAttempts = 3,
  }) => JsonClient(
    kBaseUrl,
    r: RetryOptions(maxAttempts: maxAttempts, delayFactor: Duration.zero),
    minRequestGap: minRequestGap,
    rateLimitBackoff: rateLimitBackoff,
    client: server.client,
  );

  test('identifies itself with a user agent', () async {
    late http.BaseRequest seen;
    final client = JsonClient(
      kBaseUrl,
      r: const RetryOptions(maxAttempts: 1, delayFactor: Duration.zero),
      minRequestGap: Duration.zero,
      client: MockClient((request) async {
        seen = request;
        return _ok();
      }),
    );

    await client.get('/a');
    expect(seen.headers['User-Agent'], JsonClient.kUserAgent);

    await client.post('/b', {});
    expect(seen.headers['User-Agent'], JsonClient.kUserAgent);
  });

  test('keeps a gap between requests', () async {
    final server = FakeHttp([_ok()]);
    final client = clientFor(
      server,
      minRequestGap: const Duration(milliseconds: 50),
    );

    await Future.wait([
      client.get('/a'),
      client.get('/b'),
      client.get('/c'),
    ]);

    expect(server.requests, 3);
    expect(server.span, greaterThanOrEqualTo(const Duration(milliseconds: 90)));
  });

  test('stands off when the api asks for a pause', () async {
    final server = FakeHttp([_refusal(429), _ok()]);
    final client = clientFor(
      server,
      rateLimitBackoff: const Duration(milliseconds: 200),
    );

    await client.get('/a');

    expect(server.requests, 2);
    expect(
      server.span,
      greaterThanOrEqualTo(const Duration(milliseconds: 190)),
    );
  });

  test('stands off longer for each refusal in a row', () async {
    final server = FakeHttp([_refusal(429), _refusal(429), _ok()]);
    final client = clientFor(
      server,
      rateLimitBackoff: const Duration(milliseconds: 100),
    );

    await client.get('/a');

    expect(server.requests, 3);
    expect(
      server.span,
      greaterThanOrEqualTo(const Duration(milliseconds: 290)),
    );
  });

  test('slows down while the api keeps pushing back', () async {
    final server = FakeHttp([_refusal(429), _refusal(429), _ok()]);
    final client = clientFor(
      server,
      minRequestGap: const Duration(milliseconds: 50),
      rateLimitBackoff: const Duration(milliseconds: 10),
    );

    await client.get('/a');
    final recovered = server.sentAt.last;
    await client.get('/b');

    expect(server.requests, 4);
    expect(
      server.sentAt.last.difference(recovered),
      greaterThanOrEqualTo(const Duration(milliseconds: 140)),
    );
  });

  test('waits as long as the api asks rather than its own guess', () async {
    final server = FakeHttp([
      _refusal(429, headers: {'retry-after': '1'}),
      _ok(),
    ]);
    final client = clientFor(
      server,
      rateLimitBackoff: const Duration(milliseconds: 20),
    );

    await client.get('/a');

    expect(
      server.span,
      greaterThanOrEqualTo(const Duration(milliseconds: 900)),
    );
  });

  test('holds back the requests behind the one that was refused', () async {
    final server = FakeHttp([_refusal(429), _ok()]);
    final client = clientFor(
      server,
      rateLimitBackoff: const Duration(milliseconds: 200),
    );

    final refused = client.get('/a');
    final behind = client.get('/b');
    await Future.wait([refused, behind]);

    expect(
      server.sentAt.last.difference(server.sentAt.first),
      greaterThanOrEqualTo(const Duration(milliseconds: 190)),
    );
  });

  test('gives up on a request the api has ruled on', () async {
    final server = FakeHttp([_refusal(400)]);
    final client = clientFor(server);

    await expectLater(client.get('/a'), throwsA(isA<ApiException>()));

    expect(server.requests, 1);
  });

  test('tries again on a server error', () async {
    final server = FakeHttp([_refusal(503)]);
    final client = clientFor(server, maxAttempts: 3);

    await expectLater(client.get('/a'), throwsA(isA<ApiException>()));

    expect(server.requests, 3);
  });
}
