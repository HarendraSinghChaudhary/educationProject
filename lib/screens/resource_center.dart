
import 'package:Ambitious/utils/list.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';




class ResourceCenter extends StatefulWidget {
  const ResourceCenter({Key? key}) : super(key: key);

  @override
  State<ResourceCenter> createState() => _ResourcecenterState();
}

class _ResourcecenterState extends State<ResourceCenter> {
  final ScrollController   _controller = ScrollController();
  TextStyle tital =  const TextStyle( color: kTitleColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,);
  TextStyle subtital = const  TextStyle(color: kSubTitleColor,fontSize: 12,height: 1.5,  fontWeight: FontWeight.w400,);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.035, vertical: Get.height * 0.02),
              height: Get.height * 0.1750,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.03),
                color: kBackOfResourceColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Get.height * 0.06,
                        left: Get.width * 0.07),
                    child:const Text(
                      'Community\nCenter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: ktitalResourceColor,
                      ),
                    ),
                  ),
                SizedBox(width: Get.width * 0.01),
                  Container(
                    padding: EdgeInsets.only(top: Get.height * 0.04),
                    height: Get.height * 0.7,
                    width: Get.height * 0.2,
                    child: SvgPicture.asset(
                      'assets/icons/resourceimage.svg',
                      // height: Get.height * 1,
                      // width: Get.width * 1,
                    ),
                  )
                ],
              ),
            ),
            //Recource center box  Start

            ListView.builder(
              controller: _controller,
                itemCount: Recourcecenter.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
              return   Padding(
              padding:  EdgeInsets.symmetric(
                    horizontal: Get.height * 0.020, vertical: Get.height * 0.01),
                child: Container(
                  height: Get.height * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        offset: const Offset(0,3),
                        blurRadius: 7,
                      )
                    ]
                  ),
                  child: Stack(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.01 ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: Get.height*0.07,
                                  width: Get.width*0.17,
                                  child: Image.asset(Recourcecenter[index]["image"].toString(),
                                  ),
                                ),
                                SizedBox(width: Get.width*0.02,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(Recourcecenter[index]["tital"].toString(),
                                      style: tital,),
                                      SizedBox(height: Get.height * 0.002,),
                                      Text(Recourcecenter[index]["subtital"].toString(),style: subtital,),
                                
                                      SizedBox(height: Get.height * 0.01,),
                                   
                                    
                                    ],
                                  ),
                                ),


                                



                              ],
                            ),
                          ),
                        ),
                      ),


                       const Positioned(
                          right: 10,
                          bottom: 8,

                          child: Text("COMING SOON",
                                   style:TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 10
                                   ),
                                    ),
                        ),
                    ],
                  ),
                ),
              );
            }),

             Padding(
              padding:  EdgeInsets.symmetric(
                    horizontal: Get.height * 0.020, vertical: Get.height * 0.01),
                child: Container(
                  height: Get.height * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        offset: const Offset(0,3),
                        blurRadius: 7,
                      )
                    ]
                  ),
                  child: Stack(
                    children: [
                      TextButton(
                        onPressed: (){
                          // Get.to(PageViewController());
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.02 ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: Get.height*0.05,
                                  width: Get.width*0.14,
                                  child: Image.asset("assets/images/5.png",
                                  ),
                                ),
                                SizedBox(width: Get.width*0.04,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Discord Community",
                                      style: tital,),
                                      SizedBox(height: Get.height * 0.002,),
                                      Text("Network with Ambitious people.",style: subtital,),
                                
                                      SizedBox(height: Get.height * 0.01,),
                                   
                                    
                                    ],
                                  ),
                                ),
             
             
                                
             
             
             
                              ],
                            ),
                          ),
                        ),
                      ),
             
             
                       const Positioned(
                          right: 10,
                          bottom: 8,
             
                          child: Text("COMING SOON",
                                   style:TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 10
                                   ),
                                    ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
