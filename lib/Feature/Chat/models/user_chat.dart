import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

class UserChat {
  String id;
  String photoUrl;
  String nickname;


  UserChat({required this.id, required this.photoUrl, required this.nickname});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String photoUrl = "";
    String nickname = "";
  
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (e) {}
    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      nickname: nickname,
      
    );
  }
}
