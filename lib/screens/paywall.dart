import 'dart:developer';

import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/testing/navigation_testing.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:csslib/visitor.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_data.dart';
import '../services/firebase_analytics.dart';
import '../services/purchase_api.dart';
import '../utils/gradient_text.dart';

class Paywall extends StatefulWidget {
  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //AppData.checkUserPurchaseStatus();

  }

  bool _isLoading = false;

  Future<void> _fetchOffers() async {
    setState(() {
      _isLoading = true;
    });
    // final offerings = await PurchaseApi.fetchOffers(all: false); //for subscription
    print(MyOfferings.allIds.first);
    print(MyOfferings.allIds.last);
    final offerings = await PurchaseApi.fetchOffersByIds(MyOfferings.allIds);

    if (offerings.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "No Subscriptions Found To Purchase",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Color.fromARGB(117, 5, 5, 5),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      final offer = offerings.first;
      print("Offer====: $offer");

      final packages = offerings
          .map((offer) => offer.availablePackages)
          .expand((pair) => pair)
          .toList();

      var isSuccess = false;
      if (selected_plan == "monthly") {
        isSuccess =
            await PurchaseApi.purchasePackage(packages.first).whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
      } else if (selected_plan == "annual") {
        isSuccess =
            await PurchaseApi.purchasePackage(packages.last).whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      if (isSuccess) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: "Purchase Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(117, 5, 5, 5),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: "Purchase Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(117, 5, 5, 5),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  String selected_plan = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            const Center(
              child: GradientText(
                "Become a Member",
                gradient: LinearGradient(colors: [
                  kCyanColor,
                  kcardcyangradient,
                ]),
                style: TextStyle(
                    color: kCyanColor,
                    fontSize: 32,
                    height: 1.5,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "When you join Ambitious, you\nget unlimited access to all\nAmbitious resources.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 22,
                  height: 1.5,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 37,
                width: 308,
                decoration: const BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: kCyanColor,
                      child: Icon(
                        Icons.check,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "New playbooks added every week",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
                height: 37,
                width: 308,
                decoration: const BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: kCyanColor,
                      child: Icon(
                        Icons.check,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Live project based workshops",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
                height: 37,
                width: 308,
                decoration: const BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: kCyanColor,
                      child: Icon(
                        Icons.check,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Slack commuinity access",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Learn the hottest skills of\n2022 in 5 minutes a day",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24,
                  height: 1.5,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 90,
                      width: 78,
                      decoration: const BoxDecoration(
                          color: kcardblue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 70,
                            // color: Colors.white,
                            child: const Image(
                                image:
                                    AssetImage("assets/images/paywall1.png")),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "UI UX\nDesign",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 10,
                                height: 1.3,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  Container(
                      height: 90,
                      width: 78,
                      decoration: const BoxDecoration(
                          color: kcardblue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 70,
                            // color: Colors.white,
                            child: Image(
                                image:
                                    AssetImage("assets/images/paywall5.png")),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Web\nDevelopment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 10,
                                height: 1.3,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  Container(
                      height: 90,
                      width: 78,
                      decoration: const BoxDecoration(
                          color: kcardblue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 70,
                            // color: Colors.white,
                            child: Image(
                                image:
                                    AssetImage("assets/images/paywall4.png")),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Digital\nMarketing",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 10,
                                height: 1.3,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  Container(
                      height: 90,
                      width: 78,
                      decoration: const BoxDecoration(
                          color: kcardblue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 70,
                            // color: Colors.white,
                            child: const Image(
                                image:
                                    AssetImage("assets/images/paywall6.png")),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Startup\nBusiness",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 10,
                                height: 1.3,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selected_plan = "annual";
                });
              },
              child: Container(
                height: 75,
                width: 338,
                decoration: BoxDecoration(
                    color: kcardblue,
                    border: selected_plan == "annual"
                        ? Border.all(color: kCyanColor, width: 2.5)
                        : null,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "ANNUAL",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14,
                                    height: 1.5,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 17,
                                width: 60,
                                decoration: const BoxDecoration(
                                    color: kArrowBackgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    "BEST VALUE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 8,
                                        height: 1.5,
                                        wordSpacing: 2.5,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "3 day free trial, then \$49.99/year",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14,
                                height: 1.5,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "\$49.99",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  height: 1.5,
                                  wordSpacing: 2.5,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selected_plan = "monthly";
                });
              },
              child: Container(
                height: 75,
                width: 338,
                decoration: BoxDecoration(
                    color: kcardblue,
                    border: selected_plan == "monthly"
                        ? Border.all(color: kCyanColor, width: 2.5)
                        : null,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "MONTHLY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14,
                                    height: 1.5,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Text(
                            "3 day free trial, then \$9.99/month",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14,
                                height: 1.5,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text(
                              "\$9.99",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  height: 1.5,
                                  wordSpacing: 2.5,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: _fetchOffers,
              child: Container(
                height: 58,
                width: 340,
                decoration: const BoxDecoration(
                    color: kstartgradiant,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: _isLoading
                      ? Container(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : Text(
                          "TRY FOR FREE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 22,
                              height: 1.5,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w400),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Join over 5000+ Ambitious people",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 14,
                    height: 1.5,
                    wordSpacing: 2.5,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 125,
                width: 321,
                decoration: const BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "MEET THE FOUNDER, ALIM",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 14,
                            height: 1.5,
                            wordSpacing: 2.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/paywall_dp.png"),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "“My goal is to provide all the\ntools to be successful in the\npocket of 1 million people.”",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14,
                                height: 1.5,
                                wordSpacing: 5.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Recurring billing. Cancel anytime.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 10,
                    height: 1.5,
                    wordSpacing: 2.5,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "Terms, Conditions & Privacy Policy",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 10,
                    height: 1.5,
                    decoration: TextDecoration.underline,
                    wordSpacing: 2.5,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  try {
                    CustomerInfo restoredInfo =
                        await Purchases.restorePurchases();

                    AppData.isPro =
                        restoredInfo.entitlements.all['pro']!.isActive;

                    if (AppData.isPro) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Restored Purchases Success"),
                        duration: Duration(seconds: 5),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Restored Purchases Failed"),
                        duration: Duration(seconds: 5),
                      ));
                    }

                    // ... check restored purchaserInfo to see if entitlement is now active
                  } on PlatformException catch (e) {
                    AppData.isPro = false;
                    // Error restoring purchases
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                      duration: Duration(seconds: 5),
                    ));
                  }
                },
                child: const Text(
                  "Restore Purchases",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 10,
                      height: 1.5,
                      decoration: TextDecoration.underline,
                      wordSpacing: 2.5,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 185,
            ),
          ],
        ),
      ),
    );
  }
}
