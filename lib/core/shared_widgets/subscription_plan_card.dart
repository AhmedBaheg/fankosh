import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/subscription_plan_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/assets.dart';
import '../../l10n/app_localizations.dart';

/// Single interactive subscription plan card widget (Figma Frame 3).
class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  final SubscriptionPlanModel plan;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final quotaText = l10n?.quotaFormat(plan.attempts, plan.validityDays) ??
        '${plan.attempts} محاولة • صالحة لمدة ${plan.validityDays} يوم';
    final currencyText = l10n?.egpCurrency ?? 'ج.م';
    final badgeText = plan.badgeTag?.replaceAll('⭐', '').trim() ?? '';

    final effectiveBorderColor =
        isSelected ? AppColors.primaryGoldBorder : AppColors.border;

    return Stack(
      children: [
        // Main Container Card
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.only(
              top: (plan.isPopular && plan.badgeTag != null) ? 24.h : 16.h,
              bottom: 16.h,
              left: 20.w,
              right: 20.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: effectiveBorderColor,
                width: isSelected ? 2.0.w : 1.0.w,
              ),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  )
                else
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Row: Title, Badge & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Right side in RTL: Title & Optional Pill Badge
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          plan.title,
                          style: AppTextStyles.headlineSmall.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (plan.badgeTag != null && !plan.isPopular) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceMuted,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              plan.badgeTag!,
                              style: AppTextStyles.bodySmall.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Left side in RTL: Price & Currency
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${plan.price}',
                          style: AppTextStyles.priceValue.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w900,
                            color: isSelected
                                ? AppColors.primaryDark
                                : AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          currencyText,
                          style: AppTextStyles.priceCurrency.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 6.h),

                // Quota details ("20 محاولة • صالحة لمدة 30 يوم")
                Text(
                  quotaText,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textTertiary,
                  ),
                ),
                SizedBox(height: 12.h),

                // Divider line
                const Divider(
                  color: AppColors.divider,
                  thickness: 1,
                  height: 1,
                ),
                SizedBox(height: 10.h),

                // Bottom feature highlight
                Text(
                  plan.featureHighlight,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.primaryExtraDark
                        : AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Top Tag Badge ("الأكثر اختيارًا") with SVG ic_star
        if (plan.isPopular && plan.badgeTag != null)
          Positioned(
            top: 0.h,
            left: 17.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryDark.withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.icStar,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    badgeText,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
