import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/repositories/authentication_repository.dart';
import 'package:vynn/features/authentication/repositories/user_repository.dart';
import 'package:vynn/features/home/models/content_params.dart';
import 'package:vynn/features/home/presentation/state/home_state.dart';
import 'package:vynn/features/home/repositories/content_ideas_repository.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required AuthenticationRepository authenticationRepository,
    required ContentIdeasRepository contentIdeasRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _contentIdeasRepository = contentIdeasRepository,
        _userRepository = userRepository,
        super(const HomeState()) {
    fetchContent();
  }

  final AuthenticationRepository _authenticationRepository;
  final ContentIdeasRepository _contentIdeasRepository;
  final UserRepository _userRepository;

  void selectSocialMedia(SocialMedia newSocialMedia) {
    state = state.copyWith(selectedSocialMedia: newSocialMedia);
  }

  Future<void> fetchContent() async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        failure: null,
      );

      final firebaseUser = _authenticationRepository.currentUser;
      final user = await _userRepository.getUser(firebaseUser!.uid);

      final content = await _contentIdeasRepository.getContentIdeas(
        ContentParams(
          companyType: user?.businessInfo ?? '',
          contentFocus: user?.contentFocus,
          contentTone: user?.contentTone,
          targetAudience: user?.targetAudience,
        ),
      );

      state = state.copyWith(
        viewState: ViewState.success,
        content: content,
      );
    } on ContentIdeasException catch (ex) {
      state = state.copyWith(
        failure: Failure(ex.message),
        viewState: ViewState.failure,
      );
    }
  }
}

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
    contentIdeasRepository: ref.watch(contentIdeasRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
