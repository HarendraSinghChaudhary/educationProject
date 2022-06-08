import 'package:demo/screens/profile_completed.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'courses_all.dart';
class ProfileOne extends StatefulWidget {
  const ProfileOne({Key? key}) : super(key: key);

  @override
  State<ProfileOne> createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: 3,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
            children: [
              //Row for settings icons code Start
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(Get.height*0.02),
                    child: const Icon(Icons.settings,color: kTitleColor,),
                  )
                ],
              ),
              //Row for settings icons code Start
              SizedBox(height: Get.height*0.02,),
              const Text(
                '👋🏼 Hello,\nAntonio Perez!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTitleColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Get.height*0.02,),
              const Text('134,679 XP',style: TextStyle(fontSize: 20,color: kSubTitleColor,fontWeight: FontWeight.w500),),
              SizedBox(height: Get.height*0.01,),
              Container(
                margin: EdgeInsets.only(top:Get.height*0.02,left:Get.width*0.06,right: Get.width*0.06 ),
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
                  unselectedLabelStyle: const TextStyle(
                    color: kSubTitleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ), tabs: const [
                  Tab(
                    text: 'SAVED',
                  ),
                  Tab(
                    text: 'COMPLETED',
                  ),
                  Tab(
                    text: 'WIP',
                  ),
                ],
                ),
              ),
              //TabBar for Courses and people End code
              SizedBox(height: Get.height*0.04 ,),
              //TabBarView Code Start
              const Expanded(child: TabBarView(
                children: [
                  ProfileCompleted(),
                  ProfileCompleted(),
                  ProfileCompleted(),

                ],
              ))
            ],
          ),

      ),
    ),
    );
  }
}
