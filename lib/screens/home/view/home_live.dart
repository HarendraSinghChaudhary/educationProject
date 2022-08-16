// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/category/category_controller.dart';
import 'package:Ambitious/controllers/courses/courses_controller.dart';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/course_detail.dart';
import 'package:Ambitious/screens/courses/learningPath/view/learning_path.dart';
import 'package:Ambitious/screens/flash_card.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/services/crispchat.dart';
import 'package:Ambitious/testing/navigation_testing.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:crisp/crisp_view.dart';
import 'package:crisp/models/main.dart';
import 'package:crisp/models/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../reusable/home_header.dart';
import '../../../utils/list.dart';

class HomeLive extends StatefulWidget {
  const HomeLive({Key? key}) : super(key: key);

  @override
  State<HomeLive> createState() => _ProfileState();
}

class _ProfileState extends State<HomeLive> {
  late CrispMain crispMain;
  String id = "";
  String name = "";
  String email = "";
  String tokenId = "";
  bool bookmark = false;
  ScrollController _controller = ScrollController();

  CoursesController coursesController =
      Get.put(CoursesController(), permanent: true);

         late final Mixpanel _mixpanel;


  Future<void> _initMixpanel() async {
   _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4", optOutTrackingDefault: false);
  }




   clearMethod () async{
     await  _initMixpanel();
    _mixpanel.track("Course Home Page");

  }



  @override
  void initState() {
   
    super.initState();

    getUserList();

    coursesController.learningPathApi();
    coursesController.getHotCoursesApi();
    clearMethod();
    token();
    
  }

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<LearningPathIndex>(() => LearningPathIndex());
    print("length: " + coursesController.learningPathList.length.toString());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.11,
        automaticallyImplyLeading: false,
        backgroundColor: kArrowBackgroundColor,
        centerTitle: false,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Row(
          children: [
            Image.asset(
              "assets/images/logoe.png",
              width: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "Hi, "+ firstName! +" 👋🏼",
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                 
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Obx((() =>

          //  categoryController.isLoading.value
          //                     ? Align(
          //                         alignment: Alignment.center,
          //                         child: Platform.isAndroid
          //                             ? CircularProgressIndicator()
          //                             : CupertinoActivityIndicator())
          //                     :

          SingleChildScrollView(
            controller: controllerScroll,
            padding: EdgeInsets.only(
                left: Get.height * 0.015, top: Get.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HomeHeader(),
                // Text(
                //   "💰 EARN ",
                //   // Get.find<LearningPathIndex>().isShowIndex.toString(),
                //   style: TextStyle(
                //     color: kTitleColor,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),

                // SizedBox(
                //   height: Get.height * 0.005,
                // ),
                // Text(
                //   " Complete 2 tasks for a \$10 gift card",
                //   style: TextStyle(
                //     color: Color(0xff4C5A6A),
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 15, right: 10),
                  elevation: 3,
                  color: Colors.white,
                  child: ListTile(
                    onTap: share,
                    horizontalTitleGap: 20,
                    contentPadding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    leading: Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/rst.png"),
                              fit: BoxFit.fill)),
                    ),
                    title: Text(
                      "Invite Friends",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    subtitle: Text(
                      "Invite a friend and get a \$5 gift card when they sign up.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    trailing: Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kArrowBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 15, right: 10),
                  elevation: 3,
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      Get.to(CrispChat());
                    },
                    contentPadding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/blub.png"),
                              fit: BoxFit.fill)),
                    ),
                    title: Text(
                      "Request a Topic",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    subtitle: Text(
                      "We want to hear from you. Get a \$5 gift card for honest feedback.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    trailing: Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kArrowBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: Get.height * 0.03,
                ),

                Text(
                  '🔥 COURSES FOR YOU',
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                //  SizedBox(
                //   height: Get.height * 0.000,
                // ),

                // Text(
                //   'Based on your interests',
                //   style: TextStyle(
                //     height: 1.7,
                //     color: Color(0xff4C5A6A),
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),

                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: coursesController.getHotCourseList.length,
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                                         _mixpanel.track('Course Started', properties: {
                                          "Course Name" : coursesController
                                          .getHotCourseList[index].title
                                          .toString()
                                         });
                      
                                    shareCourse =  coursesController
                                          .getHotCourseList[index].title
                                          .toString();
                      
                                                 Get.to(FlashCard(
                                                id: coursesController
                                          .getHotCourseList[index].id
                                          .toString(),
                                          title: coursesController
                                          .getHotCourseList[index].title
                                          .toString(),
                                                
                                                
                                                ));
                            },
                            child: Container(

                                height: Get.height * 0.2,
                                    width: 176,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 85,
                                    width: 176,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(coursesController
                                              .getHotCourseList[index].image
                                              .toString()),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6),
                                    child: Text(
                                      //  'Bitcoin & Blockchain',
                                      coursesController
                                          .getHotCourseList[index].title
                                          .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: kTitleColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                               
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, ),
                  child: Text(
                    '📈 LEARNING PATHS',
                    style: TextStyle(
                      color: kTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Text(
                //   'Pursue a new dream',
                //   style: TextStyle(
                //     color: Color(0xff4C5A6A),
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.97,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: coursesController.learningPathList.length,
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(BottomNavigationScreen(
                                  index: 1.obs,
                                  learningPathIndex: index.obs,
                                ));

                                // Get.find<LearningPathIndex>().isShowIndex = index.obs ;
                                // print("====="+Get.find<LearningPathIndex>().isShowIndex.toString());

                                // Get.find<LearningPathIndex>().selectedModel = coursesController.learningPathList[index];

                                print("press here..");
                              },
                              child: Container(
                                width: Get.width * 0.35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: Get.height * 0.1,
                                      width: Get.width * 0.35,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  coursesController
                                                      .learningPathList[index]
                                                      .image
                                                      .toString()),
                                              fit: BoxFit.fill)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          // paths[index]['name']
                                          //     .toString(),
                                    
                                          coursesController
                                              .learningPathList[index]
                                              .subCategoryName
                                              .toString(),
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Color(0xff344356),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        );
                      }),
                ),

                SizedBox(
                  height: Get.height * 0.03,
                )
              ],
            ),
          ))),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Ambitious App',
        text:
            'Hey! Check out this new app called Ambitious. You can learn about Tech, Crypto, Business in just 5 minutes. Sign up here —>',
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
    firstName = pref.getString("firstname").toString();
    print("name: " + name.toString());

    setState(() {});
  }

   token() {
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("token: " + value.toString());
      tokenId = value.toString();

      print("new token: " + tokenId.toString());
    });
  }
}
