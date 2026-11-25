/// Model representing the dynamic data displayed on the Plan Details screen.
class SubscriptionDetailsModel {
  const SubscriptionDetailsModel({
    this.planName = 'فانكوش بلس',
    this.planQuota = '40 محاولة • 30 يوم',
    this.badgeText = 'نشطة',
    this.isActive = true,
    this.remainingAttempts = 28,
    this.totalAttempts = 40,
    this.activationDate = '15 أكتوبر 2026',
    this.expiryDate = '14 نوفمبر 2026',
    this.duration = '30 يوم',
    this.amountPaid = '350',
    this.currency = 'جنيه',
  });

  final String planName;
  final String planQuota;
  final String badgeText;
  final bool isActive;
  final int remainingAttempts;
  final int totalAttempts;
  final String activationDate;
  final String expiryDate;
  final String duration;
  final String amountPaid;
  final String currency;

  SubscriptionDetailsModel copyWith({
    String? planName,
    String? planQuota,
    String? badgeText,
    bool? isActive,
    int? remainingAttempts,
    int? totalAttempts,
    String? activationDate,
    String? expiryDate,
    String? duration,
    String? amountPaid,
    String? currency,
  }) {
    return SubscriptionDetailsModel(
      planName: planName ?? this.planName,
      planQuota: planQuota ?? this.planQuota,
      badgeText: badgeText ?? this.badgeText,
      isActive: isActive ?? this.isActive,
      remainingAttempts: remainingAttempts ?? this.remainingAttempts,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      activationDate: activationDate ?? this.activationDate,
      expiryDate: expiryDate ?? this.expiryDate,
      duration: duration ?? this.duration,
      amountPaid: amountPaid ?? this.amountPaid,
      currency: currency ?? this.currency,
    );
  }
}
