// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:Ambitious/reusable/home_header.dart';
import 'package:Ambitious/reusable/path_card.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // topbar 50Xp and notification icon
          HomeHeader(),
          //topbar 50Xp and notification icon
          SizedBox(
            height: Get.height * 0.02,
          ),
          //user name and other icons
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width*0.001),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height *0.18,
                  width: Get.width*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Zayan 👋🏼',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Row(
                        children: [
                          Container(
                            height: Get.height * 0.035,
                            width: Get.width*0.076,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffAEB8FF),
                            ),
                            child: Icon(
                              Icons.help,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                          SizedBox(
                            width: Get.width*0.03,
                          ),
                          Text(
                            'Request Topic',
                            style: TextStyle(
                              color: Color(0xff344356),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height*0.014,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(6),
                              height: Get.height * 0.035,
                              width: Get.width*0.076,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffAEB8FF),
                              ),
                              child: SvgPicture.asset(
                                'assets/images/Shape.svg',
                              )),
                          SizedBox(
                            width: Get.width*0.03,
                          ),
                          Text(
                            'Redeem Points',
                            style: TextStyle(
                              color: Color(0xff344356),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height*0.014,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(1),
                              height: Get.height * 0.035,
                              width: Get.width*0.076,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffAEB8FF),
                              ),
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 13,
                              )),
                          SizedBox(
                            width: Get.width*0.03,
                          ),
                          Text(
                            'Invite Friends',
                            style: TextStyle(
                              color: Color(0xff344356),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height*0.177,
                  width: Get.width*0.48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height*0.1,
                        width: Get.width*0.48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/img_4.png',),fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height*0.015,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.74),
                        child: Text(
                          'LIVE Thursday 7pm',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height*0.001,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.74),
                            child: Text(
                              'What are NFTs?',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 9.20),
                              child: InkWell(
                                onTap: () {
                                  Get.snackbar(
                                      "You will be notified when this event starts!",
                                      "");
                                },
                                child: Icon(
                                  Icons.add_alert,
                                  size: 20,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //user name and other icons

          Container(
            margin: EdgeInsets.only(left: 1,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  '📈 PATHS',
                  style: TextStyle(
                    color: Color(0xff344356),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  height: Get.height * 0.166,
                  width: Get.width*0.9,
                  child: ListView.builder(
                      itemCount: paths.length,
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return PathCard(
                            text: paths[index]['name'].toString(),
                            press: () {
                              Get.toNamed("/coursesEmptyScreen");
                            },
                            image: paths[index]["image"].toString(),);
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  '🔥 TRENDING',
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              // Image.asset(
              //   'assets/images/img_3.png',
              //   height: 28,
              //   width: 24,
              // ),
            ],
          ),
          GridView.builder(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            itemCount: 4,
            controller: _controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Get.width*0.02,
              childAspectRatio: 1.1,
              crossAxisSpacing: Get.height*0.01,
            ),
            itemBuilder: (BuildContext context, int index) {
              return




              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.1,
                      width:  Get.width * 0.44,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/img_4.png'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.02),
                      child: Column(
                        children: [
                          Text(
                            'Bitcoin & Blockchain',
                            style: TextStyle(
                              color: kTitleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:Get.height*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(
                            left: Get.width*0.02,
                            bottom: 1,
                          ),
                          child: Text(
                            '12 Shorts',
                            style: TextStyle(
                              color: kLightGreyColorwithMail,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1.3),
                          child: Container(
                            width: Get.width*0.1,
                            child: Stack(
                              children: [
                                Positioned(
                                    right:  Get.width*0.038,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundImage: AssetImage(
                                        "assets/images/Oval.png",
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(top: Get.height*0.0001),
                                  height: Get.height*0.02,
                                  width:Get.width*0.049,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Color(0xff979797),
                                          width: 1)),
                                  child: Center(
                                    child: Text(
                                      "+25",
                                      style: TextStyle(
                                          fontSize: 7,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(height: Get.height * 0.01,)
                  ],
                ),
              );
            },
          ),

          SizedBox(
            height: Get.height * 0.03,
          )
        ],
      ),
    ),
      ),
    );
  }
}
