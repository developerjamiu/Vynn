import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
  }) : borderRadius = const BorderRadius.all(Radius.circular(38));

  final BorderRadius borderRadius;
  final IconData? prefixIcon;
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

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
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
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
              borderSide: BorderSide(color: colors.tangerine),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
