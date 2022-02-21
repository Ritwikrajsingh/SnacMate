import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snacmate/services/google_sign_in.dart';
import 'package:provider/provider.dart';


class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text("Logout", style: TextStyle(color: Colors.white),),
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
            "Profile",
            style:  TextStyle(fontSize: 24),
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          Text("Name: " + user.displayName!),
          Text("Email: " + user.email!),
          ],
        ),
        ),
    );
  }
}