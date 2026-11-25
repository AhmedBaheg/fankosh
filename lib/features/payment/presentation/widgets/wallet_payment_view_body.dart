import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/utils/assets.dart';
import 'card_payment_bottom_strip.dart';
import 'payment_plan_summary_card.dart';
import 'security_information_strip.dart';
import 'wallet_option_card.dart';
import 'wallet_payment_header_section.dart';
import 'wallet_phone_input_field.dart';

/// Main body layout for Wallet Payment screen ("ادفع بمحفظتك").
class WalletPaymentViewBody extends StatefulWidget {
  const WalletPaymentViewBody({super.key, required this.plan});

  final SubscriptionPlanModel plan;

  @override
  State<WalletPaymentViewBody> createState() => _WalletPaymentViewBodyState();
}

class _WalletPaymentViewBodyState extends State<WalletPaymentViewBody> {
  // Default selected: Vodafone Cash (Option 1)
  int _selectedWalletIndex = 0;
  bool _isLoading = false;
  late final TextEditingController _phoneController;

  final List<({String title, String logo})> _wallets = const [
    (title: 'فودافون كاش', logo: AppAssets.vodafoneCashIcon),
    (title: 'اتصالات كاش', logo: AppAssets.etisalatCashIcon),
    (title: 'أورنج كاش', logo: AppAssets.orangeCashIcon),
  ];

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onPayPressed() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(
        context,
        Routes.paymentSuccessView,
        arguments: widget.plan,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Shared App Header Bar
        const AppHeaderBar(),

        // 2. Scrollable Body
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),

                // 2.1 Header Section
                const WalletPaymentHeaderSection(),
                SizedBox(height: 20.h),

                // 2.2 Reused Plan Summary Card
                PaymentPlanSummaryCard(plan: widget.plan),
                SizedBox(height: 24.h),

                // 2.3 Section Heading: "اختار محفظتك" & "محافظ مصر الرقمية"
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'اختار محفظتك',
                      style: AppStyles.alexandria(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                        height: 26 / 16,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'محافظ مصر الرقمية',
                      style: AppStyles.alexandria(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textMutedWarm,
                        height: 14 / 11,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // 2.4 Wallet Options List
                ...List.generate(_wallets.length, (index) {
                  final wallet = _wallets[index];
                  final isSelected = _selectedWalletIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: WalletOptionCard(
                      title: wallet.title,
                      logoAsset: wallet.logo,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          _selectedWalletIndex = index;
                        });
                      },
                    ),
                  );
                }),
                SizedBox(height: 14.h),

                // 2.5 Phone Number Input Field
                WalletPhoneInputField(controller: _phoneController),
                SizedBox(height: 16.h),

                // 2.6 Security Information Strip (Reused)
                const SecurityInformationStrip(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),

        // 3. Floating Sticky Bottom Payment Strip (Reused)
        CardPaymentBottomStrip(
          price: widget.plan.price,
          onPayPressed: _onPayPressed,
          isLoading: _isLoading,
        ),
      ],
    );
  }
}
