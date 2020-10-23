import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/store_near/store_near_cubit.dart';
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
          create: (context) => getIt<StoreNearCubit>(),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          ProfileAvatar(),
          SizedBox(width: 30),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
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
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) => state.map(
                  inital: (state) => circularProgress(context),
                  getting: (state) => circularProgress(context),
                  success: (state) => NearStoreFeed(),
                  failure: (state) => Text('Error: Location is not enable'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
