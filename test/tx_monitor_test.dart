import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/transactions/tx_monitor.dart';

class FakeRpcService extends Fake implements RpcService {
  final pullStartHashes = <String>[];
  VirtualChainSegment Function(String startHash)? segmentBuilder;
  Object? error;

  @override
  Future<VirtualChainSegment> getVirtualChainFromBlockV2(
    String startHash, {
    DataVerbosity verbosity = DataVerbosity.high,
    int? minConfirmationCount,
  }) async {
    pullStartHashes.add(startHash);
    if (error case final error?) throw error;
    return segmentBuilder!(startHash);
  }
}

Transaction makeTx(
  String id, {
  String toAddress = 'kaspa:other',
  List<Outpoint> spends = const [],
}) {
  return Transaction(
    transactionId: id,
    blockTime: 0,
    isAccepted: true,
    inputs: [
      for (final outpoint in spends)
        TransactionInput(
          transactionId: id,
          index: 0,
          previousOutpointHash: outpoint.transactionId,
          previousOutpointIndex: BigInt.from(outpoint.index),
          signatureScript: '',
          sigOpCount: 1,
        ),
    ],
    outputs: [
      TransactionOutput(
        transactionId: id,
        index: 0,
        amount: 100,
        scriptPublicKey: '',
        scriptPublicKeyAddress: toAddress,
        scriptPublicKeyType: '',
      ),
    ],
  );
}

Utxo makeUtxo(Outpoint outpoint, {String address = 'kaspa:mine'}) {
  return Utxo(
    address: address,
    outpoint: outpoint,
    utxoEntry: UtxoEntry(
      amount: BigInt.one,
      scriptPublicKey: ScriptPublicKey(
        scriptPublicKey: Uint8List(0),
        version: 0,
      ),
      blockDaaScore: BigInt.zero,
      isCoinbase: false,
    ),
  );
}

VirtualChainChanged vcc({
  List<String> added = const [],
  List<String> removed = const [],
  Map<String, List<String>> accepted = const {},
}) {
  return VirtualChainChanged(
    removedChainBlockHashes: removed,
    addedChainBlockHashes: added,
    acceptedTransactionIds: [
      for (final entry in accepted.entries)
        AcceptedTransactionIds(
          acceptingBlockHash: entry.key,
          acceptedTransactionIds: entry.value,
        ),
    ],
  );
}

ChainAcceptedTransactions chainBlock(String hash, List<Transaction> txs) {
  return ChainAcceptedTransactions(
    chainBlockHash: hash,
    blueScore: 1,
    daaScore: 1,
    timestamp: 0,
    acceptedTransactions: txs,
  );
}

VirtualChainSegment segment(List<ChainAcceptedTransactions> blocks) {
  return VirtualChainSegment(
    removedChainBlockHashes: [],
    addedChainBlockHashes: blocks.map((b) => b.chainBlockHash).toList(),
    chainBlocks: blocks,
  );
}

