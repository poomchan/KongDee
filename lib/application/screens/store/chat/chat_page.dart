import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/input_bar.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/message_view.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';

class ChatPage extends StatelessWidget {
  final UniqueId storeId;

  const ChatPage({Key key, @required this.storeId})
      : assert(storeId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              MessageView(storeId: storeId),
              const Divider(height: 0),
              InputBar(storeId: storeId),
            ],
          ),
        ),
      ),
    );
  }
}
