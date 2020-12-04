import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/banner_field.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/image_field.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/menu_field.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/name_field.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/get.dart';
import 'bloc/store_form_bloc.dart';

class StoreForm extends StatelessWidget {
  final Option<Store> initialStore;
  const StoreForm({@required this.initialStore}) : assert(initialStore != null);

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoreFormBloc>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.saved(),
        backgroundColor: Colors.green,
        child: Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
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
    );
  }
}
