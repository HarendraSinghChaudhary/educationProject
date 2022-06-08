
import 'package:demo/screens/courses/courseHeader/view/course_header.dart';
import 'package:demo/screens/courses_all.dart';
import 'package:demo/screens/courses_empty_screen.dart';


import 'package:demo/screens/homeNav/home_nav.dart';
import 'package:demo/screens/onboarding/introduction/view/introduction.dart';
import 'package:demo/screens/onboarding/realQuick/view/quick_notification.dart';
import 'package:demo/screens/onboarding/realQuick/view/real_quick.dart';
import 'package:demo/screens/onboarding/signIn/view/signin.dart';
import 'package:demo/screens/onboarding/signUp/view/create_password.dart';
import 'package:demo/screens/onboarding/signUp/view/new_account.dart';
import 'package:demo/screens/quizend.dart';
import 'package:demo/screens/resource_center.dart';
import 'package:demo/screens/social_me_courses.dart';
import 'package:demo/screens/social_me_people.dart';
import 'package:demo/screens/socialme.dart';
import 'package:demo/screens/courses/courseDetails/view/course_details.dart';
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
      home: const Introduction(),


      // Application Routes

      getPages: [
        GetPage(name: "/", page: () =>const EducationOnDemand()),
        GetPage(
            name: "/homeNav",
            page: () => const HomeNav(
                 
                )),
        GetPage(name: "/newAccount", page: () => const NewAccount(), transition: Transition.rightToLeft ),
        GetPage(name: "/createPassword", page: () => const CreatePassword(), transition: Transition.leftToRight ),
        GetPage(name: "/signIn", page: () => const SignIn(), transition: Transition.rightToLeft ),
        GetPage(name: "/realQuick", page: () => const RealQuick(), transition: Transition.leftToRight ),
        GetPage(name: "/quickNotification", page: () => const QuickNotification(), ),
        GetPage(name: "/homeNav", page: () => const HomeNav(), ),
        GetPage(name: "/courseHeader", page: () => const CourseHeader(), ),
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

