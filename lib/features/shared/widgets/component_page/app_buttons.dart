import 'package:flutter/material.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/circular_button.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Buttons'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          AppButton(
            label: 'Button Enabled',
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          const AppButton(
            label: 'Button Disabled',
            onPressed: null,
          ),
          const SizedBox(height: 8),
          AppButton.outline(
            label: 'Outline Button Enabled',
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          const AppButton.outline(
            label: 'Outline Button Disabled',
            onPressed: null,
          ),
          const SizedBox(height: 8),
          Center(
            child: Row(
              children: [
                CircularIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {},
                ),
                const CircularIconButton(
                  icon: Icons.arrow_back,
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
