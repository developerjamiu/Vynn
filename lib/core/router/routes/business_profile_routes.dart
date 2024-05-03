import 'package:go_router/go_router.dart';
import 'package:vynn/features/authentication/models/user_model.dart';
import 'package:vynn/features/business_profile/presentation/pages/business_profile_page.dart';
import 'package:vynn/features/business_profile/presentation/pages/edit_business_profile_page.dart';

final businessProfileRoutes = [
  GoRoute(
    path: BusinessProfilePage.routePath,
    name: BusinessProfilePage.routeName,
    builder: (context, state) => const BusinessProfilePage(),
    routes: [
      GoRoute(
        path: EditBusinessProfilePage.routePath,
        name: EditBusinessProfilePage.routeName,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return EditBusinessProfilePage(
            user: extra['user'] as UserModel,
          );
        },
      ),
    ],
  ),
];
