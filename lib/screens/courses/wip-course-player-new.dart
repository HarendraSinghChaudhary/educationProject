import 'package:demo/utils/constant.dart';
import 'package:demo/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WipCoursePlayerNew extends StatefulWidget {
  const WipCoursePlayerNew({Key? key}) : super(key: key);

  @override
  State<WipCoursePlayerNew> createState() => _WipCoursePlayerNewState();
}

class _WipCoursePlayerNewState extends State<WipCoursePlayerNew>
    with TickerProviderStateMixin {
  bool like = false;

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller?.addListener(() {
      print(_controller?.value);
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (double.parse(_controller!.value.toString()) > 0.5) {
// When it gets there hold it there.
        _controller?.value = 0.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controllerr = ScrollController();
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: w * 0.04, right: w * 0.04, top: h * 0.01),
                height: h * 0.04,
                width: w * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: h * 0.03,
                        width: w * 0.065,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: kBlackColor.withOpacity(0.20),
                                  blurRadius: 1)
                            ]),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 17,
                          color: kiconscolor,
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.013,
                      width: w * 0.5,
                      margin: EdgeInsets.symmetric(horizontal: h * 0.02),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: kBlackColor.withOpacity(0.10),
                          minHeight: h * 0.017,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              kPrimaryColor),
                          value: 0.6,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: h * 0.03,
                      width: w * 0.065,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: kBlackColor.withOpacity(0.20),
                                blurRadius: 1)
                          ]),
                      child: SvgPicture.asset(
                        'assets/images/messanger.svg',
                      ),
                    ),
                    Container(
                      height: h * 0.03,
                      width: w * 0.065,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: kBlackColor.withOpacity(0.20),
                                blurRadius: 1)
                          ]),
                      child: const Icon(
                        Icons.share_outlined,
                        size: 17,
                        color: kiconscolor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              ListView.builder(
                  controller: _controllerr,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: (){
                          Get.toNamed('/flashCard');
                        },
                      child: Container(
                          padding: EdgeInsets.only(
                              top: h * 0.015, left: w * 0.02, right: w * 0.04),
                          width: w * 1,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  width: w * 0.84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kWhiteColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      Wiptital[index]["tital"].toString(),
                                      style: const TextStyle(
                                          color: ktitalResourceColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                right: w * 0.001,
                                child: Container(
                                  width: w * 0.1,
                                  height: h * 0.060,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kBackgroundColor,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        like = !like;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        child: like == false
                                            ? const Icon(
                                                Icons.favorite_border,
                                                color: kPrimaryColor,
                                                size: 18,
                                              )
                                            : Container(
                                                height: 100,
                                                width: 100,
                                                child: Lottie.asset(
                                                    'assets/icons/likeblue.json',
                                                    fit: BoxFit.contain,
                                                         onLoaded: (comp){
          _controller
          ?.duration = comp.duration
         ;
    }
                                                )),
                                        backgroundColor: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    );
                  }),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                height: Get.height * 0.29,
                width: Get.width * 0.87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/bitcoinimage.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
