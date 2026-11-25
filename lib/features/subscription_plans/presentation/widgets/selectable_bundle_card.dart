import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bundle_radio_indicator.dart';

/// Selectable bundle card with custom radio button matching Figma specs:
/// - width: 359, height: ~88 (unselected) / 76-88 (selected)
/// - border-radius: 18px, padding: 16px, background: #FFFFFF
/// - Unselected: custom radio #E5E2E1 with 10x10 white center, no border
/// - Selected: custom radio #FEC529 with 10x10 white center, 1.5px gold border (#FEC529), orange price (#FE9311)
class SelectableBundleCard extends StatelessWidget {
  const SelectableBundleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.currency = 'جنيه',
    this.billingCycle,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String price;
  final String currency;
  final String? billingCycle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 359.w),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : AppColors.shadowLight,
              blurRadius: isSelected ? 12 : 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Right Side (RTL): Custom Radio + Plan Title & Quota
            Row(
              textDirection: TextDirection.rtl,
              children: [
                // Custom Radio (20x20 outer, 10x10 inner)
                BundleRadioIndicator(isSelected: isSelected),
                SizedBox(width: 12.w),

                // Title & Subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.alexandria(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textHeaderDark,
                        height: 26 / 18,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppStyles.alexandria(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                        height: 14 / 11,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),

            // Left Side (RTL): Price + Currency (+ Billing Cycle if provided)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      price,
                      style: AppStyles.alexandria(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? AppColors.primaryDark
                            : AppColors.textHeaderDark,
                        height: 30 / 22,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      currency,
                      style: AppStyles.alexandria(
                        fontSize: isSelected ? 11.sp : 10.sp,
                        fontWeight: isSelected
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: isSelected
                            ? AppColors.textNavMuted
                            : AppColors.textSecondary.withValues(alpha: 0.8),
                        height: 14 / 11,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                if (billingCycle != null) ...[
                  SizedBox(height: 1.h),
                  Text(
                    billingCycle!,
                    style: AppStyles.alexandria(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary.withValues(alpha: 0.8),
                      height: 14 / 10,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
