import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class JsonClient {
  final String baseUrl;
  final RetryOptions r;

  JsonClient(
    this.baseUrl, {
    this.r = const RetryOptions(
      maxAttempts: 3,
      delayFactor: Duration(milliseconds: 500),
    ),
  });

  Future<Object?> get(String path) async {
    final url = Uri.parse('$baseUrl$path');

    return await r.retry(() async {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('GET: Received status code ${response.statusCode}');
      }

      final data = json.decode(response.body);
      return data;
    });
  }

  Future<Object?> post(String path, Map<String, Object?> params) async {
    final url = Uri.parse('$baseUrl$path');
    final body = json.encode(params);

    return await r.retry(() async {
      final response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200) {
        throw Exception('POST: Received status code ${response.statusCode}');
      }
      final data = json.decode(response.body);
      return data;
    });
  }
}

class VoidJsonClient extends JsonClient {
  VoidJsonClient() : super('');

  @override
  Future<Object?> get(String path) {
    throw Exception('Void GET request: $path');
  }

  @override
  Future<Object?> post(String path, Map<String, Object?> params) {
    throw Exception('Void POST request: $path withParams: $params');
  }
}
