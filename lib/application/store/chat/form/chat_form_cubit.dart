import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/domain/message/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_form_state.dart';
part 'chat_form_cubit.freezed.dart';

@injectable
class ChatFormCubit extends Cubit<ChatFormState> {
  ChatFormCubit(this._iChatRepository) : super(ChatFormState.inital());

  final IMessageRepository _iChatRepository;

  Future<void> uploadChat({@required UniqueId storeId}) async {

    Either<MessageFailure, Unit> failureOrSuccess;

    if (state.chat.failureOption.isNone()) {
      emit(state.copyWith(
        isUploading: true,
        uploadingChat: some(state.chat),
        uploadSuccessOrFailureOption: none(),
        chat: MessageDomain.empty(),
      ));
      print('saving to database');
      failureOrSuccess = await _iChatRepository.uploadMessage(
        storeId: storeId,
        chat: state.uploadingChat.fold(() => null, (chat) => chat),
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

}