void main() {
  late FakeRpcService rpc;
  late DateTime clock;
  late List<Transaction> acceptedTxs;
  late List<Set<String>> unaccepted;
  late List<Set<String>> expired;
  late List<Set<String>> expiredAddresses;

  setUp(() {
    rpc = FakeRpcService();
    clock = DateTime(2026, 7, 30);
    acceptedTxs = [];
    unaccepted = [];
    expired = [];
    expiredAddresses = [];
  });

  void advance(Duration duration) => clock = clock.add(duration);

  TxMonitor makeMonitor({
    Set<String> walletIds = const {},
    bool Function(Transaction tx)? isWalletTx,
  }) {
    return TxMonitor(
      rpc: rpc,
      isWalletTxId: walletIds.contains,
      isWalletTx: isWalletTx ?? (_) => false,
      onTxsAccepted: (txs) async => acceptedTxs.addAll(txs),
      onTxsUnaccepted: (ids) async => unaccepted.add(ids),
      onWatchesExpired: (ids) async => expired.add(ids),
      onOutpointsExpired: (addresses) async => expiredAddresses.add(addresses),
      now: () => clock,
    );
  }

  test('acceptance of unrelated ids does not pull', () async {
    final monitor = makeMonitor();

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['other']}),
    );

    expect(rpc.pullStartHashes, isEmpty);
    expect(acceptedTxs, isEmpty);
  });

  test('watched id acceptance pulls from anchor and delivers', () async {
    final monitor = makeMonitor();
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    advance(const Duration(seconds: 1));
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );

    expect(rpc.pullStartHashes, ['b0']);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1']);

    await monitor.onVirtualChainChanged(
      vcc(added: ['b2'], accepted: {'b2': ['tx1']}),
    );
    expect(rpc.pullStartHashes, hasLength(1));
  });

  test('watch registered after the acceptance notification still pulls',
      () async {
    final monitor = makeMonitor();
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    advance(const Duration(seconds: 1));
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );
    expect(rpc.pullStartHashes, isEmpty);

    await monitor.watch('tx1');

    expect(rpc.pullStartHashes, ['b0']);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1']);
  });

  test('wallet tx id acceptance pulls without a watch', () async {
    final monitor = makeMonitor(walletIds: {'tx1'});
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );

    expect(rpc.pullStartHashes, ['b0']);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1']);
  });

  test('pulled segment delivers unwatched txs relevant by body', () async {
    final monitor = makeMonitor(
      isWalletTx: (tx) => tx.outputs.any(
        (output) => output.scriptPublicKeyAddress == 'kaspa:mine',
      ),
    );
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
      chainBlock('b2', [
        makeTx('txReceive', toAddress: 'kaspa:mine'),
        makeTx('txOther'),
      ]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1', 'b2'], accepted: {'b1': ['tx1']}),
    );

    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1', 'txReceive']);
  });

  test('overlapping pulls do not redeliver', () async {
    final monitor = makeMonitor(walletIds: {'tx1', 'tx2'});
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );

    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
      chainBlock('b2', [makeTx('tx2')]),
    ]);
    await monitor.onVirtualChainChanged(
      vcc(added: ['b2'], accepted: {'b2': ['tx2']}),
    );

    expect(rpc.pullStartHashes, hasLength(2));
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1', 'tx2']);
  });

  test('reorg un-accepts delivered txs and re-watches them', () async {
    final monitor = makeMonitor();
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1']);

    await monitor.onVirtualChainChanged(vcc(added: ['b2'], removed: ['b1']));
    expect(unaccepted, isEmpty);

    advance(const Duration(seconds: 3));
    await monitor.onVirtualChainChanged(vcc(added: ['b2b']));
    expect(unaccepted, [{'tx1'}]);

    rpc.segmentBuilder = (_) => segment([
      chainBlock('b3', [makeTx('tx1')]),
    ]);
    await monitor.onVirtualChainChanged(
      vcc(added: ['b3'], accepted: {'b3': ['tx1']}),
    );
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1', 'tx1']);
  });

  test('quick re-acceptance within the reorg grace period never unaccepts',
      () async {
    final monitor = makeMonitor();
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1']);

    await monitor.onVirtualChainChanged(vcc(added: ['b2'], removed: ['b1']));
    expect(unaccepted, isEmpty);

    rpc.segmentBuilder = (_) => segment([
      chainBlock('b3', [makeTx('tx1')]),
    ]);
    await monitor.onVirtualChainChanged(
      vcc(added: ['b3'], accepted: {'b3': ['tx1']}),
    );

    advance(const Duration(seconds: 3));
    await monitor.onVirtualChainChanged(vcc(added: ['b4']));

    expect(unaccepted, isEmpty);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx1', 'tx1']);
  });

  test('unresolved watches expire to the fallback', () async {
    final monitor = makeMonitor();

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    advance(const Duration(seconds: 61));
    await monitor.onVirtualChainChanged(vcc(added: ['b1']));

    expect(expired, [{'tx1'}]);
    expect(rpc.pullStartHashes, isEmpty);
  });

  test('pull failure keeps watches and re-anchors', () async {
    final monitor = makeMonitor();
    rpc.error = Exception('start hash not in chain');

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );

    expect(rpc.pullStartHashes, ['b0']);
    expect(expired, isEmpty);

    rpc.error = null;
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b3', [makeTx('tx2')]),
    ]);
    advance(const Duration(seconds: 61));
    await monitor.onVirtualChainChanged(vcc(added: ['b2']));
    expect(expired, [{'tx1'}]);

    await monitor.watch('tx2');
    await monitor.onVirtualChainChanged(
      vcc(added: ['b3'], accepted: {'b3': ['tx2']}),
    );
    expect(rpc.pullStartHashes, ['b0', 'b2']);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['tx2']);
  });

  test('watched outpoint spend pulls and delivers the unknown spender',
      () async {
    final monitor = makeMonitor();
    final outpoint = Outpoint(transactionId: 'txPrev', index: 1);
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('txSpend', spends: [outpoint])]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watchSpentUtxos([makeUtxo(outpoint)]);

    expect(rpc.pullStartHashes, ['b0']);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['txSpend']);
  });

  test('outpoint watch survives a failed pull and retries on the next '
      'notification', () async {
    final monitor = makeMonitor();
    final outpoint = Outpoint(transactionId: 'txPrev', index: 0);
    rpc.error = Exception('node unreachable');

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watchSpentUtxos([makeUtxo(outpoint)]);
    expect(rpc.pullStartHashes, ['b0']);
    expect(acceptedTxs, isEmpty);

    rpc.error = null;
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('txSpend', spends: [outpoint])]),
    ]);
    advance(const Duration(seconds: 2));
    await monitor.onVirtualChainChanged(vcc(added: ['b1']));

    expect(rpc.pullStartHashes, ['b0', 'b1']);
    expect(acceptedTxs.map((tx) => tx.transactionId), ['txSpend']);

    await monitor.onVirtualChainChanged(vcc(added: ['b2']));
    expect(rpc.pullStartHashes, hasLength(2));
  });

  test('unresolved outpoint watches expire to the address fallback', () async {
    final monitor = makeMonitor();
    final outpoint = Outpoint(transactionId: 'txPrev', index: 0);
    rpc.segmentBuilder = (_) => segment([]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watchSpentUtxos([makeUtxo(outpoint)]);
    expect(rpc.pullStartHashes, hasLength(1));

    await monitor.watchSpentUtxos([makeUtxo(outpoint)]);
    expect(rpc.pullStartHashes, hasLength(1));

    advance(const Duration(seconds: 31));
    await monitor.onVirtualChainChanged(vcc(added: ['b1']));
    expect(expired, isEmpty);
    expect(expiredAddresses, [{'kaspa:mine'}]);

    rpc.segmentBuilder = (_) => segment([
      chainBlock('b2', [makeTx('txSpend', spends: [outpoint])]),
    ]);
    await monitor.watchSpentUtxos([
      makeUtxo(Outpoint(transactionId: 'txOther', index: 0)),
    ]);
    expect(rpc.pullStartHashes, hasLength(2));
    expect(acceptedTxs, isEmpty);
  });

  test('anchor lags behind the chain tip', () async {
    final monitor = makeMonitor(walletIds: {'tx1'});
    rpc.segmentBuilder = (_) => segment([]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    advance(const Duration(seconds: 10));
    await monitor.onVirtualChainChanged(vcc(added: ['b1']));
    advance(const Duration(seconds: 10));
    await monitor.onVirtualChainChanged(vcc(added: ['b2']));
    advance(const Duration(seconds: 10));
    await monitor.onVirtualChainChanged(
      vcc(added: ['b3'], accepted: {'b3': ['tx1']}),
    );

    expect(rpc.pullStartHashes, ['b1']);
  });

  test('wallet hit missed by the pull expires to the fallback', () async {
    final monitor = makeMonitor(walletIds: {'tx1'});
    rpc.segmentBuilder = (_) => segment([]);

    await monitor.onVirtualChainChanged(
      vcc(added: ['b0'], accepted: {'b0': ['tx1']}),
    );
    expect(rpc.pullStartHashes, ['b0']);
    expect(acceptedTxs, isEmpty);

    advance(const Duration(seconds: 61));
    await monitor.onVirtualChainChanged(vcc(added: ['b1']));

    expect(expired, [{'tx1'}]);
  });

  test('disposed monitor stops delivering', () async {
    final monitor = makeMonitor();
    rpc.segmentBuilder = (_) => segment([
      chainBlock('b1', [makeTx('tx1')]),
    ]);

    await monitor.onVirtualChainChanged(vcc(added: ['b0']));
    await monitor.watch('tx1');
    monitor.dispose();
    await monitor.onVirtualChainChanged(
      vcc(added: ['b1'], accepted: {'b1': ['tx1']}),
    );

    expect(acceptedTxs, isEmpty);
  });
}
