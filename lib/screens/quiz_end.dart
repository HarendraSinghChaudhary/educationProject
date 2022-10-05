// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:Ambitious/controllers/status_change_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/reusable/home_header.dart';
import 'package:Ambitious/screens/courses/courseHeader/view/course_header.dart';
import 'package:Ambitious/screens/home/view/home.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/services/crispchat.dart';
import 'package:Ambitious/testing/navigation_testing.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/courses/darkcourse_controller.dart';
import '../controllers/study_material/study_material_controller.dart';
import '../utils/sharedPreference.dart';
import 'dark_course_detail.dart';

class QuizEnd extends StatefulWidget {
  int length;
  QuizEnd ({required this.length});

  @override
  State<QuizEnd> createState() => _QuizendState();
}

class _QuizendState extends State<QuizEnd> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [

    
            SizedBox(
          
            width: Get.width * 0.99,
            height: Get.height * 0.99,
            child: Lottie.asset('assets/icons/confetti.json',  fit: BoxFit.cover)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                   SizedBox(height: Get.height * 0.1,),


                    InkWell(
                      onTap: () {
                       Get.to(()=>BottomNavigationScreen(index: 1.obs, learningPathIndex: 0.obs));
                   Get.delete<StudyMaterialController>();
                       Get.delete<DarkCourseDetail_Controller>();
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
                              // Text(
                              //   widget.length.toString() +' of ' + widget.length.toString(),
                              //   style: TextStyle(color: kSubTitleColor),
                              // ),
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
                    // Positioned(
                    //   top: Get.height * 0.197,
                    //   left: Get.width * 0.39,
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     height: Get.height * 0.056,
                    //     width: Get.width * 0.22,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(25)),
                    //     child: Text(
                    //       '+100 XP',
                    //       style: TextStyle(
                    //           color: kCyanColor,
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w700),
                    //     ),
                    //   ),
                    // )
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
                'You finished the course!',
                textAlign: TextAlign.center,
                style: TextStyle(color:kSubTitleColor,
                  height: 1.5,
                fontSize: 20,fontWeight: FontWeight.w400),
              ),
              SizedBox(height: Get.height*0.03,),
            const  Text(
                'Let us know what you think using \n'
                ' the button bellow.',
                textAlign: TextAlign.center,
                
                style: TextStyle(color:kSubTitleColor,
                height: 1.5,
                fontSize: 20,fontWeight: FontWeight.w400),
              ),
              //Gretting Code End
              SizedBox(height: Get.height*0.05,),

          
              // InkWell(
              //   onTap: share,
              //   child: Padding(
              //     padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.04),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Container(
              //           padding: EdgeInsets.all(Get.height*0.015),
              //           height: Get.height*0.08,
              //           width: Get.width*0.17,
              //           decoration: BoxDecoration(
              //             color: kPrimaryColor.withOpacity(0.3),
              //             borderRadius: BorderRadius.circular(13),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.blue.withOpacity(0.05),
              //                   offset: const Offset(0,4),
              //                   blurRadius: 9,
              //                 )
              //               ]
              //           ),
              //           child: SvgPicture.asset('assets/icons/share-.svg'),
              //         ),
                      
              //       ],
              //     ),
              //   ),
              // ),

                    DefaultButton(
                width: Get.width * 0.86,
                height: Get.height * 0.075,
                text: 'CONTINUE',
                press: () {

                   Get.to(()=>BottomNavigationScreen(index: 1.obs, learningPathIndex: 0.obs));
                   Get.delete<DarkCourseDetail_Controller>();
                   Get.delete<StudyMaterialController>();




                  // Get.to();
                }),
                

                SizedBox(height: Get.height * 0.02,),



                InkWell(
                  onTap: () {
                  //   Get.to(()=> CrispChat());
                  //  Get.delete<DarkCourseDetail_Controller>();
                  //  Get.delete<StudyMaterialController>();
                  Get.to(
                    ()=>LessonEnd()
                  );


                   
                  },
                  child: Container(
                     width: Get.width * 0.86,
                  height: Get.height * 0.075,
                
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: kPrimaryColor
                
                    )
                  ),
                  child: Center(
                    child: Text("PROVIDE FEEDBACK", 
                    style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                    ),
                  ),
                    
                  ),
                )
              //share Button(4) code End
            ],
          ),
        ],
      ),
    );
  }


    Future<void> share() async {
    await FlutterShare.share(
        title: 'Ambitious App',
        text:
            'Hey! Check out this new app called Ambitious. *'+name.toString() + '* has completed *'+ shareCourse.toString() + '* course. You can Learn, Build, and Grow with 1000+ other Ambitious learners. Sign up here —>',
        linkUrl: 'https://theambitiousapp.com/',
        chooserTitle: '');
  }

  Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());
