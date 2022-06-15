import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: w*0.04,top: h*0.01,bottom: h*0.001,right: w*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: Get.height*0.045,
                  width: Get.width*0.18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: Colors.white),
                  child: const Text(
                    '50 XP',
                    style: TextStyle(
                        color: Color(0xff00D9CD),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 73,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/img_3.png',
                        height: Get.height*0.04,
                        width: Get.width*0.1,
                      ),
                      SizedBox(
                        width: Get.width*0.01,
                      ),
                      Text(
                        '3',
                        style: GoogleFonts.roboto(
                            color: kSubTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
    );
  }
}
