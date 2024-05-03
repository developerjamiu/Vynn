import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class OptionsListPage extends ConsumerWidget {
  static const routePath = 'options-list';
  static const routeName = 'OptionsList';

  const OptionsListPage({
    super.key,
    required this.title,
    this.options = const [],
  });

  final List<String> options;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: CustomAppBar(
          title: title,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: options.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final option = options[index];

            return GestureDetector(
              onTap: () => context.pop(option),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      option,
                      style: textTheme.titleMedium,
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
