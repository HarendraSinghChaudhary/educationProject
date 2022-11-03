import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/testing/navigation_testing.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// in working
import '../paywall.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String id = "";

  @override
  void initState() {
   // Get.to(Paywall());
    getLoginStatus();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Center(
          child: Container(
              height: 280,
              child: Image.asset(
                "assets/images/newlogo.png",
              ))),
    );
  }

  getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id").toString();
    var firstTime = true;
    firstTime = prefs.getBool("isFirstTimeLaunch") ?? true;
    print("id :" + id.toString() + "^");

    Future.delayed(const Duration(seconds: 2), () {
      id.toString() == "" || id.toString() == "null" || id.toString() == ''
          ? firstTime == "null"
              ? firstTime
                  ? Get.offAll(() => const Splash())
                  : Get.offAll(() => const Introduction())
              : Get.offAll(() => const Introduction())
          : id.toString() == '72'
              ? Get.offAll(() => const Introduction())
              : Get.offAll(() => BottomNavigationScreen(
                    index: 0.obs,
                    learningPathIndex: 0.obs,
                  ));
    });
  }
}
