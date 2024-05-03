import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/extensions/snackbar_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/business_profile/presentation/pages/business_profile_page.dart';
import 'package:vynn/features/shared/widgets/app_image.dart';
import 'package:vynn/features/shared/widgets/app_menu_button.dart';

class AppMenuBottomSheet extends StatelessWidget {
  const AppMenuBottomSheet({super.key});

  static void show(BuildContext context) => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const AppMenuBottomSheet(),
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return Wrap(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            AppImage.bottomTitle(),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                'APP MENU',
                textAlign: TextAlign.center,
                style: textTheme.labelMedium?.copyWith(
                  color: color.grey.shade800,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  AppMenuButton.outline(
                    onPressed: () {
                      context.pop();
                      context.showSuccessSnackbar('Coming Soon');

                      // TODO: Implement Saved Content
                      // context.push(SavedContentPage.routePath);
                    },
                    label: 'Your Saved Content',
                    prefixIcon: Icon(
                      Icons.favorite_border_outlined,
                      color: color.grey[800],
                      size: 24,
                    ),
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: color.grey[400],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppMenuButton.outline(
                    onPressed: () {
                      context.go(BusinessProfilePage.routePath);
                    },
                    label: 'My Business Profile',
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: color.grey[800],
                    ),
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: color.grey[400],
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
