import 'package:go_router/go_router.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';

final homeRoutes = [
  GoRoute(
    path: HomePage.routePath,
    name: HomePage.routeName,
    builder: (context, state) => const HomePage(),
  ),
];
