import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/notification_item_model.dart';
import 'notification_card.dart';
import 'notifications_app_bar.dart';

/// Notifications screen body layout matching Figma specs:
/// - Circular back button (40x40, #FFFFFF, border: #E7E5E4B2)
/// - Title: "الإشعارات" (Alexandria Bold 22px, #150E16)
/// - "تحديد الكل كمقروء" action with double-check icon (#399CFE)
/// - Space: 25px
/// - List of notification cards
class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({
    super.key,
    this.initialNotifications,
    this.onBackPressed,
  });

  final List<NotificationItemModel>? initialNotifications;
  final VoidCallback? onBackPressed;

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  late List<NotificationItemModel> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = widget.initialNotifications ??
        [
          NotificationItemModel(
            id: '1',
            title: 'باقتك اتفعّلت! 🎉',
            subtitle: 'اشتراكك جاهز... يلا نكمّل قفشات!',
            time: '11:30 ص',
            iconPath: AppAssets.planMedalIcon,
            iconBgColor: const Color(0xFFFEF6DF),
            iconColor: const Color(0xFFFE9311),
            isRead: false,
          ),
          NotificationItemModel(
            id: '2',
            title: 'محاولاتك قربت تخلص!',
            subtitle: 'فاضلك محاولتين بس!',
            time: 'أمس',
            iconPath: AppAssets.attemptsLightningIcon,
            iconBgColor: const Color(0xFFE8F3FF),
            iconColor: const Color(0xFF399CFE),
            isRead: true,
          ),
        ];
  }

  void _markAllAsRead() {
    setState(() {
      for (final item in _notifications) {
        item.isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            // Top App Bar Row
            NotificationsAppBar(
              title: l10n.notifications,
              markAllAsReadText: l10n.markAllAsRead,
              onMarkAllAsRead: _markAllAsRead,
              onBackPressed: widget.onBackPressed,
            ),
            SizedBox(height: 25.h),

            // Notifications List
            Expanded(
              child: _notifications.isEmpty
                  ? Center(
                      child: Text(
                        'لا توجد إشعارات حالياً',
                        style: GoogleFonts.alexandria(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondaryGray,
                        ),
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _notifications.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final item = _notifications[index];
                        return NotificationCard(
                          item: item,
                          onTap: () {
                            if (!item.isRead) {
                              setState(() {
                                item.isRead = true;
                              });
                            }
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
