import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/assets.dart';
import '../../l10n/app_localizations.dart';

/// Pill badge component showing remaining recording attempts (Figma Page 25 / Frame 4).
/// - Pill capsule with soft warm golden gradient (#FFF7DC -> #FFE699) and subtle border (#FCDA82)
/// - Visual Layout: [ ⚡  محاولات 0 ]
///   - Left: solid amber lightning bolt icon (15x15)
///   - Right: attempts count in Alexandria 13sp SemiBold (#1B1C1C)
class AttemptsBadge extends StatelessWidget {
  const AttemptsBadge({
    super.key,
    this.attemptsCount = 3,
  });

  final int attemptsCount;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final countText = l10n?.attemptsCount(attemptsCount) ?? '$attemptsCount محاولات';

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF7DC),
              Color(0xFFFFE699),
            ],
          ),
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(
            color: const Color(0xFFFCDA82),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              countText,
              style: GoogleFonts.alexandria(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1B1C1C),
                height: 18 / 13,
                letterSpacing: 0.0,
              ),
            ),
            SizedBox(width: 6.w),
            SvgPicture.asset(
              AppAssets.attemptsLightningIcon,
              width: 15.w,
              height: 15.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFFFE9311),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
