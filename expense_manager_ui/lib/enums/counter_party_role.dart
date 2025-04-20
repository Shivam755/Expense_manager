enum CounterPartyRole{ source, sink, both}

CounterPartyRole counterPartyRoleFromIndex(int index) {
  if (index < 0 || index >= CounterPartyRole.values.length) {
    throw ArgumentError('Invalid index: $index');
  }
  return CounterPartyRole.values[index];
}