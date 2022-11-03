import 'dart:convert';

import 'package:Ambitious/screens/homeNav/navigationBottomBar.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/mixpanel.dart';
import '../../utils/sharedPreference.dart';

class EditProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  var response = "";
  var tokenId = "";

  Future<dynamic> editProfileApi(
      String userId, String name, String firstName, String lastName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id").toString();
    var token = pref.getString("token").toString();

    isLoading(true);
    String msg = "";
    var jsonRes;
    http.Response? res;
    String addName = firstName.toString() + " " + lastName.toString();
    var request = http.post(
        Uri.parse(
          RestDatasource.EDITPROFILE_URL,
        ),
        headers: {
          "Authorization": Preferences.pref!.getString("token").toString()
        },
        body: {
          "userId": userId.toString().trim(),
          "name": addName.toString().trim(),
          "firstname": firstName.toString().trim(),
          "lastname": lastName.toString().trim(),
        });

    await request.then((http.Response response) {
      res = response;
      jsonRes = jsonDecode(response.body);
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

        prefs.commit();

        // Mixpanell.mixpanel!.alias(
        //   "New user",
        //   jsonRes["data"]["email"].toString(),
        // );
        // // Mixpanell.mixpanel!.identify(jsonRes["data"]["email"].toString(),) ;
        // Mixpanell.mixpanel!.getPeople().set(
        //       "Name",
        //       jsonRes["data"]["name"].toString(),
        //     );
        // Mixpanell.mixpanel!.getPeople().set(
        //       "Email",
        //       jsonRes["data"]["email"].toString(),
        //     );

        Get.offAll(BottomNavigationScreen(
          index: 0.obs,
          learningPathIndex: 0.obs,
        ));

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
}
