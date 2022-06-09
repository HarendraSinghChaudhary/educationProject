// ignore_for_file: prefer_const_constructors

import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';


class TrendingCard extends StatelessWidget {

   const TrendingCard({

     Key? key,
    required this.text,
    required this.press,
    required this.image,
    required this.userImage,
    required this.points,
    required this.subTitle
  }) : super(key: key);
  final String text;
  final String image;
  final String userImage;
  final String points;
  final String subTitle;
  final Function() press;
 

  @override
  Widget build(BuildContext context) {
    return          Container(
                  
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
                                image: AssetImage(image),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 6),
                          child: Text(
                                text,
                                style: TextStyle(
                                  color: kTitleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        ),
                      const  SizedBox(
                          height: 10,
                        ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                                bottom: 1,
                              ),
                              child: Text(
                                subTitle,
                                style: TextStyle(
                                  color: kLightGreyColorwithMail,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),


                           const Icon(Icons.bookmark_border_outlined)
                           
                          
                          
                          ],
                        ),

                        // SizedBox(height: Get.height * 0.01,)
                      ],
                    ),
                  );
    
  }
}