import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/home/models/content_model.dart';

enum SocialMedia {
  facebook('Facebook post'),
  twitter('Twitter tweet'),
  whatsapp('Whatsapp status');

  const SocialMedia(this.name);
  final String name;
}

class HomeState {
  const HomeState({
    this.selectedSocialMedia = SocialMedia.facebook,
    this.content,
    this.viewState = ViewState.idle,
    this.failure,
  });

  final SocialMedia selectedSocialMedia;
  final ContentModel? content;
  final ViewState viewState;
  final Failure? failure;

  List<String> get selectedContents {
    final content = this.content;

    if (content == null) return [];

    switch (selectedSocialMedia) {
      case SocialMedia.facebook:
        return content.facebook;
      case SocialMedia.twitter:
        return content.twitter;
      case SocialMedia.whatsapp:
        return content.whatsApp;
    }
  }

  HomeState copyWith({
    SocialMedia? selectedSocialMedia,
    ContentModel? content,
    ViewState? viewState,
    Failure? failure,
  }) {
    return HomeState(
      selectedSocialMedia: selectedSocialMedia ?? this.selectedSocialMedia,
      content: content ?? this.content,
      viewState: viewState ?? this.viewState,
      failure: failure ?? this.failure,
    );
  }
}
