import 'package:ds_twaddle/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ds_twaddle/models/users.dart';
import '../screens/post_login/chat_screen.dart';

class AuthService {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  // Create User object based on Firebase User
  TheUser? _allUsersFromFirebase(User? allUsers) {
    return allUsers != null ? TheUser(uid: allUsers.uid) : null;
  }

  //Auth change User Stream
  Stream<TheUser?> get allUsers {
    return _authService.authStateChanges().map(_allUsersFromFirebase);
  }

  //Anon SignUp
  Future signUpAnon() async {
    try {
      UserCredential resultAnon = await _authService.signInAnonymously();
      User? userAnon = resultAnon.user;
      return _allUsersFromFirebase(userAnon);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  // Email Register
  Future signUpEmail(String email, String password) async {
    try {
      UserCredential resultEmail = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);
      User? userEmail = resultEmail.user;
      await DatabaseService(uid: userEmail!.uid).updateUserData(
          'user emoji', loggedInUser.email.toString(), 'user messages');
      return _allUsersFromFirebase(userEmail);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  // Email Login
  Future loginEmail(String email, String password) async {
    try {
      UserCredential resultEmail = await _authService
          .signInWithEmailAndPassword(email: email, password: password);
      User? userEmail = resultEmail.user;
      return _allUsersFromFirebase(userEmail!);
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  // Log Out

  Future signOut() async {
    try {
      return await _authService.signOut();
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }
}
