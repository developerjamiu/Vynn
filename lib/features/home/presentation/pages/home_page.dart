import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/home/presentation/state/user_provider.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  static const routeName = 'Home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: Center(
        child: user.when(
          data: (data) => Text(data.firstName),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (_, __) => const Text('Error loading user data'),
        ),
      ),
    );
  }
}
