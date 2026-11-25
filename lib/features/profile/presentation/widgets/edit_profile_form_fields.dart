import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'edit_profile_field_container.dart';

/// Form fields section for Name, Email, Birthdate, and Privacy assurance note.
class EditProfileFormFields extends StatelessWidget {
  const EditProfileFormFields({
    super.key,
    required this.nameController,
    required this.nameLabel,
    required this.emailLabel,
    required this.email,
    required this.birthDateLabel,
    required this.birthDate,
    required this.privacyNote,
  });

  final TextEditingController nameController;
  final String nameLabel;
  final String emailLabel;
  final String email;
  final String birthDateLabel;
  final String birthDate;
  final String privacyNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Name Field
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            nameLabel,
            style: AppStyles.alexandria(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textHeaderDark,
              height: 20 / 14,
              letterSpacing: 0.14,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        EditProfileFieldContainer(
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppAssets.userIcon,
                width: 18.r,
                height: 18.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  controller: nameController,
                  textDirection: TextDirection.rtl,
                  style: AppStyles.alexandria(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHeaderDark,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  nameController.clear();
                },
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 18.sp,
                    color: AppColors.borderC7C5C2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // 2. Email Field (Read-only display)
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            emailLabel,
            style: AppStyles.alexandria(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textHeaderDark,
              height: 20 / 14,
              letterSpacing: 0.14,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        EditProfileFieldContainer(
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppAssets.emailIcon,
                width: 18.r,
                height: 18.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  email,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: AppStyles.alexandria(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.profileTextMutedBrown,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // 3. Birthdate Field (With Calendar & Lock icon)
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            birthDateLabel,
            style: AppStyles.alexandria(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textHeaderDark,
              height: 20 / 14,
              letterSpacing: 0.14,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        EditProfileFieldContainer(
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppAssets.calendarIcon,
                width: 18.r,
                height: 18.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  birthDate,
                  style: AppStyles.alexandria(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHeaderDark,
                  ),
                ),
              ),
              SvgPicture.asset(
                AppAssets.lockIcon,
                width: 16.r,
                height: 16.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.borderC7C5C2,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),

        // Helper Birthday Note
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              AppAssets.shieldCheckGreenIcon,
              width: 14.r,
              height: 14.r,
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: Text(
                privacyNote,
                style: AppStyles.alexandria(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.profileTextMutedBrown,
                  height: 14 / 11,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
