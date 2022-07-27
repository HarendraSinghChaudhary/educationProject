import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/text_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/constant.dart';


class WIPCoursesPlayer extends StatefulWidget {
  const WIPCoursesPlayer({Key? key}) : super(key: key);

  @override
  State<WIPCoursesPlayer> createState() => _WIPCoursesState();
}

class _WIPCoursesState extends State<WIPCoursesPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.height * 0.02, vertical: Get.height * 0.01),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.01),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.height * 0.06, vertical: Get.height * 0.08),
              height: Get.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBackgroundColorOfWIp,
              ),
              child: Column(
                children: [
                  Text(
                   wipcreen,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Get.height * 0.019,
                        fontWeight: FontWeight.w400,
                        color: kBlackColor),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  SvgPicture.asset('assets/images/Star.svg')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tap to continue',
                    style: TextStyle(
                      fontSize: Get.height * 0.025,
                      color: kTitleColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Container(
                    height: Get.height * 0.040,
                    width: Get.width* 0.080,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: Icon(Icons.bookmark_border,color: Colors.white,
                    size: Get.height*0.024,),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                    backgroundColor: kLightGreyColorwithMail,
                    minHeight: Get.height * 0.017,
                    valueColor: const AlwaysStoppedAnimation<Color>(kCyanColor),
                    value:  0.3,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
