import 'package:demo/screens/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            // topbar 50Xp and notification icon
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
            //topbar 50Xp and notification icon
            SizedBox(
              height: 15,
            ),
            //user name and other icons
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  // color: Colors.blue,
                  // padding: EdgeInsets.only(left: 23),
                  height: 150,
                  width: 170,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Hi, Zayan 👋🏼',
                          style: TextStyle(
                            color: Color(0xff344356),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Row(
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
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Request Topic',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Row(
                          children: [
                            Container(padding: EdgeInsets.all(6),
                              height: 27,
                              width: 27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: Color(0xffAEB8FF),
                              ),
                              child: SvgPicture.asset('assets/images/Shape.svg',)
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Redeem Points',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(1),
                              height: 27,
                              width: 27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: Color(0xffAEB8FF),
                              ),
                              child:Icon(Icons.message,color: Colors.white,size: 13,)
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Invite Friends',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 144,
                    width: 176,
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
                              image: AssetImage('assets/images/img_4.png'),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.74),
                          child: Text(
                            'LIVE Thursday 7pm',
                            style: TextStyle(
                              color: Color(0xff5468FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.74),
                              child: Text(
                                'What are NFTs?',
                                style: TextStyle(
                                  color: Color(0xff344356),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 9.20),
                                child: Icon(
                                  Icons.add_alert,
                                  size: 18,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //user name and other icons
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 15),
              child: Row(
                children: [
                  Text(
                    '📈 PATHS',
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
                  height: 144,
                  width: 360,
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
                                width: 131,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 72,
                                      width: 131,
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
                                    Text(
                                      Paths[index]['name'].toString(),
                                      style: TextStyle(
                                        color: Color(0xff344356),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
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
            SizedBox(
              height: 15,
            ),
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
                    '🔥 TRENDING',
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
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              itemCount: 20,
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 124,
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
                              image: AssetImage('assets/images/img_4.png'),
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
                            Text(
                              'What are NFTs?',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: const EdgeInsets.only(bottom: 1.3),
                            child: Container(
                              width: 38,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 15,
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffD67df2)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 2.5),
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xff979797),
                                            width: 1)),
                                    child: Text(
                                      "+25",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7, color: Colors.black,fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
