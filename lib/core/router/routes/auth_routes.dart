import 'package:go_router/go_router.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_up_page.dart';

final authRoutes = [
  GoRoute(
    path: AuthOptionsPage.routePath,
    name: AuthOptionsPage.routeName,
    builder: (context, state) => const AuthOptionsPage(),
    routes: [
      GoRoute(
        path: 'sign_in',
        name: 'SignIn',
        builder: (context, state) => const SignInPage(), // SignInPage
      ),
      GoRoute(
        path: 'sign_up',
        name: 'SignUp',
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  ),
];
