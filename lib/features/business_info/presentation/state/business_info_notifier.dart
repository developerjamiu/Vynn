import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';
import 'package:vynn/features/business_info/presentation/state/business_info_state.dart';

class BusinessInfoInNotifier extends StateNotifier<BusinessInfoState> {
  BusinessInfoInNotifier({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const BusinessInfoState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> updateBusinessInfo(String selectedBusiness) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      final user = _authenticationRepository.currentUser;

      await _userRepository.updateBusinessInfo(
        userId: user!.uid,
        businessInfo: selectedBusiness,
      );

      state = state.copyWith(viewState: ViewState.success);
    } on AppException catch (ex) {
      state = state.copyWith(
        failure: Failure(ex.message),
        viewState: ViewState.failure,
      );
    }
  }

  void signOut() => _authenticationRepository.signOut();
}

final businessInfoNotifierProvider = StateNotifierProvider.autoDispose<
    BusinessInfoInNotifier, BusinessInfoState>(
  (ref) => BusinessInfoInNotifier(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
