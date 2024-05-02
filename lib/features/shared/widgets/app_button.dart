import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
  }) : isOutlined = false;

  const AppButton.outline({
    super.key,
    required this.onPressed,
    required this.label,
  }) : isOutlined = true;

  final bool isOutlined;
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    final backgroundColor = isOutlined ? colors.white : colors.primary;
    final textColor = isOutlined ? colors.primary : colors.white;
    final disabledBackgroundColor =
        isOutlined ? null : colors.primary.withOpacity(0.3);
    final shape = isOutlined
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
            side: BorderSide(color: colors.primary),
          )
        : null;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(55),
        disabledBackgroundColor: disabledBackgroundColor,
        shape: shape,
      ),
      child: Text(
        label,
        style: textTheme.labelLarge?.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
