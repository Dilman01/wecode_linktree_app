// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wecode_linktree_app/screens/chat_screen.dart';

import 'screens/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _firebaseApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('This Error occurred: ${snapshot.hasError}');
            return Center(
              child: Text('Something went wrong!'),
            );
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      routes: {
        MessagesScreen.routeName: (context) => MessagesScreen(),
      },
    );
  }
}
