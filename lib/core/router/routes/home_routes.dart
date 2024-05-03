import 'package:go_router/go_router.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';
import 'package:vynn/features/home/presentation/pages/saved_content_page.dart';

final homeRoutes = [
  GoRoute(
      path: HomePage.routePath,
      name: HomePage.routeName,
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'saved_content',
          name: 'SavedContent',
          builder: (context, state) => const SavedContentPage(), // SignInPage
        ),
      ]),
];
