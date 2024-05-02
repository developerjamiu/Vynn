import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/shared/widgets/app_icon.dart';
import 'package:vynn/features/shared/widgets/app_image.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class VerifyEmailPage extends StatelessWidget {
  static const routePath = 'verify_email';
  static const routeName = 'VerifyEmail';

  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              AppImage.verifyEmailBackground(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: 94,
                      height: 94,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors.main100,
                            colors.main200,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(47),
                      ),
                      child: Center(
                        child: AppIcon.emailSent(size: 36),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      'We’ve sent a verification link to your email.',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.main100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Click on the link we sent to your email address to start creating content for your business without hassle.',
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
