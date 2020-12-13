import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

part 'action_state.freezed.dart';

@freezed
abstract class ActionState with _$ActionState {
  const factory ActionState.inital() = _Initial;
  const factory ActionState.loading() = _Loading;
  const factory ActionState.loaded() = _Loaded;
  const factory ActionState.failure() = _Failure;
}

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
  void updateWithLoading() => _setState(ActionState.loading());
  void updateWithLoaded() => _setState(ActionState.loaded());
  void updateWithFailure(F f) => _setState(ActionState.failure(), f:f);
}
