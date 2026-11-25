import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// 3D User avatar with camera action badge and change photo prompt.
class EditProfileAvatarPicker extends StatelessWidget {
  const EditProfileAvatarPicker({
    super.key,
    required this.helperText,
    this.onChangePhotoPressed,
  });

  final String helperText;
  final VoidCallback? onChangePhotoPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 104.r,
            height: 104.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Avatar circle with border shadow
                Container(
                  width: 96.r,
                  height: 96.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowSubtleBlack,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.userAvatar3d,
                      width: 96.r,
                      height: 96.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Camera Badge Button (bottom-left in RTL)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: InkWell(
                    onTap: onChangePhotoPressed ?? () {},
                    borderRadius: BorderRadius.circular(9999.r),
                    child: Container(
                      width: 32.r,
                      height: 32.r,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.overlayLight,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: -2,
                          ),
                          BoxShadow(
                            color: AppColors.overlayLight,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                            spreadRadius: -1,
                          ),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.cameraWhiteIcon,
                          width: 15.r,
                          height: 14.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            helperText,
            style: AppStyles.alexandria(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.profileTextMutedBrown,
              height: 14 / 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
