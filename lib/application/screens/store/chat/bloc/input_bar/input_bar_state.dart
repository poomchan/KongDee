import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_bar_state.freezed.dart';

@freezed
abstract class InputBarState with _$InputBarState {
  const factory InputBarState({
    @required Option<MessageDomain> uploadingChat,
    @required MessageDomain chat,
    @required bool isUploading,
    @required Option<Either<ChatFailure, Unit>> uploadSuccessOrFailureOption,
  }) = _InputBarState;

  factory InputBarState.inital() => InputBarState(
        chat: MessageDomain.empty(),
        uploadingChat: none(),
        isUploading: false,
        uploadSuccessOrFailureOption: none(),
      );
}
