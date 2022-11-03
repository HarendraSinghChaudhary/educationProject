import 'dart:io';

import 'package:Ambitious/screens/onboarding/onboarding_screens/onboarding_interests.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class OnboardingWelcome extends StatelessWidget {
  const OnboardingWelcome({Key? key}) : super(key: key);

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
              "STEP 1 OF 5",
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
                begin: 0.0,
                end: 0.2,
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
              height: 50,
            ),
            Container(
              height: 200,
              width: 200,
              child: const Image(
                  image: AssetImage("assets/images/onboarding_rocket.png")),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome, Sophia! 👋🏻',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24,
                        height: 1.5,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: '\nLet\'s ',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24,
                        height: 1.5,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: 'Get Started',
                    style: TextStyle(
                        color: kCyanColor,
                        fontSize: 24,
                        height: 1.5,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Not all Ambitious people are alike! Let’s discover your learning style so we can personalize your plan.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  height: 1.3,
                  wordSpacing: 1,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(const OnboardingInterests());
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
                      "BUILD MY PLAN",
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
            const SizedBox(
              height: 15,
            ),
            const Text(
              "It will only take 2 minutes",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14,
                  height: 1.3,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
