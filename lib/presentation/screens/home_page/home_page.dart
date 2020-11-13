import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/nearby/store_near_cubit.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/near_store_feed.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/profile_avatar.dart';

class HomePage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (ctx) => getIt<LocationCubit>()..getUserLocation(),
        ),
        BlocProvider<StoreNearCubit>(
          create: (ctx) => getIt<StoreNearCubit>()..watchNearbyStore(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          ProfileAvatar(),
          SizedBox(width: 30),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NearStoreFeed(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

