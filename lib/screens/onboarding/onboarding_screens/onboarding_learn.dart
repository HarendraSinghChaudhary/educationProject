import 'dart:developer';
import 'dart:io';

import 'package:Ambitious/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final onbardingController = Get.find<OnBoardingController>();
  bool _isLoading = false;
  void updateLearningMethods() {
    onbardingController.learningPreferencesSelectedList.clear();
    if (insta) {
      onbardingController.learningPreferencesSelectedList
          .add("Watching Stories");
    }
    if (youtube) {
      onbardingController.learningPreferencesSelectedList.add("Live Workshops");
    }
    if (projects) {
      onbardingController.learningPreferencesSelectedList
          .add("Building Projects");
    }
    if (audio) {
      onbardingController.learningPreferencesSelectedList
          .add("Listening To Audio.");
    }
    onbardingController.update();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onbardingController.learningPreferencesSelectedList.clear();
  }

  bool insta = false;
  bool youtube = false;
  bool projects = false;
  bool audio = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
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
                begin: 0.6,
                end: 0.8,
              ),
              builder: (context, value, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
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
                  height: 1.2.h,
                  wordSpacing: 2.5.w,
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
                  height: 1.5.h,
                  wordSpacing: 2.5.w,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (onbardingController
                                    .learningPreferencesSelectedList.length <=
                                1 ||
                            (onbardingController.learningPreferencesSelectedList
                                        .length ==
                                    2 &&
                                insta)) {
                          insta = !insta;
                          updateLearningMethods();
                          setState(() {});
                        } else {
                          //showSnack("Can select max 2 Learning Preferences");
                        }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                              Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: SvgPicture.asset(
                                    "assets/images/instagram2.svg",
                                    height: 57.h,
                                  )

                                
                                  ),
                              Text(
                                "Watching\nStories",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.2.h,
                                    wordSpacing: 2.5.w,
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
                        if (onbardingController
                                    .learningPreferencesSelectedList.length <=
                                1 ||
                            (onbardingController.learningPreferencesSelectedList
                                        .length ==
                                    2 &&
                                youtube)) {
                          youtube = !youtube;
                          updateLearningMethods();
                          setState(() {});
                        } else {
                          // showSnack("Can select max 2 Learning Preferences");
                        }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                              Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: SvgPicture.asset(
                                    "assets/images/youtube2.svg",
                                    height: 57.h,
                                  )

                               
                                  ),
                              Text(
                                "Live\nWorkshops",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.2.h,
                                    wordSpacing: 2.5.w,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (onbardingController
                                    .learningPreferencesSelectedList.length <=
                                1 ||
                            (onbardingController.learningPreferencesSelectedList
                                        .length ==
                                    2 &&
                                projects)) {
                          projects = !projects;
                          updateLearningMethods();
                          setState(() {});
                        } else {
                          // showSnack("Can select max 2 Learning Preferences");
                        }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: projects == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: SvgPicture.asset(
                                    "assets/images/figma3.svg",
                                    height: 57.h,
                                  )

                          
                                  ),
                              Text(
                                "Building\nProjects",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.2.h,
                                    wordSpacing: 2.5.w,
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
                        if (onbardingController
                                    .learningPreferencesSelectedList.length <=
                                1 ||
                            (onbardingController.learningPreferencesSelectedList
                                        .length ==
                                    2 &&
                                audio)) {
                          audio = !audio;
                          updateLearningMethods();
                          setState(() {});
                        } else {
                          //showSnack("Can select max 2 Learning Preferences");
                        }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                              Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: SvgPicture.asset(
                                    "assets/images/spotify2.svg",
                                    height: 57.h,
                                  )

                                  ),
                              Text(
                                "Listening\nTo Audio",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.2.h,
                                    wordSpacing: 2.5.w,
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
            onbardingController.learningPreferencesSelectedList.isEmpty
                ? Container()
                : InkWell(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      int res = await onbardingController
                          .finishOnBoarding()
                          .whenComplete(() {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                      if (res == 200) {
                        Get.offAll(const OnboardingPersonalizing());
                      } else {
                        showSnack("Something went wrong please try again.");
                      }
                    },
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Container(
                            height: 58.h,
                            width: 338.w,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: kWhiteColor,
                                    )
                                  : Text(
                                      "CONTINUE",
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
          ],
        ),
      ),
    );
  }
}
