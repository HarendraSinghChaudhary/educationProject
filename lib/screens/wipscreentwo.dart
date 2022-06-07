
import 'package:demo/reusable/topicon.dart';
import 'package:demo/utils/constant.dart';
import 'package:demo/utils/text_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wipscreentwo extends StatefulWidget {
  const Wipscreentwo({Key? key}) : super(key: key);

  @override
  State<Wipscreentwo> createState() => _WipscreentwoState();
}

class _WipscreentwoState extends State<Wipscreentwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Container(
              height: Get.height * 0.82,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://bit.ly/3x6JoMt'),
                    fit: BoxFit.fill),
              ),
              child: Stack(

                children: [
                  Positioned(
                    top: Get.height * 0.015,
                    left: Get.width * 0.7,
                    child: Topicon(
                        width: Get.width * 0.27,
                        height: Get.height * 0.045,
                        text: '1 of 6'),
                  ),
                  Positioned(
                    bottom: Get.height * 0.0,
                    child: Container(
                      padding: EdgeInsets.only(top: Get.height*0.04,left: Get.width*0.07),
                      height: Get.height * 0.1350,
                      width: Get.width * 1,
                      color: Colors.black.withOpacity(0.6),
                      child: Text(
                        wipscreentwo,
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: Get.height * 0.028,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: Get.height*0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.06, vertical: Get.height * 0.01),
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
                      size: Get.height*0.020,),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height*0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  backgroundColor: kLightGreyColorwithMail,
                  minHeight: Get.height * 0.017,
                  valueColor: AlwaysStoppedAnimation<Color>(kCyanColor),
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
