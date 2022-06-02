import 'package:demo/screens/HomePage.dart';
import 'package:demo/screens/Realquick.dart';
import 'package:demo/screens/StartCourse.dart';
import 'package:demo/screens/TabBar.dart';
import 'package:demo/screens/bottombar.dart';
import 'package:demo/screens/intropage.dart';
import 'package:demo/screens/newaccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}


 // This widget is the root of your application.

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      title: "Education On Demand",
      home: const IntroPage(),
    );
  }
}

