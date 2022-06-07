
import 'package:demo/screens/createpassword.dart';

import 'package:demo/screens/login.dart';
import 'package:demo/screens/quick_notification.dart';
import 'package:demo/screens/realquick.dart';

import 'package:demo/screens/home_nav.dart';
import 'package:demo/screens/intropage.dart';
import 'package:demo/screens/newaccount.dart';
import 'package:demo/screens/start_course.dart';
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
     
      
      ],
    );
  }
}

