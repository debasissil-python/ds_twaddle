import 'package:ds_twaddle/screens/post_login/landing_screen.dart';
import 'package:ds_twaddle/screens/pre_login/email_registration.dart';
import 'package:ds_twaddle/screens/pre_login/login_screen.dart';
import 'package:ds_twaddle/screens/pre_login/welcome_screen.dart';
import 'package:ds_twaddle/screens/wrapper.dart';
import 'package:ds_twaddle/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'models/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Twaddle());
}

class Twaddle extends StatelessWidget {
  const Twaddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>(
      //value: AuthService().user,
      create: (value) => AuthService().allUsers,
      initialData: null,
      child: MaterialApp(
          //home: const Wrapper(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Wrapper(),
            '/welcome': (context) => const WelcomeScreen(),
            '/emailRegistration': (context) => const EmailRegistration(),
            '/login': (context) => const LoginScreen(),
            '/landing': (context) => const LandingScreen(),
            'home': (context) => const Home(),
          }),
    );
  }
}
