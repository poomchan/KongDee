import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';

class NameField extends ViewWidget<StoreFormBloc>{
  const NameField();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      children: [
        TextFormField(
          initialValue: bloc.store.name.getOrCrash(),
          decoration: InputDecoration(labelText: 'store name'),
          style: TextStyle(fontSize: 30.0),
          maxLines: 1,
          maxLength: StoreName.maxLength,
          onChanged: (val) => bloc.nameChanged(val),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => bloc.store.name.value.fold(
            (f) => f.maybeWhen(
              empty: (_) => 'name must not be emty!',
              multiline: (_) => 'name must have only one line',
              exceedingLength: (_, __) => 'name is too long',
              orElse: () => null,
            ),
            (_) => null,
          ),
        ),
        Text(
          'Location',
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
