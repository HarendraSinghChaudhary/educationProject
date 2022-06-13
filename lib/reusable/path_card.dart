// ignore_for_file: prefer_const_constructors

import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





class PathCard extends StatelessWidget {
  const PathCard({

     Key? key,
    required this.text,
    required this.press,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return  Row(
                        children: [
                          InkWell(
                            onTap: press,
                            child: Container(
                              width: Get.width*0.35,
                              height: Get.height*0.17,
                              decoration: BoxDecoration(
                                               
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                          
                                        image: DecorationImage(
                                            image:AssetImage(
                                              image,
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    text,
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
    
  }
}