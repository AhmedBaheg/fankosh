import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'selected_plan_features_card.dart';

/// Card 1 of Review Subscription screen: Selected Plan Details Card.
/// - Shows plan title, subtitle, price, pill badge ("★ الأكثر اختيارًا"), link to change plan ("تغيير الباقة ←")
/// - Inner card with 2 rows: microphone icon + attempts, calendar icon + validity
class ReviewSelectedPlanCard extends StatelessWidget {
  const ReviewSelectedPlanCard({
    super.key,
    required this.plan,
    this.onChangePlan,
  });

  final SubscriptionPlanModel plan;
  final VoidCallback? onChangePlan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x081B1C1C),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color(0x1FFFAE00),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1 (RTL): Tag Badge on right, Change Plan Link on left
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Badge: "★ الأكثر اختيارًا" (or badge tag)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryGoldBorder,
                  borderRadius: BorderRadius.circular(9999),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowSubtle,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '★',
                      style: GoogleFonts.alexandria(
                        fontSize: 10.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      plan.badgeTag?.replaceAll('⭐', '').trim() ??
                          'الأكثر اختيارًا',
                      style: GoogleFonts.alexandria(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                        height: 16 / 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Change Plan Link ("تغيير الباقة ←")
              GestureDetector(
                onTap: onChangePlan,
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icLeft,
                      width: 10.w,
                      height: 10.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'تغيير الباقة',
                      style: GoogleFonts.alexandria(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                        height: 16 / 12,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Row 2 (RTL): Title & Subtitle on right, Price on left
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title & Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    plan.title,
                    style: GoogleFonts.alexandria(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textHeaderDark,
                      height: 30 / 20,
                    ),
                  ),
                  Text(
                    'الاشتراك الشهري المميز',
                    style: GoogleFonts.alexandria(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMutedBrown,
                      height: 14 / 11,
                    ),
                  ),
                ],
              ),

              // Price (350 جنيه)
              Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${plan.price}',
                    style: GoogleFonts.alexandria(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryGold,
                      height: 40 / 28,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'جنيه',
                    style: GoogleFonts.alexandria(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      letterSpacing: 0.24,
                      height: 16 / 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Inner Gray Card: Quota & Validity
          SelectedPlanFeaturesCard(
            attempts: plan.attempts,
            validityDays: plan.validityDays,
          ),
        ],
      ),
    );
  }
}
