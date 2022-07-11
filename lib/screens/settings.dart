// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/onboarding/createUser/create_user.dart';
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

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
         if (Platform.isAndroid) WebView.platform = AndroidWebView();

      //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kBackgroundColor
          ),
          automaticallyImplyLeading: false,
         
          backgroundColor: kBackgroundColor,
          elevation: 0,
          title: const Text(
            'Settings',
            style: const TextStyle(
                color: kTitleColor, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          centerTitle: true,
        
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(right: Get.width * 0.04),
          //     child: Transform.scale(
          //         scaleX: -1,
          //         child: const Icon(
          //           Icons.nights_stay_sharp,
          //           color: kTitleColor,
          //         )),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: Get.width * 0.08,
              //       right: Get.width * 0.08,
              //       top: h * 0.02),
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.toNamed("/editprofile");
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Text(
              //           'Edit Profile',
              //           style: TextStyle(color: kPrimaryColor),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                  margin: EdgeInsets.only(
                      left: Get.width * 0.08,
                      right: Get.width * 0.08,
                      top: h * 0.005),
                  height: h * 0.27,
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
                      // ListTile(
                      //   leading: Container(
                      //       padding: const EdgeInsets.all(11),
                      //       height: Get.height * 0.05,
                      //       width: Get.width * 0.12,
                      //       decoration: const BoxDecoration(
                      //           shape: BoxShape.circle, color: kPurpleColor),
                      //       child: SvgPicture.asset(
                      //         "assets/images/settingmobile.svg",
                      //       )),
                      //   title: Text(
                      //     "Phone Number",
                      //     style: const TextStyle(
                      //         color: kTitleColor,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      //   subtitle: Text(
                      //     "+00 123 456 789",
                      //     style: const TextStyle(
                      //         color: ksubtitamarketColor, fontSize: 14),
                      //   ),
                      // ),
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
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.08,
                    vertical: Get.height * 0.03
                  ),
                  height: Get.height * 0.27,
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
                    // ListTile(
                    //           leading: Container(
                    //               padding: const EdgeInsets.all(11),
                    //               height: Get.height * 0.05,
                    //               width: Get.width * 0.12,
                    //               decoration: const BoxDecoration(
                    //                   shape: BoxShape.circle,
                    //                   color: kPurpleColor),
                    //               child: SvgPicture.asset(
                    //                 "assets/images/settinguaiton.svg",
                    //               )),
                    //           title: Text(
                    //            "Help Center",
                    //             style: const TextStyle(
                    //                 color: kTitleColor,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w600),
                    //           ),
                    //           trailing: const Icon(
                    //             Icons.arrow_forward_ios,
                    //             size: 15,
                    //           )),

                              SizedBox(height: 10,),

                               ListTile(
                                 onTap: (){
                                   print("hit");
                                   setState(() {
                                     
                                   });
                                    WebView(

             onPageFinished: (finish) {
             
      
           javascriptMode: JavascriptMode.unrestricted;
           initialUrl:'https://www.theambitiousapp.com/privacy-and-terms';
             }
      // zoomEnabled: true,
     );
                                 },
                                                           leading: Container(
                                  padding: const EdgeInsets.all(11),
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.12,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPurpleColor),
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

                              SizedBox(height: 10,),

                               ListTile(
                              leading: Container(
                                  padding: const EdgeInsets.all(11),
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.12,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPurpleColor),
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

                              SizedBox(height: 10,),

                  ],)
                  
                  
                  
                  
           
                      ),
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
        
                                  Get.offAll(const CreateUser());
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
      ),
    );
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('id', "");
    prefs.setString('name', "");

    prefs.setString('email', "");

    prefs.setString('status', "");

    prefs.setString('token', "");

    prefs.commit();
  }
}
