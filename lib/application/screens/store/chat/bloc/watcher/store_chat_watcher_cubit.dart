import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:get/get.dart';

class StoreChatWatcherBloc extends GetxController
    with SimpleStateSetter<MessageFailure> {
  final IMessageRepository _iMessageRepository = Get.find<IMessageRepository>();
  final AuthBloc _authBloc = Get.find<AuthBloc>();
  final StoreViewBloc _storeViewBloc = Get.find<StoreViewBloc>();

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  /// the only [Message] list to display on screen
  List<MessageDomain> _finalMessageList = [];

  /// rxList with listener
  List<MessageDomain> _recentMessageList = [];

  /// List with no listener
  List<MessageDomain> _moreMessageList = [];
  List<MessageDomain> get messageList => _finalMessageList;

  Future<void> watchStarted() async {
    setLoadingState();
    final storeId = _storeViewBloc.store.id;
    final user = _authBloc.user;
    _iMessageRepository
        .watchMessages(storeId: storeId, viewerId: user.id)
        .listen(
      (failreOrChats) {
        failreOrChats.fold(
          (f) => setFailureState(f),
          (chatList) async {
            _recentMessageList = List.from(chatList.reversed);
            _finalMessageList = List.from(_recentMessageList);
            _finalMessageList.addAll(_moreMessageList);
            setLoadedState();
          },
        );
      },
    );
  }

  Future<void> fetchMoreChat() async {
    final user = _authBloc.user;
    final storeId = _storeViewBloc.store.id;

    // no need to paginate if the total messages in the room is below 20
    if (_moreMessageList.length % IMessageRepository.itemPerPage != 0) return;

    final fOrMessageList = await _iMessageRepository.fetchMoreMessages(
        storeId: storeId, viewerId: user.id);

    fOrMessageList.fold((f) {
      if (f == MessageFailure.emptyChatRoom()) {
        return;
      } else {
        setFailureState(f);
      }
    }, (mList) {
      _moreMessageList.addAll(mList);
      _finalMessageList = List.from(_recentMessageList);
      _finalMessageList.addAll(_moreMessageList);
      setLoadedState();
    });
  }

  @override
  Future<void> onReady() async {
    await watchStarted();
    super.onReady();
  }

  @override
  void onClose() {
    _iMessageRepository.clearState();
    _scrollController.dispose();
    _finalMessageList = null;
    _recentMessageList = null;
    _moreMessageList = null;
    super.onClose();
  }
}
