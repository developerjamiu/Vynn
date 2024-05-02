import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/initialization/presentation/state/initialization_notifier.dart';

class InitializationPage extends ConsumerWidget {
  static const routePath = '/initialization';
  static const routeName = 'Initialization';

  const InitializationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializationNotifier =
        ref.read(initializationNotifierProvider.notifier);

    ref.listen(
      initializationNotifierProvider,
      (previous, next) {
        if (next.redirectPath != null) {
          if (next.redirectPath == AuthOptionsPage.routePath) {
            initializationNotifier.signOut();
          }

          WidgetsBinding.instance.addPostFrameCallback(
            (_) => context.go(next.redirectPath!),
          );

          WidgetsBinding.instance.ensureVisualUpdate();
        }
      },
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
