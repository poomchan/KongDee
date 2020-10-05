import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/application/location/permission/location_permission_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/home_page.dart';

import 'app_onboarding_page.dart';

class AppLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPermissionCubit, LocationPermissionState>(
      builder: (BuildContext context, LocationPermissionState state) {
        return state.map(
          // TODO: implement app logo page insted of the circular progress
          inital: (_) => circularProgress(context),
          loading: (_) => circularProgress(context),
          denied: (_) => AppOnboardingPage(),
          granted: (_) {
            return HomePage();
          },
        );
      },
    );
  }
}
