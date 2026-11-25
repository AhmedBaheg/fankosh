import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/edit_profile_view_body.dart';

/// Standalone screen view for Edit Profile ("تعديل الملف الشخصي").
class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    this.name = 'أحمد محمد',
    this.email = 'ahmed@example.com',
    this.birthDate = '14 أكتوبر 1998',
  });

  final String name;
  final String email;
  final String birthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: EditProfileViewBody(
        initialName: name,
        email: email,
        birthDate: birthDate,
      ),
    );
  }
}
