import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  // saving the userdata
  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // get user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  // creating a group
  Future createGroup(String groupId, String userName, String id, String groupName) async {
    await createGroup2(groupId,id,groupName);
    // update the members
     await createGroup3(groupId);

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups":
          FieldValue.arrayUnion(["${groupId}"])
    });
  }


  Future createGroup2(String groupId, String id, String groupName) async {
    return await groupCollection.doc(groupId).set({
      "groupName": groupName,
      "groupIcon": "",
      "admin": "${id}",
      "members": [],
      "groupId": "",
      "recentMessage": "",
      "recentMessageSender": "",
    }).then((value) => print("Added"))
    .catchError((error) => print("Failed to add: $error"));;
  }
  Future createGroup3(String groupId) async {
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);
    return groupDocumentReference.update({
      "members": FieldValue.arrayUnion(["${uid}"]),
      "groupId": groupId,
    });
  }

  // getting the chats
  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  // get group members
  getGroupMembers(groupId) async {
    return groupCollection.doc(groupId).snapshots();
  }

  // search
  searchByName(String groupName) {
    return groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  // function -> bool
  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains("${groupId}")) {
      return true;
    } else {
      return false;
    }
  }

  // toggling the group join/exit
  Future toggleGroupJoin(
      String groupId, String userName, String groupName) async {
    // doc reference
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    // if user has our groups -> then remove then or also in other part re join
    if (groups.contains("${groupId}")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(["${uid}"])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(["${uid}"])
      });
    }
  }

  // send message
  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    await sendMessage2(groupId,chatMessageData);
    await sendMessage3(groupId,chatMessageData);
  }
  sendMessage2(String groupId, Map<String, dynamic> chatMessageData) async {
    return await groupCollection.doc(groupId).collection("messages").doc(DateTime.now().millisecondsSinceEpoch.toString()).set(chatMessageData).then((value) => print("Added"))
    .catchError((error) => print("Failed to add: $error"));;
  }
  sendMessage3(String groupId, Map<String, dynamic> chatMessageData) async {
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);
    return groupDocumentReference.update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }

}

class TypeMessage {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
