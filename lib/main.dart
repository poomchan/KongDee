import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/screens/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
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

        StreamProvider<GoogleSignInAccount>(
          create: (context) => GoogleSignIn().onCurrentUserChanged,
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
        home: HomePage(title: 'TaLadSod'),
      ),
    );
  }
}
