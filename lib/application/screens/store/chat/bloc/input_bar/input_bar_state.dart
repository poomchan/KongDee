import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_bar_state.freezed.dart';

@freezed
abstract class InputBarState with _$InputBarState {
  const factory InputBarState({
    @required Option<MessageDomain> uploadingChat,
    @required MessageDomain chat,
    @required bool isUploading,
    @required Option<Either<MessageFailure, Unit>> uploadSuccessOrFailureOption,
  }) = _InputBarState;

  factory InputBarState.inital() => InputBarState(
        chat: MessageDomain.created(),
        uploadingChat: none(),
        isUploading: false,
        uploadSuccessOrFailureOption: none(),
      );
}
