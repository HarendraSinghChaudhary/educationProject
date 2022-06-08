// ignore_for_file: camel_case_types

import 'package:demo/controllers/exit_controller.dart';
import 'package:demo/screens/courses/courseHeader/view/course_header.dart';
import 'package:demo/screens/home/view/home_live.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/view/home.dart';


class HomeNav extends StatefulWidget {
  const HomeNav ({Key? key}) : super(key: key);

  @override
  State<HomeNav> createState() => _bottombarState();
}

class _bottombarState extends State<HomeNav > {
  int _selectindex = 0;

  static const List<Widget> _widgetOption = <Widget>[
   Home(),
   CourseHeader(),
   HomeLive(),
  ];

  void _onitemTape(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Exit Route
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOption.elementAt(_selectindex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/home.svg',
                  color:
                      _selectindex == 0 ? kPrimaryColor : kTitleColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/courses.svg',
                  color:
                      _selectindex == 1 ? kPrimaryColor : kTitleColor),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/profile.svg',
                  color:
                      _selectindex == 2 ? kPrimaryColor : kTitleColor),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectindex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kTitleColor,
          // selectedIconTheme: IconThemeData(color: Color(0xff201CE0)),
          // unselectedIconTheme: IconThemeData(color: Color(0xffff201CE0)),
          onTap: _onitemTape,
          backgroundColor: Colors.white,
          selectedLabelStyle:const TextStyle(
            color: kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
