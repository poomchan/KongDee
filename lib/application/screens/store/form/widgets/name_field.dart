// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';

class NameField extends StatelessWidget {
  const NameField();

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoreFormBloc>();
    return ReusableCard(
      children: [
        TextFormField(
            initialValue: bloc.store.name,
            decoration: InputDecoration(labelText: 'store name'),
            style: TextStyle(fontSize: 30.0),
            maxLines: 1,
            maxLength: StoreName.maxLength,
            onChanged: (val) => bloc.nameChanged(val),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (_) => StoreName(bloc.store.name).value.fold(
                  (f) => f.maybeWhen(
                    exceedingLength: (val, length) => 'name is too long',
                    empty: (val) => 'name cannot be empty',
                    multiline: (val) => 'name must have one line',
                    orElse: () => null,
                  ),
                  (ok) => null,
                )),
        Text(
          'Location',
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
