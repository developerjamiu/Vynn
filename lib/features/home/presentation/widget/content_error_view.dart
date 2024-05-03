import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/home/presentation/state/home_notifier.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';

class ContentErrorView extends ConsumerWidget {
  const ContentErrorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Icon(
            Icons.info,
            color: colors.main100,
          ),
          const SizedBox(height: 16),
          Text(
            'We encountered some problems while generating the drafts, please try  again',
            style: textTheme.labelLarge?.copyWith(
              color: colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 150,
            child: AppButton.outline(
              onPressed: () =>
                  ref.read(homeNotifierProvider.notifier).fetchContent(),
              label: 'Refresh',
            ),
          ),
        ],
      ),
    );
  }
}
