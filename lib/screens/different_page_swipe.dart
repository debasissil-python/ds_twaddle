import 'package:ds_twaddle/screens/post_login/chat_screen.dart';
import 'package:ds_twaddle/screens/pre_login/email_registration.dart';
import 'package:ds_twaddle/screens/pre_login/login_screen.dart';
import 'package:ds_twaddle/screens/pre_login/registration_screen.dart';
import 'package:ds_twaddle/screens/pre_login/welcome_screen.dart';
import 'package:flutter/material.dart';

class DifferentPageSwipe extends StatelessWidget {
  const DifferentPageSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const WelcomeScreen(),
      '/registration': (context) => const RegistrationScreen(),
      '/emailRegistration': (context) => const EmailRegistration(),
      '/login': (context) => const LoginScreen(),
      '/chat': (context) => const ChatScreen(),
    });
  }
}
