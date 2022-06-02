import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'list.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF3F5F9),
        body: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
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
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 73,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/img_3.png',
                            height: 28,
                            width: 24,
                          ),
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( 'Hi, Zayan 👋🏼',
                  style: TextStyle(
                    color: Color(0xff344356),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5 ),
                height: 51,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22,right: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 27,
                            width: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                              color: Color(0xffAEB8FF),
                            ),
                            child: Icon(
                              Icons.help,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                          Container(padding: EdgeInsets.all(6),
                              height: 27,
                              width: 27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: Color(0xffAEB8FF),
                              ),
                              child: SvgPicture.asset('assets/images/Shape.svg',)
                          ),
                          Container(
                            height: 27,
                            width: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                              color: Color(0xffAEB8FF),
                            ),
                            child:Icon(Icons.message,color: Colors.white,size: 18,)
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Request Topic',
                          style: TextStyle(
                            color: Color(0xff344356),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Redeem Points',
                          style: TextStyle(
                            color: Color(0xff344356),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                            color: Color(0xff344356),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      '📈 LEARNING PATH',
                      style: TextStyle(
                        color: Color(0xff344356),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
               Row(
          children: [
            Container(
              height: 150,
              width: 340,
              child: ListView.builder(
                  itemCount: Paths.length,
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 141,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Container(
                                  height: 72,
                                  width: 162,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            Paths[index]["image"]
                                                .toString(),
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    Paths[index]['name'].toString(),
                                    style: TextStyle(
                                      color: Color(0xff344356),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
      ),
              SizedBox(height:24,),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/images/img_3.png',
                    //   height: 28,
                    //   width: 24,
                    // ),
                    Text(
                      '🔥 HOT COURSES',
                      style: TextStyle(
                        color: Color(0xff344356),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.only(left: 21,right: 21),
                shrinkWrap: true,
                itemCount: Hot.length,
                controller: _controller,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 132,
                    width: 160.53,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 81,
                          width: 176,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Hot[index]["image"].toString()),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Column(
                            children: [
                              Text(Hot[index]["name"].toString(),
                                style: TextStyle(
                                  color: Color(0xff344356),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                bottom: 1,
                              ),
                              child: Text(
                                '12 Shorts',
                                style: TextStyle(
                                  color: Color(0xff344356).withOpacity(0.40),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80,bottom: 3),
                              child: Icon(Icons.bookmark_border,size: 15,),
                            )

                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
