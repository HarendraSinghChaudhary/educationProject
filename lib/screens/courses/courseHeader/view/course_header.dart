// ignore_for_file: prefer_const_constructors

import 'package:demo/screens/courses/allCourses/view/all_courses.dart';

import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../learningPath/view/learning_path.dart';

class CourseHeader extends StatefulWidget {
  const CourseHeader({Key? key}) : super(key: key);

  @override
  State<CourseHeader> createState() => _TabbarState();
}

class _TabbarState extends State<CourseHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 82,
          leading:  Container(
            margin:const EdgeInsets.only(top: 12,bottom: 9,left: 12),
            alignment: Alignment.center,
            height: 25,
            width: 73,
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
          backgroundColor: kBackgroundColor,

          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  Text('🔥',style: TextStyle(fontSize: 20),),
                const  SizedBox(
                    width: 2,
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
            ),

          ],
        ),
        body:
      Column(
        children: [
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
              LearningPath(),
              AllCourses(),
            ]),
          )
        ],
      ),
      ),
    )
    );
  }
}
