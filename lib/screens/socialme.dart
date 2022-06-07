// ignore_for_file: prefer_const_constructors

import 'package:demo/screens/social_me_people.dart';
import 'package:demo/screens/social_me_courses.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Socialme extends StatefulWidget {
  const Socialme({Key? key}) : super(key: key);

  @override
  State<Socialme> createState() => _SocialmeState();
}

class _SocialmeState extends State<Socialme> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(length: 2,
          child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
          children: [
            //Appbar container Social me tital Start Code
            SizedBox(
              height: Get.height * 0.06,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 110),
                    child: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    'Social Me',
                    style: TextStyle(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            //Appbar container Social me tital End Code
            SizedBox(height: Get.height*0.01,),
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
                unselectedLabelStyle:const TextStyle(
                  color: kSubTitleColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            // ignore: prefer_const_literals_to_create_immutables
            ), tabs: [
                Tab(
                  text: 'COURSES',
                ),
                Tab(
                  text: 'PEOPLE',
                ),
              ],
              ),
              ),
            //TabBar for Courses and people End code
            SizedBox(height: Get.height*0.04 ,),
            //TabBarView Code Start
            Expanded(child: TabBarView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SocialmeCourses(),
                SocialmePeople(),
              ],
            )),
            //TabBarView Code end
          ],
      ),
    ),
        ));
  }
}
