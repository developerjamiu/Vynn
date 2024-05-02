import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/presentation/state/sign_up_state.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> signUpUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      final userModel = await _authenticationRepository.signUp(
        emailAddress: emailAddress,
        password: password,
      );

      await _userRepository.createUser(userModel);

      state = state.copyWith(viewState: ViewState.success);
    } on AppException catch (ex) {
      state = state.copyWith(
        failure: Failure(ex.message),
        viewState: ViewState.failure,
      );
    }
  }
}

final signUpNotifierProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
