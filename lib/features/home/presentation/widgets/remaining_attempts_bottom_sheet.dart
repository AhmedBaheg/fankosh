import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import 'remaining_attempts_discover_button.dart';
import 'remaining_attempts_header.dart';
import 'remaining_attempts_hero.dart';
import 'remaining_attempts_progress_card.dart';

/// Shows the Remaining Attempts bottom sheet dialog matching the Figma design.
Future<void> showRemainingAttemptsBottomSheet(
  BuildContext context, {
  int remainingAttempts = 3,
  int totalTrials = 3,
  VoidCallback? onDiscoverPackages,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.modalOverlayBarrier,
    builder: (context) => RemainingAttemptsBottomSheet(
      remainingAttempts: remainingAttempts,
      totalTrials: totalTrials,
      onDiscoverPackagesPressed: onDiscoverPackages,
    ),
  );
}

/// Remaining Attempts Bottom Sheet component matching Figma:
/// - width: 390, height: ~454.5, border-top-radius: 36
/// - background: #FFFFFF, shadow: 0px -10px 40px rgba(0, 0, 0, 0.18)
/// - Composed of modular widgets:
///   1. [RemainingAttemptsHeader]: Drag handle & close button
///   2. [RemainingAttemptsHero]: Glowing lightning badge, title & subtitle
///   3. [RemainingAttemptsProgressCard]: Credit progress card with dynamic trial steps
///   4. [RemainingAttemptsDiscoverButton]: Outlined CTA button
class RemainingAttemptsBottomSheet extends StatelessWidget {
  const RemainingAttemptsBottomSheet({
    super.key,
    this.remainingAttempts = 3,
    this.totalTrials = 3,
    this.onDiscoverPackagesPressed,
  });

  final int remainingAttempts;
  final int totalTrials;
  final VoidCallback? onDiscoverPackagesPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSheet, // 0px -10px 40px 0px #0000002E
            blurRadius: 40,
            offset: Offset(0, -10),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 28.h),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Header (Drag Handle + Close Button)
            const RemainingAttemptsHeader(),
            SizedBox(height: 18.h),

            // 2. Hero (Glowing Badge + Title + Subtitle)
            RemainingAttemptsHero(
              remainingAttempts: remainingAttempts,
            ),
            SizedBox(height: 24.h),

            // 3. Credit Progress Indicators Card
            RemainingAttemptsProgressCard(
              remainingAttempts: remainingAttempts,
              totalTrials: totalTrials,
            ),
            SizedBox(height: 24.h),

            // 4. Discover Packages CTA Button
            RemainingAttemptsDiscoverButton(
              onPressed: onDiscoverPackagesPressed,
            ),
          ],
        ),
      ),
    );
  }
}
