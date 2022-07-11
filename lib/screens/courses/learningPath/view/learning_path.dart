// ignore_for_file: prefer_const_constructors

import 'package:Ambitious/controllers/courses/courses_controller.dart';
import 'package:Ambitious/models/learnig_path_model.dart';
import 'package:Ambitious/utils/list.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LearningPath extends StatefulWidget {
  const LearningPath({Key? key}) : super(key: key);

  @override
  State<LearningPath> createState() => _LearningpathState();
}

class _LearningpathState extends State<LearningPath> {
  int isShow = 0;
  CoursesController coursesController =
      Get.put(CoursesController(), permanent: true);

  LearningPathModel selectedModel = LearningPathModel();

  @override
  void initState() {
    super.initState();

    coursesController.learningPathApi().then((value) {
      selectedModel = coursesController.learningPathList.first;

        name =
          coursesController.learningPathList.first.subCategoryName.toString();


    });
  }

  bool isVisible = false;
  final ScrollController _controller = ScrollController();

  String name= "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx((() => SingleChildScrollView(
              controller: _controller,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        height: Get.height * 0.21,
                        width: Get.width * 0.97,
                        child: ListView.builder(
                            itemCount:
                                coursesController.learningPathList.length,
                            scrollDirection: Axis.horizontal,
                            controller: _controller,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        // bool isTrue = true;

                                        // if (isTrue == true) {

                                        // }

                                        selectedModel = coursesController
                                            .learningPathList[index];

                                        name = coursesController
                                            .learningPathList[index]
                                            .subCategoryName
                                            .toString();

                                        //  coursesController.learningPathList[index ].isPress = true;

                                        isShow = index + 1;

                                        //  coursesController.learningPathList[isShow].isPress = true;

                                        isVisible = true;
                                      });
                                      // Get.toNamed('/wipCoursePlayerNew');
                                    },
                                    child: Container(
                                      width: Get.width * 0.35,
                                      height: Get.height * 0.22,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: Get.width * 0.35,
                                            height: Get.height * 0.18,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: Get.height * 0.1,
                                                  width: Get.width * 0.35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              coursesController
                                                                  .learningPathList[
                                                                      index]
                                                                  .image
                                                                  .toString()),
                                                          fit: BoxFit.fill)),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Color(0xff344356),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: isShow == index + 1,
                                            child: Positioned(
                                              top: Get.height * 0.16,
                                              left: 0,
                                              right: 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Transform(
                                                    alignment:
                                                        FractionalOffset.center,
                                                    transform:
                                                        new Matrix4.identity()
                                                          ..rotateZ(45 *
                                                              3.1415927 /
                                                              180),
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                    ),
                                                  ),
                                                ],
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
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                name.isEmpty?Text("....."
                                ,
                                    style: TextStyle(
                                    wordSpacing: 1,
                                    color: kTitleColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )
                                ):
                                Text(
                                  '${name} Learning Path',
                                  style: TextStyle(
                                    wordSpacing: 1,
                                    color: kTitleColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          GridView.builder(
                            padding:
                                EdgeInsets.only(left: 21, right: 16, top: 10),
                            itemCount:
                                selectedModel.courseListbyLearningPath.length,
                            controller: _controller,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.15,
                              crossAxisSpacing: 20,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed('/wipCoursePlayerNew');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 81,
                                        width: 176,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  // 'assets/images/img_4.png'
                                                  selectedModel
                                                      .courseListbyLearningPath[
                                                          index]
                                                      .image
                                                      .toString()),
                                              fit: BoxFit.fill),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          // 'iPhone Photography for Creators',
                                          selectedModel
                                              .courseListbyLearningPath[index]
                                              .title
                                              .toString(),
                                          maxLines: 2,
                                          style: TextStyle(
                                            height: 1.2,
                                            color: Color(0xff344356),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'REQUEST A TOPIC',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff344356).withOpacity(0.40),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ))));
  }
}
