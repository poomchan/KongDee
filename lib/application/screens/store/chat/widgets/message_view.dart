import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/message_view/message_view_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/date_card.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/message.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:get/get.dart';

class MessageView extends ViewWidget<MessageViewBloc> {
  const MessageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<MessageViewBloc>(
          builder: (bloc) => bloc.progress.when(
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
        itemCount: bloc.state.messageList.length,
        itemBuilder: (context, index) => _buildMessage(bloc.state.messageList, index),
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
              ? DateCard(dateTime: m.timestamp.toDate())
              : const SizedBox(height: 0),
        Message(
          m,
          isTop: index == messages.length - 1
              ? true
              : m.senderId != messages[index + 1].senderId,
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return GetBuilder<MessageViewBloc>(
      builder: (bloc) => bloc.failure.when(
        unexpected: (err) => Text('Unexpected Error: $err'),
        severFailure: () => Text('Server failure, please try again later'),
        noSuchMessage: () => Text("Error 404: No such message"),
        emptyChatRoom: () => Text("Let's send a message to the seller"),
      ),
    );
  }
}
