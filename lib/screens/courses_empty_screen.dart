
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:demo/screens/courses_all.dart';
import 'package:demo/screens/social_me_courses.dart';
import 'package:demo/screens/social_me_people.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../utils/constant.dart';
class CoursesEmptyScreen extends StatefulWidget {
  const CoursesEmptyScreen({Key? key}) : super(key: key);

  @override
  State<CoursesEmptyScreen> createState() => _Courses_infoState();
}

class _Courses_infoState extends State<CoursesEmptyScreen> {
  @override
  Widget build (BuildContext context) {
     return SafeArea(
        child: DefaultTabController(length: 3,
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Column(
              children: [
                SizedBox(height: Get.height*0.02,),
                //TabBar for Courses and people Start code
                Container(
                  margin: EdgeInsets.symmetric(horizontal:Get.width*0.06),
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  TabBar(
                    labelColor: Colors.black,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),

                    ),
                    unselectedLabelStyle: TextStyle(
                      color: kSubTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ), tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'STUDYING',
                    ),
                    Tab(
                      text: 'SAVED',
                    ),
                  ],
                  ),
                ),
                //TabBar for Courses and people End code
                SizedBox(height: Get.height*0.04 ,),
                //TabBarView Code Start
                Expanded(child: TabBarView(
                  children: [
                   SocialmeCourses(),
                   CoursesAll(),
                   SocialmeCourses()
                 
                  ],
                )
                ),
                //TabBarView Code end
              ],
            ),
          ),
        ));
  }
}
