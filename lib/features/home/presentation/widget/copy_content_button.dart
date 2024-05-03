import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class CopyContentButton extends StatelessWidget {
  const CopyContentButton({
    super.key,
    required this.post,
  });

  final String post;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE5631A),
              Color(0xFFE5631A),
              Color(0xFFF5BE08),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.ios_share_outlined,
              color: color.white,
            ),
            const SizedBox(width: 8),
            Text(
              'Copy this one',
              style: textTheme.labelLarge?.copyWith(
                color: color.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
