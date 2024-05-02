import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class AppColors extends StatelessWidget {
  const AppColors({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Colors'),
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          ('main100', colors.main100),
          ('main110', colors.main110),
          ('main200', colors.main200),
          ('main300', colors.main300),
          ('main310', colors.main310),
          ('main320', colors.main320),
          ('danger100', colors.danger100),
          ('danger110', colors.danger110),
          ('success100', colors.success100),
          ('success110', colors.success110),
          ('white', colors.white),
          ('black', colors.black),
          ('Grey', colors.grey),
        ]
            .map(
              (record) => ColoredBox(
                color: record.$2,
                child: Center(
                  child: Text(
                    record.$1,
                    style: textTheme.titleMedium,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
