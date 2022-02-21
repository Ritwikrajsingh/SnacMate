// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Splash_Text extends StatelessWidget {
  const Splash_Text({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          children: [Container(
              padding: const EdgeInsets.all(152),
            ),
            const Text(
          "SnacMate Splash",
          style: TextStyle(
            color: Color(0x876c0200),
            fontSize: 66,
            fontWeight: FontWeight.bold
          ),
          )
            ],
          ),
      ),
    );
  }
}