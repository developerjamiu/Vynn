import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppMenuButton extends StatelessWidget {
  const AppMenuButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.prefixIcon,
    required this.suffixIcon,
  }) : isOutlined = false;

  const AppMenuButton.outline({
    super.key,
    required this.onPressed,
    required this.label,
    required this.prefixIcon,
    required this.suffixIcon,
  }) : isOutlined = true;

  final bool isOutlined;
  final VoidCallback? onPressed;
  final String label;
  final Widget prefixIcon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    final backgroundColor = isOutlined ? colors.white : colors.grey[300];
    final textColor = isOutlined ? colors.grey[800] : colors.white;
    final disabledBackgroundColor =
        isOutlined ? null : colors.main300.withOpacity(0.3);
    final shape = isOutlined
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
            side: BorderSide(color: colors.grey.shade300),
          )
        : null;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          minimumSize: const Size.fromHeight(68),
          disabledBackgroundColor: disabledBackgroundColor,
          shape: shape,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon,
            const SizedBox(width: 8),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            suffixIcon,
          ],
        ));
  }
}
