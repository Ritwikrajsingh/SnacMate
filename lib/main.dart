import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/pages/signup/signup_home.dart';
import 'package:snacmate/services/google_sign_in.dart';
import 'package:snacmate/pages/home/home.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static final String AppName = "SnacMate";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Full screen width and height

    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'SnacMate',
        theme: ThemeData(
          
          primarySwatch: Colors.red,
          
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
