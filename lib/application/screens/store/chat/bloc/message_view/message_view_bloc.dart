import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/message_view/message_view_state.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/chat_avatar_dialog.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:get/get.dart';

class MessageViewBloc extends GetxController
    with SimepleProgressSetter<MessageFailure> {
  IMessageRepository get _iMessageRepository => Get.find<IMessageRepository>();
  AuthBloc get _authBloc => Get.find<AuthBloc>();
  StoreViewBloc get _storeViewBloc => Get.find<StoreViewBloc>();

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  /// rxList with listener
  List<MessageDomain> _recentMessageList = [];

  /// List with no listener
  List<MessageDomain> _moreMessageList = [];

  MessageViewState state = MessageViewState.initial();

  Future<void> watchStarted() async {
    updateWithLoading();
    final storeId = _storeViewBloc.store.id;
    final user = _authBloc.user;
    _iMessageRepository
        .watchMessages(storeId: storeId, viewerId: user.id)
        .listen(
      (failreOrChats) {
        failreOrChats.fold(
          (f) => updateWithFailure(f),
          (mList) async {
            _recentMessageList = List.from(mList.reversed);
            state = state.copyWith(
              messageList: List.from(_recentMessageList)
                ..addAll(_moreMessageList),
            );
            updateWithLoaded();
          },
        );
      },
    );
  }

  Future<void> fetchMoreChat() async {
    final user = _authBloc.user;
    final storeId = _storeViewBloc.store.id;

    // no need to paginate if the total messages in the room is below 20
    if (_moreMessageList.length % IMessageRepository.itemPerPage != 0) return;

    final fOrMessageList = await _iMessageRepository.fetchMoreMessages(
        storeId: storeId, viewerId: user.id);

    fOrMessageList.fold((f) {
      if (f == MessageFailure.emptyChatRoom()) {
        return;
      } else {
        updateWithFailure(f);
      }
    }, (mList) {
      _moreMessageList.addAll(mList);
      state = state.copyWith(
        messageList: state.messageList..addAll(_moreMessageList),
      );
      updateWithLoaded();
    });
  }

  void onMessageAvatarTapped(String name) {
    showCupertinoModalPopup(
      context: Get.context,
      builder: (_) => buildAvatarActionSheet(name),
    );
  }

  @override
  Future<void> onReady() async {
    await watchStarted();
    super.onReady();
  }

  @override
  void onClose() {
    state = null;
    _iMessageRepository.clearState();
    _scrollController.dispose();
    _recentMessageList = null;
    _moreMessageList = null;
    super.onClose();
  }
}
