import 'package:demo/utils/list.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourceCenter extends StatefulWidget {
  const ResourceCenter({Key? key}) : super(key: key);

  @override
  State<ResourceCenter> createState() => _ResourcecenterState();
}

class _ResourcecenterState extends State<ResourceCenter> {
  final ScrollController   _controller = ScrollController();
  TextStyle tital =  const TextStyle( color: kTitleColor,
    fontWeight: FontWeight.w600,
    fontSize: 15,);
  TextStyle subtital = const  TextStyle(color: kSubTitleColor,fontSize: 12,height: 1.5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //50XP icons and notifiation icon  like appbar top start

              SizedBox(height: Get.height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: Get.height * 0.05,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.white),
                    child: const Text(
                      '50 XP',
                      style: TextStyle(
                          color: Color(0xff00D9CD),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height * 0.05,
                    width: Get.width * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/img_3.png',
                          height: Get.height * 0.090,
                          width: Get.width * 0.070,
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        Text(
                          '3',
                          style: GoogleFonts.roboto(
                              color:  const Color(0xff344356).withOpacity(0.40),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //50XP icons and notifiation icon  like appbar top start
              //Recource center box  Start
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.035, vertical: Get.height * 0.02),
                height: Get.height * 0.1750,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                  color: kBackOfResourceColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.0399999,
                          horizontal: Get.width * 0.07),
                      child:const Text(
                        'Resource\nCenter',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: ktitalResourceColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: Get.height * 0.04),
                      height: Get.height * 0.7,
                      width: Get.height * 0.2,
                      child: SvgPicture.asset(
                        'assets/icons/resourceimage.svg',
                        // height: Get.height * 1,
                        // width: Get.width * 1,
                      ),
                    )
                  ],
                ),
              ),
              //Recource center box  Start

              ListView.builder(
                controller: _controller,
                  itemCount: Recourcecenter.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                return   Padding(
                padding:  EdgeInsets.symmetric(
                      horizontal: Get.height * 0.020, vertical: Get.height * 0.01),
                  child: Container(
                    height: Get.height * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          offset: const Offset(0,3),
                          blurRadius: 7,
                        )
                      ]
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width*0.04 ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: Get.height*0.07,
                                width: Get.width*0.17,
                                child: Image.asset(Recourcecenter[index]["image"].toString(),
                                ),
                              ),
                              SizedBox(width: Get.width*0.04,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Recourcecenter[index]["tital"].toString(),
                                  style: tital,),
                                  SizedBox(height: Get.height * 0.002,),
                                  Text(Recourcecenter[index]["subtital"].toString(),style: subtital,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
