// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/state_setter.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/chat/i_chat_repository.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'input_bar_state.dart';

class InputBarBloc extends GetxController
    with MyStateSetter<InputBarState, ChatFailure> {
  final IChatRepository _iChatRepository = Get.find();
  final AuthBloc _authBloc = Get.find();
  final StoreViewBloc _storeViewBloc = Get.find();
  UserDomain get _user => _authBloc.user;
  UniqueId get _storeId => _storeViewBloc.store.id;

  final inputController = TextEditingController();

  Future<void> onSendButtonTapped() async {
    final message = MessageDomain.created(
      user: _user,
      body: inputController.text,
    );
    if (message.isValid) {
      inputController.text = '';
      setLoading(state.copyWith(
        isUploading: true,
        showErrorMessage: false,
      ));

      final failureOrSuccess = await _iChatRepository.uploadStoreMessage(
        storeId: _storeId,
        message: message,
      );

      failureOrSuccess.fold(
        (f) => f.maybeWhen(
          severFailure: () => Get.showSnackbar(
            GetBar(message: 'server failure, please try again later'),
          ),
          unexpected: (f) => Get.showSnackbar(
            GetBar(message: 'error : $f'),
          ),
          orElse: () => null,
        ),
        (unit) => null,
      );

      setLoaded(state.copyWith(
        isUploading: false,
      ));
    } else {
      setLoaded(state.copyWith(showErrorMessage: true));
    }
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    initState(InputBarState.inital());
    super.onInit();
  }
}
