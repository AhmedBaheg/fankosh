/// Model representing the recognized joke punchline result returned by the recognition service.
class RecognitionResultModel {
  const RecognitionResultModel({
    required this.id,
    required this.userRecordingDuration,
    required this.responseAudioDuration,
    required this.createdAt,
    this.jokeTitle,
    this.jokeSubtitle,
  });

  final String id;
  final int userRecordingDuration;
  final int responseAudioDuration;
  final DateTime createdAt;
  final String? jokeTitle;
  final String? jokeSubtitle;
}
