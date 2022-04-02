import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/services/card_provider.dart';
import 'package:snacmate/services/google_sign_in.dart';
import 'package:snacmate/pages/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';




Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCuQyUTpbqqRlvPhVauWOocGAI8yR_pk1E",
        authDomain: "snacmate.firebaseapp.com",
        databaseURL: "https://snacmate-default-rtdb.firebaseio.com",
        projectId: "snacmate",
        storageBucket: "snacmate.appspot.com",
        messagingSenderId: "268312469896",
        appId: "1:268312469896:web:6d8b3a2dcae29f56b65a3d",
        measurementId: "G-2CT3Z3DBNV"
    )
  );
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
