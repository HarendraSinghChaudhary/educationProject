import 'package:Ambitious/reusable/url_launcher.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:crisp/crisp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/courses/courses_controller.dart';
import '../../controllers/courses/darkcourse_controller.dart';
import '../../main.dart';
import '../../models/powerhourModel.dart';
import '../../services/launcher.dart';
import '../../services/web_view.dart';
import '../../testing/navigation_testing.dart';
import '../../utils/endpoint_url.dart';
import '../Events/CurrentEvent/currentEvent.dart';
import '../Events/CurrentEvent/currentEventController.dart';
import '../Events/eventController.dart';
import '../Events/eventView.dart';
import '../dark_course_detail.dart';

class NewHomeLive extends StatefulWidget {
  const NewHomeLive({Key? key}) : super(key: key);

  @override
  State<NewHomeLive> createState() => _NewHomeLiveState();
}

class _NewHomeLiveState extends State<NewHomeLive> {
  late CrispMain crispMain;
  String id = "";
  String name = "";
  String email = "";
  String tokenId = "";
  bool bookmark = false;
  ScrollController _controller = ScrollController();

  CoursesController coursesController =
      Get.put(CoursesController(), permanent: false);
      EventController eventController = Get.put(EventController(),permanent: false);

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
    eventController.getpowerHourData();
    clearMethod();
    token();
    
  }
  @override
  Widget build(BuildContext context) {
   return
   Obx(
    ()=> Scaffold(
    backgroundColor: kdarkblue,
    body: SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: w*0.05,
              right: w*0.08,
              top: h*0.08
            ),
                      height: h*0.15,
                      width: w,
                      decoration: BoxDecoration(
                        gradient: kbluegradiant,
                        borderRadius: BorderRadius.circular(h*0.01),
                      ),
        child:  Text(
                    // "Community ",
                "Hi, "+ firstName.toString() +" 👋🏼",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor
                    ),
                  ),             
     ),
     Expanded(
       child:
        !eventController.homeloading.value?loader:
        ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: w*0.03,
          vertical: h*0.02 
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const Text(
            "🔥 Featured ",
            style: TextStyle(
              fontSize: 24,
              color: kWhiteColor,
              fontWeight: FontWeight.w700
            ),
          ),
          const Text(
            "Members enjoy taking these courses",
            style: TextStyle(
              fontSize: 18,
              color: kWhiteColor,
              height: 2,
              fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(
            height: h*0.01,
          ),
          SizedBox(
            height: h*0.3,
            child: ListView.builder(
                      itemCount: coursesController.getHotCourseList.length,
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: w*0.4,
                          // height: h*0.2,
                          margin: EdgeInsets.only(
                            right: w*0.04
                          ),
                          child: InkWell(
                            onTap: () {
                                         _mixpanel.track('Course Started', properties: {
                                          "Course Name" : coursesController
                                          .getHotCourseList[index].title
                                          .toString()
                                         });
                          
                                    shareCourse =  coursesController
                                          .getHotCourseList[index].title
                                          .toString();
                                          Get.to(
                                            ()=>DarkCourseDetail(
                                          //   id: coursesController
                                          // .getHotCourseList[index].id
                                          // .toString(),
                                          ),
                                          binding: DarkCourseDetailBinding(id:coursesController
                                          .getHotCourseList[index].id
                                          .toString(),
                                          ),
                                          
                                          
                                          );
                          
                                          //        Get.to(FlashCard(
                                          //       id: coursesController
                                          // .getHotCourseList[index].id
                                          // .toString(),
                                          // title: coursesController
                                          // .getHotCourseList[index].title
                                          // .toString(),
                                                
                                                
                                          //       ));
                            },
                            child: 
                            Column(
                                    
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                           height: h*0.2,
                                          
                                          decoration: BoxDecoration(
                                            color: kcardblue,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(h*0.02),topRight: Radius.circular(h*0.02)),
                                            image:  DecorationImage(image: 
                                            // AssetImage("assets/images/img_9.png",),
                                            NetworkImage(coursesController.getHotCourseList[index].image.toString()),
                                            fit: BoxFit.fill)
                                          ),
                                        // child: Image.asset("assets/images/img_9.png")
                                        )
                                        ),
                                      Expanded(
                                        child: Container(
                                          height: h*0.1,
                                          width: w,
                                          padding: EdgeInsets.symmetric(
                                            vertical: h*0.015,
                                            horizontal: w*0.03
                                          ),
                                          decoration: BoxDecoration(
                                            color: kcardblue,
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(h*0.02),bottomRight: Radius.circular(h*0.02))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                // "Bitcoin, Simplified",
                                                coursesController.getHotCourseList[index].title.toString(),
                                                
                                                // softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: kWhiteColor
                                                                ),
                                              ),
                                              Text(
                                                // "12 Shorts",
                                                "${coursesController.getHotCourseList[index].allModules} Modules",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: kWhiteColor
                                                                ),
                                              ),
                                              SizedBox(
                                                height: h*0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  // Expanded(
                                                  //   child: Row(
                                                  //     children: [
                                                  //       CircleAvatar( 
                                                  //         radius: h*0.012,
                                                  //         backgroundColor: kWhiteColor.withOpacity(0.5),
                                                  //         foregroundColor: kcardblue,
                                                  //         child: const Icon(Icons.thumb_up_off_alt_rounded,size: 15,)),
                                                  //       Text(
                                                  //          "  ${coursesController.getHotCourseList[index].allLikes}%",
                                                  //         // "",
                                                  //          // controller.bigdata.value!.
                                                  //          style: TextStyle(
                                                  //   fontSize: 10,
                                                  //   fontWeight: FontWeight.w300,
                                                  //   color: kWhiteColor.withOpacity(0.5),
                                                  //   height: 2,
                                                  //          ),
                                                  //        ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                         Icon(Icons.groups,size: 20,color: kWhiteColor.withOpacity(0.5),),
                                                        Text(
                                                          "  123",
                                                          style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w300,
                                                    color: kWhiteColor.withOpacity(0.5),
                                                    height: 2,
                                                         ),
                                                       ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                                
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
     
                            
                                              )                      );
                      },
                    ),
     
          ),
          GestureDetector(
            onTap: (){
                launchInBrowser(slackUrl);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: w*0.1,
                vertical: h*0.018
              ),
              margin: EdgeInsets.only(
                top: h*0.02
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h*0.02),
                color: kcardblue,
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(
                      0,4
                    )
                  ),
                  
                ]
              ),
              width: w,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/prefix.png",
                    height: h*0.05,
                  ),
                  const Text(
                    "Join our Slack community",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16,
                      height: 2,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const Text(
                    "Network with Ambitious people like yourself and participate in events.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
                
              ),
            ),
          ),
          SizedBox(
            height: h*0.02,
          ),
          const Text(
            "🚀 Hot Learning Paths",
            style: TextStyle(
              fontSize: 24,
              color: kWhiteColor,
              // height: 2,
              fontWeight: FontWeight.w700
            ),
          ),
          const Text(
            "Simplify your path to a career.",
            style: TextStyle(
              fontSize: 18,
              height: 2,
              color: kWhiteColor,
              fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(
            height: h*0.01,
          ),
          SizedBox(
                  height: Get.height * 0.23,
                  width: Get.width * 0.97,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: coursesController.hotsubcatList.length,
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
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
                                width: Get.width * 0.38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kcardblue),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: Get.height * 0.1,
                                      width: Get.width * 0.38,
                                      margin: EdgeInsets.symmetric(
                                        vertical: h*0.005
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  coursesController
                                                      .hotsubcatList[index]
                                                      .image
                                                      .toString()),
                                              // fit: BoxFit.fill
                                              )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          // paths[index]['name']
                                          //     .toString(),
                                    
                                          coursesController
                                              .hotsubcatList[index]
                                              .subCategoryName
                                              .toString(),
                                              
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: kWhiteColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
            height: h*0.02,
          ),
          Visibility(
            visible: eventController.homeloading.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "🎤 Upcoming Power Hours",
                  style: TextStyle(
                    fontSize: 24,
                    color: kWhiteColor,
                    // height: 2,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const Text(
                  "Join a live talk from an industry expert.",
                  style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    height: 2,
                    fontWeight: FontWeight.w300
                  ),
                ),
                SizedBox(
                  height: h*0.01,
                ),
                 Container(
                                    height: h*0.36,
                                    margin: EdgeInsets.symmetric(
                                      vertical: h*0.015
                                    ),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: eventController.powerHours.value!.upcoming!.length,
                                      itemBuilder:(context, index) {
                                        AllDatum data = eventController.powerHours.value!.upcoming![index];
                                        return GestureDetector(
                                          onTap: (){
                                            eventController.data.value = data;
                                            eventController.showyoutube(false);
                                            Get.to(
                                              ()=>CurrentEventView(),
                                              binding: CurrentEventBinding()
                                            );
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.only(
                                              right: w*0.04,
                                            bottom: h*0.01
                                            ),
                                            child: CommunityCard(
                                              flex2: 3,
                                              url: 
                                              // "assets/images/banner.png",
                                              data.image.toString(),
                                              child: Container(
                                                width: w,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: w*0.025,
                                                  vertical: h*0.01
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:  EdgeInsets.symmetric(
                                                        vertical: h*0.01
                                                      ),
                                                      child: Text(
                                                        // "Thursday July 21st".toUpperCase(),
                                                        "${eventController.convertdate(data.startTime!)}",
                                                        // textAlign: TextAlign.start,
                                                        style: const TextStyle(
                                                          fontSize:12,
                                                          fontWeight: FontWeight.w700,
                                                          color: kWhiteColor
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.symmetric(vertical: h*0.01),
                                                      child: Text(
                                                        // "Breaking Down The Blockchain",
                                                        data.powerHouseTitle.toString(),
                                                        // textAlign: TextAlign.start,
                                                        style: const TextStyle(
                                                          fontSize:16,
                                                          fontWeight: FontWeight.w700,
                                                          color: kWhiteColor
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(
                                                      "📲 In-App Event",
                                                      // textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize:12,
                                                        fontWeight: FontWeight.w400,
                                                        color: kWhiteColor
                                                      ),
                                                    ),
                                                  ],
                                              
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
                // launchurl(suggessionUrl);
                Get.to(
                          ()=>  WebViewExample(
                              title: "Provide Feedback",
                              url: suggessionUrl,
                            )
                          );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: w*0.1,
                vertical: h*0.018
              ),
              margin: EdgeInsets.only(
                top: h*0.02
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h*0.02),
                color: kcardblue,
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(
                      0,4
                    )
                  ),
                  
                ]
              ),
              width: w,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/idea.png",
                    height: h*0.05,
                  ),
                  const Text(
                    "Provide Feedback",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16,
                      height: 2,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const Text(
                    "Have a suggestion for courses or learning paths? Tap here to contact us. We`d love to hear from you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
                
              ),
            ),
          ),

        ],
       ),
     ),


        ],
      ),
    ),
   )
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