// ignore_for_file: prefer_const_constructors

import 'dart:io';


import 'package:Ambitious/controllers/category/category_controller.dart';
import 'package:Ambitious/controllers/courses/courses_controller.dart';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../reusable/home_header.dart';
import '../../../utils/list.dart';
class HomeLive extends StatefulWidget {
  const HomeLive({Key? key}) : super(key: key);

  @override
  State<HomeLive> createState() => _ProfileState();
}

class _ProfileState extends State<HomeLive> {

  String id = "";
  String name = "";
  String email = "";
  bool bookmark =  false;
  ScrollController _controller = ScrollController();

  CoursesController coursesController =
      Get.put(CoursesController(), permanent: true);


  



 @override
 void initState() {
   super.initState();

   getUserList();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: kArrowBackgroundColor, // status bar color
  ));
   coursesController.learningPathApi();
  //  categoryController.subcategoryApi();

   _controller = ScrollController();
   
   
 }


 @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }



  @override
  Widget build(BuildContext context) {

    print("length: "+ coursesController.learningPathList.length.toString());
    return Scaffold(
    appBar: AppBar(
      toolbarHeight: Get.height*0.11,
      automaticallyImplyLeading: false,
      backgroundColor:kArrowBackgroundColor ,
     centerTitle: false,
     elevation: 0,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight: Radius.circular(20))),
      title: Text( "Hi, ${name} 👋🏼",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ), 
    ),
            
        backgroundColor: kBackgroundColor,
      body: 


      Obx((() => 


    //  categoryController.isLoading.value
    //                     ? Align(
    //                         alignment: Alignment.center,
    //                         child: Platform.isAndroid
    //                             ? CircularProgressIndicator()
    //                             : CupertinoActivityIndicator())
    //                     : 

      
      
      
       SingleChildScrollView(
        controller: controllerScroll,
         padding: EdgeInsets.only(left: Get.height*0.015, top: Get.height*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HomeHeader(),
       Text(
         "💰 Earn ",
         style: TextStyle(
                  color: Color(0xff344356),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
       ),
         Text(
         " Complete 2 tasks for a \$10 gift card",
         style: TextStyle(
                  color: Color(0xff4C5A6A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: Get.height*0.0025
                ),
       ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
           margin: EdgeInsets.only(top: 15,right: 10),
              elevation: 3,
             color: Colors.white,
             child: ListTile(
               contentPadding: EdgeInsets.only(left: 20,right: 10, top: 10,bottom: 10),
leading:  Icon(Icons.home),
title: Text("Invite Friends", 
style: TextStyle(
  fontWeight: FontWeight.w700
),
),
subtitle: Text("Invite a friend and get a \$5 gift card \nwhen they sign up."),
trailing:  Container(
  alignment: Alignment.center,
  height: 25,
  width: 25,
  decoration: BoxDecoration(
    color: kArrowBackgroundColor,
    borderRadius: BorderRadius.circular(20),
  ),
  child: Icon(Icons.arrow_forward,color: Colors.white,size: 18,),
),
             ),
            ),
               Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
           margin: EdgeInsets.only(top: 15,right: 10),
              elevation: 3,
             color: Colors.white,
             child: ListTile(
               contentPadding: EdgeInsets.only(left: 20,right: 10, top: 10,bottom: 10),
leading:  Icon(Icons.home),
title: Text("Request a Topic", 
style: TextStyle(
  fontWeight: FontWeight.w700
),
),
subtitle: Text("We want to hear from you. Get a \$5 gift \ncard for honest feedback."),
trailing:  Container(
  alignment: Alignment.center,
  height: 25,
  width: 25,
  decoration: BoxDecoration(
    color: kArrowBackgroundColor,
    borderRadius: BorderRadius.circular(20),
  ),
  child: Icon(Icons.arrow_forward,color: Colors.white,size: 18,),
),
             ),
            ),
          // Center(
          //    child:  Text( "Hi, ${name} 👋🏼",
          //       style: TextStyle(
          //         color: Color(0xff344356),
          //         fontSize: 24,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //  ),
       
            // SizedBox(height: Get.height * 0.02,),
       
            // Center(
            //   child: SizedBox(
            //     width: Get.width * 0.90,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
       
            //             Container(
            //                   height: 27,
            //                   width: 27,
            //                   decoration: const BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     color:  Color(0xffAEB8FF),
            //                   ),
            //                   child: const Icon(
            //                     Icons.help,
            //                     color: Colors.white,
            //                     size: 13,
            //                   ),
            //                 ),
       
            //                const SizedBox(height: 5,),
       
            //                 const Text(
            //                 'Request Topic',
            //                 style: TextStyle(
            //                   color: Color(0xff344356),
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
       
       
       
            //         ],
            //       ),
       
            //          Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
       
            //               Container(padding: EdgeInsets.all(6),
            //                     height: 27,
            //                     width: 27,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(27),
            //                       color: Color(0xffAEB8FF),
            //                     ),
            //                     child: SvgPicture.asset('assets/images/Shape.svg',)
            //                 ),
       
            //                const SizedBox(height: 5,),
       
            //                 const Text(
            //                 'Redeem Points',
            //                 style: TextStyle(
            //                   color: Color(0xff344356),
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
       
       
       
            //         ],
            //       ),
       
            //          Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
       
            //               Container(
            //                   height: 27,
            //                   width: 27,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(27),
            //                     color:const Color(0xffAEB8FF),
            //                   ),
            //                   child:const Icon(Icons.message,color: Colors.white,size: 18,)
            //                 ),
       
            //                const SizedBox(height: 5,),
       
            //                 const Text(
            //                 'Invite Friends',
            //                 style: TextStyle(
            //                   color: Color(0xff344356),
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
       
       
       
            //         ],
            //       )
       
            //     ],),
            //   ),
            // ),
         
             SizedBox(height: Get.height * 0.03,),
       
                Text(
           '🔥 COURSES FOR YOU',
           style: TextStyle(
             color: kTitleColor,
             fontSize: 16,
             fontWeight: FontWeight.w500,
           ),
         ),
          Text(
           'Based on your interests',
           style: TextStyle(
             height: 1.7,
            //  color: kTitleColor,
             fontSize: 14,
             fontWeight: FontWeight.w500,
           ),
         ),
             GridView.builder(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
              itemCount: coursesController.coursesByCatList.length,
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                childAspectRatio: 1.1,
                crossAxisSpacing: 7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return 
                Container(
                
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 85,
                        width: 176,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(coursesController.coursesByCatList[index].image.toString()),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 6),
                        child: Text(
                           'Bitcoin & Blockchain',
                              // categoryController.subCategoryList[index].subCategory.toString(),
                              style: TextStyle(
                                color: kTitleColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      ),
                    const  SizedBox(
                        height: 10,
                      ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                              bottom: 1,
                            ),
                            child: Text(
                              '12 Shorts',
                              style: TextStyle(
                                color: kLightGreyColorwithMail,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
       
       
                          InkWell(
                            onTap:(){
                              setState( (){
                                bookmark  = !bookmark;
                              });
                            },
                              child: bookmark == false ? Icon(Icons.bookmark_border_outlined):Icon(Icons.bookmark))
                         
                        
                        
                        ],
                      ),
       
                      // SizedBox(height: Get.height * 0.01,)
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: Get.height * 0.03,),
          const  Padding(
              padding:  EdgeInsets.only(top: 16,bottom: 6),
              child:  Text(
                '📈 LEARNING PATH',
                style: TextStyle(
                  color: kTitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
              Text(
                'Pursue a new dream',
                style: TextStyle(
                  // color: ,
                  color: Color(0xff4C5A6A),
                  fontSize: 14,

                  fontWeight: FontWeight.w400,
                ),
              ),
             SizedBox(
               height: 144,
               width: Get.width * 0.97,
               child: ListView.builder(
                 padding: EdgeInsets.only(top: 15),
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
       
                             });
                             // Get.toNamed('/wipCoursePlayerNew');
                           },
                           child: Container(
                             width: Get.width * 0.35,
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
                                           const BorderRadius.only(
                                               topLeft:
                                                   Radius.circular(15),
                                               topRight:
                                                   Radius.circular(
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
                                       const EdgeInsets.only(left: 10),
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
                         SizedBox(
                           width: 15,
                         )
                       ],
                     );
                   }),
             ),
                   
                   
          
          
            

       
            SizedBox(height: Get.height * 0.03,)
          
          ],
        ),
           )
     
     )
      
      
      
      
      
     
     
    ),
    );
  }

    Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());
  

    setState(() {});
  }
}
