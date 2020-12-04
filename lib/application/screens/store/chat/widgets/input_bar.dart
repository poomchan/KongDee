import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/form/chat_form_bloc.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:get/get.dart';

class InputBar extends StatelessWidget {
  final UniqueId storeId;

  const InputBar({Key key, @required this.storeId})
      : assert(storeId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatFormBloc>(
      builder: (formBloc) => Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: formBloc.textController,
                textCapitalization: TextCapitalization.sentences,
                minLines: 1,
                maxLines: 5,
                decoration:
                    InputDecoration.collapsed(hintText: 'send a message...'),
                onChanged: (val) => formBloc.bodyChanged(val),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              onPressed: () => formBloc.uploadChat(
                storeId: storeId,
              ),
            ),
            const SizedBox(
              width: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
