import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/services/card_provider.dart';
import 'package:snacmate/services/google_sign_in.dart';
import 'package:snacmate/pages/home/home.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  static const String appName = "SnacMate";
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => CardProvider())
        ],
      child: MaterialApp(
        title: 'SnacMate',
        theme: ThemeData(
          
          primarySwatch: Colors.red,
          
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
