// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/study_material/study_material_controller.dart';
import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/screens/quiz_end.dart';
import 'package:Ambitious/screens/study_material_detail.dart';
import 'package:Ambitious/testing/navigation_testing.dart';

import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class FlashCard extends StatefulWidget {
  String id, title;
  FlashCard({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<FlashCard> createState() => _FlashcardState();
}

class _FlashcardState extends State<FlashCard> {
  int _curr = 1;
  double pageNumber = 0.0;

  StudyMaterialController studyMaterialController =
      Get.put(StudyMaterialController(), permanent: false);
  String isSelected = "";
  ScrollController _controller = ScrollController();

  late final Mixpanel _mixpanel;

  Future<void> _initMixpanel() async {
    _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
        optOutTrackingDefault: false);
  }

  @override
  void initState() {
    _initMixpanel();

    super.initState();
    pageNumber = 0.0;

    studyMaterialController.studyMaterialApi(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    print("length: " +
        studyMaterialController.studyMaterialList.length.toString());
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx((() => studyMaterialController.isLoading.value
            ? Align(
                alignment: Alignment.center,
                child: Platform.isAndroid
                    ? CircularProgressIndicator(
                        strokeWidth: 1,
                      )
                    : CupertinoActivityIndicator())
            : Column(
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.04,
                        right: Get.width * 0.04,
                        top: Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offAll(BottomNavigationScreen(
                                index: 0.obs, learningPathIndex: 0.obs));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close_rounded,
                                color: kPrimaryColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        SizedBox(
                          width: Get.width * 0.65,
                          height: Get.height * 0.015,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              backgroundColor:
                                  kLightGreyColorwithMail.withOpacity(0.3),
                              minHeight: Get.height * 0.017,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(kCyanColor),
                              value: pageNumber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    height: Get.height * 0.80,
                    child: Swiper(
                      loop: false,
                      autoplayDisableOnInteraction: true,
                      itemCount:
                          studyMaterialController.studyMaterialList.length,
                      itemWidth: Get.width * 0.95,
                      itemHeight: Get.height * 0.75,
                      layout: SwiperLayout.STACK,
                      onIndexChanged: (int index) {
                        _curr = index;

                        print("current: " + _curr.toString());
                        pageNumber = pageNumber == 0.0
                            ? (1 /
                                studyMaterialController
                                    .studyMaterialList.length)
                            : (_curr /
                                studyMaterialController
                                    .studyMaterialList.length);
                        print(pageNumber);

                        setState(() {});
                      },
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05),
                            color: Colors.white,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * 0.2,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              studyMaterialController
                                                  .studyMaterialList[index]
                                                  .image
                                                  .toString()),
                                          fit: BoxFit.cover)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        width: Get.width * 0.30,
                                        height: Get.height * 0.035,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          onPressed: () {
                                            Get.to(StudyMaterialDetail(
                                                image: studyMaterialController
                                                    .studyMaterialList[index]
                                                    .image
                                                    .toString(),
                                                detail: studyMaterialController
                                                    .studyMaterialList[index]
                                                    .StudayMaterial
                                                    .toString()));
                                          },
                                          child: Text(
                                            "View More",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ))
                                  ],
                                ),
                                Expanded(
                                  child: Html(
                                      data: studyMaterialController
                                          .studyMaterialList[index]
                                          .StudayMaterial
                                          .toString()),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  studyMaterialController.studyMaterialList.length - 1 == _curr
                      ? DefaultButton(
                          width: Get.width * 0.86,
                          height: Get.height * 0.070,
                          text: 'COMPLETE',
                          press: () {
                            _mixpanel.track('Course Finished', properties: {
                              "Course Name": widget.title.toString()
                            });

                            Get.to(QuizEnd(
                              length: studyMaterialController
                                  .studyMaterialList.length,
                            ));
                          })
                      : Container(),
                ],
              ))));
  }
}
