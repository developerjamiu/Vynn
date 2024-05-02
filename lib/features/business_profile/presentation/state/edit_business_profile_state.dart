import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/failure.dart';
import 'package:vynn/features/authentication/models/user_model.dart';

class EditBusinessProfileState {
  const EditBusinessProfileState({
    required this.user,
    this.viewState = ViewState.idle,
    this.failure,
  });

  final UserModel user;
  final ViewState viewState;
  final Failure? failure;

  EditBusinessProfileState copyWith({
    UserModel? user,
    ViewState? viewState,
    bool? businessInfoNeeded,
    Failure? failure,
  }) {
    return EditBusinessProfileState(
      user: user ?? this.user,
      viewState: viewState ?? this.viewState,
      failure: failure ?? this.failure,
    );
  }
}
