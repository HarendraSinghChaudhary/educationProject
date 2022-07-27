// ignore_for_file: prefer_const_constructors

import 'package:Ambitious/controllers/category/category_controller.dart';
import 'package:Ambitious/controllers/courses/courses_controller.dart';
import 'package:Ambitious/models/learnig_path_model.dart';
import 'package:Ambitious/screens/course_detail.dart';
import 'package:Ambitious/screens/page_detail.dart';
import 'package:Ambitious/services/crispchat.dart';
import 'package:Ambitious/utils/list.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LearningPath extends StatefulWidget {
  RxInt indexPath;
  LearningPath({Key? key, required this.indexPath}) : super(key: key);

  @override
  State<LearningPath> createState() => _LearningpathState();
}

class _LearningpathState extends State<LearningPath> {


  LearningPathModel selectedModel = LearningPathModel();
  final dataKey = GlobalKey();
  List keys = [];
  var contexte ;
 
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Get.find<LearningPathIndex>().dispose();
  }
  @override
  void initState() {
  print("111====="+widget.indexPath.toString());
    super.initState();
 for (int i = 0; i < Get.find<CoursesController>().learningPathList.length; i++) {
        keys.add(i);
        keys[i] = GlobalKey();
      }
    if (widget.indexPath ==0.obs) {
      Get.find<CoursesController>().learningPathApi().then((value) {
        selectedModel = Get.find<CoursesController>().learningPathList[0];


        print("press 1....");

        name =
            Get.find<CoursesController>().learningPathList.first.subCategoryName.toString();
      }).whenComplete(() {
        for (int i = 0; i < Get.find<CoursesController>().learningPathList.length; i++) {
        keys.add(i);
        keys[i] = GlobalKey();
      }
      });
    } else {
      Get.find<CoursesController>().learningPathApi().then((value) {
        // selectedModel = widget.indexPath;
        
           selectedModel = Get.find<CoursesController>().learningPathList[widget.indexPath.toInt()];

         print("press 2...");

        name =
            Get.find<CoursesController>().learningPathList[widget.indexPath.toInt()].subCategoryName.toString();
            scollToItem(widget.indexPath.toInt());
      }).whenComplete((){
        for (int i = 0; i < Get.find<CoursesController>().learningPathList.length; i++) {
        keys.add(i);
        keys[i] = GlobalKey();
      }
      });
    }





  }

  bool isVisible = false;
  final ScrollController _controller = ScrollController();

  String name = "";

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<LearningPathIndex>(() => LearningPathIndex());
     Get.lazyPut<CoursesController>(() => CoursesController());
      // print("index====: "+ Get.find<LearningPathIndex>().isShowIndex.toString());
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx((() => 
        
        SingleChildScrollView(
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
                                Get.find<CoursesController>().learningPathList.length,
                            scrollDirection: Axis.horizontal,
                            controller: _controller,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                key: keys[index],
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedModel = Get.find<CoursesController>().learningPathList[index];

                                          name = Get.find<CoursesController>().learningPathList[index]
                                              .subCategoryName
                                              .toString();

                                         widget.indexPath= index.obs ;
                                        });

                                        scollToItem(index);

                                        // _controller
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
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(2, 3),
                                                        blurRadius: 10,
                                                        spreadRadius: 3)
                                                  ],
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
                                                               Get.find<CoursesController>().learningPathList[
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

                                                      Get.find<CoursesController>().learningPathList[index]
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
                                              visible:
                                                 widget.indexPath ==
                                                      index ,
                                              child: Positioned(
                                                top: Get.height * 0.16,
                                                left: 0,
                                                right: 0,
                                                bottom: 15,
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
                                ),
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
                                name.isEmpty
                                    ? Text("",
                                        style: TextStyle(
                                          wordSpacing: 1,
                                          color: kTitleColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ))
                                    : Text(
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
                                 Get.to(PageViewController(title:  selectedModel
                                              .courseListbyLearningPath[index]
                                              .title
                                              .toString(),
                                              id: selectedModel
                                              .courseListbyLearningPath[index]
                                              .id
                                              .toString(),
                                              
                                              
                                              ));
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
                        onTap: () {
                          Get.to(CrispChat());
                        },
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
  Future scollToItem(int index) async {
    contexte = keys[index].currentContext!;
    print(keys[index].currentContext!);
    await Scrollable.ensureVisible(contexte,
        duration: const Duration(milliseconds: 800));
  }

}



// class LearningPathIndex extends GetxController {
  
//   LearningPathModel selectedModel = LearningPathModel();

//   RxInt? isShowIndex;

//   void newone () {
//     print("index: "+ isShowIndex.toString());
//   }
// }
