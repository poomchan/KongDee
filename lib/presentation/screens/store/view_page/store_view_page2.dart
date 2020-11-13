import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/application/store/prefs/actor/store_prefs_actor_cubit.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/banner_appbar2.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/console.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/image_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/menu_view.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/name_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class StoreViewPage2 extends StatelessWidget implements AutoRouteWrapper{
  final UniqueId storeId;

  const StoreViewPage2({Key key, this.storeId}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LocationCubit>()..getUserLocation(),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) => state.maybeMap(
          orElse: () => Scaffold(body: circularProgress(context)),
          success: (state) => MultiBlocProvider(
            providers: [
              BlocProvider<StoreViewCubit>(
                create: (contxt) => getIt<StoreViewCubit>()
                  ..watchStoreStarted(storeId: storeId, context: contxt),
              ),
              BlocProvider<StorePrefsActorCubit>(
                create: (contxt) => getIt<StorePrefsActorCubit>(),
              ),
            ],
            child: this,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final storeViewBloc = context.watch<StoreViewCubit>();
    return ColorFiltered(
      colorFilter: storeViewBloc.state.maybeMap(
        orElse: () => ColorFilter.mode(Colors.transparent, BlendMode.saturation),
        success: (s) => s.store.prefs.isOpen
            ? ColorFilter.mode(Colors.transparent, BlendMode.saturation)
            : ColorFilter.mode(Colors.grey, BlendMode.saturation),
      ),
      child: Scaffold(
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
      ),
    );
  }
}
