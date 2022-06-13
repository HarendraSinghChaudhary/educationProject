import 'package:demo/reusable/default_button.dart';

import 'package:demo/utils/constant.dart';
import 'package:demo/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

class Flashcard extends StatefulWidget {
  const Flashcard({Key? key}) : super(key: key);

  @override
  State<Flashcard> createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  String isSelected = "";
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.04,
                        right: Get.width * 0.04,
                        top: Get.height * 0.02),
                    child: Row(
                      children: [
                        Icon(
                          Icons.close_rounded,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                        Container(
                          width: Get.width * 0.83,
                          height: Get.height * 0.015,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              backgroundColor: kLightGreyColorwithMail,
                              minHeight: Get.height * 0.017,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(kCyanColor),
                              value: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    height: Get.height * 0.78,
                    child: Swiper(
                      itemCount: Quiz.length,
                      itemWidth: Get.width * 0.86,
                      itemHeight: Get.height * 0.66,
                      layout: SwiperLayout.STACK,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.08,
                                  left: Get.width * 0.08,
                                  right: Get.width * 0.08,
                                ),
                                child: Text(
                                  Quiz[index]["tital"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kTitleColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                  maxLines: 4,
                                ),
                              ),
                              Spacer(),
                              ListView.builder(
                                  itemCount: 3,
                                 shrinkWrap : true,

                                  itemBuilder:
                                  (BuildContext context, int index) {
                                return   Padding(
                                  padding:  EdgeInsets.only(left: Get.width * 0.06,right:Get.width * 0.06,bottom: Get.height*0.02 ),
                                  child: InkWell(
                                    onTap: () {
                                      setState (() {
                                        isSelected = 'A.   The Reserve Bank';
                                      });



                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(left: Get.width * 0.06),
                                        alignment: Alignment.centerLeft,
                                        height: Get.height * 0.075,
                                        width: Get.width * 0.76,
                                        decoration: BoxDecoration(
                                            color: isSelected == 'A.   The Reserve Bank' ? kCyanColor: kWhiteColor,
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                                color: isSelected == 'A.   The Reserve Bank' ? kCyanColor: kBackgroundColor , width: 3)),
                                        child: Text(
                                          'A.   The Reserve Bank',
                                          style: TextStyle(
                                              color: isSelected == 'A.   The Reserve Bank' ? kWhiteColor: kSubTitleColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                );
                              }),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  DefaultButton(
                      width: Get.width * 0.86,
                      height: Get.height * 0.075,
                      text: 'CONTINUE',
                      press: () {}),
                ],
              ),
            )));
  }
}
