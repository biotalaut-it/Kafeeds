import '../kaspa/kaspa.dart';
import 'social_protocol_adapter.dart';

class KaPostsChainReader {
  const KaPostsChainReader(this.api);

  final ApiService api;

  Future<KaPostsChainRecord?> fetch(String txId) async {
    if (txId.isEmpty) return null;
    final transaction = await api.getTxWithId(txId);
    if (transaction == null) return null;
    final payload = transaction.payload;
    if (payload.isEmpty) return null;

    try {
      final bytes = hexToBytes(payload);
      final record = KaPostsProtocol.parseChainPayload(
        String.fromCharCodes(bytes),
      );
      if (record == null) return null;
      return KaPostsChainRecord(
        txId: transaction.transactionId,
        action: record.action,
        authorPubkey: record.authorPubkey,
        message: record.message,
        referencedId: record.referencedId,
        blockTimeMillis: transaction.blockTime,
      );
    } on FormatException {
      return null;
    }
  }
}