// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:snacmate/widgets/sign_in_buttons.dart';


class SigninWidgetsGroup extends StatefulWidget {
  const SigninWidgetsGroup({ Key? key }) : super(key: key);

  @override
  _SigninWidgetsGroupState createState() => _SigninWidgetsGroupState();
}

class _SigninWidgetsGroupState extends State<SigninWidgetsGroup> {

  List<Widget> additionalOptions = [];

  showMoreOptions(){
    setState(() {
      additionalOptions.add(SignupButton());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
        "By clicking \"Log in\", you agree eith our Terms. Learn how we",
        style: TextStyle(color: Colors.white),
        ),
        Text(
        "process your data in our Privacy Policy and Cookies Policy.",
        style: TextStyle(color: Colors.white),
        ),
        
        SignupButton(),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 22),
          child: SizedBox(
            height: 30,
            child: TextButton(
              onPressed: () {},
              child: Text(
            "More options",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.5),
            ),
            ),
          )
          
        )

      ],
    );
  }
}