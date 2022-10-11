import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/onboarding/introduction/introduction.dart';
import 'package:Ambitious/screens/onboarding/signIn/view/loginSignupview.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../../testing/navigation_testing.dart';
import '../../utils/endpoint_url.dart';
class LoginSignUpConroller extends GetxController{

  RxBool isLoading = false.obs;
  RxString otpemail = "".obs;
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController conpass = TextEditingController();
  RxBool isforgot = false.obs;
 RxBool islogin  = false.obs;


  Future register(String firstName, String lastName, String email, String password)async{
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.REGISTER_URL),
        body: {
          "firstname":firstName,
          "lastname":lastName,
          "email":email,
          "password":password
        }
      );
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){

        if(data["status"]){
          otpemail.value = email; 
        //   Preferences.pref!.setString('id', data["data"]["_id"].toString());
        // Preferences.pref!.setString('name', data["data"]["name"].toString());
      
        // Preferences.pref!.setString('email', data["data"]["email"].toString());
        // Preferences.pref!.setString('firstname', data["data"]["firstname"].toString());
        // Preferences.pref!.setString('lastname', data["data"]["lastname"].toString());
      
        // Preferences.pref!.setString('status', data["data"]["status"].toString());
        // Preferences.pref!.setBool("isNotificationAllowed",data["data"]["isAllow"]=="true");
       
        Preferences.pref!.setString(
            'token', data["token"].toString());

            print("token: "+ data["token"].toString());
            isforgot.value = false;
            showBottumSheet(
                                const OtpVerfication(),
                              );

isLoading.value = false;
first.clear();
last.clear();
mail.clear();
pass.clear();
        }else{
          showSnack("User already exist",data['msg']);

        }

      }else{
          showSnack(data['msg']);
      }
    } catch (e) {
isLoading.value = false;
          showSnack("Something went wrong please try again later");

      
    }
  }
 
 
  Future login(String email, String password)async{
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.login_URL),
        body: {
          "email":email,
          "password":password
        }
      );
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){

        if(data["status"]){
        Preferences.pref!.setString('id', data["data"][0]["_id"].toString());
        Preferences.pref!.setString('name', data["data"][0]["name"].toString());
      
        Preferences.pref!.setString('email', data["data"][0]["email"].toString());
        Preferences.pref!.setString('firstname', data["data"][0]["firstname"].toString());
        Preferences.pref!.setString('lastname', data["data"][0]["lastname"].toString());
      
        Preferences.pref!.setString('status', data["data"][0]["status"].toString());
        Preferences.pref!.setBool("isNotificationAllowed",data["data"][0]["isAllow"]=="true");
       
        Preferences.pref!.setString(
            'token', data["token"].toString());

            print("token: "+ data["token"].toString());

            mail.clear();
            pass.clear();
            // Get.back();
            Get.to(
              ()=> BottomNavigationScreen(
                index: 0.obs,
                learningPathIndex: 0.obs,
              )
            );
isLoading.value = false;

        }else{
          showSnack("Incorrect Email or Password",data["msg"]);
        }
      }else{
        showSnack("Error",data["msg"]);
      }
    } catch (e) {
isLoading.value = false;
showSnack("Something went wrong please try again later");
      print(e);
    }
  }


Future otpVerify(String otpp)async{
    FocusManager.instance.primaryFocus?.unfocus();
    print(otpemail.value);
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.OTP_URL),
        body: {
          "otp":otpp,
          "email":otpemail.value
        }
      );
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){

        if(data["status"]){

        Preferences.pref!.setString('id', data["data"]["_id"].toString());
        Preferences.pref!.setString('name', data["data"]["name"].toString());
      
        Preferences.pref!.setString('email', data["data"]["email"].toString());
        Preferences.pref!.setString('firstname', data["data"]["firstname"].toString());
        Preferences.pref!.setString('lastname', data["data"]["lastname"].toString());
      
        Preferences.pref!.setString('status', data["data"]["status"].toString());
        Preferences.pref!.setBool("isNotificationAllowed",data["data"]["isAllow"]=="true");
        isforgot.value?{
          // Get.back(),
          Get.back(),
          otp.clear(),
          showBottumSheet(
            const ResetPass()
          )
        }:
        
        Get.offAll(
          ()=>BottomNavigationScreen(index: 0.obs,learningPathIndex: 0.obs,)
        );

isLoading.value = false;
first.clear();
last.clear();
mail.clear();
pass.clear();
        }else{
isLoading.value = false;
showSnack(data["msg"]);
        }
      }else{
isLoading.value = false;
showSnack(data["msg"]);

      }
    } catch (e) {
isLoading.value = false;
showSnack("Something went wrong please try again later");
      
    }
  }




Future sendMail(String email)async{
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.forgotPass_URL),
        body: {
          "email":email
        }
      );
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){

        if(data["status"]){
// showSnack(data["message"]);
isforgot.value = true;
otpemail.value = email;
Get.back();
showBottumSheet(
  const OtpVerfication()
);

        

isLoading.value = false;
mail.clear();

        }else{
isLoading.value = false;
showSnack("Incorrect Email",data["message"]);
        }
      }else{
isLoading.value = false;
showSnack(data["message"]);

      }
    } catch (e) {
isLoading.value = false;
showSnack("Something went wrong please try again later");
      
    }
  }





  Future resetPassword()async{
    FocusManager.instance.primaryFocus?.unfocus();
    print(otpemail);
    print(pass.text);
    print(conpass.text);
    var apibody ={
          "email":otpemail.value,
           "new_password":pass.text,
           "confirm_password":conpass.text
        };
        // String body = jsonEncode(apibody);
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.reset_password_url),
        body: apibody,
      );
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){

        // Get.snackbar("Update Password Successfully",data["message"]);
        // Get.back();
        pass.clear();
        conpass.clear();
        return data["message"];

await showSnack("Update Password Successfully",data["message"]);
// .then((value) {
//   Get.back();
// // islogin.value = true;
// // showBottumSheet(const LoginSignUp());
// });

await testing();
print("msg show");
isLoading(false);
print("loader going to false");
pass.clear();
conpass.clear();
mail.clear();
print("controller clear ho rhe hh");

print("get back ");
print("go to login");
      }else{
isLoading(false);
showSnack(data["message"]);

      }
    } catch (e) {
isLoading(false);
print("Error ===== $e");
showSnack("Something went wrong please try again later");
      
    }
  }
   
   
   
   
    Future resendtp()async{
    FocusManager.instance.primaryFocus?.unfocus();
    print(otpemail);
    var apibody ={
          "email":otpemail.value,
        };
        // String body = jsonEncode(apibody);
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.resendOtp_url),
        body: apibody,
      );
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){

        if(data["status"]){
showSnack("OTP Sent",data["message"]);
isLoading.value = false;
        }else{
isLoading.value = false;
showSnack(data["message"]);
        }
      }else{
isLoading.value = false;
showSnack(data["message"]);

      }
    } catch (e) {
isLoading.value = false;
print("Error ===== $e");
showSnack("Something went wrong please try again later");
      
    }
  }

Future testing ()async{
  Get.back();
  islogin.value = true;
showBottumSheet(const LoginSignUp());
}

}