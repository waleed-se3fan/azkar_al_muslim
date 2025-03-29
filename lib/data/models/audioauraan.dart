class AudioModel {
  final int id;
  final int chapterId;
  final double fileSize;
  final String format;
  final String audioUrl;

  AudioModel({
    required this.id,
    required this.chapterId,
    required this.fileSize,
    required this.format,
    required this.audioUrl,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['id'] ?? 0,
      chapterId: json['chapter_id'] ?? 0,
      fileSize: json['file_size'] ?? 0,
      format: json['format'] ?? '',
      audioUrl: json['audio_url'] ?? '',
    );
  }
}
