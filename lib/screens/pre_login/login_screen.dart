// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ds_twaddle/buttons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../animated_texts.dart';
import '../../constants.dart';
import '../../services/auth.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Icon home = const Icon(Icons.home);
  Icon registration = const Icon(Icons.app_registration);

  final AuthService _authEmail = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  //text field state
  String name = '';
  String email = '';
  String password = '';

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
            setState(() {
              showSpinner = true;
            });
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
              setState(() {
                showSpinner = true;
              });
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
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
            child: Container(
              height: 550,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Hero(
                    //   tag: 'logo',
                    //   child: Image.asset(
                    //     'images/Chat.png',
                    //     scale: 1,
                    //   ),
                    // ),

                    const SizedBox(
                      height: 28.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a valid email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value.trim();
                        });
                        //print('Email Address Error : $e');
                      },
                      decoration:
                          kTextField.copyWith(hintText: 'Enter your email'),
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      validator: (value) => value!.length < 8
                          ? 'Password must be at least 8 characters'
                          : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      //hintText: 'Enter your password',
                      decoration: kTextField.copyWith(
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(
                      height: 45.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Buttons(
                        text: 'Login',
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            dynamic previouslyLoggedInEmail =
                                await _authEmail.loginEmail(email, password);
                            if (previouslyLoggedInEmail == null) {
                              setState(() {
                                showToastError(
                                    'Please enter a valid Email Id or Password',
                                    context);
                                //String error = 'Please enter a valid email';
                              });
                              setState(() {
                                showSpinner = false;
                              });
                            } else {}
                          }
                          setState(() {
                            showSpinner = false;
                          });
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
                    const SizedBox(
                      height: 45.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          kFuelledBy,
        ]),
      ),
    );
  }
}
