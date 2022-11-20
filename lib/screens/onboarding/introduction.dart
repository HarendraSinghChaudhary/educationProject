// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/signup_controller.dart/create_user_controller.dart';
import 'package:Ambitious/screens/onboarding/InBottomSheet/loginSignupview.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../controllers/signup_controller.dart/apple_signin_controller.dart';
import '../../controllers/signup_controller.dart/loginSignUp_Controller.dart';
import '../../services/mixpanel.dart';

//in working

String appleSignFirstName = "";
String appleSignlasttName = "";

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  String? name = "";
  String? email = "";
  String? firstName = "";
  String? lastName = "";

  bool asign = false;
  Future googleLogin() async {
    createUserController.isLoading(true);
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut != null) {
        final userData = await reslut.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: userData.accessToken, idToken: userData.idToken);
        var finalResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        name = reslut.displayName.toString();
        firstName = finalResult.additionalUserInfo?.profile!["given_name"];
        lastName = finalResult.additionalUserInfo?.profile!["family_name"];

        email = reslut.email.toString();
        createUserController.isLoading(false);
        return true;
      }
      createUserController.isLoading(false);
      return false;
    } catch (error) {
      createUserController.isLoading(false);
      return false;
    }
  }

  LoginSignUpConroller controller =
      Get.put<LoginSignUpConroller>(LoginSignUpConroller(), permanent: true);

  CreateUserController createUserController =
      Get.put(CreateUserController(), permanent: true);
  @override
  void initState() {
    super.initState();
    mixpanelTrack("Signup Page");
  }

  @override
  Widget build(BuildContext context) {
    createUserController.isLoading = false.obs;
    return Scaffold(
        backgroundColor: kdarkblue,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logoe.png", height: h * 0.15),
                    SizedBox(height: h * 0.02),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Career Growth,",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              fontFamily: "HK Grotesk"),
                          children: const [
                            TextSpan(
                              text: " \nSimplified 🚀",
                              style: TextStyle(
                                  color: Color(0xff9EC9FF),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "HK Grotesk"),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: Get.height * 0.38,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: kcardblue,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Join 1000+ Ambitious learners worldwide",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    createUserController.isLoading.value
                        ? Align(
                            alignment: Alignment.center,
                            child: Platform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator())
                        : InkWell(
                            onTap: () {
                              googleLogin().then((value) {
                                createUserController.isLoading(false);

                                if (value) {
                                  createUserController.createGoogleUserApi(
                                      email!, name!, firstName!, lastName!);
                                } else {
                                  showSnack("",
                                      "Something went wrong please try again");
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 2),
                              height: 56,
                              width: 277,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xff4f86eb),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    height: 53,
                                    width: 53,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      'assets/images/googlelogog.png',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.05,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    createUserController.isSubmitting.value
                        ? Align(
                            alignment: Alignment.center,
                            child: Platform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator())
                        : Platform.isIOS
                            ? InkWell(
                                onTap: () {
                                  signInWithApple().then((value) {
                                    createUserController.isSubmitting(true);
                                    print("response: " + value.toString());

                                    name = value.user?.displayName ??
                                        appleSignFirstName +
                                            " " +
                                            appleSignlasttName;

                                    email = value.user?.email.toString();

                                    //print("apple email: " + email.toString());

                                    if (email.toString() != "" ||
                                        email.toString() != "null" ||
                                        email != null) {
                                      createUserController.createAppleUserApi(
                                          email!, name!);
                                    } else {
                                      showSnack("", "Email Id not found!");
 
                                    }
                                  });
                                },
                                child: Container(
                                  height: 56,
                                  width: 277,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: h * 0.01,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.apple,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 25),
                                        child: Text(
                                          'Sign in with Apple',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                    InkWell(
                      onTap: () {
                        controller.islogin.value = true;
                        showBottumSheet(LoginSignUp());
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 2),
                        height: 56,
                        width: 277,
                        alignment: Alignment.center,
                        child: Text(
                          'SIGN IN WITH EMAIL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
