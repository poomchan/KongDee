import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_form_state.freezed.dart';

@freezed
abstract class ChatFormState with _$ChatFormState {
  const factory ChatFormState({
    @required Option<MessageDomain> uploadingChat,
    @required MessageDomain chat,
    @required bool isUploading,
    @required Option<Either<MessageFailure, Unit>> uploadSuccessOrFailureOption,
  }) = _ChatFormState;

  factory ChatFormState.inital() => ChatFormState(
        chat: MessageDomain.empty(),
        uploadingChat: none(),
        isUploading: false,
        uploadSuccessOrFailureOption: none(),
      );
}
