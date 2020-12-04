import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/domain/message/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'chat_form_state.dart';


class ChatFormBloc extends GetxController {
  final IMessageRepository _iChatRepository = Get.find<IMessageRepository>();
  final IAuthFacade _iAuthFacade = Get.find<IAuthFacade>();

  final textController = TextEditingController();
  ChatFormState state = ChatFormState.inital();

  Future<void> uploadChat({@required UniqueId storeId}) async {
    Either<MessageFailure, Unit> failureOrSuccess;

    if (state.chat.failureOption.isNone()) {
      textController.text = '';
      state = state.copyWith(
        isUploading: true,
        uploadingChat: some(state.chat),
        uploadSuccessOrFailureOption: none(),
        chat: MessageDomain.empty(),
      );

      final userOrF = await _iAuthFacade.getSignedInUser();
      final user = userOrF.getOrElse(() => throw 'User unauthenticated');

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

      state = state.copyWith(
        isUploading: false,
        uploadingChat: none(),
        uploadSuccessOrFailureOption: some(failureOrSuccess),
      );
    } else {
      state = state.copyWith(
        uploadingChat: none(),
        isUploading: false,
        uploadSuccessOrFailureOption: optionOf(failureOrSuccess),
      );
    }
  }

  Future<void> bodyChanged(String value) async {
    state = state.copyWith(
      chat: state.chat.copyWith(
        body: MessageBody(value),
      ),
      uploadSuccessOrFailureOption: none(),
    );
  }

  @override
  void onClose() {
    textController.dispose();
    state = null;
    super.onClose();
  }
}
