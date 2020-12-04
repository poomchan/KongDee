import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/banner_appbar2.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/console.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/image_view.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/menu_view.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/name_view.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:get/get.dart';
import 'bloc/store_view_bloc.dart';

class StoreViewPage2 extends StatelessWidget {
  final UniqueId storeId;

  const StoreViewPage2({Key key, @required this.storeId})
      : assert(storeId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<StoreViewBloc>(
        builder: (bloc) => bloc.state.when(
          inital: () => circularProgress(context),
          loading: () => circularProgress(context),
          loaded: () => _buildStoreView(context),
          failure: () => _buildErrorWidget(context),
        ),
      ),
    );
  }

  Widget _buildStoreView(BuildContext context) {
    final screenWidth = Get.width;
    return GetX<StoreViewBloc>(
      builder: (bloc) => ColorFiltered(
        colorFilter: bloc.store.prefs.isOpen
            ? ColorFilter.mode(Colors.transparent, BlendMode.saturation)
            : ColorFilter.mode(Colors.grey, BlendMode.saturation),
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
                onPressed: () =>
                    Get.toNamed(Routes.chatPage, arguments: storeId),
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
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return GetBuilder<StoreViewBloc>(
      builder: (bloc) => Center(
        child: Column(
          children: [
            Icon(Icons.error),
            bloc.failure.when(
              noStore: () => Text('Error 404: No store found'),
              unexpected: (err) => Text('Unexpected Error: ${err.detail}'),
              locationNotGranted: () => Text('Please enable location'),
              timeout: () => Text('Time out, try reload again'),
            ),
          ],
        ),
      ),
    );
  }
}
