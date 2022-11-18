import 'dart:developer';
import 'dart:io';

import 'package:Ambitious/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:Ambitious/services/mixpanel.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_html/style.dart';
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

class OnboardingInterests extends StatefulWidget {
  const OnboardingInterests({Key? key}) : super(key: key);

  @override
  State<OnboardingInterests> createState() => _OnboardingInterestsState();
}

class _OnboardingInterestsState extends State<OnboardingInterests> {
  final onbardingController = Get.find<OnBoardingController>();
  void updateInterests() {
    onbardingController.interestedInSelectedList.clear();
    if (ui) {
      onbardingController.interestedInSelectedList.add("UI UX Design");
    }
    if (web) {
      onbardingController.interestedInSelectedList.add("Web Development");
    }
    if (marketing) {
      onbardingController.interestedInSelectedList.add("Digital Marketing");
    }
    if (startup) {
      onbardingController.interestedInSelectedList.add("Startups & Business");
    }

    onbardingController.update();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onbardingController.interestedInSelectedList.clear();
    mixpanelTrack(
              "Onboarding Step 2");
  }

  bool ui = false;
  bool web = false;
  bool marketing = false;
  bool startup = false;

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
              "STEP 2 OF 5",
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
                begin: 0.2,
                end: 0.4,
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
              'What are you interested in?',
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
              "It’s OK if you don’t know. We can help!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14.sp,
                  height: 1.3,
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
                        // if (onbardingController
                        //             .interestedInSelectedList.length <=
                        //         1 ||
                        //     (onbardingController
                        //                 .interestedInSelectedList.length ==
                        //             2 &&
                        //         ui)) {
                        ui = !ui;
                        updateInterests();
                        setState(() {});
                        // } else {
                        //   //showSnack("Can select max 2 Interests");
                        // }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                                    height: 1.5.h,
                                    wordSpacing: 2.5.w,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: SvgPicture.asset(
                                    "assets/images/onboarding_interests3.svg",
                                    height: 50.h,
                                  )

                            
                                  ),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        // if (onbardingController
                        //             .interestedInSelectedList.length <=
                        //         1 ||
                        //     (onbardingController
                        //                 .interestedInSelectedList.length ==
                        //             2 &&
                        //         web)) {
                        web = !web;
                        updateInterests();
                        setState(() {});
                        // } else {
                        //   //showSnack("Can select max 2 Interests");
                        // }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                                    height: 1.5.h,
                                    wordSpacing: 2.5.w,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: SvgPicture.asset(
                                    "assets/images/onboarding_interests2.svg",
                                    height: 50.h,
                                  )

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
                        // if (onbardingController
                        //             .interestedInSelectedList.length <=
                        //         1 ||
                        //     (onbardingController
                        //                 .interestedInSelectedList.length ==
                        //             2 &&
                        //         marketing)) {
                        marketing = !marketing;
                        updateInterests();
                        setState(() {});
                        // } else {
                        //   //showSnack("Can select max 2 Interests");
                        // }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                                    height: 1.5.h,
                                    wordSpacing: 2.5.w,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: SvgPicture.asset(
                                    "assets/images/onboarding_interests4.svg",
                                    height: 50.h,
                                  )

                            
                                  ),
                            ],
                          )),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        // if (onbardingController
                        //             .interestedInSelectedList.length <=
                        //         1 ||
                        //     (onbardingController
                        //                 .interestedInSelectedList.length ==
                        //             2 &&
                        //         startup)) {
                        startup = !startup;
                        updateInterests();
                        setState(() {});
                        // } else {
                        //   //showSnack("Can select max 2 Interests");
                        // }
                      },
                      child: Container(
                          height: 164.w,
                          width: 164.w,
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
                                    height: 1.5.h,
                                    wordSpacing: 2.5.w,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: SvgPicture.asset(
                                    "assets/images/onboarding_interests1.svg",
                                    height: 50.h,
                                  )
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
            onbardingController.interestedInSelectedList.isEmpty
                ? Container()
                : InkWell(
                    onTap: () {
                       
                      Get.to(const OnboardingGoals());
                    },
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Container(
                            height: 58.h,
                            width: 400.w,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: Text(
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
