import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Pinned bottom primary action button for saving profile edits.
class EditProfileSaveButton extends StatelessWidget {
  const EditProfileSaveButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 16.h),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(35.r),
        child: Container(
          width: double.infinity,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(35.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSubtleBlack,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check,
                size: 20,
                color: AppColors.surface,
              ),
              SizedBox(width: 6.w),
              Text(
                text,
                style: AppStyles.alexandria(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
