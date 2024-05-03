import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/extensions/snackbar_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/business_info/presentation/pages/business_list_page.dart';
import 'package:vynn/features/business_info/presentation/state/business_info_notifier.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class BusinessInfoPage extends ConsumerStatefulWidget {
  static const routePath = '/business-info';
  static const routeName = 'BusinessInfo';

  const BusinessInfoPage({super.key});

  @override
  ConsumerState<BusinessInfoPage> createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends ConsumerState<BusinessInfoPage> {
  late final _businessInfoController = TextEditingController();

  @override
  void dispose() {
    _businessInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final businessInfoNotifier = ref.watch(businessInfoNotifierProvider);

    ref.listen(
      businessInfoNotifierProvider,
      (previous, next) {
        if (next.failure != null) {
          context.showErrorSnackbar(next.failure!.message);
        }

        if (next.viewState == ViewState.success) {
          context.go(HomePage.routePath);
        }
      },
    );

    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: CustomAppBar(
          onBackPressed: () {
            context.go(AuthOptionsPage.routePath);
            ref.watch(businessInfoNotifierProvider.notifier).signOut();
          },
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'What industry are you in?',
                    style: textTheme.headlineSmall?.copyWith(
                      color: colors.main100,
                    ),
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () async {
                      final business = await context.push<String?>(
                        '${BusinessInfoPage.routePath}/${BusinessListPage.routePath}',
                      );

                      if (business == null) return;

                      _businessInfoController.text = business;
                    },
                    child: AbsorbPointer(
                      child: AppTextFormField(
                        hintText: 'Select Industry',
                        labelText: 'Select Industry',
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icons.chevron_right,
                        controller: _businessInfoController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 32,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: _businessInfoController,
                    builder: (context, value, child) => AppButton(
                      loading:
                          businessInfoNotifier.viewState == ViewState.loading,
                      disabled: value.text.isEmpty,
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        ref
                            .read(businessInfoNotifierProvider.notifier)
                            .updateBusinessInfo(_businessInfoController.text);
                      },
                      label: 'Continue',
                    ),
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
