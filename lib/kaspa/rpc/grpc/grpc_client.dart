import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import 'messages.pbgrpc.dart';

const _defaultTimeout = Duration(seconds: 30);

typedef GrpcSubscription = ({
  Future<KaspadResponse> response,
  Stream<KaspadResponse> notifications,
});

class GrpcClient {
  final ClientChannel channel;
  final RPCClient rpcClient;
  final Duration timeout;

  StreamSubscription<KaspadResponse>? _connection;

  final _responders = <Int64, Completer<KaspadResponse>>{};
  final _subscriptions = <String, StreamController<KaspadResponse>>{};

  final _requestController = StreamController<KaspadRequest>();

  GrpcClient({required this.channel, Duration? timeout})
    : rpcClient = RPCClient(channel),
      timeout = timeout ?? _defaultTimeout;

  factory GrpcClient.host(
    String host, {
    required int port,
    bool tls = false,
    Duration? timeout,
  }) {
    final channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(credentials: tls ? .secure() : .insecure()),
    );

    return GrpcClient(channel: channel, timeout: timeout);
  }

  KaspadResponse_Payload _convertToNotificationPayload(
    KaspadRequest_Payload payload,
  ) {
    return switch (payload) {
      .notifyBlockAddedRequest => .blockAddedNotification,
      .notifyUtxosChangedRequest => .utxosChangedNotification,
      .notifyVirtualDaaScoreChangedRequest =>
        .virtualDaaScoreChangedNotification,
      .notifySinkBlueScoreChangedRequest => .sinkBlueScoreChangedNotification,
      .notifyVirtualChainChangedRequest => .virtualChainChangedNotification,
      _ => throw Exception('Unsuported payload: $payload'),
    };
  }

  Future<void> connect() async {
    if (_connection != null) {
      return;
    }

    _connection = rpcClient.messageStream(_requestController.stream).listen(
      (message) {
        if (message.hasId()) {
          // response
          final completer = _responders.remove(message.id);
          completer?.complete(message);
        } else {
          // notification
          final notification = message.whichPayload();
          _subscriptions[notification.name]?.add(message);
        }
      },
    );
  }

  Future<void> close() async {
    _connection?.cancel();
    _responders.forEach(
      (_, value) => value.completeError(Exception('Connection closed')),
    );
    _responders.clear();
    _subscriptions.forEach((_, value) => value.close());
    _subscriptions.clear();
    return channel.shutdown();
  }

  Future<KaspadResponse> call(KaspadRequest request) async {
    final completer = Completer<KaspadResponse>();
    _responders[request.id] = completer;

    _requestController.add(request);

    return completer.future.timeout(
      timeout,
      onTimeout: () {
        _responders.remove(request.id);
        throw TimeoutException('$request: id ${request.id}', timeout);
      },
    );
  }

  GrpcSubscription subscribe(KaspadRequest request) {
    final payload = request.whichPayload();
    final notification = _convertToNotificationPayload(payload);

    // close previous subscription if any
    _subscriptions[notification.name]?.close();

    final controller = StreamController<KaspadResponse>();
    _subscriptions[notification.name] = controller;

    final response = call(request);

    return (
      response: response,
      notifications: controller.stream,
    );
  }
}
