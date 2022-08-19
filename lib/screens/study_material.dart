import 'dart:io';

import 'package:Ambitious/controllers/study_material/study_material_controller.dart';
import 'package:Ambitious/reusable/skip_button.dart';
import 'package:Ambitious/screens/study_material_detail.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class StudyMaterial extends StatefulWidget {
  String title, id;
  StudyMaterial({Key? key, required this.title, required this.id})
      : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StudyMaterial> {
  PageController controller = PageController();
  int _curr = 1;
  double pageNumber = 0.0;

  StudyMaterialController studyMaterialController =
      Get.put(StudyMaterialController(), permanent: false);

  late final Mixpanel _mixpanel;

  Future<void> _initMixpanel() async {
    _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
        optOutTrackingDefault: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studyMaterialController.studyMaterialApi(widget.id);
    _initMixpanel();
  }

  @override
  Widget build(BuildContext context) {
    print("length: " +
        studyMaterialController.studyMaterialList.length.toString());

    return Scaffold(
        backgroundColor: kBackgroundColor,
// 	appBar:AppBar(
//     backgroundColor: kBackgroundColor,
// 		title: "",
//     centerTitle: true,
//     elevation: 0,

// ),
        body: Obx((() => studyMaterialController.isLoading.value
            ? Align(
                alignment: Alignment.center,
                child: Platform.isAndroid
                    ? const CircularProgressIndicator(
                        strokeWidth: 1,
                      )
                    : const CupertinoActivityIndicator())
            : 
            
            
            
            
            Column(
                children: [
                  SizedBox(height: Get.height * 0.03),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.04,
                        right: Get.width * 0.04,
                        top: Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: kPrimaryColor,
                              size: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        SizedBox(
                          width: Get.width * 0.65,
                          height: Get.height * 0.015,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              backgroundColor:
                                  kLightGreyColorwithMail.withOpacity(0.3),
                              minHeight: Get.height * 0.017,
                              valueColor:
                                  const AlwaysStoppedAnimation<Color>(kCyanColor),
                              value: pageNumber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                 
                 
                 
                 
                  Expanded(
                    child: PageView.builder(
                        onPageChanged: (num) {
                          setState(() {
                            print(studyMaterialController
                                .studyMaterialList.length);

                            _curr = num ;
                            print("current: " + _curr.toString());
                            pageNumber = _curr / 4;
                            print(pageNumber);

                            _mixpanel.track('Flashcard Swipe');
                          });

                          if (pageNumber == 4) {
                            _mixpanel.track(' Course Finished');
                          }
                        },
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        //  controller: controller,

                        itemBuilder: (context, position) {
                          return 
                          
                          
                          
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.05),
                              color: Colors.white,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height * 0.2,
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://pilbox.themuse.com/image.jpg?filter=antialias&h=422&opt=1&pos=top-left&prog=1&q=keep&url=https%3A%2F%2Fcms-assets.themuse.com%2Fmedia%2Flead%2F01212022-1047259374-coding-classes_scanrail.jpg%3Fv%3De701c89d3e07cc24ac41b2df50f5a40a821e3813&w=767"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.all(10),
                                          width: Get.width * 0.25,
                                          height: Get.height * 0.035,
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            onPressed: () {
                                              // Get.to(StudyMaterialDetail(
                                              //     detail:
                                              //         studyMaterialController
                                              //             .studyMaterialList
                                              //             .first
                                              //             .courseData[position]
                                              //             .toString()));
                                            },
                                            child: const Text(
                                              "View More",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Expanded(
                                    child: Html(
                                      data: "",
                                        // data: studyMaterialController
                                        //     .studyMaterialList
                                        //     .first
                                        //     .courseData[position]
                                        //     .toString()
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          );
                      
                      
                      
                      
                        },
                        itemCount: 4 // Can be null
                        ),
                  )
                ],
              ))));
  }
}
