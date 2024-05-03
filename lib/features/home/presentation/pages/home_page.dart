import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/extensions/iterable_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/home/presentation/state/home_notifier.dart';
import 'package:vynn/features/home/presentation/state/home_state.dart';
import 'package:vynn/features/home/presentation/state/user_provider.dart';
import 'package:vynn/features/home/presentation/widget/app_menu_bottom_sheet.dart';
import 'package:vynn/features/home/presentation/widget/content_data_view.dart';
import 'package:vynn/features/home/presentation/widget/content_error_view.dart';
import 'package:vynn/features/home/presentation/widget/content_loading_view.dart';
import 'package:vynn/features/home/presentation/widget/content_options_bottom_sheet.dart';
import 'package:vynn/features/shared/widgets/app_image.dart';
import 'package:vynn/features/shared/widgets/circular_button.dart';
import 'package:vynn/features/shared/widgets/socials.dart';

import '../../../shared/widgets/app_button.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  static const routeName = 'Home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final homeNotifier = ref.watch(homeNotifierProvider);

    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hi, ',
                        style: textTheme.headlineSmall?.copyWith(
                          color: colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'see what we have \nfor you today!',
                            style: textTheme.headlineSmall?.copyWith(
                              color: colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircularIconButton(
                      onPressed: () => AppMenuBottomSheet.show(context),
                      icon: Icons.more_horiz_outlined,
                    )
                  ],
                ),
                const SizedBox(height: 36),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: SocialMedia.values
                        .map<Widget>(
                          (socialMedia) => GestureDetector(
                            onTap: () {
                              ref
                                  .read(homeNotifierProvider.notifier)
                                  .selectSocialMedia(socialMedia);
                            },
                            child: SocialsContainer(
                              title: socialMedia.name,
                              isSelected: homeNotifier.selectedSocialMedia ==
                                  socialMedia,
                            ),
                          ),
                        )
                        .insertBetween(const SizedBox(width: 8)),
                  ),
                ),
                const SizedBox(height: 32),
                if (homeNotifier.viewState == ViewState.loading)
                  const ContentLoadingView()
                else if (homeNotifier.failure != null)
                  const ContentErrorView()
                else if (homeNotifier.content == null)
                  const SizedBox(height: 300)
                else
                  const ContentDataView(),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.swipe(),
                    const SizedBox(width: 8),
                    Text(
                      'Swipe to see other drafts',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: colors.main300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {
                            ref
                                .read(homeNotifierProvider.notifier)
                                .fetchContent();
                          },
                          label: 'Regenerate Content',
                          icon: AppImage.cycle(),
                        ),
                      ),
                      user.when(
                        data: (user) => Row(
                          children: [
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () async {
                                final isSuccess =
                                    await ContentOptionsBottomSheet.show(
                                  context,
                                  user: user,
                                );

                                if (isSuccess == true) {
                                  ref
                                      .read(homeNotifierProvider.notifier)
                                      .fetchContent();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colors.grey[300],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Icon(
                                  Icons.settings_outlined,
                                  color: colors.main300,
                                ),
                              ),
                            )
                          ],
                        ),
                        error: (_, __) => const SizedBox(),
                        loading: () => const SizedBox(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
