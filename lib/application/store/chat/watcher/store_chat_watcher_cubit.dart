import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_chat_watcher_state.dart';
part 'store_chat_watcher_cubit.freezed.dart';

@injectable
class StoreChatWatcherCubit extends Cubit<StoreChatWatcherState> {
  final IMessageRepository _iChatRepository;
  final IAuthFacade _iAuthFacade;

  UserDomain user;
  List<MessageDomain> messageList = [];

  StoreChatWatcherCubit(this._iChatRepository, this._iAuthFacade)
      : super(_Initial());

  Future<void> watchStarted(UniqueId storeId) async {
    emit(StoreChatWatcherState.loading(messageList));

    final userOption = await _iAuthFacade.getSignedInUser();
    user = userOption.getOrElse(() => throw 'User unauthenticated');

    _iChatRepository.watchMessages(storeId: storeId, viewerId: user.id).listen(
      (failreOrChats) {
        failreOrChats.fold(
          (f) => emit(StoreChatWatcherState.failure(f)),
          (chatList) async {
            messageList = chatList;
            emit(StoreChatWatcherState.loaded(messageList));
          },
        );
      },
    );
  }

  Future<void> fetchMoreChat(UniqueId storeId) async {
    assert(user != null);

    // no need to paginate if the total messages in the room is below 20
    // (just a single page)
    if (messageList.length < 20) return;

    emit(StoreChatWatcherState.loading(messageList));

    final fOrMessageList = await _iChatRepository.fetchMoreMessages(
        storeId: storeId, viewerId: user.id);

    fOrMessageList.fold((f) {
      if (f == MessageFailure.emptyChatRoom()) {
        emit(StoreChatWatcherState.loaded(messageList));
      } else {
        emit(StoreChatWatcherState.failure(f));
      }
    }, (mList) {
      messageList.insertAll(0, mList);
      emit(StoreChatWatcherState.loaded(messageList));
    });
  }

  @override
  Future<void> close() {
    _iChatRepository.clearState();
    return super.close();
  }
}
