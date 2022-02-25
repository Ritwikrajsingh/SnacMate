// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:snacmate/widgets/signin_widget.dart';

class signupHomepage extends StatefulWidget {
  const signupHomepage({ Key? key }) : super(key: key);

  @override
  _signupHomepageState createState() => _signupHomepageState();
}

class _signupHomepageState extends State<signupHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.deepOrange,
              Colors.red,
              Colors.pink,
              
            ]
            )
        ),
        child: Column(
          children: [
            Spacer(),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 66),
              child: const Center(
                child: Text(
                  "Snac\nMate.",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
            )
            ),
            Spacer(),
            //Spacer(),
            const SigninWidgetsGroup()

          ],
        ),
      ),
    );
  }
}