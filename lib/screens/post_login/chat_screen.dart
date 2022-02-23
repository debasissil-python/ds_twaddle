import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ds_twaddle/constants.dart';
import '../../animated_texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _authentication = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageTexts;
  //final FirebaseUser user;
  //late String user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedInUser = user;
        // print(loggedInUser.email);
        // print(loggedInUser.displayName);
      }
    } catch (e) {
      //print('The Error : $e');
    }
  }

  void messageStreams() async {
    await _firestore
        .collection('messages')
        .snapshots()
        .forEach((databaseMessage) {
      for (var message in databaseMessage.docs) {
        print(message.data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.maybePop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                _authentication.signOut();
                Navigator.pushNamed(context, '/login');
                //messageStreams();
              }),
        ],
        centerTitle: true,
        title: const AnimatedTitle(
          text: 'twaddle',
          fontSize: 25.0,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageTexts = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageTexts,
                        'sender': loggedInUser.email,
                        'displayName': loggedInUser.displayName,
                      });
                      // messageTexts + loggedInUser;
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
