import 'package:demo/reusable/default_button.dart';

import 'package:demo/utils/constant.dart';
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
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: kBackgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                const  CircleAvatar(
                   radius: 130,
                   backgroundImage: AssetImage('assets/images/img_1.png'),
                 ),
                 SizedBox(
                   height: Get.height * 0.06,
                 ),
                const Text(
                   'Notifications',
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
                   'Stay notified about new course\nupdates, scoreboard stats and\n new friend follows.',
                   textAlign: TextAlign.center,
                   style: GoogleFonts.roboto(
                     height: 1.5,
                       color: kSubTitleColor,
                       fontSize: 18,
                       fontWeight: FontWeight.w400),
                 ),
                SizedBox(
                   height: Get.height * 0.05,
                 ),

  DefaultButton(
                        width: Get.width * 0.4,
                        height: Get.height * 0.070,

                        text: "ALLOW",
                        press: () {
                        Get.toNamed("/onbaordingNotificationLike");
                        }),

                         SizedBox(
                   height: Get.height * 0.02,
                 ),


                TextButton(
                    onPressed: () {
                            Get.toNamed("/onbaordingNotificationLike");
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
        ),
      )),
    );
  }
}
