


import 'dart:convert';

import 'package:Ambitious/models/study_material_model.dart';
import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StudyMaterialController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<StudyMaterialModel> studyMaterialList = RxList();

  

  Future<dynamic> studyMaterialApi(String id) async {
    // isLoading(true);
    print("...."+ id.toString());

    var request = http.get(
      Uri.parse(RestDatasource.STUDYMETERIAL_URL + id),
      headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmI1NzhjNzNlMWY2ODNhZTcwM2JhNGMiLCJlbWFpbCI6ImNoYWl0YW55YUBnbWFpbC5jb20iLCJpYXQiOjE2NTYwNjAzMzN9.xQy5ZCyQrXu_y54fXIV5VOo5fsNvt__R8L6wWrTshWI"
      },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      print("Response: " + response.body.toString() + "_");
      print("ResponseJSON: " + jsonRes.toString() + "_");
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['Moduledata'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

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

          print("name: " + jsonArray[i]["courseData"].toString());


          // update();
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
