import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'guarantees_banner.dart';
import 'order_summary_card.dart';
import 'review_selected_plan_card.dart';

/// Main body layout for Review Subscription screen ("راجع باقتك! 🎬").
class ReviewSubscriptionViewBody extends StatelessWidget {
  const ReviewSubscriptionViewBody({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanModel plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Header Bar
        const AppHeaderBar(),

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Space 23
                SizedBox(height: 23.h),

                // 1. Overlay Pill: "تأكيد الاشتراك"
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGoldBorder.withValues(alpha: 0.17),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'تأكيد الاشتراك',
                          style: AppStyles.alexandria(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryExtraDark,
                            height: 14 / 11,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(
                          AppAssets.ticketIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                      ],
                    ),
                  ),
                ),

                // Space 12
                SizedBox(height: 12.h),

                // 2. Title: "راجع باقتك! 🎬"
                Text(
                  'راجع باقتك! 🎬',
                  style: AppStyles.alexandria(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textHeaderDark,
                    height: 36 / 28,
                    letterSpacing: -0.7,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),

                // Subtitle: "خطوة واحدة وتكمّل رحلة الإفيهات."
                Text(
                  'خطوة واحدة وتكمّل رحلة الإفيهات.',
                  style: AppStyles.alexandria(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    height: 22 / 14,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Space 40
                SizedBox(height: 40.h),

                // 3. Card 1: Selected Plan Details
                ReviewSelectedPlanCard(
                  plan: plan,
                  onChangePlan: () {
                    Navigator.pop(context);
                  },
                ),

                // Space 16
                SizedBox(height: 16.h),

                // 4. Card 2: Order Summary
                OrderSummaryCard(plan: plan),

                // Space 16
                SizedBox(height: 16.h),

                // 5. Guarantees & Delighters Banner
                const GuaranteesBanner(),

                // Space 36
                SizedBox(height: 36.h),

                // 6. Action Button: "متابعة للدفع — 350 جنيه"
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.paymentView,
                      arguments: plan,
                    );
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: double.infinity,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary, // #FEC529
                      borderRadius: BorderRadius.circular(9999),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'متابعة للدفع — ${plan.price} جنيه',
                          style: AppStyles.alexandria(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            height: 26 / 16,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          AppAssets.checkCircleIcon,
                          width: 18.w,
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                ),

                // Space 12
                SizedBox(height: 12.h),

                // Footer Helper: "هيتم تفعيل باقتك بعد تأكيد الدفع بنجاح."
                Text(
                  'هيتم تفعيل باقتك بعد تأكيد الدفع بنجاح.',
                  style: AppStyles.alexandria(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    height: 14 / 11,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Space at bottom for scrolling
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
