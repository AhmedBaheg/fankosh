import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Credit Progress Indicators Card matching Figma:
/// - width: 342, height: 104, border-radius: 16
/// - background: #FFFBEBCC, border: 1px solid #FDE68ACC
/// - box-shadow: 0px 1px 2px 0px #0000000D
/// - Row of dynamic trial steps (1, 2, 3) connected by dividers
class RemainingAttemptsProgressCard extends StatelessWidget {
  const RemainingAttemptsProgressCard({
    super.key,
    required this.remainingAttempts,
    this.totalTrials = 3,
  });

  final int remainingAttempts;
  final int totalTrials;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 342.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.cardGoldTintFill.withValues(alpha: 0.8), // #FFFBEBCC
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.goldBorderTint.withValues(alpha: 0.8), // #FDE68ACC
          width: 1.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSubtle, // 0px 1px 2px 0px #0000000D
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 1; i <= totalTrials; i++) ...[
            TrialStepItem(
              stepNumber: i,
              isActive: i <= remainingAttempts,
            ),
            if (i < totalTrials)
              TrialStepDivider(
                isActive: (i + 1) <= remainingAttempts,
              ),
          ],
        ],
      ),
    );
  }
}

/// Single circular trial step indicator inside Credit Progress card.
class TrialStepItem extends StatelessWidget {
  const TrialStepItem({
    super.key,
    required this.stepNumber,
    required this.isActive,
  });

  final int stepNumber;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circular step node (48x48, border 2px white)
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isActive
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.trialActiveGradientStart,
                      AppColors.trialActiveGradientEnd,
                    ],
                  )
                : null,
            color: isActive ? null : AppColors.surfaceMuted,
            border: Border.all(
              color: isActive ? Colors.white : AppColors.borderLight,
              width: 2.0,
            ),
            boxShadow: isActive
                ? const [
                    BoxShadow(
                      color: AppColors.shadow1F,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            '$stepNumber',
            style: AppStyles.cairo(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: isActive
                  ? AppColors.textDarkNavyCharcoal
                  : AppColors.textDisabled,
              height: 20 / 16,
            ),
          ),
        ),
        SizedBox(height: 4.h),

        // Status Label: "متاحة" (Available) or "مستهلكة" (Used)
        Text(
          isActive ? 'متاحة' : 'مستهلكة',
          style: AppStyles.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: isActive
                ? AppColors.trialAmberText
                : AppColors.textDisabled,
            height: 16 / 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Horizontal divider line connecting trial step circles.
class TrialStepDivider extends StatelessWidget {
  const TrialStepDivider({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 2.h,
      margin: EdgeInsets.only(
        left: 6.w,
        right: 6.w,
        bottom: 20.h, // Vertically aligns with center of 48.h circle
      ),
      decoration: BoxDecoration(
        color: isActive ? AppColors.goldBorderTint : AppColors.borderLight,
        borderRadius: BorderRadius.circular(9999),
      ),
    );
  }
}
