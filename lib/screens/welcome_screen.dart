// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ds_twaddle/buttons.dart';
import '../constants.dart';
import '../animated_texts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animateColor;
  late Animation animateLogo;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animateColor =
        ColorTween(begin: Colors.red, end: Colors.white).animate(controller);
    //controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animateColor.value,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    'images/Chat.png',
                  ),
                ),
                AnimatedTitle(
                  text: 'twaddle',
                  fontSize: 45.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                kAppInfo,
                SizedBox(
                  height: 30,
                ),
                Buttons(
                  text: 'Login',
                  onPressed: () async {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Buttons(
                  text: 'Registration',
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          kFuelledBy,
        ],
      ),
    );
  }
}
