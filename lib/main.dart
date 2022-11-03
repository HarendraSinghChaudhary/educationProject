// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:Ambitious/services/mixpanel.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:Ambitious/screens/onboarding/splash.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'screens/homeNav/navigationBottomBar.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'Ambitious', // id
    'Ambitious',
    description: "User Notification Channel", // name
    importance: Importance.max,
    enableLights: true,
    playSound: true,
    enableVibration: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();
String? selectedNotificationPayload;

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              ReceivedNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await AppTrackingTransparency.requestTrackingAuthorization();
  getInstance();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  Preferences.pref = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const EducationOnDemand());
}

// This widget is the root of your application.

ScrollController controllerScroll = ScrollController();
String? name;
String? id;
String? token;
String? email;
String shareCourse = "";
String? firstName;

TextEditingController nameController = TextEditingController();

class EducationOnDemand extends StatefulWidget {
  const EducationOnDemand({Key? key}) : super(key: key);

  @override
  State<EducationOnDemand> createState() => _EducationOnDemandState();
}

class _EducationOnDemandState extends State<EducationOnDemand> {
  var title = "";
  String _authStatus = 'Unknown';
  List<String> notificationList = [];

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => BottomNavigationScreen(
                      index: 0.obs,
                      learningPathIndex: 0.obs,
                    ),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() async {
    selectNotificationSubject.stream.listen((String? payload) async {
      if (payload != null) {
        if (payload != "") {
          var listdata = await breakPayload(payload);
          var type = "";
          var review_id = "";
          var reply_id = "";
          listdata.forEach((element) {
            if (element.contains("type")) {
              int i = element.indexOf(":") + 2;
              type = element.substring(i).toString();
            }

            if (element.contains("businessreview_id")) {
              int i = element.indexOf(":") + 2;
              review_id = element.substring(i).toString();
            }

            if (element.contains("reply_id")) {
              int i = element.indexOf(":") + 2;
              reply_id = element.substring(i).toString();
            }
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification != null) {
        Map<String, dynamic> map = HashMap();
        map["title"] = message.notification!.title;
        map["body"] = message.notification!.body;
      }
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      const IOSNotificationDetails ios = IOSNotificationDetails(
          presentAlert: true, presentBadge: true, presentSound: true);
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'Ambitious',
        'Ambitious',
        channelDescription: 'User Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        enableLights: true,
        enableVibration: true,
        playSound: true,
      );
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics, iOS: ios);
      await flutterLocalNotificationsPlugin.show(
        10,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data.toString(),
      );
    });
    //Routing on tap notification
    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (message.notification != null) {
        Map<String, dynamic> map = HashMap();

        map["title"] = message.notification!.title;
        map["body"] = message.notification!.body;
        if (message.data.isNotEmpty) {
          if (message.data.containsKey("type")) {
            map["type"] = message.data["type"];
          }
        }
      }
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'Ambitious',
        'Ambitious',
        channelDescription: 'User Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        enableLights: true,
        enableVibration: true,
        playSound: true,
      );
      const IOSNotificationDetails ios = IOSNotificationDetails(
          presentAlert: true, presentBadge: true, presentSound: true);
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics, iOS: ios);
      await flutterLocalNotificationsPlugin.show(
        10,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data.toString(),
      );
    });
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dear User'),
          content: const Text(
            'We care about your privacy and data security. We keep this app free by showing ads. '
            'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
            'Our partners will collect data and use a unique identifier on your device to show you ads.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ambitious",
      initialRoute:
          "/", // Starting app route. Navigate to EducationOnDemand Class
      theme: ThemeData(fontFamily: "HK Grotesk", primaryColor: kPrimaryColor),

      home: Splash(),
    );
  }
}

Future<List<String>> breakPayload(String? _payload) async {
  String a = _payload!.replaceAll("{", "");
  String b = a.replaceAll("}", "");
  List<String> listdata = b.split(",");

  return listdata;
}
