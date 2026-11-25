import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/shared_widgets/attempts_badge.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'benefits_trio_row.dart';

/// Main body layout component for Page 25 (Free Attempts Exhausted Screen).
/// - Mascot Illustration: trials_finished.png
/// - Title: "القفشات ببلاش خلصت!" in Alexandria 28sp Bold (#1B1C1C, letter-spacing: -0.7)
/// - Subtitle: "بس لسه عندنا ضحك كتير!\nاختار باقتك وكمّل مع فانكوش." in Alexandria 16sp Regular (#4E4633)
/// - Benefits Trio: 3 cards (قفشات أكتر, محاولات أكتر, ضحك مكمّل)
/// - Primary CTA: "اكتشف الباقات" with star icon in Alexandria 14sp Bold (#150E16)
/// - Secondary Link: "مش دلوقتي" in Alexandria 14sp Medium (#4E4633)
class AttemptsExhaustedViewBody extends StatelessWidget {
  const AttemptsExhaustedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final titleText = l10n?.attemptsExhaustedTitle ?? 'القفشات ببلاش خلصت!';
    final sub1 = l10n?.attemptsExhaustedSubtitle1 ?? 'بس لسه عندنا ضحك كتير!';
    final sub2 = l10n?.attemptsExhaustedSubtitle2 ?? 'اختار باقتك وكمّل مع فانكوش.';
    final explorePlansText = l10n?.explorePlans ?? 'اكتشف الباقات';
    final notNowText = l10n?.notNow ?? 'مش دلوقتي';

    return Column(
      children: [
        // 1. Shared App Header (Logo, Profile, Notification)
        const AppHeaderBar(),

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 8.h),

                // 2. Attempts Counter Badge ("0 محاولات ⚡")
                const AttemptsBadge(attemptsCount: 0),
                SizedBox(height: 46.h),

                // 3. Sad Mascot Character Sticker (trials_finished.png)
                Center(
                  child: Image.asset(
                    AppAssets.trialsFinished,
                    width: 200.w,
                    height: 190.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 26.h),

                // 4. Main Title ("القفشات ببلاش خلصت!")
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    titleText,
                    style: AppStyles.alexandria(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimaryDark,
                      height: 36 / 28,
                      letterSpacing: -0.7,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 31.h),

                // 5. Subtitle ("بس لسه عندنا ضحك كتير!\nاختار باقتك وكمّل مع فانكوش.")
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    '$sub1\n$sub2',
                    style: AppStyles.alexandria(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                      height: 26 / 16,
                      letterSpacing: 0.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 26.h),

                // 6. Benefits Trio Row ("قفشات أكتر", "محاولات أكتر", "ضحك مكمّل")
                const BenefitsTrioRow(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),

        // 7. Primary CTA ("اكتشف الباقات") & Secondary Link ("مش دلوقتي")
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Primary CTA Pill Button ("اكتشف الباقات")
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.subscriptionPlansView);
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary, // #FEC529
                    borderRadius: BorderRadius.circular(9999),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.starIcon,
                        width: 18.w,
                        height: 18.h,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        explorePlansText,
                        style: AppStyles.alexandria(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 20 / 14,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              // Secondary Text Button ("مش دلوقتي")
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.homeView);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 38.h),
                ),
                child: Text(
                  notNowText,
                  style: AppStyles.alexandria(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    height: 22 / 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
