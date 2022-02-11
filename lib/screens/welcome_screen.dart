// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    scale: 2,
                  ),
                ),
                Text(
                  'twaddle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.blueGrey.shade900,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Connecting like minded People Globally',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  height: 58,
                  minWidth: 100,
                  focusElevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Stack(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.white,
                          //color: Colors.blueGrey.shade900,
                        ),
                      ),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  color: const Color(0xFFF7CA18),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  height: 58,
                  minWidth: 100,
                  focusElevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  child: Stack(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.white,
                          //color: Colors.blueGrey.shade900,
                        ),
                      ),
                      const Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  color: const Color(0xFFF7CA18),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'fuelled by:\n Hobby Networking',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.blueGrey.shade600,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
