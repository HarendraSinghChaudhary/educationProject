import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Function() press;

  SkipButton(
      {required this.height,
      required this.width,
      required this.text,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: kSubTitleColor)),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: press,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kSubTitleColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
