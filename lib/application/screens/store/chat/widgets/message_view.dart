import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/controller/chat_view_controller.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/watcher/store_chat_watcher_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/day_card.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/message.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:get/get.dart';

class MessageView extends StatelessWidget {
  final UniqueId storeId;
  const MessageView({
    Key key,
    @required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Get.put(StoreChatWatcherCubit()..watchStarted(storeId));
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<StoreChatWatcherCubit, StoreChatWatcherState>(
          cubit: bloc,
          builder: (_, state) => state.map(
            inital: (_) => const Text('Cubit not initialized'),
            failure: (s) => _buildErrorWidget(context, s.f),
            loading: (_) => circularProgress(context),
            loaded: (s) => _buildMessageView(context, s.chatList),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageView(BuildContext context, List<MessageDomain> mList) {
    final bloc = Get.find<StoreChatWatcherCubit>();
    return Obx(() {
      final controller = Get.put(ChatViewController()).scrollController;
      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification &&
              controller.position.extentAfter == 0) {
            bloc.fetchMoreChat(storeId);
          }
          return null;
        },
        child: ListView.builder(
          controller: controller,
          shrinkWrap: true,
          reverse: true,
          itemCount: mList.length,
          itemBuilder: (context, index) => _buildMessage(mList, index),
        ),
      );
    });
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

  Widget _buildErrorWidget(BuildContext context, MessageFailure f) {
    return f.map(
      unexpected: (f) => Text('Unexpected Error: $f'),
      severFailure: (f) => Text('Server failure, please try again later'),
      noSuchMessage: (f) => Text("Error 404: No such message"),
      emptyChatRoom: (f) => Text("Let's send a message to the seller"),
    );
  }
}
