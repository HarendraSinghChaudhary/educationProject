
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
import 'package:Ambitious/screens/courses/courseHeader/view/course_header.dart';
import 'package:Ambitious/screens/courses/wip-course-player-new.dart';
import 'package:Ambitious/screens/courses_all.dart';
import 'package:Ambitious/screens/courses_empty_screen.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/on-baording%20notification-like.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/on-boarding-next-page.dart';
import 'package:Ambitious/screens/onboarding/splash.dart';
import 'package:Ambitious/testing/testing_appbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Ambitious/screens/flash_card.dart';
import 'package:Ambitious/screens/home/view/home.dart';
import 'package:Ambitious/screens/home/view/home_live.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/marketplace.dart';
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/quick_notification.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/real_quick.dart';
import 'package:Ambitious/screens/onboarding/signIn/view/signin.dart';

import 'package:Ambitious/screens/profile_edit.dart';
import 'package:Ambitious/screens/quiz_end.dart';
import 'package:Ambitious/screens/resource_center.dart';
import 'package:Ambitious/screens/settings.dart';
import 'package:Ambitious/screens/social_me_courses.dart';
import 'package:Ambitious/screens/social_me_people.dart';
import 'package:Ambitious/screens/socialme.dart';
import 'package:Ambitious/screens/courses/courseDetails/view/course_details.dart';
import 'package:Ambitious/screens/wipcourse_player.dart';
import 'package:Ambitious/screens/wipscreentwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const EducationOnDemand());


   

 
}


 // This widget is the root of your application.

ScrollController controllerScroll = ScrollController();
String? name;
String? id;
String? token;
String? email;

TextEditingController nameController = TextEditingController();

class EducationOnDemand extends StatelessWidget {
  const EducationOnDemand({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
        
      title: "Ambitious",
      initialRoute: "/",     // Starting app route. Navigate to EducationOnDemand Class
      home: const Splash(),


      // Application Routes

      getPages: [
        GetPage(name: "/", page: () =>const EducationOnDemand()),
        GetPage(
            name: "/homeNav",
            page: () =>  HomeNav(index: 0,
                 
                )),
   
        GetPage(name: "/signIn", page: () => const SignIn(), transition: Transition.rightToLeft ),
        GetPage(name: "/realQuick", page: () => const RealQuick(), transition: Transition.leftToRight ),
        GetPage(name: "/quickNotification", page: () => const QuickNotification(), ),
        // GetPage(name: "/homeNav", page: () =>  HomeNav(index: 0,), ),
        GetPage(name: "/courseHeader", page: () => const CourseHeader(), ),
        GetPage(name: "/coursesAll", page: () => const CoursesAll() ),
        GetPage(name: "/socialmePeople", page: () => const SocialmePeople() ),
        GetPage(name: "/resourceCenter", page: () => const ResourceCenter() ),
        GetPage(name: "/socialmeCourses", page: () => const SocialmeCourses() ),
        GetPage(name: "/courseDetails", page: () => const CourseDetails() ),
        GetPage(name: "/socialme", page: () => const Socialme() ),
        GetPage(name: "/wipScreenTwo", page: () => const Wipscreentwo() ),
        GetPage(name: "/wipCoursePlayer", page: () => const WIPCoursesPlayer() ),
        GetPage(name: "/coursesEmptyScreen", page: () => const CoursesEmptyScreen() ),
        GetPage(name: "/settings", page: () => const Settings() ),
        GetPage(name: "/flashCard", page: () => const FlashCard() ),
        GetPage(name: "/quizEnd", page: () => const QuizEnd() ),
        GetPage(name: "/editprofile", page: () => const EditProfile() ),
        // GetPage(name: "/introduction", page: () => const Introduction() ),
        GetPage(name: "/wipCoursePlayerNew", page: () => const WipCoursePlayerNew() ),
        GetPage(name: "/homeLive", page: () => const HomeLive() ),
        GetPage(name: "/onbaordingNotificationLike", page: () => const  OnbaordingNotificationLike() ),
        GetPage(name: "/onboardingNextPage", page: () => const OnboardingNextPage() ),

     
      
      ],
    );
  }

 


  


 
}

