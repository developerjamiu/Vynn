import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/failure.dart';

class SignInState {
  const SignInState({
    this.businessInfoNeeded = false,
    this.viewState = ViewState.idle,
    this.failure,
  });

  final ViewState viewState;
  final bool businessInfoNeeded;
  final Failure? failure;

  SignInState copyWith({
    ViewState? viewState,
    bool? businessInfoNeeded,
    Failure? failure,
  }) {
    return SignInState(
      viewState: viewState ?? this.viewState,
      businessInfoNeeded: businessInfoNeeded ?? this.businessInfoNeeded,
      failure: failure,
    );
  }
}
