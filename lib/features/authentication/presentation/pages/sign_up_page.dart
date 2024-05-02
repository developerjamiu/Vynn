import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vynn/core/theme/app_theme.dart';
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
    final color = context.colors;

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
                      color: color.tangerine,
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
                  const SizedBox(
                    height: 84,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 16,
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
