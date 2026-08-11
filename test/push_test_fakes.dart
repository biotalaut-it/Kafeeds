import 'package:kaspium_wallet/push/push_clock_offset.dart';

class MemoryClockOffsetStore implements ClockOffsetStore {
  @override
  int offsetMs;

  MemoryClockOffsetStore([this.offsetMs = 0]);

  @override
  Future<void> save(int offsetMs) async => this.offsetMs = offsetMs;
}
