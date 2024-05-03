import 'package:go_router/go_router.dart';
import 'package:vynn/features/business_info/presentation/pages/business_info_page.dart';
import 'package:vynn/features/business_info/presentation/pages/business_list_page.dart';

final businessInfoRoutes = [
  GoRoute(
    path: BusinessInfoPage.routePath,
    name: BusinessInfoPage.routeName,
    builder: (context, state) => const BusinessInfoPage(),
    routes: [
      GoRoute(
        path: BusinessListPage.routePath,
        name: BusinessListPage.routeName,
        builder: (context, state) => const BusinessListPage(),
      ),
    ],
  ),
];
