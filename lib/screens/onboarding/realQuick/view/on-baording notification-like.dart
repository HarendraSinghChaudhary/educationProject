import 'package:demo/reusable/default_button.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/list.dart';

class OnbaordingNotificationLike extends StatefulWidget {
  const OnbaordingNotificationLike({Key? key}) : super(key: key);

  @override
  State<OnbaordingNotificationLike> createState() =>
      _OnbaordingNotificationLikeState();
}

class _OnbaordingNotificationLikeState extends State<OnbaordingNotificationLike> {
  TextStyle tital =  const TextStyle( color: kTitleColor,
    fontWeight: FontWeight.w600,
    fontSize: 15,);
  TextStyle subtital = const  TextStyle(color: kSubTitleColor,fontSize: 12,height: 1.5);

  final ScrollController   _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.06,
              ),
              Center(
                child: Text(
                  'What interests you?',
                  style: TextStyle(
                      color: kTitleColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: h * 0.01,),
              Text(
                'Pick 2',
                style: TextStyle(
                    color: kSubTitleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h * 0.02,),
              ListView.builder(
                  controller: _controller,
                  itemCount: onboarding.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return   Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: Get.height * 0.020, vertical: Get.height * 0.01),
                      child: Container(
                        height: Get.height * 0.12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                offset: const Offset(0,3),
                                blurRadius: 7,
                              )
                            ]
                        ),
                        child: TextButton(
                          onPressed: (){},
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.04 ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: Get.height*0.07,
                                    width: Get.width*0.17,
                                    child: Image.asset(onboarding[index]["image"].toString(),
                                    ),
                                  ),
                                  SizedBox(width: Get.width*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(onboarding[index]["tital"].toString(),
                                        style: tital,),
                                      SizedBox(height: Get.height * 0.002,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: h*0.03),
                child: DefaultButton(width: w*0.9, height:  w*0.17, text: 'Next', press: (){
                  Get.toNamed('/onboardingNextPage');
                }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
