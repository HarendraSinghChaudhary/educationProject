import 'package:Ambitious/reusable/default_button_plus.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'badges.dart';

class OtherProfileBadges extends StatefulWidget {
  const OtherProfileBadges({Key? key}) : super(key: key);

  @override
  State<OtherProfileBadges> createState() => _OtherProfileBadgesState();
}

class _OtherProfileBadgesState extends State<OtherProfileBadges> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: kPrimaryColor),
          leading: const BackButton(),
        ),
        body: Column(
            children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    height: Get.height * 0.17,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kWhiteColor, width: 10),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.2),
                            offset: const Offset(01, 0.5),
                            spreadRadius: 0.1,
                            blurRadius: 11,
                          ),
                        ],
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profilelogo.jpg'))),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    'Navaeh Griffith',
                    style: TextStyle(
                        color: kTitleColor, fontWeight: FontWeight.w700, fontSize: 28),
                  ),
                  const Text(
                    '289,490 XP',
                    style: TextStyle(
                        color: kSubTitleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(height: Get.height*0.054,),
                  DefaultButtonPlus(
                      width: Get.height * 0.38,
                      height: Get.width * 0.17,
                      text: 'ADD FRIEND',
                      press: () {}),
                  SizedBox(height: Get.height*0.016 ,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:Get.width*0.085),
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  TabBar(
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(color: kTitleColor,fontSize: 14,fontWeight: FontWeight.w700),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),

                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: kSubTitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ), tabs: const [
                      Tab(
                        text: 'Badges',
                      ),
                      Tab(
                        text: 'Friends',
                      ),
                      Tab(
                        text: 'Courses',
                      ),
                    ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.017,),
                  const Expanded(child: TabBarView(
                    children: [
                      Badges(),
                      Badges(),
                      Badges(),
                    ],
                  )
                  ),
                ],
              ),
        ),
          ),
        );
  }
}
