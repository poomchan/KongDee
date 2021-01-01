// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';

class Menufield extends ViewWidget<StoreFormBloc> {
  const Menufield();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Menu',
      children: [
        TextFormField(
          controller: bloc.state.menuController,
          minLines: 5,
          maxLines: null,
          textInputAction: TextInputAction.newline,
          autovalidateMode: AutovalidateMode.always,
          validator: (_) => bloc.state.nameDomain.value.fold(
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
