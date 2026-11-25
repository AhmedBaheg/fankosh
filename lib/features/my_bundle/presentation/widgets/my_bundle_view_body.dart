import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../data/models/subscription_details_model.dart';
import 'current_subscription_card.dart';
import 'remaining_attempts_card.dart';
import 'subscription_actions_card.dart';
import 'subtle_upgrade_banner.dart';

/// Main body layout for "باقتي" (My Bundle) screen (Tab 1 in Home Bottom Navigation).
///
/// Corresponds to Figma My Bundle Screen:
/// - Header Bar (AppHeaderBar)
/// - Title: "باقتي" (Alexandria 28sp Bold, #1B1C1C)
/// - Subtitle: "كل تفاصيل اشتراكك مع فانكوش" (Alexandria 14sp SemiBold, #4E4633)
/// - Section 1: [CurrentSubscriptionCard]
/// - Section 2: [RemainingAttemptsCard] (with dynamic progress)
/// - Section 3: [SubscriptionActionsCard] (details & renew)
/// - Section 4: [SubtleUpgradeBanner] (upgrade CTA)
class MyBundleViewBody extends StatelessWidget {
  const MyBundleViewBody({
    super.key,
    this.planName = 'فانكوش بلس',
    this.planQuota = '40 محاولة • 30 يوم',
    this.amountPaid = '350 ج.م',
    this.expiryDate = '15 نوفمبر 2026',
    this.remainingAttempts = 28,
    this.totalAttempts = 40,
    this.onExplorePlans,
  });

  final String planName;
  final String planQuota;
  final String amountPaid;
  final String expiryDate;
  final int remainingAttempts;
  final int totalAttempts;
  final VoidCallback? onExplorePlans;

  void _navigateToPlans(BuildContext context) {
    if (onExplorePlans != null) {
      onExplorePlans!();
    } else {
      Navigator.pushNamed(context, Routes.bundlesView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // Shared Top Header Bar (Notifications, Logo, Profile)
          const AppHeaderBar(),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 90.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Space 28
                  SizedBox(height: 28.h),

                  // Main Title: "باقتي"
                  Text(
                    'باقتي',
                    style: AppStyles.alexandria(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      height: 36 / 28,
                      letterSpacing: -0.7,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),

                  // Subtitle: "كل تفاصيل اشتراكك مع فانكوش"
                  Text(
                    'كل تفاصيل اشتراكك مع فانكوش',
                    style: AppStyles.alexandria(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      height: 20 / 14,
                      letterSpacing: 0.14,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // Space 24
                  SizedBox(height: 24.h),

                  // Section 1: Current Subscription Card
                  CurrentSubscriptionCard(
                    planName: planName,
                    planQuota: planQuota,
                    amountPaid: amountPaid,
                    expiryDate: expiryDate,
                  ),

                  // Space 16
                  SizedBox(height: 16.h),

                  // Section 2: Remaining Attempts Card
                  RemainingAttemptsCard(
                    remainingAttempts: remainingAttempts,
                    totalAttempts: totalAttempts,
                  ),

                  // Space 16
                  SizedBox(height: 16.h),

                  // Section 3: Subscription Actions Card
                  SubscriptionActionsCard(
                    onDetailsPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.bundleDetailsView,
                        arguments: SubscriptionDetailsModel(
                          planName: planName,
                          planQuota: planQuota,
                          amountPaid: amountPaid.replaceAll(' ج.م', '').trim(),
                          expiryDate: expiryDate,
                          remainingAttempts: remainingAttempts,
                          totalAttempts: totalAttempts,
                        ),
                      );
                    },
                    onRenewPressed: () {
                      _navigateToPlans(context);
                    },
                  ),

                  // Space 16
                  SizedBox(height: 16.h),

                  // Section 4: Subtle Upgrade Banner
                  SubtleUpgradeBanner(
                    onUpgradePressed: () => _navigateToPlans(context),
                  ),

                  // Space 43
                  SizedBox(height: 43.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
