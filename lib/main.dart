import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/bloc/permission/permission_bloc.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/screens/app_onboarding_page.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PermissionBloc>(
          create: (context) =>
              PermissionBloc()..add(LocationPermissionStarted()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // main user Auth
        // this stream is for checking whether the user has signed in
        StreamProvider<FirebaseUser>(
          create: (context) => FirebaseAuth.instance.onAuthStateChanged,
        ),

        // this is the storage for deserialized data
        ChangeNotifierProvider(
          create: (context) => NetworkStateStorage(),
        ),

        ChangeNotifierProvider(
          create: (context) => LocalStateStorage(),
        ),
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'TaLadSod',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(title: TextStyle(color: Colors.black)),
        ),
        home: BlocBuilder<PermissionBloc, PermissionState>(
            builder: (BuildContext context, PermissionState state) {
          if (state is PermissionInitial) {
            //TODO: build splash screen
            return circularProgress(context);
          }
          if (state is LocationPermissionNotGranted) {
            return AppOnboardingPage();
          }
          print('Location granted');
          return HomePage(
            title: 'Kong Dee',
          );
        }),
      ),
    );
  }
}
