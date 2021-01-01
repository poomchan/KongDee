// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/state_setter.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/message_view/message_view_state.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/chat/chat.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/chat/i_chat_repository.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

class MessageViewBloc extends GetxController
    with MyStateSetter<MessageViewState, ChatFailure>{
  final IChatRepository _iChatRepository = Get.find();
  final AuthBloc _authBloc = Get.find();
  final StoreViewBloc _storeViewBloc = Get.find();
  UserDomain get user => _authBloc.user;
  UniqueId get storeId => _storeViewBloc.store.id;

  final scrollController = ScrollController();
  StreamSubscription messageSub;

  Future<void> watchStarted() async {
    setLoading();
    messageSub = _iChatRepository
        .watchStoreMessages(
      storeId: storeId,
      viewerId: user.id,
      amount: Chat.itemPerPage,
    )
        .listen(
      (failreOrChats) {
        failreOrChats.fold(
          (f) => setFailure(f),
          (mList) async {
            setLoaded(state.copyWith(
              messageList: mList.reversed.toList()..addAll(state.messageList),
            ));
          },
        );
      },
    );
  }

  Future<void> fetchMoreChat() async {
    // no need to paginate if the total messages in the room is below 20
    if (state.messageList.length % Chat.itemPerPage != 0) return;
    final fOrMessageList = await _iChatRepository.fetchMoreStoreMessages(
      storeId: storeId,
      viewerId: user.id,
      lastMessage: state.messageList.last,
    );

    fOrMessageList.fold((f) {
      if (f == ChatFailure.emptyChatRoom()) {
        setLoaded();
        return;
      } else {
        setFailure(f);
      }
    }, (mList) {
      setLoaded(state.copyWith(
        messageList: state.messageList..addAll(mList),
      ));
    });
  }

  @override
  void onInit() {
    initState(MessageViewState.initial());
    watchStarted();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    messageSub.cancel();
    super.onClose();
  }
}
