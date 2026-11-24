/// Model representing the finalized recorded voice audio.
class RecordedAudioModel {
  const RecordedAudioModel({
    required this.id,
    required this.durationSeconds,
    required this.recordedAt,
    this.filePath,
  });

  final String id;
  final int durationSeconds;
  final DateTime recordedAt;
  final String? filePath;

  @override
  String toString() =>
      'RecordedAudioModel(id: $id, durationSeconds: $durationSeconds, recordedAt: $recordedAt)';
}
