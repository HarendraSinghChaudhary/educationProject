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

class OnboardingInterests extends StatefulWidget {
  const OnboardingInterests({Key? key}) : super(key: key);

  @override
  State<OnboardingInterests> createState() => _OnboardingInterestsState();
}

class _OnboardingInterestsState extends State<OnboardingInterests> {
  bool ui = false;
  bool web = false;
  bool marketing = false;
  bool startup = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: 
        ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "STEP 2 OF 5",
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
                begin: 0.2,
                end: 0.4,
              ),
              builder: (context, value, _) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              'What are you interested in?',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24,
                  height: 1.5,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "It’s OK if you don’t know. We can help!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14,
                  height: 1.3,
                  wordSpacing: 5.5,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          ui = !ui;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: ui == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "UI UX\nDesign",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image(
                                    width: 70,
                                    height: 70,
                                    image: AssetImage(
                                        "assets/images/paywall1.png")),
                              ],
                            )),
                      ),
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          web = !web;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: web == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Web\nDevelopment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image(
                                    width: 70,
                                    height: 70,
                                    image: AssetImage(
                                        "assets/images/paywall5.png")),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          marketing = !marketing;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: marketing == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Digital\nMarketing",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image(
                                    width: 70,
                                    height: 70,
                                    image: AssetImage(
                                        "assets/images/paywall4.png")),
                              ],
                            )),
                      ),
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          startup = !startup;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: startup == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Startup\nBusiness",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image(
                                    width: 70,
                                    height: 70,
                                    image: AssetImage(
                                        "assets/images/paywall6.png")),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Get.to(const OnboardingGoals());
              },
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
                      "CONTINUE",
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
          ],
        ),
      ),
    );
  }
}
