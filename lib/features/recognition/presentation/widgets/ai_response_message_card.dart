import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Card displaying AI punchline match message (Figma Pages 9 & 10).
/// Aligned Left in RTL to match Fankoosh AI speech bubble design:
/// - Outer Bubble: width: 270.w, borderRadius: 16.r, bg: #FFFFFF
/// - Border: 1px solid #E8E2D4B2, Box Shadow: 0px 1px 2px #0000000D
/// - AI Badge: soft gold pill (#FFF2C6) with sparkle icon and Alexandria 11sp SemiBold (#815600)
/// - Headline: "أيووووه! قفشت الإفيه! 😍" in Alexandria 17sp Bold (#1B1C1C)
/// - Subtitle: "استنى بقى... اسمع دي! 😂" in Alexandria 14sp Regular (#4E4633)
class AiResponseMessageCard extends StatelessWidget {
  const AiResponseMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final smartBadgeText = l10n?.smartFankoshBadge ?? 'فانكوش الذكي ✨';
    final headlineText = l10n?.foundPunchlineTitle ?? 'أيووووه! قفشت الإفيه! 😍';
    final subtitleText = l10n?.listenToThisSubtitle ?? 'استنى بقى... اسمع دي! 😂';

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          width: 270.w,
          constraints: BoxConstraints(maxWidth: 308.w),
          padding: EdgeInsets.only(
            top: 14.h,
            right: 18.w,
            bottom: 18.h,
            left: 18.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.aiBubbleBorder, // #E8E2D4B2
              width: 1.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000), // 0px 1px 2px 0px #0000000D
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // AI Badge Pill on right in RTL
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2C6), // Soft gold pill #FFF2C6
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
                          Color(0xFF815600),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        smartBadgeText,
                        style: GoogleFonts.alexandria(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF815600),
                          height: 14 / 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Headline ("أيووووه! قفشت الإفيه! 😍")
              Text(
                headlineText,
                style: GoogleFonts.alexandria(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1B1C1C),
                  height: 24 / 17,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 6.h),

              // Subtitle ("استنى بقى... اسمع دي! 😂")
              Text(
                subtitleText,
                style: GoogleFonts.alexandria(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF4E4633),
                  height: 22 / 14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
