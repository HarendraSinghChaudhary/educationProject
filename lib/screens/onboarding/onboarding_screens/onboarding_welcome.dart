import 'dart:io';

import 'package:Ambitious/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:Ambitious/screens/onboarding/onboarding_screens/onboarding_interests.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class OnboardingWelcome extends StatefulWidget {
  const OnboardingWelcome({Key? key}) : super(key: key);

  @override
  State<OnboardingWelcome> createState() => _OnboardingWelcomeState();
}

class _OnboardingWelcomeState extends State<OnboardingWelcome> {
  String? name = "";
  OnBoardingController onboardingController =
      Get.put(OnBoardingController(), permanent: true);
  Future<void> setName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('firstname');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "STEP 1 OF 5",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 12.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5.w,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0.0,
                end: 0.2,
              ),
              builder: (context, value, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: LinearProgressIndicator(
                    minHeight: 10.h,
                    backgroundColor: kGreyColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      kCyanColor,
                    ),
                    value: value,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Image(
                height: 200.w,
                width: 200.w,
                fit: BoxFit.scaleDown,
                image: const AssetImage("assets/images/onboarding_rocket.png")),
            SizedBox(
              height: 50.h,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome, $name! 👋🏻',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24.sp,
                        height: 1.5.h,
                        wordSpacing: 2.5.w,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: '\nLet\'s ',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24.sp,
                        height: 1.5.h,
                        wordSpacing: 2.5.w,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: 'Get Started',
                    style: TextStyle(
                        color: kCyanColor,
                        fontSize: 24.sp,
                        height: 1.5.h,
                        wordSpacing: 2.5.w,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Not all Ambitious people are alike! Let’s discover your learning style so we can personalize your plan.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18.sp,
                  height: 1.3.h,
                  wordSpacing: 1.w,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                Get.to(const OnboardingInterests());
              },
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                Container(
                  height: 58.h,
                  width: 338.w,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "BUILD MY PLAN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18.sp,
                          height: 1.5.h,
                          wordSpacing: 2.5.w,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: kArrowBackgroundColor,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: kBackgroundColor,
                      size: 20,
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "It will only take 2 minutes",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14.sp,
                  height: 1.3.h,
                  wordSpacing: 2.5.w,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
