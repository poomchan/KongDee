// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';

class Menufield extends StatelessWidget {
  const Menufield();

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoreFormBloc>();
    return ReusableCard(
      title: 'Menu',
      children: [
        TextFormField(
          initialValue: bloc.store.menu,
          minLines: 5,
          maxLines: null,
          textInputAction: TextInputAction.newline,
          onChanged: (val) => bloc.menuChanged(val),
          autovalidateMode: AutovalidateMode.always,
          validator: (_) => StoreMenu(bloc.store.menu).value.fold(
                (f) => f.maybeWhen(
                  exceedingLength: (val, length) => 'menu is too long',
                  orElse: () => null,
                ),
                (ok) => null,
              ),
        ),
      ],
    );
  }
}
