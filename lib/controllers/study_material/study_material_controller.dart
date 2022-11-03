


import 'dart:convert';

import 'package:Ambitious/models/study_material_model.dart';
import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/sharedPreference.dart';



class StudyMaterialController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<StudyMaterialModel> studyMaterialList = RxList();

  
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  

  Future<dynamic> studyMaterialApi(String id) async {


    var request = http.get(
      Uri.parse(RestDatasource.STUDYMETERIAL_URL + id),
      headers: {
        "Authorization":Preferences.pref!.getString("token").toString()},
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['Moduledata'];
    });

    if (res.statusCode == 200) {

      if (jsonRes["status"].toString() == "true") {
        studyMaterialList.clear();
        for (var i = 0; i < jsonArray.length; i++) {
          StudyMaterialModel modelAgentSearch = StudyMaterialModel();
          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.StudayMaterial = jsonArray[i]["StudayMaterial"].toString();
          modelAgentSearch.Moduletitle = jsonArray[i]["Moduletitle"].toString();
          modelAgentSearch.image = jsonArray[i]["image"].toString();
          modelAgentSearch.youtubeUrl = jsonArray[i]["YoutubeUrl"];
          modelAgentSearch.a = jsonArray[i]["A"];
          modelAgentSearch.r = jsonArray[i]["R"];
          modelAgentSearch.g = jsonArray[i]["G"];
          modelAgentSearch.b = jsonArray[i]["B"];
          studyMaterialList.add(modelAgentSearch);
        }


        isLoading(false);
        update();
      } else {
        Get.snackbar(
          "",
          "",
          snackPosition: SnackPosition.TOP,
          titleText: Text(jsonRes["message"].toString()),
          messageText: Text(""),
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
        titleText: Text("Please try later"),
        messageText: Text(""),
        colorText: Colors.red,
      );

      isLoading(false);
      update();
    }
  }


  
}
