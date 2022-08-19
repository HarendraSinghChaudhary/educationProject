import 'package:Ambitious/reusable/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/courses/darkcourse_controller.dart';
import '../models/darkcoursemodel.dart';
import '../utils/constant.dart';
import 'flash_card.dart';

class DarkCourseDetail extends GetView<DarkCourseDetail_Controller> {
  
   DarkCourseDetail({Key? key}) : super(key: key);
  //  final String id ;
  final _scrollcontroller = ScrollController();
  @override
  // TODO: implement controller
  DarkCourseDetail_Controller get controller => super.controller;
  @override
  
  Widget build(BuildContext context) {
  // controller.ids = id;
    // controller.onInit();
    return 
    Obx(
      ()=>Scaffold(
      backgroundColor: kdarkblue,
      body: 
      controller.isLoading.value
       ? 
       loader
       :
      Column(
        children: [
          Container(
            color: Colors.transparent,
                  height: h*0.33,
                  child: Stack(
                    children: [
                      Container(
                        height: h*0.25,
                        width: w,
                        decoration: BoxDecoration(
                          gradient: kbluegradiant,
                          borderRadius: BorderRadius.circular(h*0.01),
                        ),
          
                      ),
                      Positioned(
                        bottom: 0,
                        left: w*0.15,
                        right: w*0.15,
                        // width: w*0.3,
          
                        child: Visibility(visible:controller.bigdata.value!.image!.isNotEmpty , child: Container(
                          height:h*0.23,width: w*0.7,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h*0.015),

                            image: DecorationImage(image: NetworkImage(controller.bigdata.value!.image.toString()),fit: BoxFit.fill,)
                          ),
                        )
                        //  Image.network(controller.bigdata.value!.image.toString() ,height:h*0.23,width: w*0.8,fit: BoxFit.contain,)
                         )
                        // Image.asset("assets/images/bitcoin.png"),height: h*0.23,
                        ),
                    ],
                  ),
                ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollcontroller,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                                  Center(
                                    child: Text(
                    // "Bitcoin, Simplified",
                    controller.bigdata.value!.title.toString(),
                    style: GoogleFonts.antonio(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor,
                      height: 2,
                    ),
                  ),
                                  ),
                  SizedBox(
                    height: h*0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: kWhiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(h*0.012),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                CircleAvatar( 
                                  radius: h*0.012,
                                  backgroundColor: kBlackColor.withOpacity(0.5),
                                  foregroundColor: kWhiteColor,
                                  child: const Icon(Icons.thumb_up_off_alt_rounded,size: 15,)),
                                Text(
                      "  90%",
                      // controller.bigdata.value!.
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: kBlackColor.withOpacity(0.5),
                        height: 2,
                      ),
                    ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: kWhiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(h*0.012),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                 Icon(Icons.groups,size: 20,color: kBlackColor.withOpacity(0.5),),
                                Text(
                      "  123",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: kBlackColor.withOpacity(0.5),
                        height: 2,
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
                    padding:  EdgeInsets.symmetric(horizontal: w*0.03),
                    child: RichText(
                      text:TextSpan(
                        text: "Description\n",
                        style: GoogleFonts.familjenGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kWhiteColor,
                          height: 2,
                          
                        ),
                        children: [
                          TextSpan(
                            text: 
                            controller.bigdata.value!.shortDescrition.toString(),
                            // "All the info to dive into the world of social media influenceing. Like the basics of creating content, growing your audience, parternships, monetization, and more",
                            style: GoogleFonts.familjenGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kWhiteColor,
                          height: 1,
                          
                        ),
                          )
                        ]
                      ) 
                      ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: w*0.03,vertical: h*0.02),
                    child: DefaultButton(width: w, height: h*0.07, text: "START", press: (){}),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: w*0.03,vertical: h*0.0),
                    child: Card(
                      color: kcardblue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.03)),
                      elevation: 8,
                      shadowColor: kWhiteColor.withOpacity(0.15),
                      child: ListView.builder(
                        controller: _scrollcontroller,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.bigdata.value!.allmodule!.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          vertical: h*0.02
                        ),
                        itemBuilder: (context,index){
                          Allmodule mod = controller.bigdata.value!.allmodule![index];
                          return InkWell(
                            onTap: (){
                                     Get.to(FlashCard(
                                                id: mod.id.toString(),
                                          title: mod.moduletitle.toString()
                                                ));
                            },
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: h*0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                    child: Text("${index+1}",style: GoogleFonts.familjenGrotesk(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                              height: 1,
                              
                                                  ),),
                                  )),
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                           mod.moduletitle.toString(), 
                                          //"What is Bitcoin?",
                                  style: GoogleFonts.familjenGrotesk(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                              height: 1,
                              
                                                  ),),
                                                  Text(
                            mod.studayMaterial.toString()+" stories",
                            // "8 stories",
                                  style: GoogleFonts.familjenGrotesk(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor,
                              height: 1.5,
                              
                                                  ),),
                                      ],
                                    )),
                                ],
                                      
                              ),
                            ),
                          );
                        },
                      )
                    ),
                  ),
                  SizedBox(
                    height: h*0.1,
                  )
                
                
                ],
              ),
            ),
          ),
        ],
      ),
    )


    );
      }
}