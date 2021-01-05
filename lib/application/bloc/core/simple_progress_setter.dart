// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'action_state.dart';

/// Mixin contains basic [ActioinState] i.e. initial, loading, loaded, failure.
/// It takes [F] as a Failure type to create [failure] property
mixin SimepleProgressSetter<F> on GetxController {
  /// [ActionState] Union for defining actions of the controller
  ActionState _state = ActionState.inital();
  ActionState get progress => _state;

  F _failure;
  F get failure => _failure;

  void _setState(ActionState state, {F f}) {
    if (f != null) _failure = f;
    _state = state;
    update();
  }

  /// set [progress] with calling [update()]
  void setLoading() => _setState(ActionState.loading());
  void setLoaded() => _setState(ActionState.loaded());
  void setFailure(F f) => _setState(ActionState.failure(), f:f);
}
