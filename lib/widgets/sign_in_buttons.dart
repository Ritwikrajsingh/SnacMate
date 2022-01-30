// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/services/google_sign_in.dart';


class SignupButton extends StatelessWidget {
  const SignupButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.84,
        height: MediaQuery.of(context).size.height*0.063,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: (){
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Icon(FontAwesomeIcons.google)),
                Text(
                  "LOGIN WITH GOOGLE",
                  style: TextStyle(fontSize: 16.6, color: Color(0xcc707070),),
                  ),
                Container(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(Icons.language, color: Colors.white.withOpacity(0)))
              ],
            )
          )
        )),
    );
  }
}