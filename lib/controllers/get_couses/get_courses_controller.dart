

import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CategoryModel> categoryList = RxList();
  RxList<SubCategoryModel> subCategoryList = RxList();

  Future<dynamic> categoryApi() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETCATEGORY),
      headers: {
        "Authorization":
            token.toString()
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
      jsonArray = jsonRes['CategoryData'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        categoryList.clear();
        for (var i = 0; i < jsonArray.length; i++) {
          CategoryModel modelAgentSearch = CategoryModel();
          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.category = jsonArray[i]["category"].toString();
          modelAgentSearch.image = jsonArray[i]["image"].toString();
          modelAgentSearch.createdAt = jsonArray[i]["createdAt"].toString();

          categoryList.add(modelAgentSearch);

          print("name: " + jsonArray[i]["category"].toString());

          isLoading(false);

          update();
        }

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