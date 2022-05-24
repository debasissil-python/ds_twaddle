import 'package:ds_twaddle/models/users.dart';
import 'package:ds_twaddle/screens/post_login/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<TheUser?>(context);
    //print(currentUser?.uid);

    // Returns either Home or Landing Screen
    if (currentUser == null) {
      return const Home();
    } else {
      return const LandingScreen();
    }
    //Home();
    //ChatScreen();
  }
}
