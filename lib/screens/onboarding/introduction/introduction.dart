// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/signup_controller.dart/apple_signin_controller.dart';
import 'package:Ambitious/controllers/signup_controller.dart/create_user_controller.dart';
import 'package:Ambitious/screens/onboarding/signIn/view/loginSignupview.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../../controllers/signup_controller.dart/loginSignUp_Controller.dart';




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
    var familyname;
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
        print("userData: $userData");
        print("credential : $credential");
        print("finalResult : $finalResult");
        print("name:" + reslut.displayName.toString());
        // print("family name: "+ )
        name = reslut.displayName.toString();
        firstName = finalResult.additionalUserInfo?.profile!["given_name"];
        lastName = finalResult.additionalUserInfo?.profile!["family_name"];

        print("=========="+lastName.toString());
        email = reslut.email.toString();
        print("name: " + name!);
        print("email: " + email!);

        createUserController.isLoading(false);
        return true;
      }
      createUserController.isLoading(false);
      return false;
      
    } catch (error) {
      createUserController.isLoading(false);
      print(error);
    }
  }
  LoginSignUpConroller controller = Get.put<LoginSignUpConroller>(LoginSignUpConroller(),permanent: true);

  CreateUserController createUserController =
      Get.put(CreateUserController(), permanent: true);
          late final Mixpanel _mixpanel;
  Future<void> _initMixpanel() async {
   _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4", optOutTrackingDefault: false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  clearMethod();
  }


  clearMethod () async{
     await  _initMixpanel();
    _mixpanel.track("Welcome Page");

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
             
           
     
              child: Lottie.asset('assets/icons/data2.json', fit: BoxFit.cover),
            
          
            ),
          ),




          Platform.isIOS
                 ? 

          

           Container(
            height: Get.height * 0.42,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
              color: Colors.white,
            ),


            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            
                 SizedBox(height: 20,),
            
                  RichText(
                    text: TextSpan(
                    text: "Career Growth,",
                    style: TextStyle(color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.w700 ),
            
            
                    children: const[
                      TextSpan(
                        text: " Simplified",
                         style: TextStyle(color: kPrimaryColor, fontSize: 24, fontWeight: FontWeight.w700 ),
                      ),
            
            
                    
            
                    ]
                  ),
            
                 
            
                  
                  
                  
                  
                  
                  ),
            
            
            
                   SizedBox(height: 10,),
            
                     Text("Learn, Build, and Grow with \n"
                     "1000+ other Ambitious learners",
                    style: TextStyle(color: kSubTitleColor, fontSize: 16,
                    height: 1.5, fontWeight: FontWeight.w400 ),
                   
                   ),
            
            
                    SizedBox(height: 20,),
            
            
            
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
                                        email!, name!, firstName!, lastName!);
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
                                      MainAxisAlignment.start,
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
                                   const  Padding(
                                      padding:  EdgeInsets.only(
                                          left: 20, right: 10),
                                      child: Text(
                                        'Sign in with Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
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
            
                      // createUserController.isSubmitting.value
                      //     ? Align(
                      //         alignment: Alignment.center,
                      //         child: Platform.isAndroid
                      //             ? CircularProgressIndicator()
                      //             : CupertinoActivityIndicator())
                          // : Platform.isIOS
                          //     ? 
                              
                              
                              
                              InkWell(
                                  onTap: () {
                                    signInWithApple().then((value) {
                                      createUserController.isSubmitting(true);
                                      print("response: " + value.toString());
            
                                      name = value.user?.displayName.toString();
                                      
            
                        
            
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
                                     height: 56,
                                width: 277,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                   ),
            
                                   child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.apple, color: Colors.white, size: 35,),
                                    
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
                                ),
            
            
                              // : Container(),
            
            
            
                 
            
            
                ],
              ),
            ),
                   )
                   
                   :

                    Container(
            height: Get.height * 0.32,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
              color: kcardblue,
            ),


            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            
                  SizedBox(height: 20,),
            
                  RichText(
                    text: TextSpan(
                    text: "Career Growth,",
                    style: TextStyle(color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.w700 ),
            
            
                    children: const[
                      TextSpan(
                        text: " Simplified",
                         style: TextStyle(color: kPrimaryColor, fontSize: 24, fontWeight: FontWeight.w700 ),
                      ),
            
            
                    
            
                    ]
                  ),
            
                 
            
                  
                  
                  
                  
                  
                  ),
            
            
            
                   SizedBox(height: 10,),
            
                     Text("Learn, Build, and Grow with \n"
                     "1000+ other Ambitious learners",
                     textAlign: TextAlign.center,
                    style: TextStyle(color: kWhiteColor, fontSize: 16,
                    height: 1.5, fontWeight: FontWeight.w400 ),
                   
                   ),
            
            
                    SizedBox(height: 20,),
            
            
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
                                    // createUserController.chackuserapi(
                                    //   email!
                                    // ).then((value2) {
                                    //   if(!value2){
                                        createUserController.createGoogleUserApi(
                                        email!, name!, firstName!, lastName!);
                                    //   }
            
                                    // });
                                    
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
                                   const  Padding(
                                      padding:  EdgeInsets.only(
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
                            InkWell(
                              onTap: () {
                                controller.islogin.value = true;
                                showBottumSheet(
                                  LoginSignUp()
                                );
                                // Get.bottomSheet(
                                //   const SentMail(),
                                //   isScrollControlled: true
                                // );
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 2),
                                height: 56,
                                width: 277,
                                alignment: Alignment.center,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(2),
                                //   color: Color(0xff4f86eb),
                                // ),
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
      )
    );
    
  }
}