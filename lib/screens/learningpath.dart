// ignore_for_file: prefer_const_constructors


import 'package:demo/screens/list.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class Learningpath extends StatefulWidget {
  const Learningpath({Key? key}) : super(key: key);

  @override
  State<Learningpath> createState() => _LearningpathState();
}

class _LearningpathState extends State<Learningpath> {
 final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: Get.height * 0.02,),

              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 144,
                             width: Get.width * 0.97,
                  child: ListView.builder(
                      itemCount: paths.length,
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed("/startCourse");
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
                                        color: Color(0xff344356),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 15,)
                          ],
                        );
                      }),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                  
               Text(
                      'Social Media Influencer Learning Path',
                      style: TextStyle(
                        wordSpacing: 5,
                        color: kTitleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Get.height * 0.02,),
              GridView.builder(
                padding: EdgeInsets.only(left: 21, right: 16, top: 10),
                itemCount: 6,
                controller: _controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.15,
                  crossAxisSpacing: 20,
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
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'iPhone Photography for Creators',
                            maxLines: 2,

                            style: TextStyle(
                              height: 1.2,
                              color: Color(0xff344356),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
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
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'REQUEST A TOPIC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff344356).withOpacity(0.40),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
