import 'package:demo/screens/home/view/home.dart';
import 'package:demo/screens/homeNav/home_nav.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';

class QuizEnd extends StatefulWidget {
  const QuizEnd({Key? key}) : super(key: key);

  @override
  State<QuizEnd> createState() => _QuizendState();
}

class _QuizendState extends State<QuizEnd> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [

    
              Container(
            
              width: Get.width * 0.99,
              height: Get.height * 0.99,
              child: Lottie.asset('assets/icons/confetti.json', )),
              
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(Get.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(HomeNav(index: 1));
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
                                Text(
                                  '100%',
                                  style: TextStyle(
                                      color: kTitleColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '5 of 5',
                                  style: TextStyle(color: kSubTitleColor),
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
                      Positioned(
                        top: Get.height * 0.197,
                        left: Get.width * 0.39,
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.056,
                          width: Get.width * 0.22,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            '+100 XP',
                            style: TextStyle(
                                color: kCyanColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
                //percent_indicator  Code End

                //Gretting Code Start
              const  Text(
                  'Lets go!',
                  style: TextStyle(
                      color: kTitleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),

                SizedBox(height: Get.height * 0.01,),
               const Text(
                  'Congratulations for getting all\nthe answers correct!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color:kSubTitleColor,
                    height: 1.5,
                  fontSize: 20,fontWeight: FontWeight.w400),
                ),
                SizedBox(height: Get.height*0.03,),
              const  Text(
                  'Share your accomplishment with a\nfriend for a 25 XP Bonus!',
                  textAlign: TextAlign.center,
                  
                  style: TextStyle(color:kSubTitleColor,
                  height: 1.5,
                  fontSize: 20,fontWeight: FontWeight.w400),
                ),
                //Gretting Code End
                SizedBox(height: Get.height*0.10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CONTINUE',
                      textAlign: TextAlign.center,
                      style: TextStyle(color:ksubtitamarketColor,fontSize: 16,fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                //share Button(4) code Start
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(Get.height*0.015),
                        height: Get.height*0.08,
                        width: Get.width*0.17,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.32),
                                offset: const Offset(0,4),
                                blurRadius: 9,
                              )
                            ]
                        ),
                        child: SvgPicture.asset('assets/images/whitesms.svg'),
                      ),
                      Container(
                        padding: EdgeInsets.all(Get.height*0.015),
                        height: Get.height*0.08,
                        width: Get.width*0.17,
                        decoration: BoxDecoration(
                            color: Color(0xff60D4AA),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.32),
                                offset: const Offset(0,4),
                                blurRadius: 9,
                              )
                            ]
                        ),
                        child: SvgPicture.asset('assets/images/mail.svg'),
                      ),
                      Container(
                        padding: EdgeInsets.all(Get.height*0.015),
                        height: Get.height*0.08,
                        width: Get.width*0.17,
                        decoration: BoxDecoration(
                            color: Color(0xff4775CC),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.32),
                                offset: const Offset(0,4),
                                blurRadius: 9,
                              )
                            ]
                        ),
                        child: SvgPicture.asset('assets/images/facebook.svg'),
                      ),
                      Container(
                        padding: EdgeInsets.all(Get.height*0.015),
                        height: Get.height*0.08,
                        width: Get.width*0.17,
                        decoration: BoxDecoration(
                            color: Color(0xff22B9FA),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.32),
                                offset: const Offset(0,4),
                                blurRadius: 9,
                              )
                            ]
                        ),
                        child: SvgPicture.asset('assets/images/twt.svg'),
                      ),
                    ],
                  ),
                )
                //share Button(4) code End
              ],
            ),
          ],
        ),
      ),
    );
  }
}
