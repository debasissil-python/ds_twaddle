import 'package:flutter/material.dart';
import '../../animated_texts.dart';
import '../pre_login/login_screen.dart';
import 'chat_screen.dart';
import 'chat_screen1.dart';
import 'chat_screen2.dart';
import 'chat_screen3.dart';
import 'chat_screen4.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.orangeAccent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const AnimatedTitle(
          text: 'twaddle',
          fontSize: 25.0,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.orangeAccent,
          padding: const EdgeInsets.all(5),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(55),
                      topLeft: Radius.circular(55),
                      bottomRight: Radius.circular(55),
                      bottomLeft: Radius.circular(55),
                    ),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(5),
                    children: <Widget>[
                      Column(
                        children: [
                          listNames(
                              text: 'General Chat Room',
                              avatar: const AssetImage('images/Chat.png'),
                              onClicked: () {
                                selectedItem(context, 1);
                              }),
                          const SizedBox(
                            width: 10,
                            height: 12,
                          ),
                          listNames(
                              text: 'Political Chat Room',
                              avatar: const AssetImage('images/Chat.png'),
                              //Image.asset('assets/images/live_chat.png'),
                              onClicked: () {
                                selectedItem(context, 2);
                              }),
                          const SizedBox(
                            width: 10,
                            height: 12,
                          ),
                          listNames(
                              text: 'Love Chat Room',
                              avatar: const AssetImage('images/Chat.png'),
                              onClicked: () {
                                selectedItem(context, 3);
                              }),
                          const SizedBox(
                            width: 10,
                            height: 12,
                          ),
                          listNames(
                              text: 'Adult Chat Room',
                              avatar: const AssetImage('images/Chat.png'),
                              onClicked: () {
                                selectedItem(context, 4);
                              }),
                          const SizedBox(
                            width: 10,
                            height: 12,
                          ),
                          listNames(
                              text: 'Emotional Chat Room',
                              avatar: const AssetImage('images/Chat.png'),
                              onClicked: () {
                                selectedItem(context, 5);
                              }),
                          const SizedBox(
                            width: 10,
                            height: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listNames({
    ImageProvider? avatar,
    required String text,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      focusColor: Colors.lightGreenAccent,
      hoverColor: Colors.black87,
      leading: CircleAvatar(
        radius: 30,
        child: avatar == null
            ? CircleAvatar(
                radius: 35,
                backgroundColor: Colors.lightGreen,
                child: Text(
                  text[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              ),
        backgroundColor: Colors.transparent,
        backgroundImage: avatar,
        //onBackgroundImageError: ,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.blueGrey[900],
        ),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context, rootNavigator: true).pop();

    switch (index) {
      case 0:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ));
        break;
      case 1:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        ));
        break;
      case 2:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const ChatScreen1(),
        ));
        break;
      case 3:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const ChatScreen2(),
        ));
        break;
      case 4:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const ChatScreen3(),
        ));
        break;

      case 5:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const ChatScreen4(),
        ));
        break;

      case 6:
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
        break;
    }
  }
}
