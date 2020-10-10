import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/store_near/store_near_cubit.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/profile_avatar.dart';
import 'package:fluttertaladsod/presentation/screens/profile/widgets/store_card.dart';
import '../../../injection.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) => getIt<LocationCubit>()..getUserLocation(),
        ),
        BlocProvider<StoreNearCubit>(
          create: (context) => getIt<StoreNearCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            ProfileAvatar(),
            SizedBox(width: 30),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BlocBuilder<LocationCubit, LocationState>(
          // if location is not ready => loading indicator here
          builder: (context, state) => state.map(
            inital: (state) => circularProgress(context),
            getting: (state) => circularProgress(context),
            success: (state) => HomePageBody(),
            failure: (state) => Text('Error: cannot get the location'),
          ),
        ),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stores close to you',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 10.0),
            NearStoreFeed(),
          ],
        ),
      ),
    );
  }
}

class NearStoreFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreNearCubit, StoreNearState>(
      cubit: getIt<StoreNearCubit>()..watchNearbyStore(context),
      builder: (context, state) => state.maybeMap(
        inital: (state) => circularProgress(context),
        failure: (state) => Center(child: Icon(Icons.error)),
        orElse: () => Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (state.maybeMap(
                    loaded: (state) => true,
                    orElse: () => false,
                  ) &&
                  // scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.atEdge) {
                print('adding radius');
                context.bloc<StoreNearCubit>().requestMoreRadius();
              }
              return null;
            },
            child: ListView(
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              children: state.maybeMap(
                  loading: (state) => [
                        circularProgress(context),
                        ..._buildStoreCard(state.previousStoreList),
                      ],
                  loaded: (state) => _buildStoreCard(state.storeList),
                  orElse: () => [Container()]),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStoreCard(List<Store> storeList) {
    return storeList
        .map((store) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: StoreCard(store: store),
            ))
        .toList();
  }
}
