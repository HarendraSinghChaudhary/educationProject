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
import 'onboarding_personalizing.dart';

class OnboardingLearn extends StatefulWidget {
  const OnboardingLearn({Key? key}) : super(key: key);

  @override
  State<OnboardingLearn> createState() => _OnboardingLearnState();
}

class _OnboardingLearnState extends State<OnboardingLearn> {
  bool insta = false;
  bool youtube = false;
  bool linkedin = false;
  bool audio = false;
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
              "STEP 4 OF 5",
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
                begin: 0.6,
                end: 0.8,
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
              'How do you like to learn?',
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
              "Choose your favorite 2 methods",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14.sp,
                  height: 1.3.h,
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
                        insta = !insta;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: insta == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  width: 50.w,
                                  height: 50.h,
                                  image: const AssetImage(
                                      "assets/images/instagram.png")),
                              Text(
                                "Watching\nStories",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        youtube = !youtube;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: youtube == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  width: 50.w,
                                  height: 50.h,
                                  image: const AssetImage(
                                      "assets/images/youtube.png")),
                              Text(
                                "Live\nWorkshops",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
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
                        linkedin = !linkedin;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: linkedin == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  width: 50.w,
                                  height: 50.h,
                                  image: const AssetImage(
                                      "assets/images/linkedin.png")),
                              Text(
                                "Reading\nShort Text",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        audio = !audio;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: audio == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  width: 50.w,
                                  height: 50.h,
                                  image: const AssetImage(
                                      "assets/images/spotify.png")),
                              Text(
                                "Listening\nTo Audio",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
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
                Get.to(const OnboardingPersonalizing());
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
