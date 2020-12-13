import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_view_state.freezed.dart';

@immutable
@freezed
abstract class MessageViewState with _$MessageViewState {
  const factory MessageViewState({
    @required List<MessageDomain> messageList,
  }) = _MessageViewState;

  factory MessageViewState.initial() => MessageViewState(
        messageList: const [],
      );
}
