/// Data model representing an individual onboarding slide.
class OnBoardingPageModel {
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final String title;
  final String highlightText;
  final bool isHighlightFirst;
  final String subtitle;

  const OnBoardingPageModel({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    required this.highlightText,
    required this.isHighlightFirst,
    required this.subtitle,
  });
}
