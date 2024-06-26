import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppDropdownFormField extends StatelessWidget {
  const AppDropdownFormField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    required this.labelText,
  }) : borderRadius = const BorderRadius.all(Radius.circular(38));

  final BorderRadius borderRadius;
  final IconData? prefixIcon;
  final String hintText;
  final String labelText;

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
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(
              value: 'Informative',
              child: Text('Informative'),
            ),
            DropdownMenuItem(
              value: 'Educative',
              child: Text('Educative'),
            ),
            DropdownMenuItem(
              value: 'Interactive',
              child: Text('Interactive'),
            ),
          ],
          onChanged: (Object? value) {},
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
              borderSide: BorderSide(color: colors.main100),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.main100),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: colors.main100),
            ),
          ),
        ),
      ],
    );
  }
}
