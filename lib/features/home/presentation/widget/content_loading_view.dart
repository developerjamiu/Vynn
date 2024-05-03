import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class ContentLoadingView extends StatelessWidget {
  const ContentLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.main300,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(
            backgroundColor: colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            'Hold on, generating drafts for you...',
            style: textTheme.labelLarge?.copyWith(
              color: colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
