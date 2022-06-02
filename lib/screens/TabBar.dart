import 'package:demo/screens/Courses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'learningpath.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 82,
          leading:  Container(
            margin: EdgeInsets.only(top: 12,bottom: 9,left: 12),
            alignment: Alignment.center,
            height: 25,
            width: 73,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Colors.white),
            child: Text(
              '50 XP',
              style: TextStyle(
                  color: Color(0xff00D9CD),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: Color(0xffE5E5E5).withOpacity(0),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🔥',style: TextStyle(fontSize: 20),),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '3',
                    style: GoogleFonts.roboto(
                        color: Color(0xff344356).withOpacity(0.40),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),

          ],
        ),
        body:
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 21,vertical: 5),
            height: 44,
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TabBar(
              unselectedLabelStyle: TextStyle(
                color: Color(0xff344356),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

              ),
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Learning paths',
                ),
                Tab(
                  text: 'ALL courses',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              Learningpath(),
              Courses(),
            ]),
          )
        ],
      ),
      ),
    )
    );
  }
}
