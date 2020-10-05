import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/edit_store_button.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/banner_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/image_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/menu_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/name_view.dart';

import '../../../../injection.dart';

class StoreViewPage extends StatelessWidget {
  final UniqueId storeId;

  const StoreViewPage({Key key, this.storeId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoreViewCubit>(
          create: (context) =>
              getIt<StoreViewCubit>()..watchStoreStarted(storeId: storeId),
        ),
      ],
      child: StoreFormScaffold(
        storeId: storeId,
      ),
    );
  }
}

class StoreFormScaffold extends StatelessWidget {
  const StoreFormScaffold({Key key, this.storeId}) : super(key: key);

  final UniqueId storeId;

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
        onPressed: () => ExtendedNavigator.of(context).push(
          Routes.chatPage,
          arguments: ChatPageArguments(storeId: storeId),
        ),
        backgroundColor: Colors.green,
        child: Icon(Icons.chat_bubble),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            BannerView(),
            Container(
              padding: EdgeInsets.all(10.0),
              // color: Colors.blue,
              width: screenWidth,
              child: Column(
                children: [
                  EditStoreButton(),
                  NameView(),
                  SizedBox(height: 10.0),
                  MenuView(),
                  SizedBox(height: 10.0),
                  ImageView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
