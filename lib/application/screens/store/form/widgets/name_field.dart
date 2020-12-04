import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:get/get.dart';

class NameField extends StatelessWidget {
  const NameField();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      children: [
        GetBuilder<StoreFormBloc>(
          builder: (bloc) => TextFormField(
            decoration: InputDecoration(labelText: 'store name'),
            style: TextStyle(fontSize: 30.0),
            maxLines: 1,
            maxLength: StoreName.maxLength,
            onChanged: (val) => bloc.nameChanged(val),
            validator: (_) => bloc.store.name.value.fold(
              (f) => f.maybeMap(
                empty: (_) => 'name must not be emty!',
                multiline: (_) => 'name must have only one line',
                exceedingLength: (_) => 'name is too long',
                orElse: () => null,
              ),
              (r) => null,
            ),
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
