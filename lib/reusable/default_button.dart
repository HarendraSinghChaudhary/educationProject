// ignore_for_file: file_names

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
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
        style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 17,
                         height: 1,
                        fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}