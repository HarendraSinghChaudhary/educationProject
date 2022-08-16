// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/signup_controller.dart/create_user_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/notification_permission.dart';
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/services/intercom.dart';
import 'package:Ambitious/services/web_view.dart';
import 'package:Ambitious/services/crispchat.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _SettingsState();
}

class _SettingsState extends State<Profile> {


 CreateUserController createUserController = Get.put(CreateUserController(), permanent: false);
 

  




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
      backgroundColor: kBackgroundColor,
      appBar: AppBar(

        automaticallyImplyLeading: false,

        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: const TextStyle(
              color: kTitleColor, fontWeight: FontWeight.w600, fontSize: 20),
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
                    top: h * 0.005),
                height: h * 0.45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.22),
                        offset: const Offset(0, 3),
                        blurRadius: 4,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
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
                            color: kTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        name.toString(),
                        style: const TextStyle(
                            color: ksubtitamarketColor, fontSize: 14),
                      ),
                    ),
                    ListTile(
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
                            color: kTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        email.toString(),
                        style: const TextStyle(
                            color: ksubtitamarketColor, fontSize: 14),
                      ),
                    ),




                    SizedBox(
                      height: 10,
                    ),

                    ListTile(
                        onTap: () {
                        
                        Get.to(WebViewExample());
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
                              color: kTitleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
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
                              color: kTitleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )),

                    SizedBox(
                      height: 10,
                    ),

                          ListTile(
                      onTap: () {
                       Get.to(NotificationPermission());
                      },
                        leading: Container(
                            padding: const EdgeInsets.all(11),
                            height: Get.height * 0.05,
                            width: Get.width * 0.12,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                            child: SvgPicture.asset(
                              "assets/images/per.svg", color: Colors.white,
                            )),
                        title: Text(
                          "Permissions",
                          style: const TextStyle(
                              color: kTitleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )),

                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            // Container(
            //   margin: EdgeInsets.symmetric(
            //       horizontal: Get.width * 0.08, vertical: Get.height * 0.03),
            //   height: h * 0.09,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(15),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.blue.withOpacity(0.22),
            //           offset: const Offset(0, 3),
            //           blurRadius: 4,
            //         )
            //       ]),
            //   child: ListTile(
            //     leading: Container(
            //         padding: const EdgeInsets.all(11),
            //         height: Get.height * 0.05,
            //         width: Get.width * 0.12,
            //         decoration: const BoxDecoration(
            //             shape: BoxShape.circle, color: kPurpleColor),
            //         child:
            //             SvgPicture.asset("assets/images/settingpassword.svg")),
            //     title: Text(
            //       'Password',
            //       style: const TextStyle(
            //           color: kTitleColor,
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600),
            //     ),
            //     subtitle: Text(
            //       "updated 2 weeks ago",
            //       style:
            //           const TextStyle(color: ksubtitamarketColor, fontSize: 14),
            //     ),
            //   ),
            // ),
       
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
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: kPrimaryColor,
                              onPressed: () {
                                logout();

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
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
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
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    createUserController.isSubmitting(false);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('id', "");
    prefs.setString('name', "");

    prefs.setString('email', "");

    prefs.setString('status', "");

    prefs.setString('token', "");

    prefs.commit();


  }



    Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());
  

    setState(() {});
  }



}
