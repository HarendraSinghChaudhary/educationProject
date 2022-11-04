import 'dart:io';

import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'onboarding_goals.dart';

class OnboardingInterests extends StatefulWidget {
  const OnboardingInterests({Key? key}) : super(key: key);

  @override
  State<OnboardingInterests> createState() => _OnboardingInterestsState();
}

class _OnboardingInterestsState extends State<OnboardingInterests> {
  bool ui = false;
  bool web = false;
  bool marketing = false;
  bool startup = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "STEP 2 OF 5",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 12.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0.2,
                end: 0.4,
              ),
              builder: (context, value, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: LinearProgressIndicator(
                    minHeight: 10,
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
              height: 20.h,
            ),
            Text(
              'What are you interested in?',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "It’s OK if you don’t know. We can help!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14.sp,
                  height: 1.3,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        ui = !ui;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: ui == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "UI UX\nDesign",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image: const AssetImage(
                                      "assets/images/paywall1.png")),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        web = !web;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: web == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Web\nDevelopment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image: const AssetImage(
                                      "assets/images/paywall5.png")),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        marketing = !marketing;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: marketing == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Digital\nMarketing",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image: const AssetImage(
                                      "assets/images/paywall4.png")),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        startup = !startup;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: startup == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Startup\nBusiness",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image:
                                      AssetImage("assets/images/paywall6.png")),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                Get.to(const OnboardingGoals());
              },
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                Container(
                  height: 58.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Center(
                    child: Text(
                      "CONTINUE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18.sp,
                          height: 1.5.h,
                          wordSpacing: 2.5,
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
          ],
        ),
      ),
    );
  }
}
