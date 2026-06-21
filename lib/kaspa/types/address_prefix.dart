enum AddressPrefix {
  unknown,
  kaspa,
  kaspaTest,
  kaspaDev,
  kaspaSim;

  static AddressPrefix parseBech32Prefix(String prefix) => switch (prefix) {
    'kaspa' => .kaspa,
    'kaspatest' => .kaspaTest,
    'kaspadev' => .kaspaDev,
    'kaspasim' => .kaspaSim,
    _ => .unknown,
  };

  @override
  String toString() => name.toLowerCase();
}
