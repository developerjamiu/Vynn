import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.enabled = true,
    this.initialValue,
  }) : borderRadius = const BorderRadius.all(Radius.circular(38));

  final BorderRadius borderRadius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: textTheme.titleSmall?.copyWith(
            color: colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
            hintText: hintText,
            hintStyle: textTheme.bodyLarge?.copyWith(color: colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.main100),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.danger110),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.danger110),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
