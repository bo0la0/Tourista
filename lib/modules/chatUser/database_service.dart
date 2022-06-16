import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {


  // Collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection('Trips');

  // update userdata
  // Future updateUserData(String fullName, String email, String password) async {
  //   return await userCollection.doc(uid).setData({
  //     'fullName': fullName,
  //     'email': email,
  //     'password': password,
  //     'Trips': [],
  //     'profilePic': ''
  //   });
  // }


  // create group
  Future createGroup(String userName, String groupName) async {
    DocumentReference groupDocRef = await groupCollection.add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': userName,
      'members': [],
      //'messages': ,
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': ''
    });

  }







  // get user Trips
  // getUserGroups() async {
  //   // return await FirebaseFirestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
  //   return FirebaseFirestore.instance.collection("users").doc(uid).snapshots();
  // }


  // send message
  sendMessage(String groupId, chatMessageData) {
    FirebaseFirestore.instance.collection('Trips').doc(groupId).collection('messages').add(chatMessageData);
    FirebaseFirestore.instance.collection('Trips').doc(groupId).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString(),
    });
  }


  // get chats of a particular group
  getChats(String groupId) async {
    return FirebaseFirestore.instance.collection('Trips').doc(groupId).collection('messages').orderBy('time').snapshots();
  }


  // search Trips
  searchByName(String groupName) {
    return FirebaseFirestore.instance.collection("Trips").where('groupName', isEqualTo: groupName).get();
  }
}