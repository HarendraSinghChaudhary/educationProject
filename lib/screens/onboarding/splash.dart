

import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/testing/navigation_testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

   String token = "";

   @override
  void initState() {

    getLoginStatus();
    // TODO: implement initState
    super.initState();
  }







  @override
  Widget build(BuildContext context) {


   

    return Scaffold(
  
      body: Center(child: Container(
        height: 280,
        child: Image.asset("assets/images/logos.png",))),
    );
    
  }

    getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token").toString();
    var firstTime = true;
    firstTime = prefs.getBool("isFirstTimeLaunch")?? true;
    print("id :" + token.toString() + "^");

    Future.delayed(const Duration(seconds: 2), () {
     

      token.toString() == "" || token.toString() == "null" || token.toString() == ''
          ? firstTime == "null"  ?     firstTime?
     Get.offAll(Splash()):
     Get.offAll(Introduction()):
     Get.offAll(Introduction())
          : token.toString() == '72' ? Get.offAll(Introduction())
          :
           Get.offAll(BottomNavigationScreen(index: 0.obs, learningPathIndex: 0.obs,));
    });
  }
}