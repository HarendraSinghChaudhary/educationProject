import 'package:Ambitious/reusable/header_streak_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constant.dart';

class AmbitiousHeaderTop extends StatelessWidget {
  const AmbitiousHeaderTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 70),
      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: kbluegradiant,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/app_logo_2.svg",
                height: 28.h,
              ),
              SizedBox(
                width: 7.w,
              ),
              Text(
                "AMBITIOUS",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: kWhiteColor),
              ),
            ],
          ),
          const HeaderStreakBanner(),
        ],
      ),
    );
  }
}