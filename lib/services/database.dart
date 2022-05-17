import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('chatMessages');

  Future updateUserData(String userEmoji, String name, String messages) async {
    return chatCollection
        .doc(uid)
        .set({'userEmoji': userEmoji, 'name': name, 'messages': messages});
  }

  final CollectionReference chatCollection1 =
      FirebaseFirestore.instance.collection('chatMessages1');

  Future updateUserData1(String userEmoji, String name, String messages) async {
    return chatCollection1
        .doc(uid)
        .set({'userEmoji': userEmoji, 'name': name, 'messages': messages});
  }

  final CollectionReference chatCollection2 =
      FirebaseFirestore.instance.collection('chatMessages2');

  Future updateUserData2(String userEmoji, String name, String messages) async {
    return chatCollection2
        .doc(uid)
        .set({'userEmoji': userEmoji, 'name': name, 'messages': messages});
  }

  final CollectionReference chatCollection3 =
      FirebaseFirestore.instance.collection('chatMessages3');

  Future updateUserData3(String userEmoji, String name, String messages) async {
    return chatCollection3
        .doc(uid)
        .set({'userEmoji': userEmoji, 'name': name, 'messages': messages});
  }

  final CollectionReference chatCollection4 =
      FirebaseFirestore.instance.collection('chatMessages4');

  Future updateUserData4(String userEmoji, String name, String messages) async {
    return chatCollection3
        .doc(uid)
        .set({'userEmoji': userEmoji, 'name': name, 'messages': messages});
  }
}
