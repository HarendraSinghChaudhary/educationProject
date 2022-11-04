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

class OnboardingShouldLearn extends StatefulWidget {
  const OnboardingShouldLearn({Key? key}) : super(key: key);

  @override
  State<OnboardingShouldLearn> createState() => _OnboardingShouldLearnState();
}

class _OnboardingShouldLearnState extends State<OnboardingShouldLearn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kdarkblue,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(children: [
             SizedBox(
              height: 20.h,
            ),
             Text(
              "STEP 5 OF 5",
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
                begin: 0.8,
                end: 1,
              ),
              builder: (context, value, _) => Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
              'Sophia, 66% of Ambitious members are just like you!',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w600),
            ),
             SizedBox(
              height: 30.h,
            ),
             Text(
              'You should learn:',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
             SizedBox(
              height: 10.h,
            ),
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                width: 340.w,
                height: 170.h,
                decoration: const BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "No Code Development",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 24.sp,
                            height: 1.5.h,
                            wordSpacing: 2.5,
                            fontWeight: FontWeight.w600),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          CircleAvatar(
                            radius: 15.r,
                            backgroundColor: kCyanColor,
                            child: const Icon(
                              Icons.check,
                              color: kBlackColor,
                              size: 20,
                            ),
                          ),
                           SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "Build websites and apps without\nhaving to write code",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 16.sp,
                                height: 1.5.h,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 340.w,
                height: 40.h,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Container(
                    color: ksettingcardColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Image(
                            width: 40.h,
                            height: 40.h,
                            image: AssetImage("assets/images/figma.png")),
                        Image(
                            width: 40.h,
                            height: 40.h,
                            image: AssetImage("assets/images/w.png")),
                        SizedBox(
                          width: 30.w,
                        ),
                        Text(
                          "Avg Salary:\$70+/hr",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13.sp,
                              height: 1.5.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w400),
                        ),
                        const Icon(
                          Icons.people,
                          color: kGreyColor,
                        ),
                        Text(
                          "5150",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13.sp,
                              height: 1.5.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 130,
            ),
            InkWell(
              onTap: () {},
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                Container(
                  height: 58,
                  width: 400,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "YES! LET’S GO!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                          height: 1.5,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
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
          ]),
        ));
  }
}
