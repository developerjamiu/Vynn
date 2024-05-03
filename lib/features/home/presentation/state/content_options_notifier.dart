import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/models/user_model.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';
import 'package:vynn/features/home/presentation/state/content_options_state.dart';

class ContentOptionsNotifier extends StateNotifier<ContentOptionsState> {
  ContentOptionsNotifier({
    required UserRepository userRepository,
    required UserModel user,
  })  : _userRepository = userRepository,
        super(ContentOptionsState(user: user));

  final UserRepository _userRepository;

  Future<void> updateContentOptions({
    required String contentFocus,
    required String contentTone,
    required String targetAudience,
  }) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      final user = state.user.copyWith(
        contentFocus: contentFocus,
        contentTone: contentTone,
        targetAudience: targetAudience,
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

final contentOptionsNotifierProvider = StateNotifierProvider.family
    .autoDispose<ContentOptionsNotifier, ContentOptionsState, UserModel>(
  (ref, user) => ContentOptionsNotifier(
    user: user,
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
