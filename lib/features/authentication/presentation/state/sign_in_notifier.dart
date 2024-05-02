import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/presentation/state/sign_in_state.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignInState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> signInUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      await _authenticationRepository.signIn(
        emailAddress: emailAddress,
        password: password,
      );

      state = state.copyWith(viewState: ViewState.success);
    } on AppException catch (ex) {
      state = state.copyWith(
        failure: Failure(ex.message),
        viewState: ViewState.failure,
      );
    }
  }
}

final signInNotifierProvider =
    StateNotifierProvider.autoDispose<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
  ),
);
