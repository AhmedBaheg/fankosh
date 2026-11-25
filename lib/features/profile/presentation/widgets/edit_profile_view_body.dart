import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'edit_profile_avatar_picker.dart';
import 'edit_profile_form_fields.dart';
import 'edit_profile_save_button.dart';

/// Body layout for Edit Profile ("تعديل الملف الشخصي") screen matching Figma specs.
/// Refactored into modular, maintainable widgets:
/// - [EditProfileAvatarPicker] (Avatar with camera badge)
/// - [EditProfileFormFields] (Name, Email, Birthdate fields)
/// - [EditProfileSaveButton] (Bottom primary action button)
class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    this.initialName = 'أحمد محمد',
    this.email = 'ahmed@example.com',
    this.birthDate = '14 أكتوبر 1998',
    this.onBackPressed,
    this.onSavePressed,
    this.onChangePhotoPressed,
  });

  final String initialName;
  final String email;
  final String birthDate;
  final VoidCallback? onBackPressed;
  final ValueChanged<String>? onSavePressed;
  final VoidCallback? onChangePhotoPressed;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final newName = _nameController.text.trim();
    widget.onSavePressed?.call(newName);
    Navigator.pop(context, newName);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Circular Back Button (40x40)
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: widget.onBackPressed ??
                          () => Navigator.maybePop(context),
                      borderRadius: BorderRadius.circular(9999.r),
                      child: Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderLightMuted,
                            width: 1.0,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shadowSubtleBlack,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.chevronRightIcon,
                            width: 16.r,
                            height: 16.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // 2. Avatar Container with Camera Button
                  EditProfileAvatarPicker(
                    helperText: l10n.tapToChangePhoto,
                    onChangePhotoPressed: widget.onChangePhotoPressed,
                  ),
                  SizedBox(height: 24.h),

                  // 3. Form Fields: Name, Email, Birthdate, Privacy Note
                  EditProfileFormFields(
                    nameController: _nameController,
                    nameLabel: l10n.nameLabel,
                    emailLabel: l10n.emailLabel,
                    email: widget.email,
                    birthDateLabel: l10n.birthDateTitle,
                    birthDate: widget.birthDate,
                    privacyNote: l10n.birthDatePrivacyNote,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),

          // 4. Pinned Primary Action Button: "حفظ التغييرات"
          EditProfileSaveButton(
            text: l10n.saveChanges,
            onPressed: _handleSave,
          ),
        ],
      ),
    );
  }
}
