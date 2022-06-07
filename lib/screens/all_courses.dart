import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/list.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({Key? key}) : super(key: key);

  @override
  State<AllCourses> createState() => _CoursesState();
}

class _CoursesState extends State<AllCourses> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return 
   
   
        Scaffold(
          backgroundColor: kBackgroundColor,
          body: SingleChildScrollView(
           
            child: Container(
              margin:const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   SizedBox(height: Get.height * 0.02,),

                 const Text(
                       'Digital Marketing',
                       style: TextStyle(
                         color: kTitleColor,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                       ),
                     ),

                  SizedBox(height: Get.height * 0.02,),
                     Row(
                       children: [
                         SizedBox(
                           
                           height: 144,
                           width: Get.width * 0.97,
                           child: ListView.builder(
                             padding: EdgeInsets.zero,
                               itemCount: paths.length,
                               scrollDirection: Axis.horizontal,
                               controller: _controller,
                               itemBuilder: (BuildContext context, int index) {
                                 return Row(
                                   children: [
                                     InkWell(
                                       onTap: () {
                                         Get.toNamed("/startCourse");
                                       },
                                       child: Container(
                                      
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(15),
                                             color: Colors.white),
                                         child: Column(
                                           children: [
                                             Container(
                                               height: 72,
                                               width: 131,
                                               decoration: BoxDecoration(
                                                   borderRadius: const BorderRadius.only(
                                                       topLeft: Radius.circular(15),
                                                       topRight: Radius.circular(15)),
                                                   image: DecorationImage(
                                                       image: AssetImage(
                                                         paths[index]["image"]
                                                             .toString(),
                                                       ),
                                                       fit: BoxFit.fill)),
                                             ),
                                           const  SizedBox(
                                               height: 10,
                                             ),
                                             Text(
                                               paths[index]['name'].toString(),
                                               style:const TextStyle(
                                                 color: Color(0xff344356),
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w400,
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),

                                    const SizedBox(width: 15,)
                                   ],
                                 );
                               }),
                         ),
                       ],
                     ),
                  SizedBox(
                    height:Get.height * 0.03,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Entrepreneursip',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                    SizedBox(
                    height:Get.height * 0.02,
                  ),

                            SizedBox(
                              height: 144,
                           width: Get.width * 0.97,
                              child: ListView.builder(
                                  itemCount: paths.length,
                                  scrollDirection: Axis.horizontal,
                                  controller: _controller,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed("/startCourse");
                                          },
                                          child: Container(
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
                                                      borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(15),
                                                          topRight: Radius.circular(15)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                            paths[index]["image"]
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.fill)),
                                                ),
                                               const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  paths[index]['name'].toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xff344356),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                       const SizedBox(width: 15,)
                                      ],
                                    );
                                  }),
                            ),
                  
                  SizedBox(
                    height:Get.height * 0.03,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Cryptocurrencies & NFTs',
                        style: TextStyle(
                          color: Color(0xff344356),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                    SizedBox(
                    height:Get.height * 0.02,
                  ),
                            SizedBox(
                              height: 144,
                           width: Get.width * 0.97,
                              child: ListView.builder(
                                  itemCount: paths.length,
                                  scrollDirection: Axis.horizontal,
                                  controller: _controller,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed("/startCourse");
                                          },
                                          child: Container(
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
                                                      borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(15),
                                                          topRight: Radius.circular(15)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                            paths[index]["image"]
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.fill)),
                                                ),
                                              const  SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  paths[index]['name'].toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xff344356),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                      const  SizedBox(width: 15,)
                                      ],
                                    );
                                  }),
                            ),
                 
                 const SizedBox(
                    height: 15,
                  ),
                 
                ],
              ),
            ),
          ),
        );
        
  }
}
