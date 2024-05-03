import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/extensions/snackbar_extension.dart';
import 'package:vynn/core/extensions/validation_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/models/user_model.dart';
import 'package:vynn/features/home/presentation/pages/options_list_page.dart';
import 'package:vynn/features/home/presentation/state/content_options_notifier.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_image.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';

class ContentOptionsBottomSheet extends ConsumerStatefulWidget {
  const ContentOptionsBottomSheet({
    super.key,
    required this.user,
  });

  final UserModel user;

  static Future<T?> show<T>(
    BuildContext context, {
    required UserModel user,
  }) =>
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => ContentOptionsBottomSheet(user: user),
      );

  @override
  ConsumerState<ContentOptionsBottomSheet> createState() =>
      _ContentOptionsBottomSheetState();
}

class _ContentOptionsBottomSheetState
    extends ConsumerState<ContentOptionsBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late final _contentFocusController = TextEditingController(
    text: widget.user.contentFocus,
  );
  late final _contentToneController = TextEditingController(
    text: widget.user.contentTone,
  );
  late final _targetAudienceController = TextEditingController(
    text: widget.user.targetAudience,
  );

  @override
  void dispose() {
    _contentFocusController.dispose();
    _contentToneController.dispose();
    _targetAudienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contentOptionsNotifier = ref.watch(
      contentOptionsNotifierProvider(widget.user),
    );

    ref.listen(
      contentOptionsNotifierProvider(widget.user),
      (previous, next) {
        if (next.failure != null) {
          context.showErrorSnackbar(next.failure!.message);
        }

        if (next.viewState == ViewState.success) {
          context.pop(true);
        }
      },
    );

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
                'CONNECT OPTIONS',
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextFormField(
                      hintText: 'Lead Generation',
                      labelText: 'Content focus',
                      validator: context.validateFieldNotEmpty,
                      controller: _contentFocusController,
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () async {
                        final contentTone = await context.push<String?>(
                          '/${OptionsListPage.routePath}',
                          extra: {
                            'options': [
                              'Informative',
                              'Funny',
                              'Casual',
                              'Controversial',
                              'Factual',
                              'Question'
                            ],
                            'title': 'Select Content Tone',
                          },
                        );

                        if (contentTone == null) return;

                        _contentToneController.text = contentTone;
                      },
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          hintText: 'Content Tone',
                          labelText: 'Informative',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icons.chevron_right,
                          controller: _contentToneController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () async {
                        final targetAudience = await context.push<String?>(
                          '/${OptionsListPage.routePath}',
                          extra: {
                            'options': [
                              'Kids',
                              'Adults',
                              'Professionals',
                              'Students',
                              'Elderly',
                              'All',
                            ],
                            'title': 'Select Content Tone',
                          },
                        );

                        if (targetAudience == null) return;

                        _targetAudienceController.text = targetAudience;
                      },
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          hintText: 'Target Audience',
                          labelText: 'Target Audience',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icons.chevron_right,
                          controller: _targetAudienceController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      loading:
                          contentOptionsNotifier.viewState == ViewState.loading,
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(
                                contentOptionsNotifierProvider(widget.user)
                                    .notifier,
                              )
                              .updateContentOptions(
                                contentFocus:
                                    _contentFocusController.text.trim(),
                                contentTone: _contentToneController.text.trim(),
                                targetAudience:
                                    _targetAudienceController.text.trim(),
                              );
                        }
                      },
                      label: 'Save New Options',
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
