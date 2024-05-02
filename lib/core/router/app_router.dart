import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/router/routes/auth_routes.dart';
import 'package:vynn/core/router/routes/home_routes.dart';
import 'package:vynn/core/router/routes/initialization_routes.dart';

abstract class AppRouter {
  static GoRouter defaultRouter = GoRouter(
    initialLocation: '/initialization',
    debugLogDiagnostics: kDebugMode ? true : false,
    routes: [
      ...initializationRoutes,
      ...authRoutes,
      ...homeRoutes,
    ],
  );
}
