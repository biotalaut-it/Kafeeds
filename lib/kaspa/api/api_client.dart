import 'api_types.dart';
import 'json_client.dart';

typedef JsonObject = Map<String, Object?>;

typedef JsonPage = ({
  Iterable<JsonObject> data,
  int? nextBefore,
  int? nextAfter,
});

class ApiClient {
  final JsonClient _client;

  const ApiClient(this._client);

  ApiClient.url(String baseUrl)
    : _client = baseUrl.isNotEmpty ? JsonClient(baseUrl) : VoidJsonClient();

  /// Kaspa Addresses

  Future<Iterable<JsonObject>> getFullTransactions({
    required String address,
    int limit = 50,
    int offset = 0,
    List<String> fields = const [],
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final params = [
      'limit=$limit',
      'offset=$offset',
      if (fields.isNotEmpty) 'fields=${fields.join(',')}',
      'resolve_previous_outpoints=${resolvePreviousOutpoints.name}',
    ];
    final path = '/addresses/$address/full-transactions?${params.join('&')}';
    final result = await _client.get(path);

    if (result == null) {
      throw Exception('Null result for $path');
    }

    return (result as Iterable).cast<JsonObject>();
  }

  Future<JsonPage> getFullTransactionsPage({
    required String address,
    int limit = 50,
    int? before,
    int? after,
    List<String> fields = const [],
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    assert(
      before == null || after == null,
      'The api takes one of before and after, not both',
    );

    final params = [
      'limit=$limit',
      if (before != null) 'before=$before',
      if (after != null) 'after=$after',
      if (fields.isNotEmpty) 'fields=${fields.join(',')}',
      'resolve_previous_outpoints=${resolvePreviousOutpoints.name}',
    ];
    final path =
        '/addresses/$address/full-transactions-page?${params.join("&")}';
    final response = await _client.getResponse(path);

    if (response.data == null) {
      throw Exception('Null result for $path');
    }

    int? cursor(String header) => int.tryParse(response.headers[header] ?? '');

    return (
      data: (response.data as Iterable).cast<JsonObject>(),
      nextBefore: cursor('x-next-page-before'),
      nextAfter: cursor('x-next-page-after'),
    );
  }

  Future<int> getTransactionsCount({required String address}) async {
    final path = '/addresses/$address/transactions-count';
    final data = await _client.get(path);

    if (data case {'total': int count}) {
      return count;
    } else {
      throw Exception('Failed to get transaction count');
    }
  }

  Future<Iterable<JsonObject>> getActive({
    required Iterable<String> addresses,
  }) async {
    final path = '/addresses/active';
    final data = await _client.post(path, {'addresses': addresses.toList()});

    return (data as Iterable).cast<JsonObject>();
  }

  /// Kaspa Transactions
  Future<JsonObject?> getTransaction({
    required String id,
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final params = [
      'resolve_previous_outpoints=${resolvePreviousOutpoints.name}',
    ];
    final path = '/transactions/$id?${params.join("&")}';

    final result = await _client.get(path);

    return result as JsonObject?;
  }

  Future<Iterable<JsonObject>> getTransactions({
    required Iterable<String> ids,
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final params = [
      'resolve_previous_outpoints=${resolvePreviousOutpoints.name}',
    ];
    final path = '/transactions/search?${params.join("&")}';
    final data = await _client.post(path, {'transactionIds': ids.toList()});

    return (data as Iterable).cast<JsonObject>();
  }
}
