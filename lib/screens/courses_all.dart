// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constant.dart';


class CoursesAll extends StatefulWidget {
  const CoursesAll({Key? key}) : super(key: key);

  @override
  State<CoursesAll> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<CoursesAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Center(
            child: Image.asset('assets/images/nocourses.png'),
          ),
         const Text(
            'No Courses!',
            style: TextStyle(
                color: kTitleColor, fontSize: 20, fontWeight: FontWeight.w600,),
          ),
         const Text(
            'Choose a course from\nCourses tab or use the button\nbelow to start.',
            style: TextStyle(
              color: kSubTitleColor,
              fontSize: 20,
              height: 1.5
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height*0.04,),
          Container(
            height: Get.height*0.08,
            width: Get.width*0.1750,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor,
                  blurRadius: 4,
                  spreadRadius: 0.2,
                  offset: Offset(0.2,0.2)
                )
              ]
            ),
            child: Icon(Icons.add,color: Colors.white,size: 35,),
          )

        ],
      ),
    );
  }
}
