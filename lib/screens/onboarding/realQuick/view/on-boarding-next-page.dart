import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/list.dart';

class OnboardingNextPage extends StatefulWidget {
  const OnboardingNextPage({Key? key}) : super(key: key);

  @override
  State<OnboardingNextPage> createState() => _OnboardingNextPageState();
}

class _OnboardingNextPageState extends State<OnboardingNextPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.06,
            ),
            const Text(
              'We think you’ll like',
              style: TextStyle(
                  color: kTitleColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  20, vertical: 10),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed('/homeNav');
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kWhiteColor, boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          offset:  Offset(0,3),
                          blurRadius: 7,
                        )
                      ]),
                      height: h * 0.31,
                      width: w * 1,
                      child: Column(
                        children: [
                          Container(
                            height: h * 0.18,
                            decoration:const  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    15,
                                  ),
                                  topRight: Radius.circular(
                                    15,
                                  )),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/apps.png',
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'UI Design 101',
                                      style: TextStyle(
                                          color: kTitleColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Learn the basics of UI UX design',
                                      style: TextStyle(
                                        color: ksubtitamarketColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: h * 0.02,),
          
            InkWell(
              onTap: () {},
              child: Text(
                
                'SEE MORE OPTIONS ->',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // height: 2,
                  color: Color(0xff344356).withOpacity(0.40),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),

                SizedBox(height: h * 0.03,),
          
          ],
        ),
      ),
    ));
  }
}
