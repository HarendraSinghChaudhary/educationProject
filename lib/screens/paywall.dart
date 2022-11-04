import 'dart:io';

import 'package:Ambitious/services/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../services/app_data.dart';
import '../services/purchase_api.dart';
import '../utils/gradient_text.dart';

class Paywall extends StatefulWidget {
  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  Future<void> checkPurchase() async {
    AppData.checkUserPurchaseStatus().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    checkPurchase();
  }

  bool _isLoading = false;

  Future<void> _fetchOffers() async {
    setState(() {
      _isLoading = true;
    });
    // final offerings = await PurchaseApi.fetchOffers(all: false); //for subscription
    // print(MyOfferings.allIds.first);
    // print(MyOfferings.allIds.last);
    final offerings = await PurchaseApi.fetchOffersByIds(MyOfferings.allIds);

    if (offerings.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      showSnack(
          "Subscription Purchase Alert", "No Subscriptions Found To Purchase");
    } else {
      //final offer = offerings.first;
      //print("Offer====: $offer");

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
        AppData.isPro = true;
        AppData.currentActiveSubscription = selected_plan;
        setState(() {});
        showSnack("Subscription Purchase Alert",
            "You have successfully purchased subscription.");
      } else {
        AppData.isPro = false;
        AppData.currentActiveSubscription = "null";
        setState(() {});
        showSnack("Subscription Purchase Alert",
            "Spmething went wrong. Purchase Failed");
      }
    }
  }

  String selected_plan = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: ListView(
          children: [
            Center(
              child: GradientText(
                "Become a Member",
                gradient: const LinearGradient(colors: [
                  kCyanColor,
                  kcardcyangradient,
                ]),
                style: TextStyle(
                    color: kCyanColor,
                    fontSize: 32.sp,
                    height: 1.5.h,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "When you join Ambitious, you\nget unlimited access to all\nAmbitious resources.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 22.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
                height: 37.h,
                width: 308.w,
                decoration:  BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kCyanColor,
                      child: Icon(
                        Icons.check,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "New playbooks added every week",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            SizedBox(
              height: 15.h,
            ),
            Container(
                height: 37.h,
                width: 308.w,
                decoration:  BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kCyanColor,
                      child: Icon(
                        Icons.check,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Live project based workshops",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            SizedBox(
              height: 15.h,
            ),
            Container(
                height: 37.h,
                width: 308.w,
                decoration:  BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kCyanColor,
                      child: Icon(
                        Icons.check,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Slack commuinity access",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Learn the hottest skills of\n2022 in 5 minutes a day",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24.sp,
                  height: 1.5.h,
                  wordSpacing: 2.5,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 90.h,
                    width: 78.w,
                    decoration:  BoxDecoration(
                        color: kcardblue,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      children: [
                        Container(
                          height: 55.h,
                          width: 70.w,
                          // color: Colors.white,
                          child: const Image(
                              image: AssetImage("assets/images/paywall1.png")),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "UI UX\nDesign",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 10.sp,
                              height: 1.3.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                Container(
                    height: 90.h,
                    width: 78.w,
                    decoration:  BoxDecoration(
                        color: kcardblue,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      children: [
                        Container(
                          height: 55.h,
                          width: 70.w,
                          // color: Colors.white,
                          child: const Image(
                              image: AssetImage("assets/images/paywall5.png")),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Web\nDevelopment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 10.sp,
                              height: 1.3.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                Container(
                    height: 90.h,
                    width: 78.w,
                    decoration:  BoxDecoration(
                        color: kcardblue,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      children: [
                        Container(
                          height: 55.h,
                          width: 70.w,
                          // color: Colors.white,
                          child: const Image(
                              image: AssetImage("assets/images/paywall4.png")),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Digital\nMarketing",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 10.sp,
                              height: 1.3.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                Container(
                    height: 90.h,
                    width: 78.w,
                    decoration:  BoxDecoration(
                        color: kcardblue,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      children: [
                        Container(
                          height: 55.h,
                          width: 70.w,
                          // color: Colors.white,
                          child: const Image(
                              image: AssetImage("assets/images/paywall6.png")),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Startup\nBusiness",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 10.sp,
                              height: 1.3.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selected_plan = "annual";
                });
              },
              child: Container(
                height: 75.h,
                width: 338.w,
                decoration: BoxDecoration(
                    color: kcardblue,
                    border: selected_plan == "annual"
                        ? Border.all(color: kCyanColor, width: 2.5)
                        : null,
                    borderRadius:  BorderRadius.all(Radius.circular(18.r))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
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
                                    fontSize: 14.sp,
                                    height: 1.5.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 17.h,
                                width: 60.w,
                                decoration:  BoxDecoration(
                                    color: kArrowBackgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r))),
                                child: Center(
                                  child: Text(
                                    "BEST VALUE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 8.sp,
                                        height: 1.5.h,
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
                                fontSize: 14.sp,
                                height: 1.5.h,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
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
                                  fontSize: 20.sp,
                                  height: 1.5.h,
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
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selected_plan = "monthly";
                });
              },
              child: Container(
                height: 75.h,
                width: 338.w,
                decoration: BoxDecoration(
                    color: kcardblue,
                    border: selected_plan == "monthly"
                        ? Border.all(color: kCyanColor, width: 2.5)
                        : null,
                    borderRadius:  BorderRadius.all(Radius.circular(18.r))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "MONTHLY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 14.sp,
                                    height: 1.5.h,
                                    wordSpacing: 2.5,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Text(
                            "3 day free trial, then \$9.99/month",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14.sp,
                                height: 1.5.h,
                                wordSpacing: 2.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "\$9.99",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20.sp,
                                  height: 1.5.h,
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
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: AppData.isPro
                  ? () {
                      if (AppData.currentActiveSubscription == "annual") {
                        showSnack("Subscription Alert",
                            "You have already an active Annual Subscription");
                      } else if (AppData.currentActiveSubscription ==
                          "monthly") {
                        showSnack("Subscription Alert",
                            "You have already an active Monthly Subscription");
                      }
                    }
                  : _fetchOffers,
              child: Container(
                height: 58.h,
                width: 340.w,
                decoration:  BoxDecoration(
                    color: kstartgradiant,
                    borderRadius: BorderRadius.all(Radius.circular(30.r))),
                child: Center(
                  child: _isLoading
                      ? Container(
                          width: 25.h,
                          height: 25.w,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : Text(
                          AppData.isPro ? "Pro User" : "TRY FOR FREE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 22.sp,
                              height: 1.5.h,
                              wordSpacing: 2.5,
                              fontWeight: FontWeight.w400),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                "Join over 5000+ Ambitious people",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 14.sp,
                    height: 1.5.h,
                    wordSpacing: 2.5,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
                height: 130.h,
                width: 337.w,
                decoration:  BoxDecoration(
                    color: kcardblue,
                    borderRadius: BorderRadius.all(Radius.circular(5.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Text(
                        "MEET THE FOUNDER, ALIM",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 14.sp,
                            height: 1.5.h,
                            wordSpacing: 2.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage: const AssetImage(
                                "assets/images/paywall_dp.png"),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(
                            "“My goal is to provide all the\ntools to be successful in the\npocket of 1 million people.”",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14.sp,
                                height: 1.5.h,
                                wordSpacing: 5.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Recurring billing. Cancel anytime.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 10.sp,
                    height: 1.5.h,
                    wordSpacing: 2.5,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 10.sp,
                          height: 1.5.h,
                          decoration: TextDecoration.underline,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w400),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(
                              'https://theambitiousapp.com/terms-of-service'));
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 10.sp,
                          height: 1.5.h,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 10.sp,
                          height: 1.5.h,
                          decoration: TextDecoration.underline,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w400),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(
                              'https://www.theambitiousapp.com/privacy-policy'));
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cancel Current Subscription',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 10.sp,
                          height: 1.5.h,
                          decoration: TextDecoration.underline,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w400),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (AppData.isPro) {
                            if (AppData.currentActiveSubscription == "annual") {
                              if (Platform.isAndroid) {
                                launchUrl(Uri.parse(
                                    'https://play.google.com/store/account/subscriptions?sku=ambitious_4999_1y&com.educationondemand'));
                              } else if (Platform.isIOS) {
                                launchUrl(Uri.parse(
                                    'https://apps.apple.com/account/subscriptions'));
                              }
                            } else if (AppData.currentActiveSubscription ==
                                "monthly") {
                              if (Platform.isAndroid) {
                                launchUrl(Uri.parse(
                                    'https://play.google.com/store/account/subscriptions?sku=ambitious_999_1m&com.educationondemand'));
                              } else if (Platform.isIOS) {
                                launchUrl(Uri.parse(
                                    'https://apps.apple.com/account/subscriptions'));
                              }
                            }
                          } else {
                            showSnack("Subscription Alert",
                                "You have not subscribed to any subscription.");
                            Future.delayed(const Duration(seconds: 3), () {
                              if (Platform.isAndroid) {
                                launchUrl(Uri.parse(
                                    'https://play.google.com/store/account/subscriptions'));
                              } else if (Platform.isIOS) {
                                launchUrl(Uri.parse(
                                    'https://apps.apple.com/account/subscriptions'));
                              }
                            });
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  try {
                    CustomerInfo restoredInfo =
                        await Purchases.restorePurchases();

                    if (restoredInfo.entitlements.all.isNotEmpty) {
                      if (restoredInfo.entitlements.all['pro']!.isActive) {
                        AppData.isPro = true;
                        AppData.currentActiveSubscription = 'annual';
                        showSnack("Subscription Alert",
                            "Restored Annual Subscription Successfully");
                      } else if (restoredInfo
                          .entitlements.all['promonthly']!.isActive) {
                        AppData.isPro = true;
                        AppData.currentActiveSubscription = 'monthly';
                        showSnack("Subscription Alert",
                            "Restored Monthly Subscription Successfully");
                      }
                    } else {
                      AppData.isPro = false;
                      AppData.currentActiveSubscription = 'null';
                      showSnack("Subscription Alert",
                          "Restore purchases failed. You have not subscribed to any subscription");
                    }
                  } on PlatformException catch (e) {
                    AppData.isPro = false;
                    AppData.currentActiveSubscription = 'null';

                    showSnack(
                        "Subscription Alert", "Restore purchases failed.");
                  }
                },
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Restore Purchases',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 10.sp,
                          height: 1.5.h,
                          decoration: TextDecoration.underline,
                          wordSpacing: 2.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
              ),
            ),
            SizedBox(
              height: 185.h,
            ),
          ],
        ),
      ),
    );
  }
}
