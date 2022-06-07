// ignore_for_file: file_names, deprecated_member_use

import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';









class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.width,
    required this.height,
     Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function() press;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child:  FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kPrimaryColor,
        onPressed: press,
        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const SizedBox(width: 20,),
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kArrowBackgroundColor,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
      ),
    );
  }
}