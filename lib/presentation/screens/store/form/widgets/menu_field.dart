import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_form/store_form_cubit.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/reusable_card.dart';

class Menufield extends StatefulWidget {
  @override
  _MenufieldState createState() => _MenufieldState();
}

class _MenufieldState extends State<Menufield> {
  TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreFormCubit, StoreFormState>(
      listenWhen: (p, c) => p.isEditting != c.isEditting,
      listener: (context, state) =>
          _textFieldController.text = state.store.menu.getOrCrash(),
      buildWhen: (p, c) => p.store.menu != c.store.menu,
      builder: (context, state) => ReusableCard(
        title: 'Menu',
        children: [
          TextFormField(
            controller: _textFieldController,
            minLines: 5,
            maxLines: null,
            maxLength: StoreMenu.maxLength,
            textInputAction: TextInputAction.newline,
            onChanged: (val) {
              context.bloc<StoreFormCubit>().menuChanged(val);
            },
            validator: (_) => state.store.menu.value.fold(
                (f) => f.maybeMap(
                    exceedingLength: (_) => 'menu too long!?',
                    empty: (_) => 'menu must not be emtyy',
                    orElse: () => null),
                (r) => null),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
