import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/extensions/snackbar_extension.dart';
import 'package:vynn/core/extensions/validation_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:vynn/features/authentication/presentation/pages/verify_email_page.dart';
import 'package:vynn/features/authentication/presentation/state/sign_up_notifier.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

import '../../../home/presentation/pages/saved_content_page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  static const routePath = 'sign-up';
  static const routeName = 'SignUp';

  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
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
    final signUpNotifier = ref.watch(signUpNotifierProvider);
    final textTheme = context.textTheme;
    final colors = context.colors;

    ref.listen(
      signUpNotifierProvider,
      (previous, next) {
        if (next.failure != null) {
          context.showErrorSnackbar(next.failure!.message);
        }

        if (next.viewState == ViewState.success) {
          context.showSuccessSnackbar(
            'Verification link sent to your email',
          );

          context.go(
            '${AuthOptionsPage.routePath}/${VerifyEmailPage.routePath}',
          );
        }
      },
    );

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
                      'Hi, create your account',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.main100,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Generate effortless content for your business, sign up for Vynn below',
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
                        text: 'Not new to Vynn?',
                        children: [
                          TextSpan(
                            text: ' Login to your account',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colors.main100,
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
                    loading: signUpNotifier.viewState == ViewState.loading,
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        // ref.read(signUpNotifierProvider.notifier).signUpUser(
                        //       emailAddress: _emailAddressController.text.trim(),
                        //       password: _passwordController.text,
                        //     );
                        context.push(
                          // HomePage.routePath,
                          SavedContentPage.routePath,
                        );
                      }
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
