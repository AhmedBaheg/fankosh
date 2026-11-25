import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

/// Supported payment method types in Fankosh app.
enum PaymentMethodType {
  bankCard,
  electronicWallet,
}

/// Model representing a selectable payment option in the payment screen.
class PaymentMethodModel {
  const PaymentMethodModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.iconBgColor,
  });

  final PaymentMethodType type;
  final String title;
  final String subtitle;
  final String iconPath;
  final Color iconBgColor;

  static const List<PaymentMethodModel> defaultMethods = [
    PaymentMethodModel(
      type: PaymentMethodType.bankCard,
      title: 'بطاقة بنكية',
      subtitle: 'Visa • Mastercard • Meeza',
      iconPath: AppAssets.bankCardIcon,
      iconBgColor: AppColors.orangeSurfaceTint,
    ),
    PaymentMethodModel(
      type: PaymentMethodType.electronicWallet,
      title: 'محفظة إلكترونية',
      subtitle: 'الدفع بالمحفظة',
      iconPath: AppAssets.walletIcon,
      iconBgColor: AppColors.errorRedSurfaceLight,
    ),
  ];
}
