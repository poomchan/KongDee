import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/banner_appbar2.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/console.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/image_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/menu_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/name_view.dart';

class StoreViewPage2 extends StatelessWidget implements AutoRouteWrapper {
  final UniqueId storeId;

  const StoreViewPage2({Key key, this.storeId}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoreViewCubit>(
          create: (context) =>
              getIt<StoreViewCubit>()..watchStoreStarted(storeId: storeId),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.blueAccent,
            shape: StadiumBorder(),
            onPressed: () => print('linking'),
            child: Icon(Icons.thumb_up),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton.extended(
            shape: StadiumBorder(),
            onPressed: () => ExtendedNavigator.of(context).push(
              Routes.chatPage,
              arguments: ChatPageArguments(storeId: storeId),
            ),
            label: Row(
              children: const [
                Text('chat'),
                Icon(Icons.chat),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          BannerAppbar2(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: screenWidth,
                  child: Column(
                    children: [
                      Console(),
                      const SizedBox(height: 10.0),
                      NameView(),
                      const SizedBox(height: 10.0),
                      MenuView(),
                      const SizedBox(height: 10.0),
                      ImageView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
