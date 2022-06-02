import 'package:demo/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Courses.dart';
import 'HomePage.dart';
import 'TabBar.dart';

class bottombar extends StatefulWidget {
  const bottombar({Key? key}) : super(key: key);

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  int _selectindex = 0;

  static const List<Widget> _widgetOption = <Widget>[
    HomePage(),
    Tabbar(),
    Profile(),
  ];

  void _onitemTape(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOption.elementAt(_selectindex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home.svg',
                color:
                    _selectindex == 0 ? Color(0xff201CE0) : Color(0xff344356)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/courses.svg',
                color:
                    _selectindex == 1 ? Color(0xff201CE0) : Color(0xff344356)),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg',
                color:
                    _selectindex == 2 ? Color(0xff201CE0) : Color(0xff344356)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectindex,
        selectedItemColor: Color(0xff201CE0),
        unselectedItemColor: Color(0xff344356),
        // selectedIconTheme: IconThemeData(color: Color(0xff201CE0)),
        // unselectedIconTheme: IconThemeData(color: Color(0xffff201CE0)),
        onTap: _onitemTape,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Color(0xff5468FF),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
