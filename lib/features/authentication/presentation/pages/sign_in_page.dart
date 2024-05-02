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
import 'package:vynn/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:vynn/features/authentication/presentation/state/sign_in_notifier.dart';
import 'package:vynn/features/business_info/presentation/pages/business_info_page.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class SignInPage extends ConsumerStatefulWidget {
  static const routePath = 'sign_in';
  static const routeName = 'SignIn';

  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
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
    final signInNotifier = ref.watch(signInNotifierProvider);

    ref.listen(
      signInNotifierProvider,
      (previous, next) {
        if (next.failure != null) {
          context.showErrorSnackbar(next.failure!.message);
        }

        if (next.viewState == ViewState.success) {
          if (next.businessInfoNeeded) {
            context.go(BusinessInfoPage.routePath);
          } else {
            context.go(HomePage.routePath);
          }
        }
      },
    );

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
                        color: colors.main100,
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
                              color: colors.main100,
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
                    loading: signInNotifier.viewState == ViewState.loading,
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        ref.read(signInNotifierProvider.notifier).signInUser(
                              emailAddress: _emailAddressController.text.trim(),
                              password: _passwordController.text,
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
