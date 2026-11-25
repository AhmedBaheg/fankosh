import 'package:fankosh/core/shared_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/subscription_details_model.dart';
import 'active_plan_badge.dart';
import 'current_subscription_card.dart';
import 'plan_details_bottom_bar.dart';
import 'plan_details_header.dart';
import 'remaining_attempts_card.dart';
import 'subscription_info_card.dart';

/// Main body layout for Plan Details (تفاصيل الباقة) screen.
///
/// Corresponds to Figma Plan Details Screen:
/// - [AppHeaderBar] (Shared App Header)
/// - Back Button (40x40 circular white button) + Centered Title & Subtitle
/// - Section 1: Active Plan Card reusing [CurrentSubscriptionCard] + [ActivePlanBadge]
/// - Section 2: Remaining Attempts reusing [RemainingAttemptsCard]
/// - Section 3: Subscription Information [SubscriptionInfoCard]
/// - Section 4: Bottom Action Button reusing [PrimaryButton]
class PlanDetailsViewBody extends StatelessWidget {
  const PlanDetailsViewBody({
    super.key,
    this.details = const SubscriptionDetailsModel(),
    this.onRenewPressed,
  });

  final SubscriptionDetailsModel details;
  final VoidCallback? onRenewPressed;

  void _onRenew(BuildContext context) {
    if (onRenewPressed != null) {
      onRenewPressed!();
    } else {
      Navigator.pushNamed(context, Routes.bundlesView);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          // Shared Top Header Bar
          const AppHeaderBar(),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Space 28
                  SizedBox(height: 28.h),

                  // Header Section: Back Button (right) + Centered Title & Subtitle
                  PlanDetailsHeader(
                    title: l10n.planDetailsTitle,
                    subtitle: l10n.planDetailsSubtitle,
                  ),

                  // Space 12
                  SizedBox(height: 12.h),

                  // Section 1: Active Plan Card
                  CurrentSubscriptionCard(
                    planName: details.planName,
                    planQuota: details.planQuota,
                    showBottomBoxes: false,
                    badge: ActivePlanBadge(
                      text: details.badgeText,
                      isActive: details.isActive,
                    ),
                  ),

                  // Space 24
                  SizedBox(height: 24.h),

                  // Section 2: Remaining Attempts Card
                  RemainingAttemptsCard(
                    title: l10n.attemptsBalanceTitle,
                    remainingAttempts: details.remainingAttempts,
                    totalAttempts: details.totalAttempts,
                    counterSuffix:
                        '${l10n.attemptsRemainingOutOf} ${details.totalAttempts}',
                    percentageOnLeft: true,
                    showInfoIcon: true,
                    showCircleIconBackground: false,
                  ),

                  // Space 16
                  SizedBox(height: 16.h),

                  // Section 3: Subscription Information Card
                  SubscriptionInfoCard(
                    activationDate: details.activationDate,
                    expiryDate: details.expiryDate,
                    duration: details.duration,
                    amountPaid: details.amountPaid,
                    currency: details.currency,
                  ),

                  // Bottom padding inside scroll area
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),

          // Section 4: Bottom Action Button (docked at the end of screen)
          PlanDetailsBottomBar(
            buttonText: l10n.renewOrChangePlan,
            onPressed: () => _onRenew(context),
          ),
        ],
      ),
    );
  }
}
