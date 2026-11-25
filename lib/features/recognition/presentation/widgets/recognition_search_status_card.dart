import 'package:fankosh/core/theme/app_text_styles.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// AI Voice Message Searching Card component (Figma Page 8).
///
/// Designed as a left-aligned speech bubble matching exact Figma specifications:
/// - Outer Bubble: width: 269.58.w, minHeight: 309.88.h, borderRadius: 16.r, bg: #FFFFFF
/// - Border: 1px solid #E8E2D4B2, Box Shadow: 0px 1px 2px #0000000D
/// - Header: "فانكوش الذكي ✨" pill badge & "جارٍ التعرف" status in Alexandria 11sp (#807660)
/// - Title: "استنى.." (Alexandria 17sp Bold, #1B1C1C)
/// - Subtitle: "بنحضرلك رد جامد ! 🎬" (Alexandria 16sp Regular, #4E4633)
/// - Minimal Searching Card: 219.58.w x 150.5.h, #FFFBF0 with #F4E6C0 border
/// - Overlay Icon: 48x48 circle #FFC92840 with magnifying search glass
/// - Searching Headline: "بندور على الإفيه المناسب.." (Alexandria 15sp SemiBold, #1B1C1C)
/// - 3 Animated Indicator Dots: 10x10 (#815600, #FFAE00, #FFC928)
class RecognitionSearchStatusCard extends StatefulWidget {
  const RecognitionSearchStatusCard({super.key});

  @override
  State<RecognitionSearchStatusCard> createState() =>
      _RecognitionSearchStatusCardState();
}

class _RecognitionSearchStatusCardState
    extends State<RecognitionSearchStatusCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _dotController;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  Widget _buildDot(int index, Color color) {
    return AnimatedBuilder(
      animation: _dotController,
      builder: (context, _) {
        final double progress = (_dotController.value + (index * 0.25)) % 1.0;
        final double scale = 0.82 + 0.36 * math.sin(progress * math.pi);
        final double opacity = 0.55 + 0.45 * math.sin(progress * math.pi);

        return Transform.scale(
          scale: scale.clamp(0.8, 1.2),
          child: Opacity(
            opacity: opacity.clamp(0.4, 1.0),
            child: Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final recognizingText = l10n?.recognizingStatus ?? 'جارٍ التعرف';
    final waitText = l10n?.waitTitle ?? 'استنى..';
    final replyText = l10n?.preparingReplySubtitle ?? 'بنحضرلك رد جامد ! 🎬';
    final searchingText =
        l10n?.searchingForPunchline ?? 'بندور على الإفيه المناسب..';
    final smartBadgeText = l10n?.smartFankoshBadge ?? 'فانكوش الذكي';

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          width: 270.w,
          constraints: BoxConstraints(minHeight: 310.h),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: AppColors.surface, // #FFFFFF
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.aiBubbleBorder, // #E8E2D4B2
              width: 1.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSubtleBlack, // 0px 1px 2px 0px #0000000D
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Top Header Row: AI Badge & "جارٍ التعرف"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Soft gold AI pill badge on right in RTL
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.userBubbleBackground, // #FEF0CE
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.sparklesIcon,
                          width: 12.w,
                          height: 12.h,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primaryExtraDark, // #815600
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          smartBadgeText,
                          style: AppStyles.alexandria(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryExtraDark, // #815600
                            height: 14 / 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // "جارٍ التعرف" Status Caption
                  Flexible(
                    child: Text(
                      recognizingText,
                      style: AppStyles.alexandria(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrayBrown, // #807660
                        height: 14 / 11,
                      ),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Subtle divider line
              const Divider(height: 1, thickness: 1, color: AppColors.borderF3ECE1),
              SizedBox(height: 14.h),

              // 2. Headline: "استنى.."
              Text(
                waitText,
                style: AppStyles.alexandria(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textHeaderDark,
                  height: 23.38 / 17,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 4.h),

              // 3. Subtitle: "بنحضرلك رد جامد ! 🎬"
              Text(
                replyText,
                style: AppStyles.alexandria(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 26 / 16,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 16.h),

              // 4. Minimal AI Searching Card (219.58 x 150.5, #FFFBF0 with #F4E6C0 border)
              Center(
                child: Container(
                  width: 220.w,
                  constraints: BoxConstraints(minHeight: 151.h),
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.aiSearchingCardBg, // #FFFBF0
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.aiSearchingCardBorder, // #F4E6C0
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Overlay Circle (48x48, #FFC92840) with search glass icon
                      Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.searchOverlayBg, // #FFC92840
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.searchMagnifierIcon,
                            width: 22.w,
                            height: 22.h,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primaryExtraDark,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      // "بندور على الإفيه المناسب.."
                      Text(
                        searchingText,
                        style: AppStyles.alexandria(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textHeaderDark,
                          height: 22.5 / 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),

                      // 3 indicator dots in exact design order: Left: #815600, Middle: #FFAE00, Right: #FFC928
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.ltr,
                        children: [
                          _buildDot(0, AppColors.primaryExtraDark),
                          SizedBox(width: 8.w),
                          _buildDot(1, AppColors.primaryGold),
                          SizedBox(width: 8.w),
                          _buildDot(2, AppColors.primaryGoldBorder),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
