import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ds_twaddle/constants.dart';
import '../../animated_texts.dart';
import '../../services/auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  late String messageTexts;
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final AuthService _authLogOut = AuthService();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authService.currentUser;
      if (user != null) {
        loggedInUser = user;
        //   print(loggedInUser.email);
        //   print(loggedInUser.uid);
        //   print(loggedInUser.displayName);
      }
    } catch (e) {
      //print('The Error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
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
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onPressed: () {
                openDialog();
              }),
        ],
        centerTitle: true,
        title: const AnimatedTitle(
          text: 'twaddle',
          fontSize: 25.0,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.orangeAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const MessagesStream(),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        textCapitalization: TextCapitalization.sentences,
                        autocorrect: true,
                        enableSuggestions: true,
                        onChanged: (value) {
                          messageTexts = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.lime,
                        shape: BoxShape.circle,
                      ),
                      child: TextButton(
                        onPressed: () {
                          messageTextController.clear();
                          _firestore.collection('chatMessages').add({
                            'messages': messageTexts,
                            'name': loggedInUser.email ??
                                'Anon - ' +
                                    loggedInUser.uid
                                        .substring(loggedInUser.uid.length - 5),
                            'userEmoji': 'user emoji',
                            'timestamp': FieldValue.serverTimestamp(),
                            // loggedInUser.email
                            //     ? 'Username'
                            //     : 'Anon - ' +
                            //         loggedInUser.uid
                            //             .substring(loggedInUser.uid.length - 5),
                            //'Anon User',
                            //'user name',
                            //loggedInUser.email,
                            //loggedInUser.uid,
                          });
                          // messageTexts + loggedInUser;
                        },
                        child: Icon(
                          Icons.send_outlined,
                          size: 35,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.lightGreenAccent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
          title: const Text(
            "Are You sure you want to Log out?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          content: const Text(
            "Would Love to Welcome You back again!",
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                _authLogOut.signOut();
                Navigator.pop(context, '/login');
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('chatMessages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            );
          }
          final chatMessages = snapshot.data!.docs;
          List<Widget> messageHolders = [];
          for (var message in chatMessages) {
            final messageText = message['messages'];
            final messageSender = message['name'];
            final currentUser = loggedInUser.email;
            //loggedInUser.email | loggedInUser.uid;
            final currentUserAnon = loggedInUser.uid;

            if (currentUser == messageSender) {
              currentUser;
              //loggedInUser.email ?? loggedInUser.uid;
              //The message is from the logged in user
            } else if (currentUserAnon == messageSender) {
              currentUserAnon;
            }

            final messageHolder = MessageBubble(
              sender: messageSender,
              text: messageText,
              isME: currentUserAnon == messageSender ||
                  currentUser == messageSender,
              //messageSender ? currentUser : currentUserAnon,
            );
            messageHolders.add(messageHolder);
          }
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    topLeft: Radius.circular(55),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.all(15),
                  children: messageHolders,
                ),
              ),
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key, required this.text, required this.sender, required this.isME})
      : super(key: key);

  final String text;
  final String sender;
  final bool isME;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        crossAxisAlignment:
            isME ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender),
          Material(
            color: isME ? Colors.lightBlue[100] : Colors.lightGreenAccent[100],
            elevation: 10,
            borderRadius: isME
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(-40),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(-40),
                  ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                text,
                style: TextStyle(
                    color: isME ? Colors.black : Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
