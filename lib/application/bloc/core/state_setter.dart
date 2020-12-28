import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'action_state.dart';

mixin MyStateSetter<T, F> on GetxController {
  @mustCallSuper
  T _state;
  F failure;
  ActionState progress = ActionState.inital();

  T get state => _state;

  @mustCallSuper
  void initState(T s) => _state = s;

  void setLoading([T newState]) {
    if (newState != null) {
      _state = newState;
    }
    if (progress != const ActionState.loading()) {
      progress = ActionState.loading();
    }
    update();
  }

  void setLoaded([T newState]) {
    if (newState != null) {
      _state = newState;
    }
    if (progress != const ActionState.loaded()) {
      progress = ActionState.loaded();
    }
    update();
  }

  void setFailure(F f) {
    failure = f;
    if (progress != const ActionState.failure()) {
      progress = ActionState.failure();
    }
    update();
  }

  @override
  void onClose() {
    _state = null;
    progress = null;
    failure = null;
    super.onClose();
  }

}
