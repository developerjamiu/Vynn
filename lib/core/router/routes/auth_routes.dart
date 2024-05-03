import 'package:go_router/go_router.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:vynn/features/authentication/presentation/pages/verify_email_page.dart';

final authRoutes = [
  GoRoute(
    path: AuthOptionsPage.routePath,
    name: AuthOptionsPage.routeName,
    builder: (context, state) => const AuthOptionsPage(),
    routes: [
      GoRoute(
        path: SignInPage.routePath,
        name: SignInPage.routeName,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: SignUpPage.routePath,
        name: SignUpPage.routeName,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: VerifyEmailPage.routePath,
        name: VerifyEmailPage.routeName,
        builder: (context, state) => const VerifyEmailPage(),
      ),
    ],
  ),
];
