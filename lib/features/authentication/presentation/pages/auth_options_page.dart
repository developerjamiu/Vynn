import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';

class AuthOptionsPage extends StatelessWidget {
  static const routePath = '/auth-options';
  static const routeName = 'AuthOptions';

  const AuthOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              AppButton(
                onPressed: () => context.go(
                  '${AuthOptionsPage.routePath}/${SignUpPage.routePath}',
                ),
                label: 'CREATE MY ACCOUNT',
              ),
              const SizedBox(height: 8),
              AppButton.outline(
                onPressed: () => context.go(
                  '${AuthOptionsPage.routePath}/${SignInPage.routePath}',
                ),
                label: 'LOGIN TO MY ACCOUNT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
