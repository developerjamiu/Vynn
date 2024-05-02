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
          ('Black', colors.black),
          ('White', colors.white),
          ('Primary', colors.primary),
          ('Egg Shell', colors.eggShell),
          ('Peach', colors.peach),
          ('Tangerine', colors.tangerine),
          ('Rust', colors.rust),
          ('Brown', colors.brown),
          ('Red', colors.red),
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
