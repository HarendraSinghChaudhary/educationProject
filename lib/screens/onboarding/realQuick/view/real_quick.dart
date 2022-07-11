// ignore_for_file: prefer_const_constructors

import 'package:Ambitious/controllers/exitDialogue/exit_controller.dart';

import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';




class RealQuick extends StatefulWidget {
  const RealQuick({Key? key}) : super(key: key);

  @override
  State<RealQuick> createState() => _RealQuickState();
}

class _RealQuickState extends State<RealQuick> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //Exit Routes
       onWillPop: () => showExitPopup(context), // called from exitController
      child: SafeArea(
          child: Scaffold(
            backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                   Text(
                      'Real quick',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.02,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Are you in school?',
                      style: GoogleFonts.roboto(
                          color: kSubTitleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.03,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 44,
                        width: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                          color: kPrimaryColor,
                        ),
                        child: Text(
                          'YES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed("/quickNotification");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 44,
                        width: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Text(
                          'NO',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: Get.height * 0.04),
                TextFormField(
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                      color: kTitleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 25,bottom: 25,left: 20),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Start typing your school name...',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: kLightGreyColorwithMail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none
                    ),
                    focusColor: Colors.white,
                  ),
                ),
          
                SizedBox(height: Get.height * 0.12),

                  DefaultButton(
                      width: Get.width * 0.8,
                      height: Get.height * 0.075,
                      text: "CONTINUE",
                      press: () {
                        Get.toNamed("/quickNotification");
                       
                      }),
          
              ],
            ),
          ),
        ),
      )),
    );
  }
}
