import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

extension SnackbarExtension on BuildContext {
  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colors.success100,
        content: Text(
          message,
          style: textTheme.labelLarge?.copyWith(
            color: colors.success110,
          ),
        ),
      ),
    );
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colors.danger100,
        content: Text(
          message,
          style: textTheme.labelLarge?.copyWith(
            color: colors.danger110,
          ),
        ),
      ),
    );
  }
}
