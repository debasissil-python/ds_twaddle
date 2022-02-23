import 'package:ds_twaddle/screens/post_login/chat_screen.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns either Home or Chat Screen
    return Home();
    //Home();
    //ChatScreen();
  }
}
