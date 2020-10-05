import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_chat_watcher_state.dart';
part 'store_chat_watcher_cubit.freezed.dart';

@injectable
class StoreChatWatcherCubit extends Cubit<StoreChatWatcherState> {
  final IMessageRepository _iChatRepository;

  List<MessageDomain> chatList = [];

  StoreChatWatcherCubit(this._iChatRepository) : super(_Initial());

  Future<void> watchStarted(UniqueId storeId) async {
    emit(StoreChatWatcherState.loading(chatList));

    _iChatRepository.watchMessages(storeId: storeId).listen(
      (failreOrChats) {
        failreOrChats.fold(
          (f) => emit(
            StoreChatWatcherState.failure(f),
          ),
          (chats) async {
            chatList = await _filterChats(chats);
            // fake state (i'm lazy to extend equatable on the chatList)
            emit(StoreChatWatcherState.inital());
            emit(StoreChatWatcherState.loaded(chatList));
          },
        );
      },
    );
  }

  Future<void> fetchMoreChat(UniqueId storeId) async {
    emit(StoreChatWatcherState.loading(chatList));

    final stream = _iChatRepository.watchMoreMessages(storeId: storeId);

    stream.listen((failureOrChats) {
      failureOrChats.fold((f) {
        if (f == MessageFailure.emtyChat()) {
          emit(StoreChatWatcherState.loaded(chatList));
        } else {
          emit(StoreChatWatcherState.failure(f));
        }
      }, (chats) async {
        final List<MessageDomain> newChats = await _filterChats(chats);
        chatList.insertAll(0, newChats);
        emit(StoreChatWatcherState.loaded(chatList));
      });
    });
  }

  Future<List<MessageDomain>> _filterChats(List<MessageDomain> chats) async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.fold(
      () => throw 'User unauthenticated',
      (user) => user,
    );
    return chats.map(
      (chat) {
        final bool isSender = user.id == chat.senderId;
        return chat.copyWith(isSender: isSender);
      },
    ).toList();
  }
}
