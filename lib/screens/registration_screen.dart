// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Icon home = const Icon(Icons.home);
  Icon login = const Icon(Icons.login);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: home,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: login,
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/Chat.png',
                  scale: 1,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                      color: Colors.blueGrey, fontStyle: FontStyle.italic),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey.shade700, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 28.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                      color: Colors.blueGrey, fontStyle: FontStyle.italic),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey.shade700, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 34.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Material(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    height: 58,
                    minWidth: 100,
                    focusElevation: 25,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: Stack(
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white,
                            //color: Colors.blueGrey.shade900,
                          ),
                        ),
                        const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    color: const Color(0xFFF7CA18),
                  ),
                ),
              ),
              Row(
                children: [
                  Text('Already a Member !'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Click here to Login',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'fuelled by:\n Hobby Networking',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.blueGrey.shade600,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
