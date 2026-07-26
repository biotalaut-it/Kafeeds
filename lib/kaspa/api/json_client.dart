import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

typedef JsonResponse = ({Object? data, Map<String, String> headers});

class ApiException implements Exception {
  final String method;
  final int statusCode;

  const ApiException(this.statusCode, {required this.method});

  bool get isTransient => statusCode == 429 || statusCode >= 500;

  @override
  String toString() => '$method: Received status code $statusCode';
}

class JsonClient {
  static const kUserAgent = 'Kaspium Wallet';

  static const _getHeaders = {'User-Agent': kUserAgent};
  static const _postHeaders = {
    'User-Agent': kUserAgent,
    'Content-Type': 'application/json',
  };

  static const kRateLimitBackoff = Duration(seconds: 2);

  static const kMaxRateLimitBackoff = Duration(seconds: 30);

  static const kMaxRequestGap = Duration(seconds: 2);

  static const kMaxBackoffSteps = 4;

  final String baseUrl;
  final RetryOptions r;

  final Duration minRequestGap;

  final Duration rateLimitBackoff;

  final http.Client _client;

  Future<void> _turn = Future.value();

  DateTime _notBefore = DateTime.now();

  late Duration _gap = minRequestGap;

  int _refusals = 0;

  JsonClient(
    this.baseUrl, {
    this.r = const RetryOptions(
      maxAttempts: 5,
      delayFactor: Duration(milliseconds: 500),
    ),
    this.minRequestGap = const Duration(milliseconds: 200),
    this.rateLimitBackoff = kRateLimitBackoff,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<JsonResponse> getResponse(String path) {
    final url = Uri.parse('$baseUrl$path');

    return _send(
      'GET',
      () => _client.get(url, headers: _getHeaders),
      (response) {
        return (
          data: json.decode(response.body) as Object?,
          headers: response.headers,
        );
      },
    );
  }

  Future<Object?> get(String path) async {
    final response = await getResponse(path);
    return response.data;
  }

  Future<Object?> post(String path, Map<String, Object?> params) {
    final url = Uri.parse('$baseUrl$path');
    final body = json.encode(params);

    return _send(
      'POST',
      () => _client.post(
        url,
        body: body,
        headers: _postHeaders,
      ),
      (response) {
        return json.decode(response.body) as Object?;
      },
    );
  }

  Future<T> _send<T>(
    String method,
    Future<http.Response> Function() send,
    T Function(http.Response response) decode,
  ) {
    return r.retry(
      () async {
        await _waitTurn();

        final response = await send();
        if (response.statusCode == 429) {
          _pushedBack(_retryAfter(response));
          throw ApiException(429, method: method);
        }
        if (response.statusCode != 200) {
          throw ApiException(response.statusCode, method: method);
        }

        _accepted();
        return decode(response);
      },
      retryIf: (e) => e is! ApiException || e.isTransient,
    );
  }

  Future<void> _waitTurn() {
    final turn = _turn.then((_) async {
      final wait = _notBefore.difference(.now());
      if (wait > .zero) {
        await Future.delayed(wait);
      }
      _notBefore = DateTime.now().add(_gap);
    });
    _turn = turn;
    return turn;
  }

  void _pushedBack(Duration? retryAfter) {
    _refusals += 1;

    final widened = _gap * 2;
    _gap = widened < kMaxRequestGap ? widened : kMaxRequestGap;

    final steps = min(_refusals - 1, kMaxBackoffSteps);
    _holdBack(retryAfter ?? rateLimitBackoff * (1 << steps));
  }

  void _accepted() {
    _refusals = 0;

    final eased = _gap - minRequestGap;
    _gap = eased > minRequestGap ? eased : minRequestGap;
  }

  void _holdBack(Duration delay) {
    final until = DateTime.now().add(
      delay > kMaxRateLimitBackoff ? kMaxRateLimitBackoff : delay,
    );
    if (until.isAfter(_notBefore)) {
      _notBefore = until;
    }
  }

  Duration? _retryAfter(http.Response response) {
    final seconds = int.tryParse(response.headers['retry-after'] ?? '');
    if (seconds == null) return null;
    return Duration(seconds: seconds);
  }
}

class VoidJsonClient extends JsonClient {
  VoidJsonClient() : super('');

  @override
  Future<JsonResponse> getResponse(String path) {
    throw Exception('Void GET request: $path');
  }

  @override
  Future<Object?> post(String path, Map<String, Object?> params) {
    throw Exception('Void POST request: $path withParams: $params');
  }
}
