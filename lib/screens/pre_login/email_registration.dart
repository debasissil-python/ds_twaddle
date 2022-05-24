import 'package:flutter/material.dart';
import 'package:ds_twaddle/buttons.dart';
import '../../animated_texts.dart';
import '../../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../services/auth.dart';

class EmailRegistration extends StatefulWidget {
  const EmailRegistration({Key? key}) : super(key: key);

  @override
  _EmailRegistrationState createState() => _EmailRegistrationState();
}

class _EmailRegistrationState extends State<EmailRegistration> {
  Icon home = const Icon(Icons.home);

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
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
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
        // actions: [
        //   IconButton(
        //     color: Colors.black,
        //     icon: login,
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/login');
        //     },
        //   ),
        // ],
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
                color: Colors.lightGreenAccent,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a your name' : null,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                        //print('Email Address Error : $e');
                      },
                      decoration:
                          kTextField.copyWith(hintText: 'Enter your name'),
                    ),
                    //hintText: 'Enter your name',
                    const SizedBox(
                      height: 28.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      validator: (value) => value!.isEmpty
                          ? 'Please enter a valid email id'
                          : null,
                      onChanged: (value) {
                        setState(() {
                          email = value.trim();
                        });
                        //print('Email Address Error : $e');
                      },
                      decoration:
                          kTextField.copyWith(hintText: 'Enter your email'),
                    ),
                    //hintText: 'Enter your email',
                    const SizedBox(
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
                      decoration: kTextField.copyWith(
                        hintText: 'Enter your password',
                      ),
                    ),
                    //hintText: 'Enter your password',
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
                          if (_formKey.currentState!.validate()) {
                            dynamic newlySignedUpEmail =
                                await _authEmail.signUpEmail(email, password);
                            if (newlySignedUpEmail == null) {
                              setState(() {
                                showToastError(
                                    'Please enter a valid Email Id \nOr \nThe Email Id is already registered ',
                                    context);
                                //String error = 'Please enter a valid email';
                              });
                              // setState(() {
                              //   showSpinner = false;
                              // });
                            } else {
                              Navigator.pushNamed(context, '/landing');
                            }
                          }
                          setState(() {
                            showSpinner = false;
                          });
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
          ),
          kFuelledBy,
        ]),
      ),
    );
  }
}
