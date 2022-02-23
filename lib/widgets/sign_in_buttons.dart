// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/services/google_sign_in.dart';


class SignupButton extends StatefulWidget {
  final Icon icon;
  final String method;

  const SignupButton({ Key? key, icon, method }) : this.icon = icon, this.method = method, super(key: key);

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: SizedBox(
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
                    child: widget.icon,
                  ),
                  Text(
                    "LOGIN WITH ${widget.method}",
                    style: TextStyle(fontSize: 16.6, color: Color(0xcc707070),),
                    ),
                  Container(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Icon(Icons.language, color: Colors.white.withOpacity(0)))
                ],
              )
            )
          )),
      ),
    );
  }
}

class googleSignupButton extends StatelessWidget {
  const googleSignupButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignupButton(
      icon: Icon(FontAwesomeIcons.google, color: Colors.red,),
      method: "GOOGLE",
    );
  }
}

class facebookSignupButton extends StatelessWidget {
  const facebookSignupButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignupButton(
      icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue,),
      method: "FACEBOOK",
    );
  }
}

class phoneSignupButton extends StatelessWidget {
  const phoneSignupButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignupButton(
      icon: Icon(FontAwesomeIcons.phoneAlt, color: Colors.blue,),
      method: "YOUR PHONE",
    );
  }
}