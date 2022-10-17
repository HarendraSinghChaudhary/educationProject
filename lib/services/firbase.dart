import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future addDatatofirebase(String fcm)async{
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection('Production');
// CollectionReference users = firestore.collection('Development');
  // users.add(
  //   {
  //     'fcmToken':fcm
  //   }
  // ).then((value) => print("User Added"))
  //         .catchError((error) => print("Failed to add user: $error"));
          users.doc(Preferences.pref!.getString("id")).set(
    {
      'fcmToken':fcm
    }
  ).then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
}

Future deleteDatatofirebase()async{
FirebaseFirestore firestore = FirebaseFirestore.instance;
// CollectionReference users = firestore.collection('Production');
CollectionReference users = firestore.collection('Development');
  users.doc(Preferences.pref!.getString("id")).delete().then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
}
 
Future fcmtoken()async {
    var messaging = FirebaseMessaging.instance;
   await messaging.getToken().then((value) {
      print("token: " + value.toString());
      Preferences.pref!.setString("fcmToken", value.toString());// value.toString();

      print("new token: " + Preferences.pref!.getString("fcmToken").toString());
    });
  }