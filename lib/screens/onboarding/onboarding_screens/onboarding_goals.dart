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

import 'onboarding_learn.dart';

class OnboardingGoals extends StatefulWidget {
  const OnboardingGoals({Key? key}) : super(key: key);

  @override
  State<OnboardingGoals> createState() => _OnboardingGoalsState();
}

class _OnboardingGoalsState extends State<OnboardingGoals> {
  bool job = false;
  bool salary = false;
  bool business = false;
  bool skills = false;
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
              "STEP 3 OF 5",
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
                begin: 0.4,
                end: 0.6,
              ),
              builder: (context, value, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
              height: 20.h,
            ),
            Text(
              'What are your goals?',
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
                        job = !job;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: job == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Land A Job\nIn Tech",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Use digital skills to\nrun an online\nbusiness",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        salary = !salary;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: salary == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Increase My\nSalary",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "You want to learn\nskills to increase\nyour salary",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
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
                        business = !business;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: business == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Start My Own\nBusiness",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Build a startup or\nbecome a freelancer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        skills = !skills;
                        setState(() {});
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: BoxDecoration(
                              color: kcardblue,
                              border: skills == true
                                  ? Border.all(color: kCyanColor, width: 2.5.w)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Learn New\n Skills",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 20.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "You love to learn\nand want to grow",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14.sp,
                                    height: 1.3.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
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
                Get.to(const OnboardingLearn());
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
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: kArrowBackgroundColor,
                    child: Icon(
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
