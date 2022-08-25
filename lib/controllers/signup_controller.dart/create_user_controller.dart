import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/name.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/category.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/coursesby_category.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateUserController extends GetxController {

     late final Mixpanel _mixpanel;


  Future<void> _initMixpanel() async {
   _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4", optOutTrackingDefault: false);
  }




   clearMethod () async{
     await  _initMixpanel();
   

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    clearMethod();
  }

  






  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  var response = "";
  var tokenId = "";







  Future<dynamic> createGoogleUserApi(
    String email,
    String name,
    String firstName,
    String lastName
  ) async {
    isLoading(true);
    print("email Print: "+email);
    print("name Print: "+name);

    print("avialble token : " + tokenId.toString());
    String msg = "";
    var jsonRes;
    http.Response? res;
    var request = http.post(
        Uri.parse(
          RestDatasource.CREATEUSER,
        ),
        body: {
          "email": email.toString().trim(),
          "name": name.toString().trim(),
          "firstname": firstName.toString().trim(),
          "lastname": lastName.toString().trim(),
          "signintype": "Google SignIn",

          
        });

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      print("Response: " + response.body.toString() + "_");
      print("ResponseJSON: " + jsonRes.toString() + "_");
      print("status: " + jsonRes["status"].toString() + "_");
      print("message: " + jsonRes["message"].toString() + "_");
      msg = jsonRes["message"].toString();
    });
    if (res!.statusCode == 200) {
      if (jsonRes["status"] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', jsonRes["user"]["_id"].toString());
        prefs.setString('name', jsonRes["user"]["name"].toString());
      
        prefs.setString('email', jsonRes["user"]["email"].toString());
        prefs.setString('firstname', jsonRes["user"]["firstname"].toString());
        prefs.setString('lastname', jsonRes["user"]["lastname"].toString());
      
        prefs.setString('status', jsonRes["user"]["status"].toString());
       
        prefs.setString(
            'token', jsonRes["token"].toString());

            print("token: "+ jsonRes["token"].toString());
       
        prefs.commit();


        _mixpanel.alias("New user", jsonRes["user"]["email"].toString(),);
        _mixpanel.identify(jsonRes["user"]["email"].toString(), ) ;
        _mixpanel.getPeople().set("Name", jsonRes["user"]["name"].toString(),  );
         _mixpanel.getPeople().set("Email", jsonRes["user"]["email"].toString(),  );




        // Get.snackbar(msg.toString(), "",  snackPosition: SnackPosition.TOP,);

        var trying = _mixpanel.identify(jsonRes["user"]["email"].toString()) ;

         var splitData = name.split(' ');
        print("splitData: "+splitData.toString());
     



         Get.offAll(NameScreen(firstName: firstName, lastName: lastName, name: name,));

        // update();

    

        isLoading(false);

    
      } else {
        isLoading(false);
      }
    } else {
      response = msg.toString();

      print("..... " + response.toString());

      // Get.snackbar(
      //   'Please enter valid credentials', "",  snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.black,
      //   padding: const EdgeInsets.only(top: 0)

      // );

      Fluttertoast.showToast(
          msg: msg.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 14.0);

      isLoading(false);
    }
  }



   Future<dynamic> createAppleUserApi(
    String email,
    String name,
  
  ) async {
    var firstName;
    var lastName;
    isSubmitting(true);
    print("email Print: "+email);
    print("name Print: "+name);


    if (name.toString() != "null") {

        var splitData = name.split(' ');
        print("splitData: "+splitData.toString());
       firstName = splitData[0].toString() ;
       lastName = splitData[1].toString() ;
        print(firstName);
        print(lastName);
    }else {
      firstName = "";
      lastName = "";

    }

    print("avialble token : " + tokenId.toString());
    String msg = "";
    var jsonRes;
    http.Response? res;
    var request = http.post(
        Uri.parse(
          RestDatasource.CREATEUSER,
        ),
        body: {
          "email": email.toString().trim(),
          "name": name.toString().trim(),
          "firstname": firstName.toString().trim(),
          "lastname": lastName.toString().trim(),
          "signintype": "Google SignIn",
          
        });

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      print("Response: " + response.body.toString() + "_");
      print("ResponseJSON: " + jsonRes.toString() + "_");
      print("status: " + jsonRes["status"].toString() + "_");
      print("message: " + jsonRes["message"].toString() + "_");
      msg = jsonRes["message"].toString();
    });
    if (res!.statusCode == 200) {
      if (jsonRes["status"] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', jsonRes["user"]["_id"].toString());
        prefs.setString('name', jsonRes["user"]["name"].toString());
      
        prefs.setString('email', jsonRes["user"]["email"].toString());
      
        prefs.setString('status', jsonRes["user"]["status"].toString());
        prefs.setString('firstname', firstName.toString());
        
       
        prefs.setString(
            'token', jsonRes["token"].toString());
       
        prefs.commit();


        _mixpanel.alias("New user", jsonRes["user"]["email"].toString(),);
        _mixpanel.identify(jsonRes["user"]["email"].toString(), ) ;
        _mixpanel.getPeople().set("Name", jsonRes["user"]["name"].toString(),  );
         _mixpanel.getPeople().set("Email", jsonRes["user"]["email"].toString(),  );



        // Get.snackbar(msg.toString(), "",  snackPosition: SnackPosition.TOP,);

        var trying = _mixpanel.identify(jsonRes["user"]["email"].toString()) ;

 


     Get.offAll(NameScreen(firstName: firstName, lastName: lastName, name: name,));

        // _handleRemeberme(remember);
        // Get.offAll( NameScreen(firstName: firstName, lastName: lastName, name: name,));

        // update();

    

       isSubmitting(true);

      
      } else {
        isSubmitting(true);
      }
    } else {
      response = msg.toString();

      print("..... " + response.toString());

      // Get.snackbar(
      //   'Please enter valid credentials', "",  snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.black,
      //   padding: const EdgeInsets.only(top: 0)

      // );

      Fluttertoast.showToast(
          msg: msg.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 14.0);

     isSubmitting(true);
    }
  }

  // token() {
  //   var messaging = FirebaseMessaging.instance;
  //   messaging.getToken().then((value) {
  //     print("token: " + value.toString());
  //     tokenId = value.toString();

  //     print("new token: " + tokenId.toString());
  //   });
  // }
}

