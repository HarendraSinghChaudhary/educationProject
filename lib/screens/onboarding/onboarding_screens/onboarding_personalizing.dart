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
import 'onboarding_shouldlearn.dart';

class OnboardingPersonalizing extends StatefulWidget {
  const OnboardingPersonalizing({Key? key}) : super(key: key);

  @override
  State<OnboardingPersonalizing> createState() =>
      _OnboardingPersonalizingState();
}

class _OnboardingPersonalizingState extends State<OnboardingPersonalizing> {
  Future<void> waitTillPersonalizingDone() async {
    Future.delayed(const Duration(milliseconds: 3500), () {
      Get.offAll(const OnboardingShouldLearn());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitTillPersonalizingDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kdarkblue,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: 340.w,
              height: 220.h,
              decoration: BoxDecoration(
                  color: kcardblue,
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Almost done!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24.sp,
                        height: 1.5.h,
                        wordSpacing: 2.5.w,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "We are personalizing your",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24.sp,
                        height: 1.5.h,
                        wordSpacing: 2.5.w,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "learning experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kcardcyangradient,
                        fontSize: 24.sp,
                        height: 1.5.h,
                        wordSpacing: 2.5.w,
                        fontWeight: FontWeight.w400),
                  ),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 3500),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(
                      begin: 0,
                      end: 1,
                    ),
                    builder: (context, value, _) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
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
                ],
              ),
            ),
          ),
        ));
  }
}
