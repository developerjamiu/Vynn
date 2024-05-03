import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/business_profile/presentation/pages/edit_business_profile_page.dart';
import 'package:vynn/features/business_profile/presentation/state/business_profile_notifier.dart';
import 'package:vynn/features/home/presentation/state/user_provider.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class BusinessProfilePage extends ConsumerStatefulWidget {
  static const routePath = '/business-profile';
  static const routeName = 'BusinessProfile';

  const BusinessProfilePage({super.key});

  @override
  ConsumerState<BusinessProfilePage> createState() =>
      _BusinessProfilePageState();
}

class _BusinessProfilePageState extends ConsumerState<BusinessProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'My Business Profile',
        ),
        body: user.when(
          data: (user) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              const SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: colors.grey.shade100,
                  borderRadius: BorderRadius.circular(68),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: colors.main100,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: colors.main110,
                          child: Icon(
                            Icons.person_outline,
                            color: colors.main100,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.firstName,
                        style: textTheme.titleMedium?.copyWith(
                          color: colors.main100,
                        ),
                      ),
                      Text(
                        user.email,
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                onTap: () {
                  context.go(
                    '${BusinessProfilePage.routePath}/${EditBusinessProfilePage.routePath}',
                    extra: {'user': user},
                  );
                },
                leading: const Icon(Icons.edit_note_rounded),
                title: const Text('Edit Business Information'),
              ),
              ListTile(
                onTap: () {
                  ref.read(businessProfileNotifierProvider.notifier).signOut();
                  context.go(AuthOptionsPage.routePath);
                },
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
              ),
            ],
          ),
          error: (error, __) => const Text('Error loading business profile'),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
