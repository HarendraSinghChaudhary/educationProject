// ignore_for_file: prefer_const_constructors

import 'package:Ambitious/controllers/status_change_controller.dart';
import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import '../../../controllers/study_material/study_material_controller.dart';
import '../../../services/mixpanel.dart';
import '../../../utils/sharedPreference.dart';

import 'package:in_app_review/in_app_review.dart';

class LessonEnd extends GetView<StatusChangeController> {
  LessonEnd({Key? key}) : super(key: key);
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Stack(
        children: [
          SizedBox(
              width: Get.width * 0.99,
              height: Get.height * 0.99,
              child: Lottie.asset('assets/icons/confetti.json',
                  fit: BoxFit.cover)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    InkWell(
                      onTap: () async {
                        await Get.delete<StudyMaterialController>();
                        if (!controller.cont.isread) {
                          await controller
                              .statusChangeApi(controller.cont.finishId)
                              .whenComplete(() {
                            controller.cont.checkCopletion();
                            mixpanelTrack("Module: Complete", {
                              "Course Name":
                                  controller.cont.bigdata.value!.title,
                              "Module Title": controller.cont.lessonTitle,
                            });

                            Get.back();
                          });
                        }
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              //percent_indicator  Code Start
              Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: Get.height * 0.3,
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 15.0,
                          percent: 1,
                          center: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.055,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: Get.height * 0.05,
                                width: Get.width * 0.22,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(
                                  '+100 XP',
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          progressColor: kCyanColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.044,
                      left: Get.width * 0.435,
                      child: Container(
                          padding: EdgeInsets.all(Get.height * 0.016),
                          height: Get.height * 0.05,
                          width: Get.width * 0.13,
                          decoration: BoxDecoration(
                            color: kCyanColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset('assets/images/done.svg')),
                    ),
                  ]),
                ],
              ),
              //percent_indicator  Code End

              //Gretting Code Start
              Text(
                'Lets Go!',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),

              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                'You just learned about ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    height: 1.5,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),

              Text(
                controller.cont.lessonTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    height: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              //Gretting Code End
              SizedBox(
                height: Get.height * 0.2,
              ),

              DefaultButton(
                  width: Get.width * 0.86,
                  height: Get.height * 0.075,
                  text: 'CONTINUE',
                  press: () async {
                    mixpanelTrack("Module: Complete", {
                      "Course Name": controller.cont.bigdata.value!.title,
                      "Module Title": controller.cont.lessonTitle,
                    });
                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview().whenComplete(() {
                        Get.delete<StudyMaterialController>();
                        if (!controller.cont.isread) {
                          controller
                              .statusChangeApi(controller.cont.finishId)
                              .whenComplete(() {
                            controller.cont.checkCopletion();
                          });
                        }
                        Get.back();
                      });
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
