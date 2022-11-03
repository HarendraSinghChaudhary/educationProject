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

import 'onboarding_learn.dart';

class OnboardingGoals extends StatefulWidget {
  const OnboardingGoals({Key? key}) : super(key: key);

  @override
  State<OnboardingGoals> createState() => _OnboardingGoalsState();
}

class _OnboardingGoalsState extends State<OnboardingGoals> {
  bool job = false;
  bool salary = false;
  bool business = false;
  bool skills = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "STEP 3 OF 5",
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
                begin: 0.4,
                end: 0.6,
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
              'What are your goals?',
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
                          job = !job;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: job == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Land A Job\nIn Tech",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Use digital skills to\nrun an online\nbusiness",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                      ),
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          salary = !salary;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: salary == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Increase My\nSalary",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You want to learn\nskills to increase\nyour salary",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w400),
                                ),
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
                          business = !business;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: business == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Start My Own\nBusiness",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Build a startup or\nbecome a freelancer",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                      ),
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          skills = !skills;
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kcardblue,
                                border: skills == true
                                    ? Border.all(color: kCyanColor, width: 2.5)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Learn New\n Skills",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You love to learn\nand want to grow",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                      height: 1.3,
                                      wordSpacing: 2.5,
                                      fontWeight: FontWeight.w400),
                                ),
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
                Get.to(const OnboardingLearn());
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
