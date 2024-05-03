import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/shared/widgets/app_image.dart';

class SocialsContainer extends StatelessWidget {
  final Widget icon;
  final String title;

  const SocialsContainer({
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return Container(
      width: 150,
      height: 38,
      decoration: BoxDecoration(
        color: color.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color.tangerine,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(color: color.tangerine, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
