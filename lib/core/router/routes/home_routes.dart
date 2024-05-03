import 'package:go_router/go_router.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';
import 'package:vynn/features/home/presentation/pages/saved_content_page.dart';
import 'package:vynn/features/home/presentation/pages/options_list_page.dart';

final homeRoutes = [
  GoRoute(
      path: HomePage.routePath,
      name: HomePage.routeName,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: OptionsListPage.routePath,
          name: OptionsListPage.routeName,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;

            return OptionsListPage(
              options: extra['options'] as List<String>,
              title: extra['title'] as String,
            );
          },
        ),
        GoRoute(
          path: SavedContentPage.routePath,
          name: SavedContentPage.routeName,
          builder: (context, state) => const SavedContentPage(), // SignInPage
        ),
      ]),
];
