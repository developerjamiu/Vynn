import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/failure.dart';

class SignInState {
  const SignInState({
    this.viewState = ViewState.idle,
    this.failure,
  });

  final ViewState viewState;
  final Failure? failure;

  SignInState copyWith({
    ViewState? viewState,
    Failure? failure,
  }) {
    return SignInState(
      viewState: viewState ?? this.viewState,
      failure: failure,
    );
  }
}
