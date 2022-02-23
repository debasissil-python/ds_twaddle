import 'package:firebase_auth/firebase_auth.dart';
import 'package:ds_twaddle/models/users.dart';

class AuthService {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  // Create User object based on Firebase User
  FirebaseUser? _anonUserFromFirebase(User user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

  //Anon SignUp
  Future signUpAnon() async {
    try {
      UserCredential result = await _authService.signInAnonymously();
      User? user = result.user;
      return _anonUserFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }

    // // Email SignUp
    // Future signUpAnon() async {
    //   try {
    //     UserCredential result = await _authService.signInAnonymously();
    //     User? user = result.user;
    //     return user;
    //   } catch (e) {
    //     print(e.toString());
    //     return null;
    //   }
  }
}
