import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class SocialsContainer extends StatelessWidget {
  final String title;
  final bool isSelected;

  const SocialsContainer({
    required this.title,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? colors.main110 : colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? colors.main100 : colors.grey.shade200,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: textTheme.titleSmall?.copyWith(
            color: isSelected ? colors.main100 : colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
