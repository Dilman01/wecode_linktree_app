import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecode_linktree_app/screens/auth_screen.dart';
import 'package:wecode_linktree_app/screens/chat_screen.dart';

import 'screens/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseApp,
      builder: (context, snapshot) {
        return MaterialApp(
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (userSnapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              } else if (userSnapshot.hasData) {
                return HomeScreen();
              }
              return AuthForm();
            },
          ),
          routes: {
            MessagesScreen.routeName: (context) => MessagesScreen(),
          },
        );
      },
    );
  }
}
