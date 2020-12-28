import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/input_bar/input_bar_bloc.dart';
import 'package:fluttertaladsod/domain/chat/value_objects.dart';
import 'package:get/get.dart';

class InputBar extends StatelessWidget {
  const InputBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputBarBloc>(
      builder: (bloc) => Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: bloc.inputController,
                textCapitalization: TextCapitalization.sentences,
                minLines: 1,
                maxLines: 5,
                decoration:
                    InputDecoration.collapsed(hintText: 'send a message...'),
                validator: (val) => bloc.state.showErrorMessage
                    ? MessageBody(val).failureOrUnit.fold(
                          (f) => f.maybeWhen(
                            exceedingLength: (_, len) =>
                                'message is too long: $len/${MessageBody.maxLength}',
                            empty: (_) => 'message cannot be empty',
                            orElse: () => null,
                          ),
                          (ok) => null,
                        )
                    : null,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              iconSize: 25.0,
              onPressed: () => bloc.uploadChat(),
            ),
            const SizedBox(width: 10.0)
          ],
        ),
      ),
    );
  }
}
