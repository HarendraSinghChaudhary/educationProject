import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/category.dart';

import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';




class QuickNotification extends StatefulWidget {
  const QuickNotification({Key? key}) : super(key: key);

  @override
  State<QuickNotification> createState() => _PagenotificationState();
}

class _PagenotificationState extends State<QuickNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
              SizedBox(
                    height: Get.height * 0.07,
                  ),
            
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.04,
                        right: Get.width * 0.04,
                        top: Get.height * 0.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                         Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close_rounded,
                                color: kPrimaryColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                    
                      
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),

            

            const  CircleAvatar(
               radius: 80,
               backgroundImage: AssetImage('assets/images/img_1.png'),
             ),
             SizedBox(
               height: Get.height * 0.06,
             ),
            const Text(
               'Stay up to date!',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: kTitleColor,
                 fontSize: 27,
                 fontWeight: FontWeight.w500,
               ),
             ),
               SizedBox(
               height: Get.height * 0.01,
             ),
             Text(
               'Get notified every weak when\nwe add new courses, features &\n host events.',
               textAlign: TextAlign.center,
               style: GoogleFonts.roboto(
                 height: 1.5,
                   color: kSubTitleColor,
                   fontSize: 18,
                   fontWeight: FontWeight.w400),
             ),
            SizedBox(
               height: Get.height * 0.09,
             ),

  DefaultButton(
                    width: Get.width * 0.8,
                    height: Get.height * 0.070,

                    text: "ALLOW NOTIFICATIONS",
                    press: () {
                     Get.to(Category());
                    }),

                     SizedBox(
               height: Get.height * 0.02,
             ),


            TextButton(
                onPressed: () {
                        Get.to(Category());
                },
                child: Text(
                  'SKIP',
                  style: GoogleFonts.roboto(color: kLightGreyColorwithMail,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
            ),
          ],
        ),
      ),
    );
  }
}
