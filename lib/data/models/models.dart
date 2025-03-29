class Surahs {
  final int number;
  final String name;
  final String type;
  final List<Ayat> verses;
  Surahs(this.number, this.name, this.type, this.verses);

  factory Surahs.fromData(Map<String, dynamic> data) {
    return Surahs(
      data['id'] as int ?? 0,
      data['name'] as String ?? '',
      data['type'] as String ?? '',
      (data['verses'] as List).map((e) => Ayat.fromData(e)).toList() ?? [],
    );
  }
}

class Ayat {
  final int id;
  final String text;
  Ayat(this.id, this.text);
  factory Ayat.fromData(Map<String, dynamic> data) {
    return Ayat(data['id'] ?? 0, data['text'] ?? '');
  }
}
