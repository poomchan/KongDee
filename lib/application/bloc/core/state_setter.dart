// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:get/get_state_manager/get_state_manager.dart';

// Project imports:
import 'action_state.dart';

mixin MyStateSetter<T, F> on GetxController {
  static const observe = false;

  @mustCallSuper
  T _state;
  F failure;
  ActionState progress = ActionState.inital();

  T get state => _state;

  @mustCallSuper
  void initState(T s) => _state = s;

  void setState(T newState, [ActionState newAction]) {
    if (observe) {
      print(
          '$T: ${_getProgressString(newAction)} with ${newState ?? 'no state changed.'}');
    }
    if (newState != null) {
      _state = newState;
    }
    if (progress != newAction) {
      progress = newAction;
    }
  }

  void setLoading([T newState]) {
    setState(newState, const ActionState.loading());
    update();
  }

  void setLoaded([T newState]) {
    setState(newState, const ActionState.loaded());
    update();
  }

  void setFailure(F f) {
    failure = f;
    setState(null, ActionState.failure());
    update();
  }

  String _getProgressString(ActionState prog) {
    if (prog == progress) return 'same state';
    return prog == ActionState.inital()
        ? 'to init'
        : prog == ActionState.loading()
            ? 'to loading'
            : prog == ActionState.loaded()
                ? 'to loaded'
                : 'to failure';
  }

  @override
  void onClose() {
    _state = null;
    progress = null;
    failure = null;
    super.onClose();
  }
}
