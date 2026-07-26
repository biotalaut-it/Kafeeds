import '../../database/boxes.dart';
import 'tx_sync_types.dart';

class AddressTxSyncStore {
  final TypedBox<AddressTxSync> _box;

  const AddressTxSyncStore(this._box);

  bool get isEmpty => _box.isEmpty;

  int get length => _box.length;

  Map<String, AddressTxSync> get records => _box.getAll();

  AddressTxSync? tryGet(String address) => _box.tryGet(address);

  AddressTxSync get(String address) =>
      _box.tryGet(address) ?? AddressTxSync(address: address);

  Future<void> save(AddressTxSync record) => _box.set(record.address, record);

  Future<void> saveAll(Iterable<AddressTxSync> records) => _box.setAll({
    for (final record in records) record.address: record,
  });

  Future<void> removeAll(Iterable<String> addresses) =>
      _box.removeAll(addresses);

  Future<int> clear() => _box.clear();
}
