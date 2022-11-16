import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/screens/homeNav/Commuinity/currentEvent.dart';
import 'package:Ambitious/controllers/EventController/currentEventController.dart';
import 'package:Ambitious/controllers/EventController/eventController.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:Ambitious/utils/hearder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../services/launcher.dart';
import '../../../services/web_view.dart';

class EventView extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Obx(() => Scaffold(
          body: Container(
            color: kdarkblue,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Header(
                  des:
                      "Attend events and network with 1000+ other Ambitious members.",
                  heading: "Community",
                  image: "assets/images/OBJECTS.png"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible:
                              controller.powerHours.value!.upcoming!.isNotEmpty,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/label.png",
                                      height: 20.h,
                                    ),
                                    Text(
                                      " Upcoming Power Hours",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: kWhiteColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Register for an upcoming event to learn from a community leader live",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: kWhiteColor,
                                  ),
                                ),
                                Container(
                                  height: 300.h,
                                  margin: EdgeInsets.symmetric(vertical: 15.h),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .powerHours.value!.upcoming!.length,
                                    itemBuilder: (context, index) {
                                      AllDatum data = controller
                                          .powerHours.value!.upcoming![index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.data.value = data;
                                          controller.showyoutube.value = false;
                                          controller.is_user_attending.value =
                                              data.is_user_attending ?? false;
                                          controller.selectedID.value =
                                              data.id ?? "";
                                          controller.selectcount.value =
                                              data.attendees_count.toString();
                                          controller.selectedIndex.value =
                                              index;
                                          Get.to(() => CurrentEventView(),
                                              binding: CurrentEventBinding());
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 5.h,
                                            bottom: 2.h,
                                            right: 5.w,
                                          ),
                                          child: CommunityCard(
                                            flex2: 3,
                                            url:
                                                // "assets/images/banner.png",
                                                data.image.toString(),
                                            child: Container(
                                              width: 157.w,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w,
                                                  vertical: 2.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                    child: Text(
                                                      // "Thursday July 21st".toUpperCase(),
                                                      "${controller.convertdate(data.startTime!)}",
                                                      // textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: kWhiteColor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 6.h, bottom: 4.h),
                                                    child: Text(
                                                      // "Breaking Down The Blockchain",
                                                      data.powerHoursTitle
                                                          .toString(),
                                                      // textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: kWhiteColor),
                                                    ),
                                                  ),
                                                  Text(
                                                    "📲 In-App Event",
                                                    // textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
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
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            // urllauncher(slackUrl);
                            launchInBrowser(slackUrl);
                          },
                          child: const SlackCard(
                            url: "assets/images/prefix.png",
                            title: "Join Slack Group",
                            subtitle:
                                "Network with Ambitious people like yourself and participate in events.",
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Visibility(
                          visible:
                              controller.powerHours.value!.passed!.isNotEmpty,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/label.png",
                                      height: 25.h,
                                    ),
                                    Text(
                                      " Watch On Demand",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: kWhiteColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  "Replay a previous Power Hour",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kWhiteColor,
                                  ),
                                ),
                                Container(
                                  height: 250.h,
                                  margin: EdgeInsets.symmetric(vertical: 15.h),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .powerHours.value!.passed!.length,
                                    itemBuilder: (context, index) {
                                      AllDatum data = controller
                                          .powerHours.value!.passed![index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.data.value = data;
                                          controller.showyoutube(true);
                                          Get.to(() => CurrentEventView(),
                                              binding: CurrentEventBinding());
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 5.h,
                                            bottom: 2.h,
                                            right: 5.w,
                                          ),
                                          child: CommunityCard(
                                            flex2: 2,
                                            url:
                                                // "assets/images/banner.png",
                                                data.image.toString(),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 2.h),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h),
                                                child: Text(
                                                  // "Breaking Down The Blockchain",
                                                  data.powerHoursTitle
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kWhiteColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const WebViewExample(
                                  title: "Suggest an idea",
                                  url: suggessionUrl,
                                ));
                          },
                          child: const SlackCard(
                            url: "assets/images/idea.png",
                            title: "Suggest an idea",
                            subtitle:
                                "Request a Power Hour Topic  or apply to host your own.",
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

class CommunityCard extends StatelessWidget {
  final Widget child;
  final String url;
  final flex2;
  const CommunityCard(
      {Key? key, required this.child, required this.url, required this.flex2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 157.w,
      child: Card(
        color: ksettingcardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(h * 0.02),
        ),
        elevation: 8,
        shadowColor: kPrimaryColor.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                //height: 20.h,
                //  width: w*0.42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    //  color: kPrimaryColor,
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.fill)),
              ),
            ),
            Expanded(flex: flex2, child: child)
          ],
        ),
      ),
    );
  }
}

class SlackCard extends StatelessWidget {
  final url;
  final title;
  final subtitle;
  const SlackCard(
      {Key? key,
      required this.url,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ksettingcardColor,
        elevation: 8,
        shadowColor: kPrimaryColor.withOpacity(0.5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              url,
              height: 35.h,
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: kWhiteColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                foregroundColor: kWhiteColor,
                radius: 12.r,
                child: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                )),
          ),
        ]));
  }
}
