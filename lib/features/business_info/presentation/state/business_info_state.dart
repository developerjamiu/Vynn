import 'package:vynn/core/enums/view_state.dart';
import 'package:vynn/core/exception/failure.dart';

class BusinessInfoState {
  const BusinessInfoState({
    this.viewState = ViewState.idle,
    this.failure,
  });

  final ViewState viewState;
  final Failure? failure;

  BusinessInfoState copyWith({
    ViewState? viewState,
    Failure? failure,
  }) {
    return BusinessInfoState(
      viewState: viewState ?? this.viewState,
      failure: failure,
    );
  }
}
