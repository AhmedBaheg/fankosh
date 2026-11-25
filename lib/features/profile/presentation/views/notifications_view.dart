import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/notifications_view_body.dart';

/// Standalone screen view for Notifications ("الإشعارات").
class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: NotificationsViewBody(),
    );
  }
}
