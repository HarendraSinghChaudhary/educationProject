// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/signup_controller.dart/apple_signin_controller.dart';
import 'package:Ambitious/controllers/signup_controller.dart/create_user_controller.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroPageState();
}

class _IntroPageState extends State<Introduction> {
  String? name = "";
  String? email = "";

  bool asign = false;
  Future googleLogin() async {
    createUserController.isLoading(true);
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut != null) {
        final userData = await reslut.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: userData.accessToken, idToken: userData.idToken);
        var finalResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print("Result $reslut");
        print("name:" + reslut.displayName.toString());
        name = reslut.displayName.toString();
        email = reslut.email.toString();
        print("name: " + name!);
        print("email: " + email!);

        createUserController.isLoading(false);
        return true;
      }
      return false;
      createUserController.isLoading(false);
    } catch (error) {
      createUserController.isLoading(false);
      print(error);
    }
  }

  CreateUserController createUserController =
      Get.put(CreateUserController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx(
          (() => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),

                    Image.asset("assets/images/Ambitious.png"),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Center(
                        child: Container(
                          height: Get.height * 0.2,
                          width: Get.height * 0.2,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/img_1.png'),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Text(
                      'Learn how to be a',
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Influencer',
                      style: TextStyle(
                        color: Color(0xff131F7C),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Acquire tech skills by watching\nstory-style courses',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                    SizedBox(
                      height: 43,
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

                                print("response google: " + value.toString());
                                if (value) {
                                  createUserController.createGoogleUserApi(
                                      email!, name!);
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 25),
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
                    SizedBox(
                      height: 10,
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

                                    name = value.user?.displayName.toString();

                                    print("apple name: " + name.toString());

                                    email = value.user?.email.toString();

                                    print("apple email: " + email.toString());

                                 

                                    if (email.toString() != "" || email.toString() != "null" || email != null) {
                                      createUserController.createAppleUserApi(
                                          email!, name!);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "EmailId not found!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: kPrimaryColor,
                                          textColor: Colors.white,
                                          fontSize: 14.0);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 277,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/img_11.png'),
                                  )),
                                ),
                              )
                            : Container(),
                    SizedBox(
                      height: 10,
                    ),

                    // Navigate to New Account Class
                  ],
                ),
              )),
        ));
  }
}
