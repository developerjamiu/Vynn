import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/presentation/state/sign_in_state.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const SignInState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> signInUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      final user = await _authenticationRepository.signIn(
        emailAddress: emailAddress,
        password: password,
      );

      final appUser = await _userRepository.getUser(user.uid);

      if (appUser == null) {
        state = state.copyWith(
          failure: const Failure('There was an error signing in user'),
          viewState: ViewState.failure,
        );
        await _authenticationRepository.signOut();
        return;
      }

      if (appUser.businessInfo == null || appUser.businessInfo!.isEmpty) {
        state = state.copyWith(businessInfoNeeded: true);
      }

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
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
