import 'dart:convert';
import 'package:Ambitious/screens/onboarding/name.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/mixpanel.dart';
import '../../screens/homeNav/navigationBottomBar.dart';

//in working
class CreateUserController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  var response = "";
  var tokenId = "";
  Future appledeleteAPI() async {}
  Future<dynamic> chackuserapi(
    String email,
  ) async {
    isLoading(true);
    String msg = "";
    var jsonRes;
    http.Response? res;
    var request = http.get(
      Uri.parse(
        RestDatasource.USERCHECK_URL + "?email=" + email.toString().trim(),
      ),
      headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
      },
    );

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
    });
    if (res!.statusCode == 200) {
      if (jsonRes["status"] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', jsonRes["data"]["_id"].toString());
        prefs.setString('name', jsonRes["data"]["name"].toString());

        prefs.setString('email', jsonRes["data"]["email"].toString());
        prefs.setString('firstname', jsonRes["data"]["firstname"].toString());
        prefs.setString('lastname', jsonRes["data"]["lastname"].toString());

        prefs.setString('status', jsonRes["data"]["status"].toString());

        return jsonRes["isUserExist"];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<dynamic> deleteuserapi() async {
    isLoading(true);
    String msg = "";
    var jsonRes;
    http.Response? res;
    var request = http.post(
      Uri.parse(
        RestDatasource.USERDELETE_URL +
            Preferences.pref!.getString("id").toString(),
      ),
      headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
      },
    );

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["msg"].toString();
    });
    if (res!.statusCode == 200) {
      if (jsonRes["status"] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<dynamic> createGoogleUserApi(
      String email, String name, String firstName, String lastName) async {
    isLoading(true);
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
      msg = jsonRes["message"].toString();
    });
    if (res!.statusCode == 200) {
      bool isUserExist = jsonRes["isUserExist"];
      if (jsonRes["status"] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', jsonRes["user"]["_id"].toString());
        prefs.setString('name', jsonRes["user"]["name"].toString());

        prefs.setString('email', jsonRes["user"]["email"].toString());
        prefs.setString('firstname', jsonRes["user"]["firstname"].toString());
        prefs.setString('lastname', jsonRes["user"]["lastname"].toString());

        prefs.setString('status', jsonRes["user"]["status"].toString());
        Preferences.pref!.setBool(
            "isNotificationAllowed", jsonRes["user"]["isAllow"] == "true");

        prefs.setString('token', jsonRes["token"].toString());

        prefs.commit();

        var splitData = name.split(' ');

        if (isUserExist) {
          Mixpanell.mixpanel!.track("User Login", properties: {
            "Name": jsonRes["user"]["name"].toString(),
            "Email": jsonRes["user"]["email"].toString()
          });
        }
        isUserExist
            ? Get.offAll(BottomNavigationScreen(
                index: 0.obs,
                learningPathIndex: 0.obs,
              ))
            : Get.offAll(() => NameScreen(
                      firstName: firstName,
                      lastName: lastName,
                      name: name,
                    ))!
                .whenComplete(() {
                isLoading(false);
              });

        isLoading(false);
      } else {
        isLoading(false);
      }
    } else {
      response = msg.toString();

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

    if (name.toString() != "null") {
      var splitData = name.split(' ');

      firstName = splitData[0].toString();
      lastName = splitData[1].toString();
    } else {
      firstName = "";
      lastName = "";
    }
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
          "signintype": "Apple SignIn",
        });

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
    });
    if (res!.statusCode == 200) {
      bool isUserExist = jsonRes["isUserExist"];
      if (jsonRes["status"] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', jsonRes["user"]["_id"].toString());
        prefs.setString('name', jsonRes["user"]["name"].toString());

        prefs.setString('email', jsonRes["user"]["email"].toString());

        prefs.setString('status', jsonRes["user"]["status"].toString());
        prefs.setString('firstname', jsonRes["user"]["firstname"].toString());

        prefs.setString('token', jsonRes["token"].toString());

        prefs.commit();

        if (isUserExist) {
          Mixpanell.mixpanel!.track("User Login", properties: {
            "Name": jsonRes["user"]["name"].toString(),
            "Email": jsonRes["user"]["email"].toString()
          });
        }
        isUserExist
            ? Get.offAll(BottomNavigationScreen(
                index: 0.obs,
                learningPathIndex: 0.obs,
              ))
            : Get.offAll(() => NameScreen(
                  firstName: firstName,
                  lastName: lastName,
                  name: name,
                ));

        isSubmitting(true);
      } else {
        isSubmitting(true);
      }
    } else {
      response = msg.toString();

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
}
