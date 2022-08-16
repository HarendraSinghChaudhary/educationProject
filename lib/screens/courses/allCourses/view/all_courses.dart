import 'package:Ambitious/controllers/courses/courses_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/course_detail.dart';
import 'package:Ambitious/screens/flash_card.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../../../utils/list.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({Key? key}) : super(key: key);

  @override
  State<AllCourses> createState() => _CoursesState();
}

class _CoursesState extends State<AllCourses> {
  CoursesController coursesController =
      Get.put(CoursesController(), permanent: true);

  late final Mixpanel _mixpanel;

  Future<void> _initMixpanel() async {
    _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
        optOutTrackingDefault: false);
  }

  @override
  void initState() {
    _initMixpanel();
    super.initState();

    coursesController.allCoursesApi();
  }

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: coursesController.allCourseList.length,
                shrinkWrap: true,
              
                controller: controller,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      coursesController.allCourseList[index]
                              .courseListbyCategory.isNotEmpty
                          ? Text(
                            // 'Digital Marketing',
                            coursesController
                                .allCourseList[index].categoryName
                                .toString(),
                            style: const TextStyle(
                              color: kTitleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          : Container(),
                      coursesController.allCourseList[index]
                              .courseListbyCategory.isNotEmpty
                          ? SizedBox(
                            height: Get.height * 0.02,
                          )
                          : Container(),
                      coursesController.allCourseList[index]
                              .courseListbyCategory.isNotEmpty
                          ? 
                          
                          Row(
                            children: [
                              SizedBox(
                                height: 144,
                                width: Get.width * 0.97,
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: coursesController
                                        .allCourseList[index]
                                        .courseListbyCategory
                                        .length,
                                    scrollDirection: Axis.horizontal,
                                    controller: controller,
                                    itemBuilder:
                                        (BuildContext context, int j) {
                                      return Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                                 _mixpanel.track('Course Started', properties: {
                                          "Course Name" :  coursesController
                                                      .allCourseList[index]
                                                      .courseListbyCategory[
                                                          j]
                                                      .title
                                                      .toString()
                                         });

                                              shareCourse =
                                                  coursesController
                                                      .allCourseList[index]
                                                      .courseListbyCategory[
                                                          j]
                                                      .title
                                                      .toString();

                                              Get.to(FlashCard(
                                                id: coursesController
                                                    .allCourseList[index]
                                                    .courseListbyCategory[j]
                                                    .id
                                                    .toString(),


                                                    title:  coursesController
                                                    .allCourseList[index]
                                                    .courseListbyCategory[j]
                                                    .title
                                                    .toString(),
                                              ));
                                            },
                                            child: Container(
                                              width: Get.width * 0.35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                  color: Colors.white),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Container(
                                                    height:
                                                        Get.height * 0.1,
                                                    width: Get.width * 0.35,
                                                    decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius
                                                                .only(
                                                            topLeft: Radius
                                                                .circular(
                                                                    15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(coursesController
                                                                .allCourseList[
                                                                    index]
                                                                .courseListbyCategory[j]
                                                                .image
                                                                .toString()),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets
                                                            .only(left: 10),
                                                    child: Text(
                                                      coursesController
                                                          .allCourseList[
                                                              index]
                                                          .courseListbyCategory[
                                                              j]
                                                          .title
                                                          .toString(),
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          const TextStyle(
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        color: Color(
                                                            0xff344356),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ), 

                                                  

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
                            ],
                          )
                          : Container(),


                           coursesController.allCourseList[index]
                              .courseListbyCategory.isNotEmpty
                          ? 
                      SizedBox(
                        height: Get.height * 0.03,
                      ) : Container(),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
