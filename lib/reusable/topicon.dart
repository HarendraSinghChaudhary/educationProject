import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constant.dart';
class Topicon extends StatelessWidget {
  const Topicon ({required this.width, required this.height, required this.text, Key? key,}):super(key: key);
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: kCyanColor, fontWeight: FontWeight.w600,fontSize: 16),
      ),
    );
  }
}