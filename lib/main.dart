// ignore_for_file: prefer_const_constructors

import 'package:Ambitious/screens/Events/eventView.dart';
import 'package:Ambitious/screens/course_detail.dart';
import 'package:Ambitious/screens/courses/courseHeader/view/course_header.dart';
import 'package:Ambitious/screens/courses/wip-course-player-new.dart';
import 'package:Ambitious/screens/courses_all.dart';
import 'package:Ambitious/screens/courses_empty_screen.dart';
import 'package:Ambitious/screens/dark_course.dart';
import 'package:Ambitious/screens/dark_course_detail.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/services/notification_services.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:Ambitious/screens/onboarding/splash.dart';
import 'package:Ambitious/testing/navigation_testing.dart';

import 'package:Ambitious/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Ambitious/screens/flash_card.dart';

import 'package:Ambitious/screens/home/view/home_live.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';

import 'package:Ambitious/screens/onboarding/realQuick/view/quick_notification.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/real_quick.dart';
import 'package:Ambitious/screens/onboarding/signIn/view/signin.dart';

import 'package:Ambitious/screens/profile_edit.dart';
import 'package:Ambitious/screens/quiz_end.dart';
import 'package:Ambitious/screens/resource_center.dart';
import 'package:Ambitious/screens/social_me_courses.dart';
import 'package:Ambitious/screens/social_me_people.dart';
import 'package:Ambitious/screens/socialme.dart';
import 'package:Ambitious/screens/courses/courseDetails/view/course_details.dart';
import 'package:Ambitious/screens/wipcourse_player.dart';
import 'package:Ambitious/screens/wipscreentwo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/Events/CurrentEvent/currentEvent.dart';
import 'screens/dark_learning_path.dart';
import 'testing/steper.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("handlor data: " + message.data.toString());
  print("handlor notification: " + message.notification!.title.toString());
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  // await Intercom.instance.initialize(
  //   'com.educationondemand',
  //   androidApiKey: 'androidApiKey',
  //   iosApiKey: 'iosApiKey',
  // );

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

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

  @override
  void initState() {
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("fist Type" +
            FirebaseMessaging.instance.getInitialMessage.toString());
        if (message != null) {
          print("fist Type" +
              FirebaseMessaging.instance.getInitialMessage.toString());
          print("New Notification");

          if (message.notification != null) {
            Map<String, dynamic> map = Map();
            map["title"] = message.notification!.title.toString();
            map["body"] = message.notification!.body.toString();
            createListMap(map);
          } else if (message.data != null) {
            createListMap(message.data);
          }

          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("second Type " + FirebaseMessaging.onMessage.listen.toString());
        if (message.notification != null) {
          print("second Type " + FirebaseMessaging.onMessage.listen.toString());
          print(message.notification!.title);

          print(message.notification!.body);
          notificationList.add(message.notification!.title.toString());
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

          if (message.notification != null) {
            Map<String, dynamic> map = Map();
            map["title"] = message.notification!.title.toString();
            map["body"] = message.notification!.body.toString();
            createListMap(map);
          } else if (message.data != null) {
            createListMap(message.data);
          }
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("third Type " +
            FirebaseMessaging.onMessageOpenedApp.listen.toString());
        if (message.notification != null) {
          print("third Type" +
              FirebaseMessaging.onMessageOpenedApp.listen.toString());
          print(message.notification!.title);
          title = message.notification!.title.toString();
          print(message.notification!.body);
          notificationList.add(message.notification!.title.toString());
          print("message.data22 ${message.data['_id']}");

          print("title three: " + title.toString());

          if (message.notification != null) {
            Map<String, dynamic> map = Map();
            map["title"] = message.notification!.title.toString();
            map["body"] = message.notification!.body.toString();
            createListMap(map);
          } else if (message.data != null) {
            createListMap(message.data);
          }
        }
      },
    );

    print("title one: " + title.toString());

    print("list: " + notificationList.toString());
  }

  Future<void> createListMap(Map<String, dynamic> map) async {
    print("ListSaveMap");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? titleList = preferences.getStringList('titleList');
    List<String>? bodyList = preferences.getStringList('bodyList');
    List<String>? isReadList = preferences.getStringList('isRead');
    // List<String>? idList = preferences.getStringList('idList');

    // List<String> timeList = preferences.getStringList('timeList');
    if (titleList != null && bodyList != null && isReadList != null
        // && idList!=null
        ) {
      titleList.add(map["title"].toString());
      bodyList.add(map["body"].toString());

      isReadList.add("false");
      preferences.setStringList("titleList", titleList);
      preferences.setStringList("bodyList", bodyList);

      // preferences.setStringList("idList", idList);

      //  preferences.setStringList("timeList", timeList);
      preferences.commit();
    } else {
      List<String> titleListNew = [];
      List<String> bodyListNew = [];
      List<String> isReadListNew = [];
      List<String> idList = [];

      titleListNew.add(map["title"].toString());
      bodyListNew.add(map["body"].toString());

      // if(map.containsKey("id")) {
      //   idList.add(map["id"].toString());
      // }else{
      //   idList.add("");

      // }

      isReadListNew.add("false");

      preferences.setStringList("titleList", titleListNew);
      preferences.setStringList("bodyList", bodyListNew);
      preferences.setStringList("isRead", isReadListNew);

      // preferences.setStringList("idList", idList);

      preferences.commit();
    }
    print("title: " + preferences.getStringList("titleList").toString());
    print("body: " + preferences.getStringList("bodyList").toString());

    // getNotify();
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
