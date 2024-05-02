import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/features/business_profile/presentation/pages/business_profile_page.dart';
import 'package:vynn/features/home/presentation/state/user_provider.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  static const routeName = 'Home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: user.when(
                data: (data) => Text(data.firstName),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (_, __) => const Text('Error loading user data'),
              ),
            ),
            AppButton(
              onPressed: () {
                context.go(BusinessProfilePage.routePath);
              },
              label: 'Do',
            ),
          ],
        ),
      ),
    );
  }
}
