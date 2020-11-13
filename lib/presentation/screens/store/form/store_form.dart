import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_form/store_form_cubit.dart';
import 'package:fluttertaladsod/application/store/store_form/store_form_location/store_form_location_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/presentation/core/components/dialogs.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/banner_field.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/image_field.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/menu_field.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/name_field.dart';

import '../../../../injection.dart';

class StoreForm extends StatelessWidget implements AutoRouteWrapper {
  final Option<Store> initialStore;

  const StoreForm({Key key, this.initialStore}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoreFormCubit>(
            create: (context) => getIt<StoreFormCubit>()
              ..initializeForm(initialStore: initialStore)),
        // BlocProvider<StoreFormLocationCubit>(
        //   create: (context) =>
        //       getIt<StoreFormLocationCubit>()..getUserLocation(),
        // ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<StoreFormCubit, StoreFormState>(
              listenWhen: (p, c) => p.isSaving != c.isSaving,
              listener: (context, state) {
                if (state.isSaving) {
                  savingDialog(context).show();
                } else {
                  ExtendedNavigator.of(context).pop();
                }
              }),
          BlocListener<StoreFormCubit, StoreFormState>(
              listenWhen: (p, c) =>
                  p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
              listener: (context, state) async {
                if (state.saveFailureOrSuccessOption.fold(() => false,
                    (some) => some.fold((failue) => false, (unit) => true))) {
                  await successDialog(context).show();
                  ExtendedNavigator.of(context).pop();
                }
                if (state.saveFailureOrSuccessOption.fold(() => false,
                    (some) => some.fold((failue) => true, (unit) => false))) {
                  errorDialog(context).show();
                }
              }),
        ],
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<StoreFormCubit>(context).saved(),
        backgroundColor: Colors.green,
        child: Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              BannerField(),
              Container(
                padding: EdgeInsets.all(10.0),
                width: screenWidth,
                child: BlocBuilder<StoreFormCubit, StoreFormState>(
                  buildWhen: (p, c) => p.showErrorMessage != c.showErrorMessage,
                  builder: (context, state) => Form(
                    autovalidate: state.showErrorMessage,
                    child: Column(
                      children: [
                        const NameField(),
                        const SizedBox(height: 10.0),
                        Menufield(),
                        const SizedBox(height: 10.0),
                        ImageField(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
