part of 'chat_form_cubit.dart';

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
