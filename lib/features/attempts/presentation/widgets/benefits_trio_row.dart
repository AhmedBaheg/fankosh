import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// 3 benefits horizontal cards row for attempts exhausted view (Figma Page 25):
/// - Container: white card with rounded border (16.r), subtle border (#EBE7DF), soft shadow
/// - 3 items in RTL order:
///   1. Right: "قفشات أكتر" with clapperboard icon
///   2. Middle: "محاولات أكتر" with lightning icon
///   3. Left: "ضحك مكمّل" with smiling laugh icon
/// - Icon circles: 32x32, #FDC41E2B (Color(0x2BFDC41E))
/// - Labels: Alexandria 12sp SemiBold (w600), #1B1C1C, letter-spacing: 0.24
class BenefitsTrioRow extends StatelessWidget {
  const BenefitsTrioRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final morePunchlinesText = l10n?.benefitMorePunchlines ?? 'قفشات أكتر';
    final moreAttemptsText = l10n?.benefitMoreAttempts ?? 'محاولات أكتر';
    final continuedLaughsText = l10n?.benefitContinuedLaughs ?? 'ضحك مكمّل';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.w),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Benefit 1 (Right in RTL): "قفشات أكتر"
          Expanded(
            child: _BenefitItem(
              iconPath: AppAssets.benefitClapperIcon,
              label: morePunchlinesText,
            ),
          ),
          Container(width: 1.w, height: 38.h, color: const Color(0xFFEFE9DC)),

          // Benefit 2 (Middle in RTL): "محاولات أكتر"
          Expanded(
            child: _BenefitItem(
              iconPath: AppAssets.benefitLightningIcon,
              label: moreAttemptsText,
            ),
          ),
          Container(width: 1.w, height: 38.h, color: const Color(0xFFEFE9DC)),

          // Benefit 3 (Left in RTL): "ضحك مكمّل"
          Expanded(
            child: _BenefitItem(
              iconPath: AppAssets.benefitLaughIcon,
              label: continuedLaughsText,
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.iconPath, required this.label});

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 32x32 circular background (#FDC41E2B)
        Container(
          width: 32.w,
          height: 32.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x2BFDC41E), // #FDC41E2B
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 16.w,
              height: 16.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFFFE9311),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: GoogleFonts.alexandria(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1B1C1C),
            height: 16 / 12,
            letterSpacing: 0.24,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
