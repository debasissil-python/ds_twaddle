import 'package:ds_twaddle/screens/pre_login/email_registration.dart';
import 'package:ds_twaddle/screens/pre_login/login_screen.dart';
import 'package:ds_twaddle/screens/pre_login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: LiquidSwipe(
          enableSideReveal: false,
          slideIconWidget: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          pages: const [
            WelcomeScreen(),
            EmailRegistration(),
            LoginScreen(),
          ],
        ),
      );
}

// MaterialApp(initialRoute: '/', routes: {
// '/': (context) => const WelcomeScreen(),
// '/registration': (context) => const RegistrationScreen(),
// '/emailRegistration': (context) => const EmailRegistration(),
// '/login': (context) => const LoginScreen(),
// '/chat': (context) => const ChatScreen(),
// });
