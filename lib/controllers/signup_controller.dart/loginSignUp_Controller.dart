import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/screens/onboarding/introduction.dart';
import 'package:Ambitious/screens/onboarding/InBottomSheet/loginSignupview.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../../screens/onboarding/onboarding_screens/onboarding_welcome.dart';
import '../../services/mixpanel.dart';
import '../../screens/homeNav/navigationBottomBar.dart';
import '../../utils/endpoint_url.dart';

//in working

class LoginSignUpConroller extends GetxController {
  RxBool isLoading = false.obs;
  RxString otpemail = "".obs;
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController conpass = TextEditingController();
  RxBool isforgot = false.obs;
  RxBool islogin = false.obs;

  Future register(
      String firstName, String lastName, String email, String password) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response =
          await http.post(Uri.parse(RestDatasource.REGISTER_URL), body: {
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "password": password
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["status"]) {
          otpemail.value = email;

          Preferences.pref!.setString('token', data["token"].toString());
          isforgot.value = false;
          showBottumSheet(
            const OtpVerfication(),
          );

          isLoading.value = false;
          first.clear();
          last.clear();
          mail.clear();
          pass.clear();
        } else {
          showSnack("User already exist", data['msg']);
        }
      } else {
        showSnack(data['msg']);
      }
    } catch (e) {
      isLoading.value = false;
      showSnack("Something went wrong please try again later");
    }
  }

  Future login(String email, String password) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response = await http.post(Uri.parse(RestDatasource.login_URL),
          body: {"email": email, "password": password});
      var data = jsonDecode(response.body);
      //print("${data.toString()} login =====");
      if (response.statusCode == 200) {
        if (data["status"]) {
          Preferences.pref!.setString('id', data["user"][0]["_id"].toString());
          Preferences.pref!
              .setString('name', data["user"][0]["name"].toString());

          Preferences.pref!
              .setString('email', data["user"][0]["email"].toString());
          Preferences.pref!
              .setString('firstname', data["user"][0]["firstname"].toString());
          Preferences.pref!
              .setString('lastname', data["user"][0]["lastname"].toString());

          Preferences.pref!
              .setString('status', data["user"][0]["status"].toString());
          Preferences.pref!.setBool(
              "isNotificationAllowed", data["user"][0]["isAllow"] == "true");

          Preferences.pref!.setString('token', data["token"].toString());
          mixpanelIdentify(
            data["user"][0]["_id"] ?? "",
            data["user"][0]["name"] ?? "",
            data["user"][0]["email"] ?? "",
          ).whenComplete(() {
            mixpanelTrack("User Login", {
              "Name": data["user"][0]["name"].toString(),
              "Email": data["user"][0]["email"].toString()
            });
          });

          // log("Email : ${data["data"][0]["email"]} Name : ${data["data"][0]["name"]} =======");

          mail.clear();
          pass.clear();
          Get.to(() => BottomNavigationScreen(
                index: 0.obs,
                learningPathIndex: 0.obs,
              ));
          isLoading.value = false;
        } else {
          showSnack("Incorrect Email or Password", data["msg"]);
        }
      } else {
        showSnack("Error", data["msg"]);
      }
    } catch (e) {
      isLoading.value = false;
      showSnack("Something went wrong please try again later");
    }
  }

  Future otpVerify(String otpp) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response = await http.post(Uri.parse(RestDatasource.OTP_URL),
          body: {"otp": otpp, "email": otpemail.value});
      var data = jsonDecode(response.body);
      // print("${data.toString()} otp =====");
      if (response.statusCode == 200) {
        if (data["status"]) {
          Preferences.pref!.setString('id', data["data"]["_id"].toString());
          Preferences.pref!.setString('name', data["data"]["name"].toString());

          Preferences.pref!
              .setString('email', data["data"]["email"].toString());
          Preferences.pref!
              .setString('firstname', data["data"]["firstname"].toString());
          Preferences.pref!
              .setString('lastname', data["data"]["lastname"].toString());

          Preferences.pref!
              .setString('status', data["data"]["status"].toString());
          Preferences.pref!.setBool(
              "isNotificationAllowed", data["data"]["isAllow"] == "true");
          if (isforgot.value) {
            Get.back();
            otp.clear();
            showBottumSheet(const ResetPass());
          } else {
            otp.clear();

            mixpanelIdentify(
              data["data"]["_id"] ?? "",
              data["data"]["name"] ?? "",
              data["data"]["email"] ?? "",
            ).whenComplete(() {
              mixpanelTrack("User Login", {
                "Name": data["data"]["name"].toString(),
                "Email": data["data"]["email"].toString()
              });
            });

            //@mini
            if (!Preferences.pref!.containsKey(
                "onBoarding_isFirstTime_${Preferences.pref!.getString("id_forOnboarding")}")) {
              //log("====Doesnt contains: onBoarding_isFirstTime_${Preferences.pref!.getString("id_forOnboarding")} ");
              Get.offAll(const OnboardingWelcome());
            } else {
              Get.offAll(BottomNavigationScreen(
                index: 0.obs,
                learningPathIndex: 0.obs,
              ));
            }
          }

          isLoading.value = false;
          first.clear();
          last.clear();
          mail.clear();
          pass.clear();
        } else {
          isLoading.value = false;
          showSnack(data["msg"]);
        }
      } else {
        isLoading.value = false;
        showSnack(data["msg"]);
      }
    } catch (e) {
      isLoading.value = false;
      //print("Error: ${e.toString()}====");
      showSnack("Something went wrong please try again later");
    }
  }

  Future sendMail(String email) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var response = await http.post(Uri.parse(RestDatasource.forgotPass_URL),
          body: {"email": email});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["status"]) {
          isforgot.value = true;
          otpemail.value = email;
          Get.back();
          showBottumSheet(const OtpVerfication());

          isLoading.value = false;
          mail.clear();
        } else {
          isLoading.value = false;
          showSnack("Incorrect Email", data["message"]);
        }
      } else {
        isLoading.value = false;
        showSnack(data["message"]);
      }
    } catch (e) {
      isLoading.value = false;
      showSnack("Something went wrong please try again later");
    }
  }

  Future resetPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var apibody = {
      "email": otpemail.value,
      "new_password": pass.text,
      "confirm_password": conpass.text
    };
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.reset_password_url),
        body: apibody,
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        pass.clear();
        conpass.clear();
        return data["message"];

        await showSnack("Update Password Successfully", data["message"]);

        await testing();

        isLoading(false);
        pass.clear();
        conpass.clear();
        mail.clear();
      } else {
        isLoading(false);
        showSnack(data["message"]);
      }
    } catch (e) {
      isLoading(false);

      showSnack("Something went wrong please try again later");
    }
  }

  Future resendtp() async {
    FocusManager.instance.primaryFocus?.unfocus();

    var apibody = {
      "email": otpemail.value,
    };
    // String body = jsonEncode(apibody);
    try {
      var response = await http.post(
        Uri.parse(RestDatasource.resendOtp_url),
        body: apibody,
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["status"]) {
          showSnack("OTP Sent", data["message"]);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          showSnack(data["message"]);
        }
      } else {
        isLoading.value = false;
        showSnack(data["message"]);
      }
    } catch (e) {
      isLoading.value = false;
      showSnack("Something went wrong please try again later");
    }
  }

  Future testing() async {
    Get.back();
    islogin.value = true;
    showBottumSheet(const LoginSignUp());
  }
}
