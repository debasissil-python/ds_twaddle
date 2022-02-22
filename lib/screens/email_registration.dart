import 'package:flutter/material.dart';
import 'package:ds_twaddle/buttons.dart';
import '../animated_texts.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class EmailRegistration extends StatefulWidget {
  const EmailRegistration({Key? key}) : super(key: key);

  @override
  _EmailRegistrationState createState() => _EmailRegistrationState();
}

class _EmailRegistrationState extends State<EmailRegistration> {
  Icon home = const Icon(Icons.home);
  Icon login = const Icon(Icons.login);
  late String displayName;
  late String email;
  late String password;

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
        title: const AnimatedTitle(
          text: 'twaddle',
          fontSize: 25.0,
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: login,
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ModalProgressHUD(
        color: Colors.black,
        opacity: 0.5,
        progressIndicator: const CircularProgressIndicator(
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
                // boxShadow: const [
                //   BoxShadow(
                //     color: Color(0xFFF2C8C8),
                //     blurRadius: 6,
                //     spreadRadius: 4,
                //   ),
                //]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      try {
                        displayName = value;
                      } catch (e) {
                        print('Username Error : $e');
                      }
                    },
                    decoration:
                        kTextField.copyWith(hintText: 'Enter your username'),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      try {
                        email = value.trim();
                      } catch (e) {
                        print('Email Address Error : $e');
                      }
                    },
                    //hintText: 'Enter your email',
                    decoration:
                        kTextField.copyWith(hintText: 'Enter your email'),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    //hintText: 'Enter your password',
                    decoration:
                        kTextField.copyWith(hintText: 'Enter your password'),
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Buttons(
                      text: 'Register',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          await _authentication.createUserWithEmailAndPassword(
                              email: email, password: password);
                          Navigator.pushNamed(context, '/chat');
                          showToastError(
                              'Congratulations! \nYou have been Successfully registered !',
                              context);
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                          showToastError(
                              'Please enter a valid Email Id. \n \nThe Password must be at least 6 characters long.',
                              context);
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Already a Member !'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Click here to Login',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  //kFuelledBy,
                ],
              ),
            ),
          ),
          kFuelledBy,
        ]),
      ),
    );
  }
}
