class TafseerModel {
  final String id;
  final String sura;
  final String aya;
  final String arabic_text;
  final String translation;

  TafseerModel({
    required this.id,
    required this.sura,
    required this.aya,
    required this.arabic_text,
    required this.translation,
  });

  factory TafseerModel.fromJson(Map<String, dynamic> json) {
    return TafseerModel(
      id: json['id'] as String ?? '',
      sura: json['sura'] as String ?? '',
      aya: json['aya'] as String ?? '',
      arabic_text: json['arabic_text'] as String ?? '',
      translation: json['translation'] as String ?? '',
    );
  }
}
