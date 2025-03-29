class AudioQuraanModel {
  final int id;
  final String url;
  AudioQuraanModel(this.id, this.url);
  factory AudioQuraanModel.fromJson(Map<String, dynamic> data) {
    return AudioQuraanModel(data['chapter_id'], data['audio_url']);
  }
}
