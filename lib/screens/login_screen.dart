// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ds_twaddle/buttons.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../animated_texts.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Icon home = const Icon(Icons.home);
  Icon registration = const Icon(Icons.app_registration);
  late String email;
  late String password;
  late String displayName;
  final _authentication = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: home,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        centerTitle: true,
        title: AnimatedTitle(
          text: 'twaddle',
          fontSize: 25.0,
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: registration,
            onPressed: () {
              Navigator.pushNamed(context, '/registration');
            },
          ),
        ],
      ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'images/Chat.png',
                    scale: 1,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value.trim();
                  },
                  decoration: kTextField.copyWith(hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 28.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      kTextField.copyWith(hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 34.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Buttons(
                    text: 'Login',
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        await _authentication.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.pushNamed(context, '/chat');
                        showToastError(
                            'Congratulations! \nYou have been Successfully logged in !',
                            context);
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        showToastError(
                            'Please enter a valid \nEmail Id \nor \nPassword',
                            context);
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Text('Not a Member ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      child: Text(
                        'Click here to Register',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                kFuelledBy,
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
