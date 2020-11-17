import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'application/core/app_widget.dart';
import 'application/global_bloc/core/simple_bloc_observer.dart';
import 'domain/location/i_location_repository.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configureInjection(Environment.prod);
  Bloc.observer = MyBlocObserver();

  final isLocationGranted = await getIt<ILocationRepository>().isPermissionGranted();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(AppWidget(isLocationGranted: isLocationGranted));
  
}
