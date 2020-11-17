part of 'store_chat_watcher_cubit.dart';

@freezed
abstract class StoreChatWatcherState with _$StoreChatWatcherState {
  const factory StoreChatWatcherState.inital() = _Initial;
  const factory StoreChatWatcherState.loading(
    List<MessageDomain> previousChatList,
  ) = _Loading;
  const factory StoreChatWatcherState.loaded(
    List<MessageDomain> chatList,
  ) = _Loaded;
  const factory StoreChatWatcherState.failure(
    MessageFailure f,
  ) = _Failure;
}
