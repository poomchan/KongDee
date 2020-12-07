import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/watcher/store_chat_watcher_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/day_card.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/message.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:get/get.dart';

class MessageView extends ViewWidget<StoreChatWatcherBloc> {
  const MessageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<StoreChatWatcherBloc>(
          builder: (bloc) => bloc.state.when(
            inital: () => const Text('Cubit not initialized'),
            failure: () => _buildErrorWidget(context),
            loading: () => circularProgress(context),
            loaded: () => _buildMessageView(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageView(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification &&
            bloc.scrollController.position.extentAfter == 0) {
          bloc.fetchMoreChat();
        }
        return null;
      },
      child: ListView.builder(
        controller: bloc.scrollController,
        shrinkWrap: true,
        reverse: true,
        itemCount: bloc.messageList.length,
        itemBuilder: (context, index) => _buildMessage(bloc.messageList, index),
      ),
    );
  }

  Widget _buildMessage(List<MessageDomain> messages, int index) {
    final m = messages[index];
    return Column(
      children: [
        if (index == messages.length - 1)
          const SizedBox(height: 0)
        else
          m.timestamp.toDate().weekday !=
                  messages[index + 1].timestamp.toDate().weekday
              ? DayCard(dateTime: m.timestamp.toDate())
              : const SizedBox(height: 0),
        Message(
          text: m.body.getOrCrash(),
          isSender: m.isSender,
          avatarUrl: m.senderAvatarUrl.getOrCrash(),
          isTop: index == messages.length - 1
              ? true
              : m.senderId != messages[index + 1].senderId,
          senderName: m.senderName.getOrCrash(),
          timestamp: m.timestamp,
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return GetBuilder<StoreChatWatcherBloc>(
      builder: (bloc) => bloc.failure.when(
        unexpected: () => Text('Unexpected Error'),
        severFailure: () => Text('Server failure, please try again later'),
        noSuchMessage: () => Text("Error 404: No such message"),
        emptyChatRoom: () => Text("Let's send a message to the seller"),
      ),
    );
  }
}
