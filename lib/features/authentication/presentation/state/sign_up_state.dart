import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/failure.dart';

class SignUpState {
  const SignUpState({
    this.viewState = ViewState.idle,
    this.failure,
  });

  final ViewState viewState;
  final Failure? failure;

  SignUpState copyWith({
    ViewState? viewState,
    Failure? failure,
  }) {
    return SignUpState(
      viewState: viewState ?? this.viewState,
      failure: failure,
    );
  }
}
