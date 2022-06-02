// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartCourse extends StatefulWidget {
  const StartCourse({Key? key}) : super(key: key);

  @override
  State<StartCourse> createState() => _StartCourseState();
}

class _StartCourseState extends State<StartCourse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 82,
          leading: Container(
            margin: const EdgeInsets.only(top: 12, bottom: 9, left: 12),
            alignment: Alignment.center,
            height: 25,
            width: 73,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26), color: Colors.white),
            child: const Text(
              '50 XP',
              style: TextStyle(
                  color: Color(0xff00D9CD),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: Color(0xffE5E5E5).withOpacity(0),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  Text(
                    '🔥',
                    style: TextStyle(fontSize: 20),
                  ),
                const  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '3',
                    style: GoogleFonts.roboto(
                        color: Color(0xff344356).withOpacity(0.40),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
         Container(
              width: 375,
              height: 175,
              child: Image.asset('assets/images/startcourse.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24,top: 15),
              child: Row(
                children: [
                 const Text(
                    'Bitcoin & The Blockchain',
                    style: TextStyle(
                      color: Color(0xff344356),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 32,),
                  Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xff5468FF)
                    ),
                    child: Icon(Icons.bookmark_border,size: 14,color: Colors.white,),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24,),
              child: Row(
                children: [
                  Container(
                    height: 29,
                    width: 29,
                    margin: EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset('assets/images/Oval.png'),
                  ),
                  Text(
                    'Dante Orlando',
                    style: TextStyle(
                      color: Color(0xff344356),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9,),
            GestureDetector(
              onTap: (){
                },
              child: Container(
                alignment: Alignment.center,
                height: 58,
                width: 315,
                decoration: BoxDecoration(
                  color: Color(0xff5468FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:   Text(
                  'START COURSE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 19,),
            Container(
              width: 305,
              height: 335,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Image.asset('assets/images/progress (1).png'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40,bottom: 20),
                    width: 225,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Fundamentals of Bitcoin',
                              style: TextStyle(
                                  color: Color(0xff5468FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What is Bitcoin?',
                              style: TextStyle(
                                  color: Color(0xff344356),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Where did Bitcoin come from?',
                              style: TextStyle(
                                  color: Color(0xff344356).withOpacity(0.60),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Decentralization',
                              style: TextStyle(
                                  color: Color(0xff344356),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'The reason you can’t fake Bitcoins',
                              style: TextStyle(
                                  color: Color(0xff344356).withOpacity(0.60),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mining Bitcoin',
                              style: TextStyle(
                                  color: Color(0xff344356),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Bitcoins are scarce. How?',
                              style: TextStyle(
                                  color: Color(0xff344356).withOpacity(0.60),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Store of Value',
                              style: TextStyle(
                                  color: Color(0xff344356),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Why is it worth so much?',
                              style: TextStyle(
                                  color: Color(0xff344356).withOpacity(0.60),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
