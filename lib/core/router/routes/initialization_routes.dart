import 'package:go_router/go_router.dart';
import 'package:vynn/features/initialization/presentation/pages/initialization_page.dart';

final initializationRoutes = [
  GoRoute(
    path: InitializationPage.routePath,
    name: InitializationPage.routeName,
    builder: (context, state) => const InitializationPage(),
  ),
];
