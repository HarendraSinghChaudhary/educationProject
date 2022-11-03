import 'dart:io';

import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'onboarding_goals.dart';

class OnboardingShouldLearn extends StatefulWidget {
  const OnboardingShouldLearn({Key? key}) : super(key: key);

  @override
  State<OnboardingShouldLearn> createState() => _OnboardingShouldLearnState();
}

class _OnboardingShouldLearnState extends State<OnboardingShouldLearn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kdarkblue,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "STEP 5 OF 5",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 12,
                  height: 1.5,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0.8,
                end: 1,
              ),
              builder: (context, value, _) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    backgroundColor: kGreyColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      kCyanColor,
                    ),
                    value: value,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sophia, 66% of Ambitious members are just like you!',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24,
                  height: 1.5,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'You should learn:',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  height: 1.5,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                width: 340,
                height: 170,
                decoration: const BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "No Code Development",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 24,
                            height: 1.5,
                            wordSpacing: 2.5,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: kCyanColor,
                            child: Icon(
                              Icons.check,
                              color: kBlackColor,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Build websites and apps without\nhaving to write code",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 16,
                                height: 1.5,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 340,
                height: 40,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Container(
                    color: ksettingcardColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("assets/images/figma.png")),
                        Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("assets/images/w.png")),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Avg Salary:\$70+/hr",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13,
                              height: 1.5,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.people,
                          color: kGreyColor,
                        ),
                        Text(
                          "5150",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13,
                              height: 1.5,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 130,
            ),
            InkWell(
              onTap: () {},
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                Container(
                  height: 58,
                  width: 400,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "YES! LET’S GO!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                          height: 1.5,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: kArrowBackgroundColor,
                    child: Icon(
                      Icons.arrow_forward,
                      color: kBackgroundColor,
                      size: 20,
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ));
  }
}
