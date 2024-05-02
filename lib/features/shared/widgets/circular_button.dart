import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: colors.white,
        minimumSize: const Size.square(42),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
          side: BorderSide(
            color: colors.grey.shade200,
          ),
        ),
      ),
      child: Icon(
        icon,
        color: colors.grey.shade800,
      ),
    );
  }
}
