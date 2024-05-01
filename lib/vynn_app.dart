import 'package:flutter/material.dart';
import 'package:vynn/core/theme/app_theme.dart';

class VynnApp extends StatelessWidget {
  const VynnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vynn',
      theme: AppTheme.defaultTheme,
      home: const Scaffold(),
    );
  }
}
