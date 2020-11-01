import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

import 'application/core/simple_bloc_observer.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('initializing firebase...');
  await Firebase.initializeApp();
  print('DONE!');

  configureInjection(Environment.prod);

  Bloc.observer = MyBlocObserver();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  Isolate.current.addErrorListener(RawReceivePort((List<dynamic> pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last as StackTrace,
    );
  }).sendPort);


  // FirebaseCrashlytics.instance.crash();


  print('Building the app...');
  runApp(AppWidget());
  
}
