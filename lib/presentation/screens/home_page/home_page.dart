import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/profile_avatar.dart';
import '../../../injection.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(
      create: (context) => getIt<LocationCubit>()..getUserLocation(),
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
          builder: (context, state) => Center(
            child: Text(
              'This is the Home Page',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
