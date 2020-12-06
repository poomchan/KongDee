import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/banner_field.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/image_field.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/menu_field.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/name_field.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/get.dart';
import 'bloc/store_form_bloc.dart';

class StoreForm extends ViewWidget<StoreFormBloc> {
  final Option<Store> initialStore;
  const StoreForm({@required this.initialStore}) : assert(initialStore != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => bloc.saved(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetBuilder<StoreFormBloc>(
          builder: (bloc) => bloc.state.maybeWhen(
            orElse: () => const SizedBox(height: 0),
            loaded: () => ListView(
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              children: const [
                BannerField(),
                NameField(),
                SizedBox(height: 10.0),
                Menufield(),
                SizedBox(height: 10.0),
                ImageField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
