import 'package:ds_twaddle/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Twaddle());
}

class Twaddle extends StatelessWidget {
  const Twaddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Wrapper(),
    );
  }
}

//Just Three things I am banging my head on :
//
// 1) How to do 'email authentication' before one can go in to Chat Page. There will be users who will try with bogus email ids. how can we stop that with firebase and flutter ?
// here no checks are shown.
//
// 2) When someone comes back in the same device, how can we say 'Welcome......' ?
//
// 3) How can we keep the user logged in in the app until he opts to sign out ?
