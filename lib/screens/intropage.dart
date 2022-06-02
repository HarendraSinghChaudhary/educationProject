// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'newaccount.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: Get.height * 0.1,),

         Image.asset("assets/images/Ambitious.png"),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Center(
              child: Container(
                height: Get.height * 0.2,
                width: Get.height * 0.2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_1.png'),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 64,
          ),
          Text(
            'Learn how to be a',
            style: TextStyle(
              color: kTitleColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Influencer',
            style: TextStyle(
              color: Color(0xff131F7C),
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Acquire tech skills by watching\nstory-style courses',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff344356).withOpacity(0.80),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.20,
            ),
          ),
          SizedBox(
            height: 43,
          ),
          Container(
            padding: EdgeInsets.only(left: 2),
            height: 56,
            width: 277,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Color(0xff4f86eb),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  height: 53,
                  width: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/googlelogog.png',
                    height: 10,
                    width: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 25),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

           Platform.isIOS ?
          Container(
            height: 50,
            width: 277,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/img_11.png'),
            )),
          ) : Container(),
          SizedBox(
            height: 10,
          ),

        
          GestureDetector(
            onTap: () {

              Get.to(Newaccount());
         
            },
            child: Text(
              'SIGN UP WITH EMAIL',
              style: TextStyle(
                color: kLightGreyColorwithMail,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
