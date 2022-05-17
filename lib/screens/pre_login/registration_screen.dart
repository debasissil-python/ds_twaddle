// ignore_for_file: prefer_const_constructors

//import 'package:ds_twaddle/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:ds_twaddle/buttons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../animated_texts.dart';
import '../../constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Icon home = const Icon(Icons.home);
  Icon login = const Icon(Icons.login);
  bool showSpinner = false;
  //final AuthService _authAnon = AuthService();
  // final _phoneController = TextEditingController();
  // final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: home,
          onPressed: () {
            setState(() {
              showSpinner = true;
            });
            Navigator.pushNamed(context, '/');
          },
        ),
        centerTitle: true,
        title: AnimatedTitle(
          text: 'twaddle',
          fontSize: 25.0,
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: login,
            onPressed: () {
              setState(() {
                showSpinner = true;
              });
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ModalProgressHUD(
        color: Colors.black,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.orange,
        ),
        inAsyncCall: showSpinner,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18, 10, 18, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'Register Using',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.white,
                            ),
                          ),
                          Text(
                            'Register Using',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    height: 500,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              //Email Registration
                              child: Buttons(
                                  text: 'Email',
                                  onPressed: () {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    Navigator.pushNamed(
                                        context, '/emailRegistration');
                                  }),
                            ),
                            Row(
                              children: [
                                Text('Already a Member!'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text(
                                    'Click here to Login',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              //onChanged: (){},
                              //     () {
                              //   // try {
                              //   //   mobile = number;
                              //   // } catch (e) {
                              //   //   print('Mobile Number Error : $e');
                              //   // }
                              // },
                              decoration: kTextField.copyWith(
                                hintText: 'Enter your mobile number',
                              ),
                              //controller: _phoneController,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              //Mobile Registration
                              child: Buttons(
                                  text: 'Mobile',
                                  onPressed: () async {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    Navigator.pushNamed(context, '/chat');
                                    openDialog();
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kFuelledBy,
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          alignment: Alignment.center,
          backgroundColor: Colors.lightGreenAccent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
          title: const Text(
            "Congratulations! \n\nPlease Remember",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: const Text(
            "If You sign out or uninstall Twaddle, \nYou won't be able to access the same account anymore. \n\nYour information will be lost.",
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}

//For Anonymous Button
// Padding(
// padding: EdgeInsets.symmetric(vertical: 6.0),
// //Anon Registration
// child: Buttons(
// text: 'Anonymous',
// onPressed: () async {
// setState(() {
// showSpinner = true;
// });
// dynamic result = await _authAnon.signUpAnon();
// if (result == null) {
// //print('error signing in');
// showToastError(
// 'Error signing in. \nPlease sign in again.',
// context);
// } else {
// //print(result.uid);
// Navigator.pushNamed(context, '/chat');
// openDialog();
// setState(() {
// showSpinner = false;
// });
// }
// }),
// ),
