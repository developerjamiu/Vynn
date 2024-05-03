import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.loading = false,
    this.disabled = false,
  }) : isOutlined = false;

  const AppButton.outline({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.loading = false,
    this.disabled = false,
  }) : isOutlined = true;

  final bool isOutlined;
  final VoidCallback? onPressed;
  final String label;
  final Widget? icon;
  final bool loading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    final backgroundColor = isOutlined ? colors.white : colors.main300;
    final textColor = isOutlined ? colors.main300 : colors.white;
    final disabledBackgroundColor = isOutlined ? null : colors.main320;
    final shape = isOutlined
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
            side: BorderSide(color: colors.main300),
          )
        : null;

    return ElevatedButton(
      onPressed: disabled || loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(55),
        disabledBackgroundColor: disabledBackgroundColor,
        shape: shape,
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                SizedBox(width: 8),
                Text(
                  label,
                  style: textTheme.labelLarge?.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            )
          : Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: textColor,
              ),
            ),
      child: loading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator.adaptive(
                backgroundColor: colors.white,
              ),
            )
          : Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: textColor,
              ),
            ),
    );
  }
}
