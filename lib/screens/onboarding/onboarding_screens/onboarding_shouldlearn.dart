import 'dart:developer';
import 'dart:io';

import 'package:Ambitious/controllers/onboarding_controller/onboarding_controller.dart';
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

import '../../homeNav/navigationBottomBar.dart';
import 'onboarding_goals.dart';

class OnboardingShouldLearn extends StatefulWidget {
  const OnboardingShouldLearn({Key? key}) : super(key: key);

  @override
  State<OnboardingShouldLearn> createState() => _OnboardingShouldLearnState();
}

class _OnboardingShouldLearnState extends State<OnboardingShouldLearn> {
  final onbardingController = Get.find<OnBoardingController>();

  String? name = "";
  Future<void> setName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('firstname') ?? "";
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                begin: 0.8,
                end: 1,
              ),
              builder: (context, value, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
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
              height: 20.h,
            ),
            Text(
              name!.isEmpty
                  ? "${onbardingController.onBoardingFinishModel!.header}"
                  : '$name, ${onbardingController.onBoardingFinishModel!.header}',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24.sp,
                  height: 1.2.h,
                  wordSpacing: 2.5.w,
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
                  wordSpacing: 2.5.w,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                width: 340.w,
                //height: 270.h,
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
                        "${onbardingController.onBoardingFinishModel!.title}",
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: onbardingController
                            .onBoardingFinishModel!.reasons!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: index == 0
                                ? const EdgeInsets.symmetric(vertical: 0)
                                : const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
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
                                Flexible(
                                  child: Text(
                                    "${onbardingController.onBoardingFinishModel!.reasons![index]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 16.sp,
                                        height: 1.5.h,
                                        wordSpacing: 2.5.w,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 40.h,
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
                      children: [
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
                          "${onbardingController.onBoardingFinishModel!.tagline}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13.sp,
                              height: 1.5.h,
                              wordSpacing: 2.5.w,
                              fontWeight: FontWeight.w400),
                        ),
                        const Icon(
                          Icons.people,
                          color: kGreyColor,
                        ),
                        Text(
                          "${onbardingController.onBoardingFinishModel!.learnerCount}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13.sp,
                              height: 1.5.h,
                              wordSpacing: 2.5.w,
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
            SizedBox(
              height: 120.h,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                // log("onBoarding_isFirstTime_${prefs.getString("id_forOnboarding")}");
                prefs.setBool(
                    "onBoarding_isFirstTime_${prefs.getString("id_forOnboarding")}",
                    true);
                Get.delete<OnBoardingController>();
                Get.offAll(BottomNavigationScreen(
                  index: 0.obs,
                  learningPathIndex: 0.obs,
                ));
              },
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                Container(
                  height: 58.h,
                  width: 338.w,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Center(
                    child: Text(
                      "YES! LET’S GO!",
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
          ]),
        ));
  }
}
