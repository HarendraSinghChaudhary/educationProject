// ignore_for_file: prefer_const_constructors

import 'package:demo/screens/StartCourse.dart';
import 'package:demo/screens/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Learningpath extends StatefulWidget {
  const Learningpath({Key? key}) : super(key: key);

  @override
  State<Learningpath> createState() => _LearningpathState();
}

class _LearningpathState extends State<Learningpath> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F5F9),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Row(
                children: [
                  Container(
                    height: 144,
                    width: 360,
                    child: ListView.builder(
                        itemCount: Paths.length,
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 21,
                              top: 15,
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => StartCourse()));
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
                                                  image: AssetImage(
                                                    Paths[index]["image"]
                                                        .toString(),
                                                  ),
                                                  fit: BoxFit.fill)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          Paths[index]['name'].toString(),
                                          style: TextStyle(
                                            color: Color(0xff344356),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                
             Text(
                    'Social Media Influencer Learning Path',
                    style: TextStyle(
                      color: Color(0xff344356),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.only(left: 21, right: 16, top: 10),
              itemCount: 20,
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 124,
                  width: 160.53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 81,
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
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Text(
                              'Edit Jaw Dropping Videos',
                              maxLines: 2,
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'REQUEST A TOPIC',
              style: TextStyle(
                color: Color(0xff344356).withOpacity(0.40),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
