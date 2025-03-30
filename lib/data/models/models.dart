class Surahs {
  final int number;
  final String name;
  final String type;
  final List<AyatModel> verses;
  Surahs(this.number, this.name, this.type, this.verses);

  factory Surahs.fromData(Map<String, dynamic> data) {
    return Surahs(
      data['id'] as int ?? 0,
      data['name'] as String ?? '',
      data['type'] as String ?? '',
      (data['verses'] as List).map((e) => AyatModel.fromData(e)).toList() ?? [],
    );
  }
}

class AyatModel {
  final int id;
  final String text;
  AyatModel(this.id, this.text);
  factory AyatModel.fromData(Map<String, dynamic> data) {
    return AyatModel(data['id'] ?? 0, data['text'] ?? '');
  }
}
