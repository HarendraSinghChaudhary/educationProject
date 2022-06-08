import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Appbar container 50Xp and notification icon code Start
              Padding(
                padding: EdgeInsets.all(Get.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.047,
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
                      height: Get.height * 0.047,
                      width: Get.width * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/img_3.png',
                            height: Get.height * 0.037,
                            width: Get.width * 0.1,
                          ),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          Text(
                            '3',
                            style: GoogleFonts.roboto(
                                color: kSubTitleColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Appbar container 50Xp and notification icon code End
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Get.height * 0.018, vertical: Get.height * 0.01),
                height: Get.height * 0.16,
                width: Get.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                  color: kBackOfResourceColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.024,
                          left: Get.width * 0.06,
                          right: Get.width * 0.08),
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Marketplace',
                            style: TextStyle(
                              fontSize: Get.height * 0.04,
                              fontWeight: FontWeight.w600,
                              color: ktitalResourceColor,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            'Redeem points for offers\nexclusively for Ambitious App\nmembers.',
                            style: TextStyle(color: ksubtitamarketColor,fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.7,
                      width: Get.height * 0.14,
                      child: SvgPicture.asset(
                        'assets/icons/resourceimage.svg',
                        // height: Get.height * 1,
                        // width: Get.width * 1,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                controller: _controller,
                shrinkWrap: true,
                itemCount: 10,
                  itemBuilder:
                  (BuildContext context,int index){
                return  Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.13,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.19),
                          offset: const Offset(0,3),
                          blurRadius: 4,
                        )
                      ]
                  ),

                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06,vertical: Get.height*0.01),
                  child: ListTile(
                    selectedColor: ktitalResourceColor,
                    onTap: (){},
                    leading: Image.asset('assets/images/resumereviewnew.png'),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: Get.height*0.005),
                      child: Text(
                        '1 Month Free Shopify',
                        style: TextStyle(
                          color: kTitleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      ' Try to start your own\n business on Shopify for free.',
                      style: TextStyle(color: ksubtitamarketColor, fontSize: 13,),
                    ),
                    trailing: Text(
                      '150 XP',
                      style: TextStyle(
                          color: kCyanColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
