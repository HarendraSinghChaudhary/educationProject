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

import 'testing/navigation_testing.dart';

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
    // systemNavigationBarColor: Colors.blue, // navigation bar color
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
            print("Notification recieved");
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
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String? payload) async {
  //   if (payload != null) {
  //     debugPrint('notification payload: $payload');
  //     // navigatorKey.currentState!.pushNamed("/notification");

  //   }
  //   selectedNotificationPayload = payload;
  //   selectNotificationSubject.add(payload);
  // });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         IOSFlutterLocalNotificationsPlugin>()
  //     ?.initialize(initializationSettingsIOS);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  Mixpanell.mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
      optOutTrackingDefault: false); // development mixpanel token
  // Mixpanell.mixpanel = await Mixpanel.init("d0b9a45e61612a70e7a3f6bb8396a918", optOutTrackingDefault: false);// production mixpanel token
  // await Intercom.instance.initialize(
  //   'com.educationondemand',
  //   androidApiKey: 'androidApiKey',
  //   iosApiKey: 'iosApiKey',
  // );

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

  List<String> notificationList = [];

  // Future<void> _requestPermissions() async {
  //   flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           IOSFlutterLocalNotificationsPlugin>()
  //       ?.requestPermissions(
  //         alert: true,
  //         badge: true,
  //         sound: true,
  //       );

  //   Map<Permission, PermissionStatus> statuses =
  //       await [Permission.notification].request();
  // }

  void _configureDidReceiveLocalNotificationSubject() {
    print("_configureDidReceiveLocalNotificationSubject");
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      print("listion ios state");
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
                print("Clicked true ios");
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
    print("_configureSelectNotificationSubject");

    selectNotificationSubject.stream.listen((String? payload) async {
      print("chacking payload" + payload.toString());
      if (payload != null) {
        if (payload != "") {
          var listdata = await breakPayload(payload);
          var type = "";
          var review_id = "";
          var reply_id = "";
          listdata.forEach((element) {
            if (element.contains("type")) {
              int i = element.indexOf(":") + 2;
              print("Type " + element.substring(i) + "^^");
              type = element.substring(i).toString();
            }

            if (element.contains("businessreview_id")) {
              int i = element.indexOf(":") + 2;
              print("businessreview_id " + element.substring(i) + "^^");
              review_id = element.substring(i).toString();
            }

            if (element.contains("reply_id")) {
              int i = element.indexOf(":") + 2;
              print("reply_id " + element.substring(i) + "^^");
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
    // _configureDidReceiveLocalNotificationSubject();
    // _configureSelectNotificationSubject();
////Forground notification
    FirebaseMessaging.onMessage.listen((message) async {
      print("Onmessage");
      // print("message " + message.notification!.title.toString() + "^^");
      // print("notification data" + message.data.toString());
      // print("notification notification" + message.notification.toString());

      if (message.notification != null) {
        print("notification notification" +
            message.notification!.title.toString());
      }
      if (message.notification != null) {
        Map<String, dynamic> map = HashMap();
        print(map.toString());
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
          print("showing");
      await flutterLocalNotificationsPlugin.show(
        10,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data.toString(),
      );
      print("notification data" + message.data.toString());

      if (message.notification != null) {
        print(message.notification!.body);
      }
    });
    //Routing on tap notification
    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // print("notification data" + message.data.toString());
      print("on message opend app");

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (message.notification != null) {
        Map<String, dynamic> map = HashMap();

        print(map.toString());
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
          print("showing noti in opened");
      await flutterLocalNotificationsPlugin.show(
        10,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data.toString(),
      );
      // if (notification != null && android != null) {
      //   flutterLocalNotificationsPlugin.show(
      //       notification.hashCode,
      //       notification.title,
      //       notification.body,
      //       NotificationDetails(
      //         android: AndroidNotificationDetails(
      //           channel.id,
      //           channel.name,
      //           icon: android.smallIcon,
      //           // other properties...
      //         ),
      //       ));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ambitious",
      initialRoute:
          "/", // Starting app route. Navigate to EducationOnDemand Class
      theme: ThemeData(fontFamily: "HK Grotesk", primaryColor: kPrimaryColor),

      home:
          // Dark_Course()
          // DarkLearningPath()
          // DarkCourseDetail()
          // Stepernew()
          Splash(),
      // EventView()
      // CurrentEventView()

      // Application Routes

      // getPages: [
      //   GetPage(name: "/", page: () =>const EducationOnDemand()),
      //   GetPage(
      //       name: "/homeNav",
      //       page: () =>  BottomNavigationScreen(index: 0.obs,

      //           )),

      //   GetPage(name: "/signIn", page: () => const SignIn(), transition: Transition.rightToLeft ),
      //   GetPage(name: "/realQuick", page: () => const RealQuick(), transition: Transition.leftToRight ),
      //   GetPage(name: "/quickNotification", page: () => const QuickNotification(), ),
      //   // GetPage(name: "/homeNav", page: () =>  HomeNav(index: 0,), ),
      //   GetPage(name: "/courseHeader", page: () =>  CourseHeader(), ),
      //   GetPage(name: "/coursesAll", page: () => const CoursesAll() ),
      //   GetPage(name: "/socialmePeople", page: () => const SocialmePeople() ),
      //   GetPage(name: "/resourceCenter", page: () => const ResourceCenter() ),
      //   GetPage(name: "/socialmeCourses", page: () => const SocialmeCourses() ),
      //   GetPage(name: "/courseDetails", page: () => const CourseDetails() ),
      //   GetPage(name: "/socialme", page: () => const Socialme() ),
      //   GetPage(name: "/wipScreenTwo", page: () => const Wipscreentwo() ),
      //   GetPage(name: "/wipCoursePlayer", page: () => const WIPCoursesPlayer() ),
      //   GetPage(name: "/coursesEmptyScreen", page: () => const CoursesEmptyScreen() ),
      //   // GetPage(name: "/settings", page: () => const Settings() ),
      //   GetPage(name: "/flashCard", page: () => const FlashCard() ),
      //   GetPage(name: "/quizEnd", page: () => const QuizEnd() ),
      //   GetPage(name: "/editprofile", page: () => const EditProfile() ),
      //   // GetPage(name: "/introduction", page: () => const Introduction() ),
      //   GetPage(name: "/wipCoursePlayerNew", page: () => const WipCoursePlayerNew() ),
      //   GetPage(name: "/homeLive", page: () => const HomeLive() ),
      //   // GetPage(name: "/onbaordingNotificationLike", page: () => const  OnbaordingNotificationLike() ),
      //   // GetPage(name: "/onboardingNextPage", page: () => const OnboardingNextPage() ),

      // ],
    );
  }
}

Future<List<String>> breakPayload(String? _payload) async {
  String a = _payload!.replaceAll("{", "");
  String b = a.replaceAll("}", "");
  print("B is" + b.toString());
  List<String> listdata = b.split(",");
  print(listdata.length);
  print(listdata.toString());

  return listdata;
}