if(Preferences.pref!.getString("name").toString()=="null"){
    name = (Preferences.pref!.getString("firstname")??"")+" "+(Preferences.pref!.getString("lastname")??"");
    print(name);

    }
    setState(() {});
  }
}

class LessonEnd extends GetView<StatusChangeController>{
  
 LessonEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Stack(
        children: [

    
            SizedBox(
          
            width: Get.width * 0.99,
            height: Get.height * 0.99,
            child: Lottie.asset('assets/icons/confetti.json',  fit: BoxFit.cover)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                   SizedBox(height: Get.height * 0.1,),


                    InkWell(
                      onTap: () {
                      //  Get.to(()=>BottomNavigationScreen(index: 1.obs, learningPathIndex: 0.obs));
                   Get.delete<StudyMaterialController>();
                   if(!controller.cont.isread){
                    controller.statusChangeApi(controller.cont.finishId).whenComplete(() {
                  controller.cont.checkCopletion();
                   });
                   }
                   
                  // Get.off(
                  //   ()=>DarkCourseDetail(),
                  //   binding: DarkCourseDetailBinding(id: controller.darkcourseId)
                  // );
                  Get.back();
                       
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
                              // Text(
                              //   widget.length.toString() +' of ' + widget.length.toString(),
                              //   style: TextStyle(color: kSubTitleColor),
                              // ),
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

              SizedBox(height: Get.height * 0.01,),
              Text(
                'You just learned about ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:kWhiteColor,
                  height: 1.5,
                fontSize: 20,fontWeight: FontWeight.w400),
              ),
              // SizedBox(height: Get.height*0.03,),
              Text(
                controller.cont.lessonTitle,
                textAlign: TextAlign.center,
                
                style: TextStyle(
                  color:kWhiteColor,
                height: 1,
                fontSize: 20,fontWeight: FontWeight.w400),
              ),
              //Gretting Code End
              SizedBox(height: Get.height*0.2,),

          
              // InkWell(
              //   onTap: share,
              //   child: Padding(
              //     padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.04),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Container(
              //           padding: EdgeInsets.all(Get.height*0.015),
              //           height: Get.height*0.08,
              //           width: Get.width*0.17,
              //           decoration: BoxDecoration(
              //             color: kPrimaryColor.withOpacity(0.3),
              //             borderRadius: BorderRadius.circular(13),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.blue.withOpacity(0.05),
              //                   offset: const Offset(0,4),
              //                   blurRadius: 9,
              //                 )
              //               ]
              //           ),
              //           child: SvgPicture.asset('assets/icons/share-.svg'),
              //         ),
                      
              //       ],
              //     ),
              //   ),
              // ),
               DefaultButton(
                width: Get.width * 0.86,
                height: Get.height * 0.075,
                text: 'CONTINUE',
                press: () {

                  //  Get.to(()=>BottomNavigationScreen(index: 1.obs, learningPathIndex: 0.obs));
                  //  Get.delete<DarkCourseDetail_Controller>();
                   Get.delete<StudyMaterialController>();
                   if(!controller.cont.isread){
                   controller.statusChangeApi(controller.cont.finishId).whenComplete(() {
                  //   Timer(Duration(seconds: 2), (){
                  // controller.cont.checkCopletion();
                  //   });
                  controller.cont.checkCopletion();
                  // Get.off(
                  //   ()=>DarkCourseDetail(),
                  //                         binding: DarkCourseDetailBinding(id:
                  //                         controller.cont.ids
                  //                         ),
                  // );
                   });
                   }
                  Get.back(); 

                  //  Get.delete<DarkCourseDetail_Controller>();
                //  controller.cont.replacement();
                  // Get.off(
                  //   ()=>DarkCourseDetail(),
                  //   binding: DarkCourseDetailBinding(id: controller.darkcourseId)
                  // );
                  // Get.back();

                  // Get.to();
                }),
                




               
            ],
          ),
        ],
      ),
    );
  }
}