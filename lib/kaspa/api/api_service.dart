import 'package:collection/collection.dart';

import 'api_client.dart';
import 'api_types.dart';

class ApiService {
  static const kMaxActiveAddressBatch = 100;

  static const kMaxTxIdBatch = 500;

  static const kMaxPageLimit = 500;

  static const kTxIdFields = ['transaction_id', 'block_time'];

  final ApiClient _api;
  const ApiService(this._api);

  ApiService.url(String url) : _api = ApiClient.url(url);

  Future<int> getTxCountForAddress(String address) {
    return _api.getTransactionsCount(address: address);
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

  Future<ApiTxPage> getTxsPageForAddress(
    String address, {
    int limit = kMaxPageLimit,
    int? before,
    int? after,
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final page = await _api.getFullTransactionsPage(
      address: address,
      limit: limit,
      before: before,
      after: after,
      resolvePreviousOutpoints: resolvePreviousOutpoints,
    );

    return ApiTxPage(
      txs: page.data.map(ApiTransaction.fromJson).toList(),
      nextBefore: page.nextBefore,
      nextAfter: page.nextAfter,
    );
  }

  Future<ApiTxIdPage> getTxIdPageForAddress(
    String address, {
    int limit = kMaxPageLimit,
    int? before,
    int? after,
  }) async {
    final page = await _api.getFullTransactionsPage(
      address: address,
      limit: limit,
      before: before,
      after: after,
      fields: kTxIdFields,
      resolvePreviousOutpoints: .no,
    );

    return ApiTxIdPage(
      ids: page.data.map(ApiTxId.fromJson).toList(),
      nextBefore: page.nextBefore,
      nextAfter: page.nextAfter,
    );
  }

  Future<List<ApiTransaction>> getTxsWithIds(
    Iterable<String> ids, {
    ResolvePreviousOutpoints resolvePreviousOutpoints = .light,
  }) async {
    final txs = <ApiTransaction>[];

    for (final idsSlice in ids.slices(kMaxTxIdBatch)) {
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

  Future<List<ApiActiveAddress>> checkActive({
    required Iterable<String> addresses,
  }) async {
    final result = <ApiActiveAddress>[];

    for (final batch in addresses.slices(kMaxActiveAddressBatch)) {
      final data = await _api.getActive(addresses: batch);
      result.addAll(data.map(ApiActiveAddress.fromJson));
    }

    return result;
  }
}
