import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/profile_completed.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'courses_all.dart';
class ProfileOne extends StatefulWidget {
  const ProfileOne({Key? key}) : super(key: key);

  @override
  State<ProfileOne> createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserList();
  }
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: 3,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body:
          Container(
            child: Column(
                children: [
                  //Row for settings icons code Start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(Get.height*0.02),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed("/settings");
                          },
                            child: const Icon(Icons.settings,color: kTitleColor,)),
                      )
                    ],
                  ),
                  //Row for settings icons code Start
                  SizedBox(height: Get.height*0.02,),
                  Text(
                    '👋🏼 Hello,\n${name}!',
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
                    margin: EdgeInsets.only(top:Get.height*0.02,left:Get.width*0.05,right: Get.width*0.05 ),
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  TabBar(
                      automaticIndicatorColorAdjustment: false,
                      indicatorPadding: EdgeInsets.zero,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      
                      unselectedLabelStyle: const TextStyle(
                        color: kSubTitleColor,
                        fontSize: 12,
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
    ),
    );
  }

     Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());
  

    setState(() {});
  }
}
