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
/// It takes [T] as a Failure type to create [failure] property
mixin SimpleStateSetter<T> on GetxController {
  /// [ActionState] Union for defining actions of the controller
  ActionState _state = ActionState.inital();
  ActionState get state => _state;

  T _failure;
  T get failure => _failure;

  void _setState(ActionState state, {T f}) {
    if (f != null) _failure = f;
    _state = state;
    update();
  }

  /// set [state] with calling [update()]
  void setLoadingState() => _setState(ActionState.loading());
  void setLoadedState() => _setState(ActionState.loaded());
  void setFailureState(T f) => _setState(ActionState.failure(), f:f);
}
