import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/chat/i_chat_repository.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:fluttertaladsod/domain/chat/value_objects.dart';
import 'package:get/get.dart';
import 'input_bar_state.dart';


class InputBarBloc extends GetxController {
  final IChatRepository _iChatRepository = Get.find();
  final IAuthFacade _iAuthFacade = Get.find();
  final StoreViewBloc _storeViewBloc = Get.find();

  final textController = TextEditingController();
  InputBarState state = InputBarState.inital();

  Future<void> uploadChat() async {
    Either<ChatFailure, Unit> failureOrSuccess;
    final storeId = _storeViewBloc.store.id;

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

      failureOrSuccess = await _iChatRepository.uploadStoreMessage(
        storeId: storeId,
        message: state.uploadingChat
            .getOrElse(
              () => null,
            )
            .copyWith(
              senderId: user.id,
              senderName: SenderName(user.displayName),
              senderAvatarUrl: SenderAvatarUrl(user.photoUrl),
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

class IMessageRepository {
}
