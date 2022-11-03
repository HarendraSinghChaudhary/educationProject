// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/signup_controller.dart/create_user_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/onboarding/introduction.dart';
import 'package:Ambitious/services/web_view.dart';
import 'package:Ambitious/services/crispchat.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../services/firbase.dart';
import '../../../services/mixpanel.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _SettingsState();
}

class _SettingsState extends State<Profile> {
  CreateUserController createUserController =
      Get.put(CreateUserController(), permanent: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kdarkblue,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: Get.width * 0.08,
                    right: Get.width * 0.08,
                    top: h * 0.02),
                // height: h * 0.45,
                decoration: BoxDecoration(
                    color: ksettingcardColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: kcardshedowColor.withOpacity(0.0851449),
                          //  Colors.blue.withOpacity(0.22),
                          offset: const Offset(0, 8),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      iconColor: ksettingsubtitleColor,
                      onTap: () {},
                      leading: Container(
                          padding: const EdgeInsets.all(11),
                          height: Get.height * 0.05,
                          width: Get.width * 0.12,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kPurpleColor),
                          child: SvgPicture.asset(
                            "assets/images/profilesetting.svg",
                          )),
                      title: Text(
                        "Name",
                        style: const TextStyle(
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        name.toString(),
                        style: const TextStyle(
                            color: ksettingsubtitleColor, fontSize: 14),
                      ),
                    ),
                    ListTile(
                      iconColor: ksettingsubtitleColor,
                      leading: Container(
                          padding: const EdgeInsets.all(11),
                          height: Get.height * 0.05,
                          width: Get.width * 0.12,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kPurpleColor),
                          child: SvgPicture.asset(
                            "assets/images/settingmail.svg",
                          )),
                      title: Text(
                        "Email",
                        style: const TextStyle(
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        email.toString(),
                        style: const TextStyle(
                            color: ksettingsubtitleColor, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        onTap: () {
                          Get.to(WebViewExample(
                            url:
                                "https://www.theambitiousapp.com/privacy-and-terms",
                            title: "Privacy & Policy",
                          ));
                        },
                        leading: Container(
                            padding: const EdgeInsets.all(11),
                            height: Get.height * 0.05,
                            width: Get.width * 0.12,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                            child: SvgPicture.asset(
                              "assets/images/settingsafe.svg",
                            )),
                        title: Text(
                          "Privacy & Terms",
                          style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: ksettingsubtitleColor,
                          size: 15,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        onTap: () {
                          Get.to(CrispChat());
                        },
                        leading: Container(
                            padding: const EdgeInsets.all(11),
                            height: Get.height * 0.05,
                            width: Get.width * 0.12,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                            child: SvgPicture.asset(
                              "assets/images/settingsms.svg",
                            )),
                        title: Text(
                          "Contact Us",
                          style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: ksettingsubtitleColor,
                          size: 15,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * 0.05,
            ),
            InkWell(
                onTap: () {
                  Get.defaultDialog(
                      contentPadding: const EdgeInsets.all(10),
                      title: "",
                      content: Column(
                        children: [
                          const Text(
                              "Are you sure you want to "
                              "\nLogout?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 140,
                            height: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  // foregroundColor: kPrimaryColor
                                  backgroundColor: kPrimaryColor),
                              onPressed: () async {
                                await logout();

                                Get.offAll(const Introduction());
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 140,
                            height: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ));
                },
                child: Text(
                  'LOG OUT',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: Get.height * 0.05,
            ),
            InkWell(
                onTap: () {
                  Get.defaultDialog(
                      contentPadding: const EdgeInsets.all(10),
                      title: "",

                      // titleStyle: TextStyle(color: Colors.black, fontSize: 17),

                      content: Column(
                        children: [
                          const Text(
                              "Are you sure you want to "
                              "\nDelete your Account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 140,
                            height: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  // foregroundColor: kPrimaryColor
                                  backgroundColor: kPrimaryColor),
                              onPressed: () async {
                                await deleteDatatofirebase();
                                createUserController
                                    .deleteuserapi()
                                    .then((value) {
                                  if (value) {
                                    logout();
                                    createUserController.isSubmitting(false);
                                    Preferences.pref!.clear();
                                    Get.offAll(const Introduction());
                                  }
                                });
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 140,
                            height: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ));
                },
                child: Text(
                  'Delete Account'.toUpperCase(),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: Get.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    createUserController.isSubmitting(false);
    mixpanelLogout();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('id', "");
    prefs.setString('name', "");
    prefs.setString('email', "");
    prefs.setString('status', "");
    prefs.setString('token', "");

    prefs.commit();
    prefs.clear();
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    email = pref.getString("email").toString();
    name = pref.getString("name").toString();
    if (Preferences.pref!.getString("name").toString() == "null") {
      name = (Preferences.pref!.getString("firstname") ?? "") +
          " " +
          (Preferences.pref!.getString("lastname") ?? "");
    }

    setState(() {});
  }
}
