import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/domain/message/value_objects.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_form_state.dart';
part 'chat_form_cubit.freezed.dart';

class ChatFormCubit extends Cubit<ChatFormState> {
  final IMessageRepository _iChatRepository = getIt<IMessageRepository>();
  final IAuthFacade _iAuthFacade = getIt<IAuthFacade>();

  final textController = TextEditingController();

  ChatFormCubit() : super(ChatFormState.inital());

  Future<void> uploadChat({@required UniqueId storeId}) async {
    Either<MessageFailure, Unit> failureOrSuccess;

    if (state.chat.failureOption.isNone()) {
      textController.text = '';
      emit(
        state.copyWith(
          isUploading: true,
          uploadingChat: some(state.chat),
          uploadSuccessOrFailureOption: none(),
          chat: MessageDomain.empty(),
        ),
      );

      final userOption = await _iAuthFacade.getSignedInUser();
      final user = userOption.getOrElse(() => throw 'User unauthenticated');

      failureOrSuccess = await _iChatRepository.uploadMessage(
        storeId: storeId,
        chat: state.uploadingChat
            .getOrElse(
              () => null,
            )
            .copyWith(
              senderId: user.id,
              senderName: SenderName(user.displayName),
              senderAvatarUrl: SenderAvatarUrl(user.photoURL),
            ),
      );

      emit(
        state.copyWith(
          isUploading: false,
          uploadingChat: none(),
          uploadSuccessOrFailureOption: some(failureOrSuccess),
        ),
      );
    }

    emit(state.copyWith(
      uploadingChat: none(),
      isUploading: false,
      uploadSuccessOrFailureOption: optionOf(failureOrSuccess),
    ));
  }

  Future<void> bodyChanged(String value) async {
    emit(
      state.copyWith(
        chat: state.chat.copyWith(
          body: MessageBody(value),
        ),
        uploadSuccessOrFailureOption: none(),
      ),
    );
  }

  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }
}
