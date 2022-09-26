import 'package:cloud_firestore/cloud_firestore.dart';

Future addDatatofirebase(String fcm)async{
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection('users');
  users.add(
    {
      'fcmToken':fcm
    }
  ).then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
}