

import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
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

    Future.delayed(Duration(seconds: 2), () {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => IntdroductionScreen()));

      token.toString() == "" || token.toString() == "null" || token.toString() == ''
          ? firstTime == "null"  ?     firstTime?
     Get.offAll(Splash()):
     Get.offAll(CreateUser()):
     Get.offAll(CreateUser())
          : token.toString() == '72' ? Get.offAll(CreateUser())
          :
           Get.offAll(HomeNav(index: 0,));
    });
  }
}