import 'dart:async';

import 'package:grpc/grpc_connection_interface.dart';

import 'grpc/grpc_client.dart';
import 'grpc/messages.pb.dart';
import 'grpc_service.dart';

class VoidRpcService extends GrpcService {
  VoidRpcService() : super(client: VoidClient());
}

class VoidClientChannel extends ClientChannel {
  VoidClientChannel() : super('');

  @override
  ClientConnection createConnection() =>
      throw Exception('Void Client: createConnection');
}

class VoidClient extends GrpcClient {
  VoidClient() : super(channel: VoidClientChannel());

  @override
  Future<KaspadResponse> call(KaspadRequest request) =>
      throw Exception('Void Client: Call $request');

  @override
  GrpcSubscription subscribe(KaspadRequest request) =>
      throw Exception('Void Client: Subscribe $request');

  @override
  Future<void> close() => Future.value();
}
