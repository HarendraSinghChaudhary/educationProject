import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage.dart';
import 'bottombar.dart';

class Pagenotification extends StatefulWidget {
  const Pagenotification({Key? key}) : super(key: key);

  @override
  State<Pagenotification> createState() => _PagenotificationState();
}

class _PagenotificationState extends State<Pagenotification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF3F5F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 50, right: 50),
              child: Container(
                width: double.infinity,
                height: 480,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/images/img_1.png'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Notifications',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff344356),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      'Stay notified about new course\nupdates, scoreboard stats and\n new friend follows.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: Color(0xff344356).withOpacity(0.80),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 58,
              width: 148,
              decoration: BoxDecoration(
                color: Color(0xff5468FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    'ALLOW',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width:18,),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff3D56F0),
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SizedBox(height: 36,),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bottombar()));
                },
                child: Text(
                  'SKIP',
                  style: GoogleFonts.roboto(color: Color(0xff344356).withOpacity(0.40),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )
            ),
          ],
        ),
      ),
    ));
  }
}
