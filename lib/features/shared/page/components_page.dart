import 'package:flutter/material.dart';
import 'package:vynn/features/shared/widgets/component_page/app_buttons.dart';
import 'package:vynn/features/shared/widgets/component_page/app_colors.dart';
import 'package:vynn/features/shared/widgets/component_page/app_text_fields.dart';
import 'package:vynn/features/shared/widgets/component_page/app_typography.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Components'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Colors'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AppColors()),
              );
            },
          ),
          ListTile(
            title: const Text('Typography'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AppTypography()),
              );
            },
          ),
          ListTile(
            title: const Text('Buttons'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AppButtons()),
              );
            },
          ),
          ListTile(
            title: const Text('App Text Fields'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AppTextFields()),
              );
            },
          ),
        ],
      ),
    );
  }
}
