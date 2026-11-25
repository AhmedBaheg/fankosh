/// Data model representing a subscription package plan.
class SubscriptionPlanModel {
  final String id;
  final String title;
  final int price;
  final int attempts;
  final int validityDays;
  final String featureHighlight;
  final String? badgeTag;
  final bool isPopular;

  const SubscriptionPlanModel({
    required this.id,
    required this.title,
    required this.price,
    required this.attempts,
    required this.validityDays,
    required this.featureHighlight,
    this.badgeTag,
    this.isPopular = false,
  });
}
