import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/message_view/message_view_state.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/chat/chat.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/chat/i_chat_repository.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:get/get.dart';

class MessageViewBloc extends GetxController
    with SimepleProgressSetter<ChatFailure> {
  IChatRepository get _iMessageRepository => Get.find();
  AuthBloc get _authBloc => Get.find();
  StoreViewBloc get _storeViewBloc => Get.find();

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  List<MessageDomain> _recentMessageList = [];
  List<MessageDomain> _moreMessageList = [];

  MessageViewState state = MessageViewState.initial();

  Future<void> watchStarted() async {
    updateWithLoading();
    final storeId = _storeViewBloc.store.id;
    final user = _authBloc.user;
    _iMessageRepository
        .watchStoreMessages(
      storeId: storeId,
      viewerId: user.id,
      amount: Chat.itemPerPage,
    )
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
    if (_moreMessageList.length % Chat.itemPerPage != 0) return;

    final fOrMessageList = await _iMessageRepository.fetchMoreStoreMessages(
      storeId: storeId,
      viewerId: user.id,
      lastMessage: state.messageList.last,
    );

    fOrMessageList.fold((f) {
      if (f == ChatFailure.emptyChatRoom()) {
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

  @override
  Future<void> onReady() async {
    await watchStarted();
    super.onReady();
  }

  @override
  void onClose() {
    state = null;
    _scrollController.dispose();
    _recentMessageList = null;
    _moreMessageList = null;
    super.onClose();
  }
}
