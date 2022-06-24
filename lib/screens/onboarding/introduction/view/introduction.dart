// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:demo/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);




  @override
  State<Introduction> createState() => _IntroPageState();
}


class _IntroPageState extends State<Introduction> {

  bool asign = false;
 Future googleLogin() async {
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
        print(reslut.displayName);
        print(reslut.email);
        print(reslut.photoUrl);
        return true;
      }
    return false;


    } catch (error) {
      print(error);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            SizedBox(height: Get.height * 0.1,),
      
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
            InkWell(
              onTap: (){
                googleLogin().then((value) {
                  if(value){
                    Get.toNamed("/quickNotification");
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.only(left: 10,right: 25),
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
      
             Platform.isIOS ?
            InkWell(
              onTap: () {

                // setState(() {
                              //   asign = true;
                              //   context.loaderOverlay.show();
                              // });
                              // try {
                              //   signInWithApple().then((value) {
                              //     List<UserInfo> data = value.user!.providerData;
                              //     String name = data[0].displayName == null
                              //         ? 'user'
                              //         : data[0].displayName.toString();
                              //     socialLogin(
                              //         email: FirebaseAuth
                              //             .instance.currentUser!.email
                              //             .toString(),
                              //         name: name)
                              //         .then((value) {
                              //       setState(() {
                              //         asign = false;
                              //         context.loaderOverlay.hide();
                              //       });
                              //     }).catchError((e) {
                              //       print(e);
                              //     });
                              //   }).catchError((e) {
                              //     setState(() {
                              //       asign = false;
                              //       context.loaderOverlay.hide();
                              //     });
                              //   });
                              // } catch (e) {
                              //   throw e;
                              // }

              },
              child: Container(
                height: 50,
                width: 277,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/img_11.png'),
                )),
              ),
            ) : Container(),
            SizedBox(
              height: 10,
            ),
      
          // Navigate to New Account Class

          ],
        ),
      ),
    );
  }


}
