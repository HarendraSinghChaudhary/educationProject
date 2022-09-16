import 'package:Ambitious/screens/dark_learning_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/courses/courses_controller.dart';
import '../utils/constant.dart';

class Dark_Course extends GetView<CoursesController>{
  const Dark_Course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return
    Obx(
      ()=>Scaffold(
      backgroundColor: kdarkblue,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: w*0.08,
              right: w*0.08,
              top: h*0.07
            ),
                      height: h*0.25,
                      width: w,
                      decoration: BoxDecoration(
                        gradient: kbluegradiant,
                        borderRadius: BorderRadius.circular(h*0.01),
                      ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Browse",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor
                    ),
                  ),
                  SizedBox(
                    height: h*0.015,
                  ),
                  const Expanded(
                    child: Text(
                      "Select a path that interests you to see available courses, projects and action items.",
                      // overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor
                      ),
                    ),
                  )
                ],
              ),
              
            ),
            Expanded(flex: 2, child: Image.asset("assets/images/magnifying glass.png",height: h*0.1,)),

          ],
        ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: w*0.05,
                          vertical: h*0.02
                        ),
                        crossAxisSpacing: w*0.09,
                        mainAxisSpacing: h*0.03,
                        childAspectRatio: 0.85,
                        children: List.generate(controller.learningPathList.length, (index) =>
                         GestureDetector(
                          onTap: (){
                            Get.to(
                              () => 
                              const DarkLearningPath(),
                              binding: DarkLearningBinding(courseListbyLearningPath: controller.learningPathList[index].courseListbyLearningPath, description: controller.learningPathList[index].description??"", image: controller.learningPathList[index].image.toString(), title: controller.learningPathList[index].subCategoryName.toString(),)
                              );
                            // print(
                            //   controller.learningPathList[index].colorcode);
                            },
                          child: Container(
                            height: h*0.15,
                            padding: EdgeInsets.symmetric(
                              vertical: h*0.015
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(controller.change_to_a(controller.learningPathList[index].a!.toInt()), controller.learningPathList[index].r!.toInt(), controller.learningPathList[index].g!.toInt(), controller.learningPathList[index].b!.toInt()),
                              borderRadius: BorderRadius.circular(h*0.02)
                            ),
                            child: Column(
                              children: [
                                // Image.asset("assets/images/bitcoin money bag.png",height: h*0.12,),
                                Image.network(controller.learningPathList[index].image.toString(),height: h*0.12,),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: w*0.02,right: w*0.02,top: h*0.005),
                                    child: Text(
                                      // "Social Media Creator",
                                      // "pppppppppppppppppppppppp",
                                      controller.learningPathList[index].subCategoryName.toString(),
                                      // "Social Media Creator and Entropruner",
                                      overflow: TextOverflow.values[1],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: kWhiteColor
                                                ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ),
                    )
        ],
      ),
    )

    );
       }
}


