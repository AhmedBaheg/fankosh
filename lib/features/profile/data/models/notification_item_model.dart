import 'package:flutter/material.dart';

/// Data model representing a notification item.
class NotificationItemModel {
  NotificationItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconPath,
    required this.iconBgColor,
    this.iconColor,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String subtitle;
  final String time;
  final String iconPath;
  final Color iconBgColor;
  final Color? iconColor;
  bool isRead;
}
