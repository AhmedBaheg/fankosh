import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/validation.dart';
import '../../../../l10n/app_localizations.dart';

/// Small modular password field widget with obscure toggle using standard Validation class.
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomTextField(
      controller: widget.controller,
      label: widget.label ?? l10n.passwordLabel,
      hintText: widget.hintText ?? l10n.passwordHint,
      prefixIcon: AppAssets.icLock,
      obscureText: _isPasswordObscured,
      textInputAction: widget.textInputAction,
      helperText: widget.helperText,
      onFieldSubmitted: widget.onFieldSubmitted,
      suffixIcon: IconButton(
        icon: SvgPicture.asset(
          _isPasswordObscured ? AppAssets.eyeOffIcon : AppAssets.eyeIcon,
        ),
        onPressed: () {
          setState(() {
            _isPasswordObscured = !_isPasswordObscured;
          });
        },
      ),
      validator: (value) => Validation.validatePassword(value ?? ''),
    );
  }
}
