import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/screens/customStory.view/storyview.dart';
import 'package:Ambitious/screens/quiz_end.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../controllers/courses/darkcourse_controller.dart';
import '../controllers/study_material/study_material_controller.dart';
import '../models/darkcoursemodel.dart';
import '../testing/dammysotryview.dart';
import '../utils/constant.dart';
import 'dark_learning_path.dart';
import 'flash_card.dart';

class DarkCourseDetail extends GetView<DarkCourseDetail_Controller> {
  static String viewCount = "";
  DarkCourseDetail({Key? key}) : super(key: key);
  //  final String id ;
  // @override
  // // TODO: implement controller
  // DarkCourseDetail_Controller get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    // controller.ids = id;
    // controller.onInit();
    return Obx(() => Scaffold(
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
                              // bottom: -20,
                              // left: w * 0.15,
                              // right: w * 0.15,
                              // top: h*0.08,
                              // width: w*0.3,
                              alignment: Alignment.bottomCenter,
                              // heightFactor: 1.2,

                              child: Visibility(
                                  visible: controller
                                      .bigdata.value!.image!.isNotEmpty,
                                  child: 
                                  ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(h*0.02)),
                                    child: Image.network(
                                      controller
                                                .bigdata.value!.image
                                                .toString(),
                                                height: h*0.25,
                                                errorBuilder: ((context, error, stackTrace) {
                                                  return Container();
                                                }),
                                                
                                  
                                    ),
                                  )
                                  // Container(
                                  //   height: h * 0.28,
                                  //   // width: w * 0.7,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(h * 0.015),
                                  //       image: DecorationImage(
                                  //         image: NetworkImage(controller
                                  //             .bigdata.value!.image
                                  //             .toString()),
                                  //         // fit: BoxFit.fill,
                                  //       )),
                                  // )
                                  //  Image.network(controller.bigdata.value!.image.toString() ,height:h*0.23,width: w*0.8,fit: BoxFit.contain,)
                                  )
                              // Image.asset("assets/images/bitcoin.png"),height: h*0.23,
                              ),
                              Positioned(
                                top: h*0.03,
                                left: w*0.05,
                                child: IconButton(
                                icon:  Icon(
                                  Icons.arrow_back_ios,
                                  color: kWhiteColor,
                                  size: h*0.03,
                                ),
                                onPressed: (){
                                  Get.back();
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
                            Center(
                              child: Text(
                                // "Bitcoin, Simplified",
                                controller.bigdata.value!.title.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor,
                                  height: 2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Card(
                                  //   color: kWhiteColor,
                                  //   shape: RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         BorderRadius.circular(h * 0.012),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(3.0),
                                  //     child: Row(
                                  //       children: [
                                  //         CircleAvatar(
                                  //             radius: h * 0.012,
                                  //             backgroundColor:
                                  //                 kBlackColor.withOpacity(0.5),
                                  //             foregroundColor: kWhiteColor,
                                  //             child: const Icon(
                                  //               Icons.thumb_up_off_alt_rounded,
                                  //               size: 15,
                                  //             )),
                                  //         Text(
                                  //           "  90%",
                                  //           // controller.bigdata.value!.
                                  //           style: TextStyle(
                                  //             fontSize: 10,
                                  //             fontWeight: FontWeight.w300,
                                  //             color:
                                  //                 kBlackColor.withOpacity(0.5),
                                  //             height: 2,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  Card(
                                    color: kWhiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(h * 0.012),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.groups,
                                            size: 20,
                                            color: kBlackColor.withOpacity(0.5),
                                          ),
                                          Text(
                                            // "  ${Get.find<DarkLearningPathController>().viewCount.value} ",
                                            DarkCourseDetail.viewCount,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color:
                                                  kBlackColor.withOpacity(0.5),
                                              // height: 2,
                                            ),
                                          ),
                                        ],
                                      ),
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
                                  text: controller.isstart.value? "START": !controller.isCompleted.value?"COMPLETED": "CONTINUE",
                                  press: () {
                                    // Get.to(()=> StoryViews());
                                   controller.onpressed();
                                //  controller. checkCopletion();

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

                                          // Get.to(() => FlashCard(
                                          //     id: mod.id.toString(),
                                          //     moduleId: mod.moduleId.toString(),
                                          //     title:
                                          //         mod.moduletitle.toString()));
                                          if(controller.bigdata.value!.allmodule![index].studayMaterial!=0){
                                          Get.to(() => CustomStoryView(
                                              id: mod.id.toString(),
                                              moduleId: mod.moduleId.toString(),
                                              title:
                                                  mod.moduletitle.toString()
                                                  ),
                                              //     binding: StudayMaterialBinding(id: mod.id.toString(),
                                              // moduleId: mod.moduleId.toString(),
                                              // title:
                                              //     mod.moduletitle.toString())
                                                  );
// Get.to(
//   ()=>CustomCourseView()
// );
                                          controller.lessonTitle =
                                              mod.moduletitle.toString();
                                              controller.finishId = mod.moduleId.toString();
                                          }else{
                                            Get.snackbar("", "");
                                          }
                                          
                                              
                                          
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.01),
                                          child: ListTile(
                                            leading:Text(
                                                      "${index + 1}",
                                                      style: const TextStyle(
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: kWhiteColor,
                                                        height: 1,
                                                      ),
                                                    ),

                                                    title: Text(
                                                        mod.moduletitle
                                                            .toString(),
                                                        //"What is Bitcoin?",
                                                        style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: kWhiteColor,
                                                          height: 1,
                                                        ),
                                                      ),

                                                      subtitle:     Text(
                                                        mod.studayMaterial
                                                                .toString() +
                                                            " stories",
                                                        // "8 stories",
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: kWhiteColor,
                                                          height: 1.5,
                                                        ),
                                                      ),

                                                      trailing:    mod.IsCompleated == true
                                                  ? Image.asset(
                                                      "assets/images/Ok.png",height: h*0.04,)
                                                  : const Text(""),
                                          )
                                          
                                          
                                          
                                          // Row(
                                          //   children: [
                                          //     Expanded(
                                          //         flex: 2,
                                          //         child: Center(
                                          //           child: Text(
                                          //             "${index + 1}",
                                          //             style: TextStyle(
                                          //               fontSize: 32,
                                          //               fontWeight:
                                          //                   FontWeight.w700,
                                          //               color: kWhiteColor,
                                          //               height: 1,
                                          //             ),
                                          //           ),
                                          //         )),
                                          //     Expanded(
                                          //         flex: 7,
                                          //         child: Column(
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment
                                          //                   .start,
                                          //           children: [
                                          //             Text(
                                          //               mod.moduletitle
                                          //                   .toString(),
                                          //               //"What is Bitcoin?",
                                          //               style: TextStyle(
                                          //                 fontSize: 22,
                                          //                 fontWeight:
                                          //                     FontWeight.w700,
                                          //                 color: kWhiteColor,
                                          //                 height: 1,
                                          //               ),
                                          //             ),
                                          //             Text(
                                          //               mod.studayMaterial
                                          //                       .toString() +
                                          //                   " stories",
                                          //               // "8 stories",
                                          //               style: TextStyle(
                                          //                 fontSize: 14,
                                          //                 fontWeight:
                                          //                     FontWeight.w400,
                                          //                 color: kWhiteColor,
                                          //                 height: 1.5,
                                          //               ),
                                          //             ),
                                          //           ],
                                          //         )),
                                          //     mod.IsCompleated == true
                                          //         ? Image.asset(
                                          //             "assets/images/Ok.png")
                                          //         : const Text("")
                                          //   ],
                                          // ),
                                        ),
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
        ));
  }
}
