// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snacmate/widgets/sign_in_buttons.dart';


class SigninWidgetsGroup extends StatefulWidget {
  const SigninWidgetsGroup({ Key? key }) : super(key: key);

  @override
  _SigninWidgetsGroupState createState() => _SigninWidgetsGroupState();
}

class _SigninWidgetsGroupState extends State<SigninWidgetsGroup> 
with SingleTickerProviderStateMixin {

  final Duration _duration = Duration(milliseconds: 280);

  late AnimationController _controller = AnimationController(vsync: this, duration: _duration);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, -1.4),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  double SigninOpacityLevel = 0.0;
  double MoreOptionsOpacityLevel = 1.0;
  bool allButtonsVisible = false;
  

  Future<void> showMoreButtons() async {
    setState(() {
      allButtonsVisible = true;
      _controller.forward();
    });
    await Future.delayed(_duration);
    setState(() {
      SigninOpacityLevel = 1;
      MoreOptionsOpacityLevel = 0;
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            AnimatedOpacity(
              opacity: SigninOpacityLevel,
              duration: _duration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  facebookSignupButton(),
                  phoneSignupButton(),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "By clicking \"Log in\", you agree ith our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        ),
                        googleSignupButton()
                    ],
                  ),
                ),
              ),
            )
            
          ],
        ),
        AnimatedOpacity(
          opacity: MoreOptionsOpacityLevel,
          duration: _duration,
          child: Container(

            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: SizedBox(
              height: 50,
              child: TextButton(
                
                onPressed: allButtonsVisible? null : showMoreButtons,
                child: Text(
                  "More options",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5
                  ),
                ),
              ),
            )
            
          ),
        )
      ],
    );
  }
}

