import 'dart:async';
import 'dart:math';

import 'package:fixnum/fixnum.dart';

import '../network.dart';
import '../types.dart';
import '../utils.dart';
import 'grpc/grpc_client.dart';
import 'grpc/messages.pbgrpc.dart';
import 'grpc/rpc.pb.dart';
import 'grpc_converters.dart';
import 'rpc_service.dart';

class RpcException implements Exception {
  final RPCError error;

  const RpcException(this.error);

  String get message => error.message;

  @override
  String toString() => message;
}

class GrpcService implements RpcService {
  final GrpcClient client;

  GrpcService({required this.client});

  factory GrpcService.url(String url, {bool tls = true, Duration? timeout}) {
    final components = url.split(':');
    final host = components.first;
    final port = int.tryParse(components.last) ?? (tls ? 443 : kMainnetRpcPort);

    final service = GrpcService(
      client: .host(host, port: port, tls: tls, timeout: timeout),
    );

    return service;
  }

  @override
  Future<void> connect() => client.connect();

  @override
  Future<void> disconnect() => client.close();

  static final _random = Random();
  static Int64 _generateId() => Int64.fromInts(
    _random.nextInt(1 << 31),
    _random.nextInt(1 << 32),
  );

  /// Server Info
  @override
  Future<ServerInfo> getServerInfo() async {
    final request = KaspadRequest(
      id: _generateId(),
      getServerInfoRequest: GetServerInfoRequestMessage(),
    );

    final response = await client.call(request);
    final message = response.getServerInfoResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return decodeServerInfo(message);
  }

  /// Blocks
  @override
  Future<Block> getBlock(String hash, {bool includeTransactions = true}) async {
    final request = KaspadRequest(
      id: _generateId(),
      getBlockRequest: GetBlockRequestMessage(
        hash: hash,
        includeTransactions: includeTransactions,
      ),
    );

    final response = await client.call(request);
    final message = response.getBlockResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return decodeBlock(message.block);
  }

  /// Virtual Chain From Block (vspc v2)
  @override
  Future<VirtualChainSegment> getVirtualChainFromBlockV2(
    String startHash, {
    DataVerbosity verbosity = .high,
    int? minConfirmationCount,
  }) async {
    final request = KaspadRequest(
      id: _generateId(),
      getVirtualChainFromBlockV2Request:
          GetVirtualChainFromBlockV2RequestMessage(
            startHash: startHash,
            dataVerbosityLevel: encodeDataVerbosity(verbosity),
            minConfirmationCount: minConfirmationCount != null
                ? Int64(minConfirmationCount)
                : null,
          ),
    );

    final response = await client.call(request);
    final message = response.getVirtualChainFromBlockV2Response;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return decodeVirtualChainSegment(message);
  }

  /// Balances
  @override
  Future<Iterable<AddressBalance>> getBalancesByAddresses(
    Iterable<String> addresses,
  ) async {
    final request = KaspadRequest(
      id: _generateId(),
      getBalancesByAddressesRequest: GetBalancesByAddressesRequestMessage(
        addresses: addresses,
      ),
    );

    final response = await client.call(request);
    final message = response.getBalancesByAddressesResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return message.entries.map(decodeAddressBalance);
  }

  /// Utxos
  @override
  Future<Iterable<Utxo>> getUtxosByAddresses(Iterable<String> addresses) async {
    final request = KaspadRequest(
      id: _generateId(),
      getUtxosByAddressesRequest: GetUtxosByAddressesRequestMessage(
        addresses: addresses,
      ),
    );

    final response = await client.call(request);
    final message = response.getUtxosByAddressesResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return message.entries.map(decodeUtxo);
  }

  /// Mempool
  @override
  Future<Iterable<MempoolEntryByAddress>> getMempoolEntriesByAddresses(
    Iterable<String> addresses, {
    bool filterTransactionPool = false,
    bool includeOrphanPool = false,
  }) async {
    final request = KaspadRequest(
      id: _generateId(),
      getMempoolEntriesByAddressesRequest:
          GetMempoolEntriesByAddressesRequestMessage(
            addresses: addresses,
            filterTransactionPool: filterTransactionPool,
            includeOrphanPool: includeOrphanPool,
          ),
    );

    final response = await client.call(request);
    final message = response.getMempoolEntriesByAddressesResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return message.entries.map(decodeMempoolEntryByAddress);
  }

  /// Fee Estimate
  @override
  Future<FeeEstimate> getFeeEstimate() async {
    final request = KaspadRequest(
      id: _generateId(),
      getFeeEstimateRequest: GetFeeEstimateRequestMessage(),
    );

    final response = await client.call(request);
    final message = response.getFeeEstimateResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return decodeFeeEstimate(message.estimate);
  }

  /// Submit Transaction
  @override
  Future<String> submitTransaction(
    RawTransaction transaction, {
    bool allowOrphan = false,
  }) async {
    final request = KaspadRequest(
      id: _generateId(),
      submitTransactionRequest: SubmitTransactionRequestMessage(
        transaction: encodeTransaction(transaction),
        allowOrphan: allowOrphan,
      ),
    );

    final response = await client.call(request);
    final message = response.submitTransactionResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return message.transactionId;
  }

