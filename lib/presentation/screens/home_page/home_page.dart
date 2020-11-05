import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/nearby/store_near_cubit.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/near_store_feed.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/profile_avatar.dart';
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
          create: (context) => getIt<StoreNearCubit>()..watchNearbyStore(),
        ),
      ],
      child: HomePageScaffold(),
    );
  }
}

class HomePageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // toolbarHeight: 100.0,
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
                BlocBuilder<LocationCubit, LocationState>(
                  builder: (context, state) => state.map(
                    inital: (state) => circularProgress(context),
                    getting: (state) => circularProgress(context),
                    success: (state) => NearStoreFeed(),
                    failure: (state) => OutlineButton(
                      onPressed: () =>
                          context.bloc<LocationCubit>().getUserLocation(),
                      child: Text('Please enable location'),
                    ),
                  ),
                ),
                ButtonBar(
                  children: [
                    BlocBuilder<StoreNearCubit, StoreNearState>(
                      builder: (context, state) => state.maybeMap(
                        loaded: (state) => Text('Searched in ${state.rad} km'),
                        orElse: () => const SizedBox(height: 10.0 + 4.0),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          context.bloc<StoreNearCubit>().requestMoreRadius(),
                      child: Text('Add Radius'),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          context.bloc<StoreNearCubit>().drainRadius(),
                      child: Text('Drain Radius'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
