import 'package:firebase_core/firebase_core.dart';
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
  print('Building the app...');
  runApp(
    AppWidget(),
  );
}
