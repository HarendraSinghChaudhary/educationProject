import 'dart:convert';

import 'package:Ambitious/controllers/signup_controller.dart/create_user_controller.dart';
import 'package:Ambitious/services/app_data.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeaderStreakBanner extends StatefulWidget {
  const HeaderStreakBanner({Key? key}) : super(key: key);

  @override
  State<HeaderStreakBanner> createState() => _HeaderStreakBannerState();
}

class _HeaderStreakBannerState extends State<HeaderStreakBanner> {
  CreateUserController createUserController =
      Get.put(CreateUserController(), permanent: false);
  int userDailyStreak = 0;
  @override
  void initState() {
    super.initState();

    createUserController.refereshUser().then((isRefereshed) {
      if (isRefereshed) {
        AppData.dailyStreak =
            3; //use when you want to see Streak banner, incase your streak is zero
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppData.dailyStreak == 0 || AppData.dailyStreak == -1
        ? Container()
        : Card(
            color: kcardblue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
              child: Text(
                "${AppData.dailyStreak.toString()} Day Streak 🔥",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: kWhiteColor),
              ),
            ),
          );
  }
}
