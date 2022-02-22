import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kAppInfo = Text(
  'Connecting like minded People Globally',
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.black87,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
    fontStyle: FontStyle.italic,
  ),
);

const kTextField = InputDecoration(
  hintText: 'Enter A Value',
  hintStyle: TextStyle(color: Colors.blueGrey, fontStyle: FontStyle.italic),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
);

const kFuelledBy = Text(
  'fuelled by:\n Hobby Networking',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontFamily: 'Pacifico',
    color: Colors.black87,
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
    letterSpacing: 2,
    fontStyle: FontStyle.italic,
  ),
);

void showToastError(String errorMessage, BuildContext context) {
  showToast(
    errorMessage,
    context: context,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.center,
    animDuration: const Duration(seconds: 2),
    duration: const Duration(seconds: 5),
    curve: Curves.elasticOut,
    reverseCurve: Curves.easeInOut,
    backgroundColor: Colors.lightGreenAccent,
    textStyle: const TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.italic,
      fontSize: 18,
    ),
    borderRadius: BorderRadius.circular(13),
  );
}

// void showToastWidget(String message, BuildContext context) {
//   showToast(
//     message,
//     animation: StyledToastAnimation.scale,
//     reverseAnimation: StyledToastAnimation.fade,
//     position: StyledToastPosition.center,
//     animDuration: const Duration(seconds: 2),
//     duration: const Duration(seconds: 5),
//     curve: Curves.elasticOut,
//     reverseCurve: Curves.easeInOut,
//     backgroundColor: Colors.lightGreenAccent,
//     textStyle: const TextStyle(
//       color: Colors.black,
//       fontStyle: FontStyle.italic,
//       fontSize: 18,
//     ),
//     borderRadius: BorderRadius.circular(13),
//   );
// }
