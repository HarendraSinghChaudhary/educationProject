import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import 'courses/darkcourse_controller.dart';

class LessonEndBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusChangeController>(() => StatusChangeController());
  }
}

class StatusChangeController extends GetxController {
  RxBool isLoading = false.obs;
  DarkCourseDetail_Controller cont = Get.find<DarkCourseDetail_Controller>();
  String title = "";
  String id = "";
  String darkcourseId = "";

  @override
  void onInit() {
    // TODO: implement onInit

    darkcourseId = cont.darkCourseId;
    cont.relode();
    super.onInit();
  }

  Future<dynamic> statusChangeApi(String id) async {
    isLoading(true);

    var request = http.post(
      Uri.parse(RestDatasource.MODULESTATUSCHANGEAPI),
      body: {
        "moduleid": id,
        "userid": Preferences.pref!.getString("id").toString()
      },
      headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmI1NzhjNzNlMWY2ODNhZTcwM2JhNGMiLCJlbWFpbCI6ImNoYWl0YW55YUBnbWFpbC5jb20iLCJpYXQiOjE2NTYwNjAzMzN9.xQy5ZCyQrXu_y54fXIV5VOo5fsNvt__R8L6wWrTshWI"
      },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) async {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
    });

    if (res.statusCode == 200) {
      if (jsonRes["status"].toString() == "true") {
        await cont.getcourse_Module().whenComplete(() {
          cont.checkCopletion();
        });
        cont.isstart(false);

        isLoading(false);
        update();
      } else {
        Get.snackbar(
          "",
          "",
          snackPosition: SnackPosition.TOP,
          titleText: Text(jsonRes["message"].toString()),
          messageText: const Text(""),
          colorText: Colors.red,
        );

        isLoading(false);
        update();
      }
    } else {
      Get.snackbar(
        "",
        "",
        snackPosition: SnackPosition.TOP,
        titleText: const Text("Please try later"),
        messageText: const Text(""),
        colorText: Colors.red,
      );

      isLoading(false);
      update();
    }
  }
}
