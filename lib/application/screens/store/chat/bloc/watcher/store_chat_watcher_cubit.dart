import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_chat_watcher_state.dart';
part 'store_chat_watcher_cubit.freezed.dart';

class StoreChatWatcherCubit extends Cubit<StoreChatWatcherState> {
  final IMessageRepository _iMessageRepository = getIt<IMessageRepository>();
  final IAuthFacade _iAuthFacade = getIt<IAuthFacade>();

  UserDomain user;
  List<MessageDomain> finalMessageList = [];
  List<MessageDomain> recentMessageList = [];
  List<MessageDomain> moreMessageList = [];

  StoreChatWatcherCubit() : super(_Initial());

  Future<void> watchStarted(UniqueId storeId) async {
    emit(StoreChatWatcherState.loading(finalMessageList));

    final userOption = await _iAuthFacade.getSignedInUser();
    user = userOption.getOrElse(
      () => throw 'User unauthenticated',
      // emit a failure to navigate to sign-in screen, then return
    );

    _iMessageRepository
        .watchMessages(storeId: storeId, viewerId: user.id)
        .listen(
      (failreOrChats) {
        failreOrChats.fold(
          (f) => emit(StoreChatWatcherState.failure(f)),
          (chatList) async {
            recentMessageList = List.from(chatList.reversed);
            finalMessageList = List.from(recentMessageList);
            finalMessageList.addAll(moreMessageList);
            emit(StoreChatWatcherState.loaded(finalMessageList));
          },
        );
      },
    );
  }

  Future<void> fetchMoreChat(UniqueId storeId) async {
    assert(user != null);

    // no need to paginate if the total messages in the room is below 20
    if (moreMessageList.length % IMessageRepository.itemPerPage != 0) return;

    final fOrMessageList = await _iMessageRepository.fetchMoreMessages(
        storeId: storeId, viewerId: user.id);

    fOrMessageList.fold((f) {
      if (f == MessageFailure.emptyChatRoom()) {
        return;
      } else {
        emit(StoreChatWatcherState.failure(f));
      }
    }, (mList) {
      moreMessageList.addAll(mList);
      finalMessageList = List.from(recentMessageList);
      finalMessageList.addAll(moreMessageList);
      emit(StoreChatWatcherState.inital());
      emit(StoreChatWatcherState.loaded(finalMessageList));
    });
  }

  @override
  Future<void> close() {
    _iMessageRepository.clearState();
    return super.close();
  }
}
