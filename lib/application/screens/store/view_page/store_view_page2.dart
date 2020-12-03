import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/banner_appbar2.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/console.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/image_view.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/menu_view.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/name_view.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/get.dart';
import 'bloc/store_view_cubit.dart';

class StoreViewPage2 extends StatelessWidget {
  final UniqueId storeId;

  const StoreViewPage2({Key key, @required this.storeId})
      : assert(storeId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoreViewCubit>(
      create: (_) =>
          Get.put(StoreViewCubit())..watchStoreStarted(storeId: storeId),
      child: Builder(
        builder: (_) => Scaffold(
          body: BlocBuilder<StoreViewCubit, StoreViewState>(
            buildWhen: (p, c) =>
                p.maybeMap(
                  success: (s) => s.store.prefs.isOpen,
                  orElse: () => true,
                ) !=
                c.maybeMap(
                  success: (s) => s.store.prefs.isOpen,
                  orElse: () => true,
                ),
            builder: (_, state) => state.map(
              inital: (s) => Text('StoreViewCubit has not been init'),
              loading: (s) => _buildStoreView(context, isOpen: true),
              success: (s) =>
                  _buildStoreView(context, isOpen: s.store.prefs.isOpen),
              failure: (s) => _buildErrorWidget(context, s.f),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoreView(BuildContext context, {bool isOpen}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ColorFiltered(
      colorFilter: isOpen
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
              onPressed: () => Get.toNamed(Routes.chatPage, arguments: storeId),
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

  Widget _buildErrorWidget(BuildContext context, StoreFailure f) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.error),
          f.map(
            noStore: (f) => Text('Error 404: No store found'),
            unexpected: (f) => Text('Unexpected Error: ${f.detail}'),
            locationNotGranted: (f) => Text('Please enable location'),
            timeout: (f) => Text('Time out, try reload again'),
          ),
        ],
      ),
    );
  }
}
