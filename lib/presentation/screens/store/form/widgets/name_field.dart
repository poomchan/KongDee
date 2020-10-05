import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertaladsod/application/store/store_form/store_form_cubit.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/reusable_card.dart';

class NameField extends HookWidget {
  const NameField();
  @override
  Widget build(BuildContext context) {
    final _textFieldController = useTextEditingController();
    // print('building the name field');

    return BlocListener<StoreFormCubit, StoreFormState>(
      listenWhen: (p, c) => p.isEditting != c.isEditting,
      listener: (context, state) {
        if (state.isEditting) {
          _textFieldController.text = state.store.name.getOrCrash();
        }
      },
      child: ReusableCard(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'store name'),
            controller: _textFieldController,
            style: TextStyle(fontSize: 30.0),
            maxLines: 1,
            maxLength: StoreName.maxLength,
            onChanged: (val) => context.bloc<StoreFormCubit>().nameChanged(val),
            validator: (_) => context
                .bloc<StoreFormCubit>()
                .state
                .store
                .name
                .value
                .fold(
                    (f) => f.maybeMap(
                        empty: (_) => 'name must not be emty!',
                        multiline: (_) => 'name must have only one line',
                        exceedingLength: (_) => 'name is too long',
                        orElse: () => null),
                    (r) => null),
          ),
          Text(
            'Location',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
