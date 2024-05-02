import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class SignUpPage extends StatelessWidget {
  static const routePath = 'sign_up';
  static const routeName = 'SignUp';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Hi, create your account',
                    style: textTheme.headlineSmall?.copyWith(
                      color: colors.tangerine,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Generate effortless content for your business, sign up for Vynn below',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  const AppTextFormField(
                    hintText: 'email@xyz.com',
                    labelText: 'Email Address',
                  ),
                  const SizedBox(height: 24),
                  const AppTextFormField(
                    hintText: 'Your secure password',
                    labelText: 'Your password',
                  ),
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: 'Not new to Vynn?',
                      children: [
                        TextSpan(
                          text: ' Login to your account',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.tangerine,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(
                                '${AuthOptionsPage.routePath}/${SignInPage.routePath}',
                              );
                            },
                        ),
                      ],
                    ),
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 32,
                  ),
                  child: AppButton(
                    onPressed: () {},
                    label: 'Continue',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
