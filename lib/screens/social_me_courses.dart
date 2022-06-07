import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/constant.dart';

class SocialmeCourses extends StatefulWidget {
  const SocialmeCourses({Key? key}) : super(key: key);

  @override
  State<SocialmeCourses> createState() => _SocialmeCoursesState();
}

class _SocialmeCoursesState extends State<SocialmeCourses> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                controller: _controller,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Get.toNamed("/startCourse");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.06,
                          vertical: Get.height * 0.01),
                      height: Get.height * 0.29,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.18,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/Coursepeople.png'),fit: BoxFit.fill),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.025,
                                  left: Get.width * 0.069,
                                ),
                                child: Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.6,
                                  // color: Colors.black,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Social Media Marketing',
                                        style: TextStyle(
                                            color: kTitleColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '18 Chapters',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kSubTitleColor,height:1.6 ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left:Get.width*0.01),
                                child: Container(
                                  // color: Colors.green,
                                  height: Get.height*0.1,
                                  width: Get.width*0.18,
                                  child: Icon(Icons.bookmark_border,size: 29,),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    ));
  }
}
