import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snacmate/pages/chat/chat_body_widget.dart';
import 'package:snacmate/pages/chat/chat_header_widget.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({ Key? key }) : super(key: key);

  final users = List<User>.filled(10, FirebaseAuth.instance.currentUser!);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            ChatHeaderWidget(users: users),
            ChatBodyWidget(users: users),
          ]
        ),
      ),
    );
  }
}