import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/router/routes/auth_routes.dart';
import 'package:vynn/core/router/routes/business_info_routes.dart';
import 'package:vynn/core/router/routes/home_routes.dart';
import 'package:vynn/core/router/routes/initialization_routes.dart';
import 'package:vynn/features/initialization/presentation/pages/initialization_page.dart';

abstract class AppRouter {
  static GoRouter defaultRouter = GoRouter(
    initialLocation: InitializationPage.routePath,
    debugLogDiagnostics: kDebugMode ? true : false,
    routes: [
      ...initializationRoutes,
      ...authRoutes,
      ...businessInfoRoutes,
      ...homeRoutes,
    ],
  );
}