  @override
  Future<(String, Transaction)> submitTransactionReplacement(
    RawTransaction transaction,
  ) async {
    final request = KaspadRequest(
      id: _generateId(),
      submitTransactionReplacementRequest:
          SubmitTransactionReplacementRequestMessage(
            transaction: encodeTransaction(transaction),
          ),
    );

    final response = await client.call(request);
    final message = response.submitTransactionReplacementResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }

    return (
      message.transactionId,
      decodeTransaction(message.replacedTransaction),
    );
  }

  /// Notifications

  /// Block Added
  @override
  Stream<Block> notifyBlockAdded() {
    final request = KaspadRequest(
      id: _generateId(),
      notifyBlockAddedRequest: NotifyBlockAddedRequestMessage(
        command: .NOTIFY_START,
      ),
    );

    return client
        .subscribe(request)
        .notifications
        .map((event) => event.blockAddedNotification.block)
        .map(decodeBlock);
  }

  @override
  Future<void> stopNotifyingBlockAdded() async {
    final request = KaspadRequest(
      id: _generateId(),
      notifyBlockAddedRequest: NotifyBlockAddedRequestMessage(
        command: .NOTIFY_STOP,
      ),
    );

    final response = await client.call(request);
    final message = response.notifyBlockAddedResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }
  }

  /// Utxos Changed
  @override
  Stream<UtxosChanged> notifyUtxosChanged(Iterable<String> addresses) {
    final request = KaspadRequest(
      id: _generateId(),
      notifyUtxosChangedRequest: NotifyUtxosChangedRequestMessage(
        addresses: addresses,
        command: .NOTIFY_START,
      ),
    );

    return client
        .subscribe(request)
        .notifications
        .map((event) => event.utxosChangedNotification)
        .map(decodeUtxosChanged);
  }

  @override
  Future<void> stopNotifyingUtxosChanged(Iterable<String> addresses) async {
    final request = KaspadRequest(
      id: _generateId(),
      notifyUtxosChangedRequest: NotifyUtxosChangedRequestMessage(
        addresses: addresses,
        command: .NOTIFY_STOP,
      ),
    );

    final response = await client.call(request);
    final message = response.notifyUtxosChangedResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }
  }

  /// Virtual DAA Score Changed
  @override
  Stream<BigInt> notifyVirtualDaaScoreChanged() {
    final request = KaspadRequest(
      id: _generateId(),
      notifyVirtualDaaScoreChangedRequest:
          NotifyVirtualDaaScoreChangedRequestMessage(
            command: .NOTIFY_START,
          ),
    );

    return client.subscribe(request).notifications.map((event) {
      final notification = event.virtualDaaScoreChangedNotification;
      return notification.virtualDaaScore.toUnsignedBigInt();
    });
  }

  @override
  Future<void> stopNotifyingVirtualDaaScoreChanged() async {
    final request = KaspadRequest(
      id: _generateId(),
      notifyVirtualDaaScoreChangedRequest:
          NotifyVirtualDaaScoreChangedRequestMessage(
            command: .NOTIFY_STOP,
          ),
    );

    final response = await client.call(request);
    final message = response.notifyVirtualDaaScoreChangedResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }
  }

  /// Sink Blue Score Changed
  @override
  Stream<BigInt> notifySinkBlueScoreChanged() {
    final request = KaspadRequest(
      id: _generateId(),
      notifySinkBlueScoreChangedRequest:
          NotifySinkBlueScoreChangedRequestMessage(
            command: .NOTIFY_START,
          ),
    );

    return client.subscribe(request).notifications.map((event) {
      final notification = event.sinkBlueScoreChangedNotification;
      return notification.sinkBlueScore.toUnsignedBigInt();
    });
  }

  @override
  Future<void> stopNotifyingSinkBlueScoreChanged() async {
    final request = KaspadRequest(
      id: _generateId(),
      notifySinkBlueScoreChangedRequest:
          NotifySinkBlueScoreChangedRequestMessage(
            command: .NOTIFY_STOP,
          ),
    );

    final response = await client.call(request);
    final message = response.notifySinkBlueScoreChangedResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }
  }

  /// Virtual Selected Parent Chain Changed
  @override
  Stream<VirtualChainChanged> notifyVirtualChainChanged({
    bool includeAcceptedTransactionIds = true,
  }) {
    final request = KaspadRequest(
      id: _generateId(),
      notifyVirtualChainChangedRequest: NotifyVirtualChainChangedRequestMessage(
        command: .NOTIFY_START,
        includeAcceptedTransactionIds: includeAcceptedTransactionIds,
      ),
    );

    return client
        .subscribe(request)
        .notifications
        .map((event) => event.virtualChainChangedNotification)
        .map(decodeVirtualChainChanged);
  }

  @override
  Future<void> stopNotifyingVirtualChainChanged() async {
    final request = KaspadRequest(
      id: _generateId(),
      notifyVirtualChainChangedRequest: NotifyVirtualChainChangedRequestMessage(
        command: .NOTIFY_STOP,
      ),
    );

    final response = await client.call(request);
    final message = response.notifyVirtualChainChangedResponse;

    if (message.hasError()) {
      throw RpcException(message.error);
    }
  }
}
