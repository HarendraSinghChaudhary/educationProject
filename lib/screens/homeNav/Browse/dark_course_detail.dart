import 'package:Ambitious/reusable/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/courses/darkcourse_controller.dart';
import '../../../models/darkcoursemodel.dart';
import '../../../services/mixpanel.dart';
import '../../../utils/constant.dart';
import '../../../utils/sharedPreference.dart';
import 'flash_card.dart';

class DarkCourseDetail extends GetView<DarkCourseDetail_Controller> {
  static String viewCount = "";
  DarkCourseDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () => controller.goback(),
          child: Scaffold(
            backgroundColor: kdarkblue,
            body: controller.isLoading.value
                ? loader
                : Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: h * 0.33,
                        child: Stack(
                          children: [
                            Container(
                              height: h * 0.25,
                              width: w,
                              decoration: BoxDecoration(
                                gradient: kbluegradiant,
                                borderRadius: BorderRadius.circular(h * 0.01),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Visibility(
                                    visible: controller
                                        .bigdata.value!.image!.isNotEmpty,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(h * 0.02)),
                                      child: Image.network(
                                        controller.bigdata.value!.image
                                            .toString(),
                                        height: h * 0.25,
                                        errorBuilder:
                                            ((context, error, stackTrace) {
                                          return Container();
                                        }),
                                      ),
                                    ))),
                            Positioned(
                              top: h * 0.03,
                              left: w * 0.05,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: kWhiteColor,
                                  size: h * 0.03,
                                ),
                                onPressed: () {
                                  Get.back();
                                  if (!controller.isCompleted.value) {
                                    mixpanelTracking("Course Finished", {
                                      "Course Name": controller
                                          .bigdata.value!.title
                                          .toString(),
                                      "Email": Preferences.pref!.get("email")
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: controller.scrollcontroller,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h * 0.015,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    // "Bitcoin, Simplified",
                                    controller.bigdata.value!.title.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: kWhiteColor,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.groups,
                                            size: 25,
                                            color: kWhiteColor,
                                          ),
                                          Text(
                                            " " +
                                                DarkCourseDetail.viewCount +
                                                " Learners",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: kWhiteColor,
                                              height: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.03),
                                child: RichText(
                                    text: TextSpan(
                                        text: "Description\n",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "HK Grotesk",
                                          fontWeight: FontWeight.w700,
                                          color: kWhiteColor,
                                          height: 2,
                                        ),
                                        children: [
                                      TextSpan(
                                        text: controller
                                            .bigdata.value!.shortDescrition
                                            .toString(),
                                        // "All the info to dive into the world of social media influenceing. Like the basics of creating content, growing your audience, parternships, monetization, and more",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: kWhiteColor,
                                          height: 1,
                                        ),
                                      )
                                    ])),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.02),
                                child: DefaultButton(
                                    width: w,
                                    height: h * 0.07,
                                    text: controller.isstart.value
                                        ? "START"
                                        : !controller.isCompleted.value
                                            ? "COMPLETED"
                                            : "CONTINUE",
                                    press: () {
                                      if (controller.isstart.value) {
                                        mixpanelTracking('Course Started', {
                                          "Course Name": controller
                                              .bigdata.value!.title
                                              .toString(),
                                          "Email":
                                              Preferences.pref!.get("email")
                                        });
                                      }
                                      controller.onpressed();
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.0),
                                child: Card(
                                    color: kcardblue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(h * 0.03)),
                                    elevation: 8,
                                    shadowColor: kWhiteColor.withOpacity(0.15),
                                    child: ListView.builder(
                                      controller: controller.scrollcontroller,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller
                                          .bigdata.value!.allmodule!.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.02),
                                      itemBuilder: (context, index) {
                                        Allmodule mod = controller
                                            .bigdata.value!.allmodule![index];
                                        return InkWell(
                                          onTap: () {
                                            if (controller
                                                    .bigdata
                                                    .value!
                                                    .allmodule![index]
                                                    .studayMaterial !=
                                                0) {
                                              Get.to(
                                                () => CustomStoryView(
                                                  id: mod.id.toString(),
                                                  moduleId:
                                                      mod.moduleId.toString(),
                                                  title: mod.moduletitle
                                                      .toString(),
                                                  courseTitile: controller
                                                          .bigdata
                                                          .value!
                                                          .title ??
                                                      "",
                                                ),
                                              );
                                              controller.lessonTitle =
                                                  mod.moduletitle.toString();
                                              controller.finishId =
                                                  mod.moduleId.toString();
                                            } else {
                                              Get.snackbar("", "");
                                            }
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: h * 0.01),
                                              child: ListTile(
                                                leading: Text(
                                                  "${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w700,
                                                    color: kWhiteColor,
                                                    height: 1,
                                                  ),
                                                ),
                                                title: Text(
                                                  mod.moduletitle.toString(),
                                                  //"What is Bitcoin?",
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    color: kWhiteColor,
                                                    height: 1,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  mod.studayMaterial
                                                          .toString() +
                                                      " stories",
                                                  // "8 stories",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: kWhiteColor,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                trailing:
                                                    mod.IsCompleated == true
                                                        ? Image.asset(
                                                            "assets/images/Ok.png",
                                                            height: h * 0.04,
                                                          )
                                                        : const Text(""),
                                              )),
                                        );
                                      },
                                    )),
                              ),
                              SizedBox(
                                height: h * 0.1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
