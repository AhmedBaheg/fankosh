import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';
import 'card_expiry_cvv_fields.dart';

/// Card Details Form Section matching exact Figma specs:
/// - width: 350, border-radius: 12px, padding: 16px, background: #FFFFFF, shadow: 0px 1px 2px 0px #0000000D
/// - Header: "بيانات البطاقة" with orange card icon
/// - Fields: Card Number, Expiry Date, CVV, Cardholder Name
class CardDetailsForm extends StatefulWidget {
  const CardDetailsForm({
    super.key,
    this.cardNumberController,
    this.expiryDateController,
    this.cvvController,
    this.cardHolderController,
  });

  final TextEditingController? cardNumberController;
  final TextEditingController? expiryDateController;
  final TextEditingController? cvvController;
  final TextEditingController? cardHolderController;

  @override
  State<CardDetailsForm> createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expiryDateController;
  late final TextEditingController _cvvController;
  late final TextEditingController _cardHolderController;

  @override
  void initState() {
    super.initState();
    _cardNumberController =
        widget.cardNumberController ?? TextEditingController();
    _expiryDateController =
        widget.expiryDateController ?? TextEditingController();
    _cvvController = widget.cvvController ?? TextEditingController();
    _cardHolderController =
        widget.cardHolderController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.cardNumberController == null) _cardNumberController.dispose();
    if (widget.expiryDateController == null) _expiryDateController.dispose();
    if (widget.cvvController == null) _cvvController.dispose();
    if (widget.cardHolderController == null) _cardHolderController.dispose();
    super.dispose();
  }

  Widget _buildFieldLabel(String label) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        label,
        style: GoogleFonts.alexandria(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1B1C1C),
          height: 16 / 12,
          letterSpacing: 0.24,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Section Title: "بيانات البطاقة" with orange card icon
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.bankCardIcon,
                width: 18.w,
                height: 18.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFAE00),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'بيانات البطاقة',
                style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1B1C1C),
                  height: 26 / 16,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Field 1: رقم البطاقة
          _buildFieldLabel('رقم البطاقة'),
          SizedBox(height: 6.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: CustomTextField(
              controller: _cardNumberController,
              hintText: '1234 5678 9012 3456',
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
                  AppAssets.visaCardIcon,
                  width: 16.w,
                  height: 13.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF706E6E),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),

          // Row with Field 2 (تاريخ الانتهاء) & Field 3 (الرمز الأمني CVV)
          CardExpiryCvvFields(
            expiryDateController: _expiryDateController,
            cvvController: _cvvController,
            labelBuilder: _buildFieldLabel,
          ),
          SizedBox(height: 14.h),

          // Field 4: اسم صاحب البطاقة
          _buildFieldLabel('اسم صاحب البطاقة'),
          SizedBox(height: 6.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: CustomTextField(
              controller: _cardHolderController,
              hintText: 'AHMED MOHAMED',
              keyboardType: TextInputType.name,
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
                  AppAssets.userIcon,
                  width: 13.w,
                  height: 13.h,
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
    );
  }
}
