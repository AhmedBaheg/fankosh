import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';

/// Modular side-by-side fields for card expiry date and CVV matching Figma specs.
class CardExpiryCvvFields extends StatelessWidget {
  const CardExpiryCvvFields({
    super.key,
    required this.expiryDateController,
    required this.cvvController,
    required this.labelBuilder,
  });

  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final Widget Function(String label) labelBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Field: تاريخ الانتهاء (Right in RTL)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              labelBuilder('تاريخ الانتهاء'),
              SizedBox(height: 6.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextField(
                  controller: expiryDateController,
                  hintText: 'MM/YY',
                  keyboardType: TextInputType.datetime,
                  borderRadius: 8.r,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  hintStyle: GoogleFonts.cairo(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFBCBFC6),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SvgPicture.asset(
                      AppAssets.calendarIcon,
                      width: 13.w,
                      height: 15.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF706E6E),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),

        // Field: الرمز الأمني CVV (Left in RTL)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              labelBuilder('الرمز الأمني CVV'),
              SizedBox(height: 6.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextField(
                  controller: cvvController,
                  hintText: '•••',
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  borderRadius: 8.r,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  hintStyle: GoogleFonts.cairo(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFBCBFC6),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SvgPicture.asset(
                      AppAssets.lockIcon,
                      width: 12.w,
                      height: 16.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF706E6E),
                        BlendMode.srcIn,
                      ),
                    ),
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

