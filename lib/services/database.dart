import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Future messageStreams() async {
  //   await for (var snapshot in chatCollection.snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }
}
