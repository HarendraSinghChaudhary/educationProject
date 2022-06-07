
import 'package:demo/screens/courses_all.dart';
import 'package:demo/screens/courses_empty_screen.dart';
import 'package:demo/screens/createpassword.dart';

import 'package:demo/screens/login.dart';
import 'package:demo/screens/quick_notification.dart';
import 'package:demo/screens/realquick.dart';

import 'package:demo/screens/home_nav.dart';
import 'package:demo/screens/intropage.dart';
import 'package:demo/screens/newaccount.dart';
import 'package:demo/screens/resource_center.dart';
import 'package:demo/screens/social_me_courses.dart';
import 'package:demo/screens/social_me_people.dart';
import 'package:demo/screens/socialme.dart';
import 'package:demo/screens/start_course.dart';
import 'package:demo/screens/wipcourse_player.dart';
import 'package:demo/screens/wipscreentwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const EducationOnDemand());
}


 // This widget is the root of your application.

class EducationOnDemand extends StatelessWidget {
  const EducationOnDemand({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
        
      title: "Education on Demand",
      initialRoute: "/",     // Starting app route. Navigate to EducationOnDemand Class
      home: const IntroPage(),


      // Application Routes

      getPages: [
        GetPage(name: "/", page: () =>const EducationOnDemand()),
        GetPage(
            name: "/homeNav",
            page: () => const HomeNav(
                 
                )),
        GetPage(name: "/newAccount", page: () => const Newaccount(), transition: Transition.rightToLeft ),
        GetPage(name: "/createPassword", page: () => const CreatePassword(), transition: Transition.leftToRight ),
        GetPage(name: "/signIn", page: () => const Login(), transition: Transition.rightToLeft ),
        GetPage(name: "/realQuick", page: () => const RealQuick(), transition: Transition.leftToRight ),
        GetPage(name: "/quickNotification", page: () => const QuickNotification(), ),
        GetPage(name: "/homeNav", page: () => const HomeNav(), ),
        GetPage(name: "/startCourse", page: () => const StartCourse(), ),
        GetPage(name: "/coursesAll", page: () => const CoursesAll() ),
        GetPage(name: "/socialmePeople", page: () => const SocialmePeople() ),
        GetPage(name: "/resourceCenter", page: () => const ResourceCenter() ),
        GetPage(name: "/socialmeCourses", page: () => const SocialmeCourses() ),
       
        GetPage(name: "/socialme", page: () => const Socialme() ),
        GetPage(name: "/wipScreenTwo", page: () => const Wipscreentwo() ),
        GetPage(name: "/wipCoursePlayer", page: () => const WIPCoursesPlayer() ),
        GetPage(name: "/coursesEmptyScreen", page: () => const CoursesEmptyScreen() ),
     
      
      ],
    );
  }
}

