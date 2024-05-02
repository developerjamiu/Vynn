import 'package:flutter/material.dart';
import 'package:vynn/core/router/app_router.dart';
import 'package:vynn/core/theme/app_theme.dart';

class VynnApp extends StatelessWidget {
  const VynnApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.defaultRouter;
    return MaterialApp.router(
      title: 'Vynn',
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
