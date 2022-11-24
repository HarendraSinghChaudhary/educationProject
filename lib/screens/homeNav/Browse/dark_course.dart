import 'package:Ambitious/controllers/courses/darkcourse_controller.dart';
import 'package:Ambitious/reusable/ambitious_header.dart';
import 'package:Ambitious/screens/homeNav/Browse/dark_course_detail.dart';
import 'package:Ambitious/screens/homeNav/Browse/dark_learning_path.dart';
import 'package:Ambitious/services/mixpanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/courses/courses_controller.dart';
import '../../../utils/constant.dart';

class Dark_Course extends GetView<CoursesController> {
  const Dark_Course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Obx(() => Scaffold(
          backgroundColor: kdarkblue,
          body: Column(
            children: [
              AmbitiousHeaderTop(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "📚 Library",
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.getCourseLibraryCategoriesList!.length,
                          itemBuilder: ((context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.h, horizontal: 2.w),
                                child: Container(
                                  //height: 20.h,
                                  //width: 106.w,
                                  decoration: const BoxDecoration(
                                      color: kcardblue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.h, horizontal: 10.w),
                                      child: Text(
                                        controller
                                            .getCourseLibraryCategoriesList![
                                                index]
                                            .categoryName
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 12.sp,
                                            height: 1.3.h,
                                            wordSpacing: 2.5.w,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: 490.h,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 5.w),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.getCourseLibraryList!.length,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    controller
                                        .getCourseLibraryList![index].header
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 16.sp,
                                        height: 1.3.h,
                                        wordSpacing: 2.5.w,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    controller
                                        .getCourseLibraryList![index].subtext
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 13.sp,
                                        height: 1.3.h,
                                        wordSpacing: 2.5.w,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      height: 300.h,
                                      child: ListView.builder(
                                        itemCount: controller
                                            .getCourseLibraryList![index]
                                            .courses!
                                            .length,

                                        scrollDirection: Axis.horizontal,
                                        // padding: EdgeInsets.only(),
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index2) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 12.w),
                                            child: Container(
                                                width: 171.w,
                                                child: InkWell(
                                                  onTap: () {
                                                    // Get.find<CoursesController>()
                                                    //     .coursecount(
                                                    //         coursesController
                                                    //             .getHotCourseList[
                                                    //                 index]
                                                    //             .id);

                                                    // shareCourse = coursesController
                                                    //     .getHotCourseList[index]
                                                    //     .title
                                                    //     .toString();
                                                    // DarkCourseDetail.viewCount =
                                                    //     coursesController
                                                    //         .getHotCourseList[index]
                                                    //         .viewCount;
                                                    Get.to(
                                                      () => DarkCourseDetail(),
                                                      binding:
                                                          DarkCourseDetailBinding(
                                                        id: controller
                                                            .getCourseLibraryList![
                                                                index]
                                                            .courses![index2]
                                                            .sId
                                                            .toString(),
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 221.h,

                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    kcardblue,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(15
                                                                            .r),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            15.r)),
                                                                image: DecorationImage(
                                                                    image:
                                                                        // AssetImage("assets/images/img_9.png",),
                                                                        NetworkImage(controller.getCourseLibraryList![index].courses![index].image.toString()),
                                                                    fit: BoxFit.fill)),
                                                        // child: Image.asset("assets/images/img_9.png")
                                                      ),
                                                      Container(
                                                        height: 77.h,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.h,
                                                                horizontal:
                                                                    5.w),
                                                        decoration: BoxDecoration(
                                                            color: kcardblue,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.r),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        15.r))),
                                                        child: Column(
                                                          //@mini
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              // "Bitcoin, Simplified",
                                                              controller
                                                                  .getCourseLibraryList![
                                                                      index]
                                                                  .courses![
                                                                      index2]
                                                                  .title
                                                                  .toString(),

                                                              // softWrap: true,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kWhiteColor),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              // "12 Shorts",
                                                              " Modules",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  height: 1.5.h,
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
                                                                        size:
                                                                            20,
                                                                        color: kWhiteColor
                                                                            .withOpacity(0.5),
                                                                      ),
                                                                      Text(
                                                                        "  23"
                                                                        // "  " +
                                                                        //     coursesController
                                                                        //         .getHotCourseList[index]
                                                                        //         .viewCount
                                                                        ,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10.sp,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          color:
                                                                              kWhiteColor.withOpacity(0.5),
                                                                          height:
                                                                              2.h,
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
                                                    ],
                                                  ),
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
