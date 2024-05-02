import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/extensions/validation_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class SignInPage extends StatefulWidget {
  static const routePath = 'sign_in';
  static const routeName = 'SignIn';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  late final _emailAddressController = TextEditingController();
  late final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Login to your account',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.tangerine,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Welcome back. Login below to pick up\nfrom where you left off.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    AppTextFormField(
                      hintText: 'email@xyz.com',
                      labelText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailAddressController,
                      validator: context.validateEmailAddress,
                    ),
                    const SizedBox(height: 24),
                    AppTextFormField(
                      hintText: 'Your secure password',
                      labelText: 'Your password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      validator: context.validatePassword,
                    ),
                    const SizedBox(height: 24),
                    Text.rich(
                      TextSpan(
                        text: 'New to Vynn?',
                        children: [
                          TextSpan(
                            text: ' Create an account',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colors.tangerine,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go(
                                  '${AuthOptionsPage.routePath}/${SignUpPage.routePath}',
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
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {}
                    },
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
