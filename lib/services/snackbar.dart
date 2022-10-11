


import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showSnack(String title, [String? msg])async{
 return Get.snackbar(
    title, 
    msg??"",
    // maxWidth: w*0.8,
    duration: const Duration(seconds: 2),
    titleText: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
        ),
      ),
    ),
    messageText: Center(
      child: Text(
        msg??"",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700
        ),
      ),
    ),
    backgroundColor: kWhiteColor,
    );
}
Future showBottumSheet(Widget child)async{
  Get.bottomSheet(
      child,
      isScrollControlled: true,
    );
}