import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/models/user_model.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';
import 'package:vynn/features/business_profile/presentation/state/edit_business_profile_state.dart';

class EditBusinessProfileNotifier
    extends StateNotifier<EditBusinessProfileState> {
  EditBusinessProfileNotifier({
    required UserRepository userRepository,
    required UserModel user,
  })  : _userRepository = userRepository,
        super(EditBusinessProfileState(user: user));

  final UserRepository _userRepository;

  Future<void> updateBusinessProfile({
    required String firstName,
    required String lastName,
    required String businessInfo,
  }) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      final user = state.user.copyWith(
        firstName: firstName,
        lastName: lastName,
        businessInfo: businessInfo,
      );

      await _userRepository.updateUser(user);

      state = state.copyWith(viewState: ViewState.success);
    } on AppException catch (ex) {
      state = state.copyWith(
        failure: Failure(ex.message),
        viewState: ViewState.failure,
      );
    }
  }
}

final editBusinessProfileNotifierProvider = StateNotifierProvider.family
    .autoDispose<EditBusinessProfileNotifier, EditBusinessProfileState,
        UserModel>(
  (ref, user) => EditBusinessProfileNotifier(
    user: user,
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
