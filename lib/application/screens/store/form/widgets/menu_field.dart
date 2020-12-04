import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:get/get.dart';

class Menufield extends StatelessWidget {
  const Menufield();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Menu',
      children: [
        GetBuilder<StoreFormBloc>(
          builder: (bloc) => TextFormField(
            minLines: 5,
            maxLines: null,
            maxLength: StoreMenu.maxLength,
            textInputAction: TextInputAction.newline,
            onChanged: (val) => bloc.menuChanged(val),
            validator: (_) => bloc.store.menu.value.fold(
              (f) => f.maybeMap(
                exceedingLength: (_) => 'menu too long!?',
                empty: (_) => 'menu must not be emtyy',
                orElse: () => null,
              ),
              (ok) => null,
            ),
          ),
        ),
      ],
    );
  }
}
