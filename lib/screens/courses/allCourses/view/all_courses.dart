import 'package:Ambitious/controllers/courses/courses_controller.dart';
import 'package:Ambitious/screens/course_detail.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/list.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({Key? key}) : super(key: key);

  @override
  State<AllCourses> createState() => _CoursesState();
}

class _CoursesState extends State<AllCourses> {

  CoursesController coursesController = Get.put(CoursesController(), permanent: true);


  @override
  void initState() {
   
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
                itemCount: coursesController.allCourseList.length,
                shrinkWrap: true,
                controller: controller,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                       Text(
                        // 'Digital Marketing',
                        coursesController.allCourseList[index].categoryName.toString(),
                        style: TextStyle(
                          color: kTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 144,
                            width: Get.width * 0.97,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: coursesController.allCourseList[index].courseListbyCategory.length,
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                itemBuilder:
                                    (BuildContext context, int j) {
                                  return 

                                  
                                  
                                  
                                  
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                         Get.to(CourseDetail(title:coursesController.allCourseList[index].courseListbyCategory[j].title.toString(),
                                         id: coursesController.allCourseList[index].courseListbyCategory[j].id.toString(),

                                         
                                         ));
                                        },
                                        child: 
                                        Container(

                                          width: Get.width * 0.35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                            topRight: Radius
                                                                .circular(
                                                                    15)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          coursesController.allCourseList[index].courseListbyCategory[j].image.toString()
                                                        ),
                                                        fit: BoxFit.fill)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  
                                                  // paths[index]['name']
                                                  //     .toString(),
                                                
                                                  coursesController.allCourseList[index].courseListbyCategory[j].title.toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Color(0xff344356),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
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
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
