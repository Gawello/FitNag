class Tempo {
  final int eccentric;
  final int pause;
  final int concentric;
  final int top;

  const Tempo({
    required this.eccentric,
    required this.pause,
    required this.concentric,
    required this.top,
  });

  static const defaultTempo = Tempo(eccentric: 2, pause: 1, concentric: 1, top: 0);

  int get totalSeconds => eccentric + pause + concentric + top;

  String get display => '$eccentric-$pause-$concentric-$top';

  bool get isApplicable => totalSeconds > 0;

  String get phaseDescription =>
      '${eccentric}s down, ${pause}s hold, ${concentric}s up, ${top}s top';

  factory Tempo.parse(String s) {
    final parts = s.split('-');
    if (parts.length != 4) return defaultTempo;
    return Tempo(
      eccentric: int.tryParse(parts[0]) ?? 2,
      pause: int.tryParse(parts[1]) ?? 1,
      concentric: int.tryParse(parts[2]) ?? 1,
      top: int.tryParse(parts[3]) ?? 0,
    );
  }

  @override
  String toString() => display;
}
