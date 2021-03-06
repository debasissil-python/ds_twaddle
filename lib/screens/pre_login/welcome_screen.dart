// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants.dart';
import '../../animated_texts.dart';

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

  bool showSpinner = false;

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
      body: ModalProgressHUD(
        color: Colors.black,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.orange,
        ),
        inAsyncCall: showSpinner,
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
            child: Container(
              height: 550,
              padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset('images/Chat.png'),
                  AnimatedTitle(
                    text: 'twaddle',
                    fontSize: 45.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  kAppInfo,
                  const SizedBox(
                    height: 45.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 65.0,
          ),
          kFuelledBy,
        ]),
      ),
    );
  }
}
