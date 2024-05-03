import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/authentication/presentation/pages/auth_options_page.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';
import 'package:vynn/features/business_info/presentation/pages/business_info_page.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';
import 'package:vynn/features/initialization/presentation/state/initialization_state.dart';

class InitializationNotifier extends StateNotifier<InitializationState> {
  InitializationNotifier({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const InitializationState()) {
    scheduleMicrotask(initializeApp);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> initializeApp() async {
    try {
      final firebaseUser = _authenticationRepository.currentUser;

      if (firebaseUser == null || !firebaseUser.emailVerified) {
        state = state.copyWith(redirectPath: AuthOptionsPage.routePath);
        return;
      }

      final appUser = await _userRepository.getUser(firebaseUser.uid);
      if (appUser == null) {
        state = state.copyWith(redirectPath: AuthOptionsPage.routePath);
        return;
      }

      if (appUser.businessInfo == null || appUser.businessInfo!.isEmpty) {
        state = state.copyWith(redirectPath: BusinessInfoPage.routePath);
        return;
      }

      state = state.copyWith(redirectPath: HomePage.routePath);
    } catch (e) {
      state = state.copyWith(redirectPath: AuthOptionsPage.routePath);
    }
  }

  void signOut() => _authenticationRepository.signOut();
}

final initializationNotifierProvider =
    StateNotifierProvider<InitializationNotifier, InitializationState>(
  (ref) => InitializationNotifier(
    authenticationRepository: ref.read(authenticationRepositoryProvider),
    userRepository: ref.read(userRepositoryProvider),
  ),
);
