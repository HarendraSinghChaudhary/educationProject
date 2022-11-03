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
import 'onboarding_shouldlearn.dart';

class OnboardingPersonalizing extends StatefulWidget {
  const OnboardingPersonalizing({Key? key}) : super(key: key);

  @override
  State<OnboardingPersonalizing> createState() =>
      _OnboardingPersonalizingState();
}

class _OnboardingPersonalizingState extends State<OnboardingPersonalizing> {
  Future<void> waitTillPersonalizingDone() async {
    Future.delayed(const Duration(milliseconds: 3500), () {
      Get.to(const OnboardingShouldLearn());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitTillPersonalizingDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kdarkblue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 340,
              height: 200,
              decoration: const BoxDecoration(
                  color: kcardblue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Almost done!",
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
                  const Text(
                    "We are personalizing your",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 24,
                        height: 1.5,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    "learning experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kcardcyangradient,
                        fontSize: 24,
                        height: 1.5,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w400),
                  ),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 3500),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(
                      begin: 0,
                      end: 1,
                    ),
                    builder: (context, value, _) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                ],
              ),
            ),
          ),
        ));
  }
}
