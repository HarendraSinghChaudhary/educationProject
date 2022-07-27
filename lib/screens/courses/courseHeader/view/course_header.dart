// ignore_for_file: prefer_const_constructors

import 'package:Ambitious/screens/courses/allCourses/view/all_courses.dart';

import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../reusable/home_header.dart';
import '../../learningPath/view/learning_path.dart';

class CourseHeader extends StatefulWidget {
  RxInt index;

  CourseHeader({required this.index});





  @override
  State<CourseHeader> createState() => _TabbarState();
}

class _TabbarState extends State<CourseHeader> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body:
      Column(
        children: [
          SizedBox(height:  Get.height * 0.05,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            height: 44,
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TabBar(
              unselectedLabelStyle: const TextStyle(
                color: kTitleColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

              ),
              labelColor: Colors.black,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Tab(
                  text: 'LEARNING PATHS',
                ),
              
                Tab(
                  text: 'ALL COURSES',
                ),
              ],
            ),
          ),
          Expanded(
            // ignore: prefer_const_literals_to_create_immutables
            child: TabBarView(children: [
              LearningPath(
                indexPath: widget.index,
              
              ),
              AllCourses(),
            ]),
          )
        ],
      ),
      ),
    );
  }
}
