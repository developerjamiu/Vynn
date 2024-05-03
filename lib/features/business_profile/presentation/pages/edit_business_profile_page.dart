import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/extensions/snackbar_extension.dart';
import 'package:vynn/core/extensions/validation_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/authentication/models/user_model.dart';
import 'package:vynn/features/business_info/presentation/pages/business_info_page.dart';
import 'package:vynn/features/business_info/presentation/pages/business_list_page.dart';
import 'package:vynn/features/business_profile/presentation/state/edit_business_profile_notifier.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class EditBusinessProfilePage extends ConsumerStatefulWidget {
  static const routePath = 'edit-business-profile';
  static const routeName = 'EditBusinessProfile';

  const EditBusinessProfilePage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  ConsumerState<EditBusinessProfilePage> createState() =>
      _EditBusinessProfilePageState();
}

class _EditBusinessProfilePageState
    extends ConsumerState<EditBusinessProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final _firstNameController = TextEditingController(
    text: widget.user.firstName,
  );
  late final _lastNameController = TextEditingController(
    text: widget.user.lastName,
  );
  late final _businessInfoController = TextEditingController(
    text: widget.user.businessInfo,
  );

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _businessInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editBusinessProfileNotifier = ref.watch(
      editBusinessProfileNotifierProvider(widget.user),
    );

    ref.listen(
      editBusinessProfileNotifierProvider(widget.user),
      (previous, next) {
        if (next.failure != null) {
          context.showErrorSnackbar(next.failure!.message);
        }

        if (next.viewState == ViewState.success) {
          context.pop();
        }
      },
    );

    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Edit Business Profile',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.main100,
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppTextFormField(
                      hintText: 'John',
                      labelText: 'First Name',
                      keyboardType: TextInputType.name,
                      controller: _firstNameController,
                      validator: context.validateFieldNotEmpty,
                    ),
                    const SizedBox(height: 24),
                    AppTextFormField(
                      hintText: 'Doe',
                      labelText: 'Last name',
                      keyboardType: TextInputType.name,
                      controller: _lastNameController,
                      validator: context.validateFieldNotEmpty,
                    ),
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 32,
                  ),
                  child: AppButton(
                    loading: editBusinessProfileNotifier.viewState ==
                        ViewState.loading,
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(
                              editBusinessProfileNotifierProvider(widget.user)
                                  .notifier,
                            )
                            .updateBusinessProfile(
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              businessInfo: _businessInfoController.text.trim(),
                            );
                      }
                    },
                    label: 'Save Changes',
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
