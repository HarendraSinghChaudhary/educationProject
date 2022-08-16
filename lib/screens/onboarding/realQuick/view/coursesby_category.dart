// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:io';

import 'package:Ambitious/controllers/courses/courses_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/reusable/skip_button.dart';
import 'package:Ambitious/screens/flash_card.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/testing/navigation_testing.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:readmore/readmore.dart';

class CoursesbyCategory extends StatefulWidget {
  String? catId;

  CoursesbyCategory({Key? key, required this.catId}) : super(key: key);

  @override
  State<CoursesbyCategory> createState() => _OnboardingNextPageState();
}

class _OnboardingNextPageState extends State<CoursesbyCategory> {
  final ScrollController _controller = ScrollController();

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
    // TODO: implement initState
    super.initState();
    coursesController.coursesByCatApi(widget.catId.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("token: " + token.toString());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: 

      Obx((() => 

     coursesController.isLoading.value
                          ? Align(
                              alignment: Alignment.center,
                              child: Platform.isAndroid
                                  ? CircularProgressIndicator()
                                  : CupertinoActivityIndicator())
                          :
       SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           SizedBox(
            height: h * 0.04,
          ),


          Container(
            margin:const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                

              // SkipButton(
              //    height: Get.height * 0.04,
              //       width: Get.width * 0.22,
              //   text: "Skip", press: () { 
              //     Get.to(HomeNav(index: 0)); 
              //     },)

            ],),
          ),

           SizedBox(
            height: h * 0.02,
          ),
         Center(
           child: Text(
            'We think you’ll like',
            style: TextStyle(
                color: kTitleColor,
                fontSize: 28,
                fontWeight: FontWeight.w600),
        ),
         ),
        SizedBox(
          height: 20,
        ),
        Obx((() => ListView.builder(
              shrinkWrap: true,
              itemCount: coursesController.coursesByCatList.length,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InkWell(
                    onTap: () {

                        _mixpanel.track('Course Started', properties: {
                                          "Course Name" :  coursesController
                                                .coursesByCatList[index]
                                                .title
                                                .toString()
                                         });


                     Get.to(FlashCard(id:  coursesController
                                                .coursesByCatList[index]
                                                .id
                                                .toString(),

                                                title:  coursesController
                                                .coursesByCatList[index]
                                                .title
                                                .toString(),
                                                
                                                
                                                
                                                
                                                ),
                                                
                                                
                                                );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              offset: Offset(0, 3),
                              blurRadius: 7,
                            )
                          ]),
                     
                      width: w * 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coursesController.coursesByCatList[index].image
                                      .toString() !=
                                  ""
                              ? Container(
                                  height: h * 0.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          15,
                                        ),
                                        topRight: Radius.circular(
                                          15,
                                        )),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            // 'assets/images/apps.png',
                                            coursesController
                                                .coursesByCatList[index]
                                                .image
                                                .toString()),
                                        fit: BoxFit.fill),
                                  ),
                                )
                              : Container(),
                          Container(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Column(
                              children: [
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    coursesController
                                                .coursesByCatList[index]
                                                .title
                                                .toString() !=
                                            ""
                                        ? Expanded(
                                          child: Text(
                                              coursesController
                                                  .coursesByCatList[index]
                                                  .title
                                                  .toString(),
                                                  maxLines: 3,
                                              style: TextStyle(
                                                  color: kTitleColor,
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w700),
                                            ),
                                        )
                                        : Container(),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                             
                                // ReadMoreText(
                                
                                //   coursesController.coursesByCatList[index].shortDescrition.toString(),
                                //   trimLines: 2,
                                //   style: TextStyle(
                                //      color: ksubtitamarketColor,
                                //     fontSize: 16,

                                //   ),
                                //   colorClickableText: ksubtitamarketColor,
                                //   trimMode: TrimMode.Line,
                                //   trimCollapsedText: 'Show more',
                                //   trimExpandedText: 'Show less',
                                //   moreStyle: TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.bold),
                                // )
                             
                             
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))),
        SizedBox(
          height: h * 0.02,
        ),
        
        SizedBox(
          height: h * 0.03,
        ),
      ],
    ),
      )
    
     )),




            bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: Get.height * 0.09,
          color: kWhiteColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: InkWell(
          onTap: () {
            Get.to(BottomNavigationScreen(index: 0.obs, learningPathIndex: 0.obs,));
          },
          child: Text(
            'SEE MORE OPTIONS ->',
            textAlign: TextAlign.center,
            style: TextStyle(
              // height: 2,
              color: Color(0xff344356).withOpacity(0.40),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),


            
              
              
              
            ),
          ),
        ),
      ),
      
      
      
      
     
    
    );
  }
}
