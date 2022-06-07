// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:demo/utils/constant.dart';
import 'package:demo/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
  
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // topbar 50Xp and notification icon

              SizedBox(height: Get.height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 73,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.white),
                    child:const Text(
                      '50 XP',
                      style: TextStyle(
                          color: Color(0xff00D9CD),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 73,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/img_3.png',
                          height: 28,
                          width: 24,
                        ),
                        SizedBox(
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
                  )
                ],
              ),
              //topbar 50Xp and notification icon
            SizedBox(height: Get.height * 0.02,),
              //user name and other icons
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                     
                     
                      // color: Colors.blue,
                      // padding: EdgeInsets.only(left: 23),
                      height: 150,
                      width: 170,
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                  color: Color(0xffAEB8FF),
                                ),
                                child: Icon(
                                  Icons.help,
                                  color: Colors.white,
                                  size: 13,
                                ),
                              ),
                              SizedBox(
                                width: 10,
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
                            height: 12,
                          ),
                          Row(
                            children: [
                              Container(padding: EdgeInsets.all(6),
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                  color: Color(0xffAEB8FF),
                                ),
                                child: SvgPicture.asset('assets/images/Shape.svg',)
                              ),
                              SizedBox(
                                width: 10,
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
                            height: 12,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1),
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                  color: Color(0xffAEB8FF),
                                ),
                                child:Icon(Icons.message,color: Colors.white,size: 13,)
                              ),
                              SizedBox(
                                width: 10,
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
                   
                      height: 144,
                      width: 176,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                             color: Colors.white,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 81,
                            width: 176,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/img_4.png'),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11,
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
                            height: 5,
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
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: Get.height * 0.03,),
                      Text(
                        '📈 PATHS',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),


                      SizedBox(height: Get.height * 0.02,),


                        
              SizedBox(
                height: 144,
                width: 360,
                child: ListView.builder(
                    itemCount: paths.length,
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed("/coursesEmptyScreen");

                            },
                            child: Container(
                              width: 131,
                              height: 140,
                              decoration: BoxDecoration(
                                               
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Container(
                                    height: 72,
                                    width: 131,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                          
                                        image: DecorationImage(
                                            image:AssetImage(
                                              paths[index]["image"]
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    paths[index]['name'].toString(),
                                    style: TextStyle(
                                      color: kTitleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: Get.width * 0.03,)
                        ],
                      );
                    }),
              ),

              SizedBox(height: Get.height * 0.03,),

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
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                itemCount: 4,
                controller: _controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                  
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 85,
                          width: 176,
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
                          padding: const EdgeInsets.only(left: 6),
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
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
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
                                width: 38,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 15,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundImage: AssetImage("assets/images/Oval.png", ),
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 2.5),
                                      height: 16,
                                      width: 16,
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
                                              fontSize: 7, color: Colors.black,fontWeight: FontWeight.w700),
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

              SizedBox(height: Get.height * 0.03,)
            ],
          ),
        ),
      ),
    ));
  }
}
