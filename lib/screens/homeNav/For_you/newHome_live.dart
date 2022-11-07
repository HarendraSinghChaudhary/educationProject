// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:crisp/crisp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controllers/courses/courses_controller.dart';
import '../../../controllers/courses/darkcourse_controller.dart';
import '../../../main.dart';
import '../../../models/powerhourModel.dart';
import '../../../services/firbase.dart';
import '../../../services/launcher.dart';
import '../../../services/mixpanel.dart';
import '../../../services/web_view.dart';
import '../../../utils/endpoint_url.dart';
import '../Commuinity/currentEvent.dart';
import '../../../controllers/EventController/currentEventController.dart';
import '../../../controllers/EventController/eventController.dart';
import '../Commuinity/eventView.dart';
import '../Browse/dark_course_detail.dart';
import '../Browse/dark_learning_path.dart';

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
  EventController eventController =
      Get.put(EventController(), permanent: false);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    mixpanelTracking(
        "Home Page", {"Email": Preferences.pref!.getString("email") ?? ""});

    getUserList();
    coursesController.learningPathApi();
    coursesController.getHotCoursesApi();
    eventController.getpowerHourData();
    Future.delayed(Duration(seconds: 2), () {
      var isthis = Preferences.pref?.get("isNotificationAllowed");
      if (isthis != true) {
        askPermission();
      }
    });
    // askPermission();
    // coursesController.bottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    coursesController.learningPathApi();
    coursesController.getHotCoursesApi();
    eventController.getpowerHourData();
    eventController.onInit();
    return Obx(() => Scaffold(
          backgroundColor: kdarkblue,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 70),
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: kbluegradiant,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r)),
                ),
                child: Text(
                  // "Community ",
                  "Hi, " + firstName.toString() + " 👋🏼",
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
              Expanded(
                child: !eventController.homeloading.value
                    ? loader
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Visibility(
                            visible:
                                coursesController.getHotCourseList.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "🔥 Recommended Playbooks ",
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Based on your preferences",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: kWhiteColor,
                                      height: 2.h,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                SizedBox(
                                  height: 300.h,
                                  child: ListView.builder(
                                    itemCount: coursesController
                                        .getHotCourseList.length,
                                    controller: _controller,
                                    scrollDirection: Axis.horizontal,
                                    // padding: EdgeInsets.only(),
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 12.w),
                                        child: Container(
                                            width: 170.w,
                                            child: InkWell(
                                              onTap: () {
                                                Get.find<CoursesController>()
                                                    .coursecount(
                                                        coursesController
                                                            .getHotCourseList[
                                                                index]
                                                            .id);

                                                shareCourse = coursesController
                                                    .getHotCourseList[index]
                                                    .title
                                                    .toString();
                                                DarkCourseDetail.viewCount =
                                                    coursesController
                                                        .getHotCourseList[index]
                                                        .viewCount;
                                                Get.to(
                                                  () => DarkCourseDetail(),
                                                  binding:
                                                      DarkCourseDetailBinding(
                                                    id: coursesController
                                                        .getHotCourseList[index]
                                                        .id
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: h * 0.2, //@mini

                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    kcardblue,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(h *
                                                                            0.02),
                                                                    topRight: Radius
                                                                        .circular(h *
                                                                            0.02)),
                                                                image: DecorationImage(
                                                                    image:
                                                                        // AssetImage("assets/images/img_9.png",),
                                                                        NetworkImage(coursesController.getHotCourseList[index].image.toString()),
                                                                    fit: BoxFit.fill)),
                                                        // child: Image.asset("assets/images/img_9.png")
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      height: h * 0.1,
                                                      width: w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  h * 0.015,
                                                              horizontal:
                                                                  w * 0.03),
                                                      decoration: BoxDecoration(
                                                          color: kcardblue,
                                                          borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      h * 0.02),
                                                              bottomRight: Radius
                                                                  .circular(h *
                                                                      0.02))),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            // "Bitcoin, Simplified",
                                                            coursesController
                                                                .getHotCourseList[
                                                                    index]
                                                                .title
                                                                .toString(),

                                                            // softWrap: true,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    kWhiteColor),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            // "12 Shorts",
                                                            "${coursesController.getHotCourseList[index].allModules} Modules",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                fontSize: 10,
                                                                height: 1.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    kWhiteColor),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .groups,
                                                                      size: 20,
                                                                      color: kWhiteColor
                                                                          .withOpacity(
                                                                              0.5),
                                                                    ),
                                                                    Text(
                                                                      "  " +
                                                                          coursesController
                                                                              .getHotCourseList[index]
                                                                              .viewCount,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        color: kWhiteColor
                                                                            .withOpacity(0.5),
                                                                        height:
                                                                            2,
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
                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchInBrowser(slackUrl);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.1, vertical: h * 0.018),
                              margin: EdgeInsets.only(top: h * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 0.02),
                                  color: kcardblue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kPrimaryColor.withOpacity(0.2),
                                        blurRadius: 5,
                                        offset: const Offset(0, 4)),
                                  ]),
                              width: w,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/prefix.png",
                                    height: h * 0.05,
                                  ),
                                  const Text(
                                    "Join our Slack community",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 16,
                                        height: 2,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Network with Ambitious people like yourself and participate in events.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Visibility(
                            visible: coursesController.hotsubcatList.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "🚀 All Categories",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: kWhiteColor,
                                      // height: 2,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                  "Explore something new",
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 2,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                SizedBox(
                                  height: Get.height * 0.23,
                                  width: Get.width * 0.97,
                                  child: ListView.builder(
                                      padding: const EdgeInsets.only(top: 15),
                                      itemCount: coursesController
                                          .hotsubcatList.length,
                                      scrollDirection: Axis.horizontal,
                                      controller: _controller,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    () =>
                                                        const DarkLearningPath2(),
                                                    binding:
                                                        DarkLearningBinding(
                                                      courseListbyLearningPath:
                                                          coursesController
                                                              .hotsubcatList[
                                                                  index]
                                                              .courseListbyLearningPath,
                                                      description:
                                                          coursesController
                                                                  .hotsubcatList[
                                                                      index]
                                                                  .description ??
                                                              "",
                                                      image: coursesController
                                                          .hotsubcatList[index]
                                                          .image
                                                          .toString(),
                                                      title: coursesController
                                                          .hotsubcatList[index]
                                                          .subCategoryName
                                                          .toString(),
                                                    ));
                                              },
                                              child: Container(
                                                width: Get.width * 0.38,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: kcardblue),
                                                child: Column(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: Get.height * 0.1,
                                                      width: Get.width * 0.38,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  h * 0.005),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15)),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                coursesController
                                                                    .hotsubcatList[
                                                                        index]
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
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10,
                                                                right: 10),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          coursesController
                                                              .hotsubcatList[
                                                                  index]
                                                              .subCategoryName
                                                              .toString(),
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: kWhiteColor,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
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
                                  height: h * 0.02,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: eventController.homeloading.value &&
                                eventController
                                    .powerHours.value!.upcoming!.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "🎤 Upcoming Power Hours",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: kWhiteColor,
                                      // height: 2,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                  "Join a live talk from an industry expert.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kWhiteColor,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Container(
                                  height: h * 0.38,
                                  margin:
                                      EdgeInsets.symmetric(vertical: h * 0.015),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: eventController
                                        .powerHours.value!.upcoming!.length,
                                    itemBuilder: (context, index) {
                                      AllDatum datam = eventController
                                          .powerHours.value!.upcoming![index];
                                      return GestureDetector(
                                        onTap: () {
                                          eventController.data.value = datam;
                                          eventController.showyoutube(false);
                                          eventController
                                                  .is_user_attending.value =
                                              datam.is_user_attending ?? false;
                                          eventController.selectedID.value =
                                              datam.id ?? "";
                                          eventController.selectcount.value =
                                              datam.attendees_count.toString();
                                          eventController.selectedIndex.value =
                                              index;

                                          Get.to(() => CurrentEventView(),
                                              binding: CurrentEventBinding());
                                        },
                                        child: Container(
                                          width: w * 0.48,
                                          padding: EdgeInsets.only(
                                              right: w * 0.04,
                                              bottom: h * 0.01),
                                          child: CommunityCard(
                                            flex2: 3,
                                            url:
                                                // "assets/images/banner.png",
                                                datam.image.toString(),
                                            child: Container(
                                              width: w,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.025,
                                                  vertical: h * 0.01),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: h * 0.01),
                                                    child: Text(
                                                      // "Thursday July 21st".toUpperCase(),
                                                      "${eventController.convertdate(datam.startTime!)}",
                                                      // textAlign: TextAlign.start,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: kWhiteColor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: h * 0.01),
                                                    child: Text(
                                                      // "Breaking Down The Blockchain",
                                                      datam.powerHoursTitle
                                                          .toString(),
                                                      // textAlign: TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: kWhiteColor),
                                                    ),
                                                  ),
                                                  const Text(
                                                    "📲 In-App Event",
                                                    // textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: kWhiteColor),
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
                            onTap: () {
                              // launchurl(suggessionUrl);
                              Get.to(() => WebViewExample(
                                    title: "Provide Feedback",
                                    url: suggessionUrl,
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.1, vertical: h * 0.018),
                              margin: EdgeInsets.only(top: h * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 0.02),
                                  color: kcardblue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kPrimaryColor.withOpacity(0.2),
                                        blurRadius: 5,
                                        offset: const Offset(0, 4)),
                                  ]),
                              width: w,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/idea.png",
                                    height: h * 0.05,
                                  ),
                                  const Text(
                                    "Provide Feedback",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 16,
                                        height: 2,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Have a suggestion for courses or learning paths? Tap here to contact us. We`d love to hear from you.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
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
        ));
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
    email = pref.getString("email").toString();
    name = pref.getString("name").toString();
    firstName = pref.getString("firstname").toString();
    if (Preferences.pref!.getString("name").toString() == "null") {
      name = (Preferences.pref!.getString("firstname") ?? "") +
          " " +
          (Preferences.pref!.getString("lastname") ?? "");
    }
    setState(() {});
  }

  Future askPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Preferences.pref!.setBool("isNotificationAllowed", true);
      if (Platform.isAndroid) {
        showDialog(
            useSafeArea: false,
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                  scrollable: true,
                  contentPadding: EdgeInsets.zero,
                  // backgroundColor: kWhiteColor,
                  titlePadding: EdgeInsets.zero,
                  // backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(h * 0.02)),
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h * 0.02),
                      color: Colors.white,
                    ),
                    // height: h*0.3,
                    width: w * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                          child: Text(
                            "\"Ambitious\" Would Like to Send You Notification",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kBlackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                          child: Text(
                            "Notifications may include alerts, sounds and icon badges. These can be configured in Setting.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kGreyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Divider(
                          // height: 0.2,
                          height: 1,
                          thickness: 0.2,
                          color: kGreyColor,
                        ),
                        SizedBox(
                          height: h * 0.06,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      await openAppSettings();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Don't Allow",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: ,
                                  width: 0.2,
                                  color: kGreyColor,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      fcmtoken().whenComplete(() {
                                        addDatatofirebase(Preferences.pref!
                                            .getString("fcmToken")
                                            .toString());
                                        coursesController.addfcm(Preferences
                                            .pref!
                                            .getString("fcmToken")
                                            .toString());
                                      });
                                      Get.back();
                                    },
                                    child: Text(
                                      "Allow",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ));
            });
      } else {
        fcmtoken().whenComplete(() {
          addDatatofirebase(Preferences.pref!.getString("fcmToken").toString());
          coursesController
              .addfcm(Preferences.pref!.getString("fcmToken").toString());
        });
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
    } else {
      Preferences.pref!.setBool("isNotificationAllowed", false);
    }
  }
}
