import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppTypography extends StatelessWidget {
  const AppTypography({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Typography'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ('Display Large', textTheme.displayLarge),
          ('Display Medium', textTheme.displayMedium),
          ('Display Small', textTheme.displaySmall),
          ('Headline Medium', textTheme.headlineMedium),
          ('Headline Small', textTheme.headlineSmall),
          ('Title Large', textTheme.titleLarge),
          ('Title Medium', textTheme.titleMedium),
          ('Title Small', textTheme.titleSmall),
          ('Body Large', textTheme.bodyLarge),
          ('Body Medium', textTheme.bodyMedium),
          ('Body Small', textTheme.bodySmall),
          ('Label Large', textTheme.labelLarge),
          ('Label Small', textTheme.labelSmall),
        ]
            .map(
              (record) => Text(
                record.$1,
                style: record.$2,
              ),
            )
            .toList(),
      ),
    );
  }
}
