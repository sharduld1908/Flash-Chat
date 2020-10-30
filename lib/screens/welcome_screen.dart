import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.yellowAccent,
                  ),
                  speed: Duration(milliseconds: 200),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: 'login',
              child: RoundedButton(
                  title: 'Log In',
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                  title: 'Register',
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
