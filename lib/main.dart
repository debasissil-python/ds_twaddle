import 'package:ds_twaddle/screens/chat_screen.dart';
import 'package:ds_twaddle/screens/login_screen.dart';
import 'package:ds_twaddle/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:ds_twaddle/screens/welcome_screen.dart';

void main() => runApp(const Twaddle());

class Twaddle extends StatelessWidget {
  const Twaddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const WelcomeScreen(),
      '/registration': (context) => const RegistrationScreen(),
      '/login': (context) => const LoginScreen(),
      '/chat': (context) => const ChatScreen(),
    });
  }
}
