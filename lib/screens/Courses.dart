import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        body: Scaffold(
          backgroundColor: Color(0xffF3F5F9),
          body: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Digital Marketing',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Row(
                    children: [
                      Container(
                        height: 141,
                        width: 360,
                        child: ListView.builder(
                            itemCount: Paths.length,
                            scrollDirection: Axis.horizontal,
                            controller: _controller,

                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 21,
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 131,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 72,
                                            width: 131,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
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
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Entrepreneursip',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Row(
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
                                  left: 21,
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 131,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 72,
                                            width: 131,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
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
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Cryptocurrencies & NFTs',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Row(
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
                                  left: 21,
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 131,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 72,
                                            width: 131,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
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
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Digital Marketing',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Row(
                    children: [
                      Container(
                        height: 141,
                        width: 360,
                        child: ListView.builder(
                            itemCount: Paths.length,
                            scrollDirection: Axis.horizontal,
                            controller: _controller,

                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 21,
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 131,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 72,
                                            width: 131,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(15)),
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
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}
