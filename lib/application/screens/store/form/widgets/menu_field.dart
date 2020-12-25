import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/validators.dart';
import 'package:get/get.dart';

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
          validator: (_) => validateStoreMenu(bloc.store.menu).fold(
            (f) => f.maybeMap(
              exceedingLength: (_) =>
                  'menu too long!? ${_.failedValue.length}/${_.max}',
              orElse: () => null,
            ),
            (ok) => null,
          ),
        ),
      ],
    );
  }
}
