import 'package:collection/collection.dart';

import 'api_client.dart';
import 'api_types.dart';

class ApiService {
  final ApiClient _api;
  const ApiService(this._api);

  ApiService.url(String url) : _api = ApiClient(url);

  Future<int> getTxCountForAddress(String address) {
    return _api.getTransactionsCount(address: address);
  }

  Future<List<ApiTxId>> getTxIdsForAddress(
    String address, {
    int pageSize = 500,
    int maxPages = 100,
  }) async {
    bool loadMore = true;
    int page = 0;
    final txIds = <ApiTxId>[];

    while (loadMore) {
      final result = await _api.getFullTransactions(
        address: address,
        limit: pageSize,
        offset: page * pageSize,
        fields: ['transaction_id', 'block_time'],
        resolvePreviousOutpoints: .no,
      );

      final txPage = result.map(ApiTxId.fromJson);
      txIds.addAll(txPage);

      page += 1;
      loadMore = txPage.length == pageSize && page < maxPages;
    }

    return txIds;
  }

  Future<List<ApiTransaction>> getTxsForAddress(
    String address, {
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
    int pageSize = 20,
    int maxPages = 100,
    required bool Function(Iterable<ApiTransaction> txs) shouldLoadMore,
  }) async {
    bool loadMore = true;
    int page = 0;
    final txs = <ApiTransaction>[];

    while (loadMore) {
      final result = await _api.getFullTransactions(
        address: address,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        limit: pageSize,
        offset: page * pageSize,
      );

      final txPage = result.map(ApiTransaction.fromJson);
      txs.addAll(txPage);

      page += 1;
      loadMore =
          txPage.length == pageSize &&
          page < maxPages &&
          shouldLoadMore(txPage);
    }

    return txs;
  }

  Future<List<ApiTransaction>> getTxsWithIds(
    Iterable<String> ids, {
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final txs = <ApiTransaction>[];

    for (final idsSlice in ids.slices(10)) {
      final data = await _api.getTransactions(
        ids: idsSlice,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
      );

      final transactions = data.map(ApiTransaction.fromJson);
      txs.addAll(transactions);
    }

    return txs;
  }

  Future<ApiTransaction?> getTxWithId(
    String id, {
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final data = await _api.getTransaction(
      id: id,
      resolvePreviousOutpoints: resolvePreviousOutpoints,
    );
    if (data == null) {
      return null;
    }
    final result = ApiTransaction.fromJson(data);

    return result;
  }

  Future<Iterable<ApiActiveAddress>> checkActive({
    required Iterable<String> addresses,
  }) async {
    final data = await _api.getActive(addresses: addresses);
    final result = data.map(ApiActiveAddress.fromJson);

    return result;
  }
}
