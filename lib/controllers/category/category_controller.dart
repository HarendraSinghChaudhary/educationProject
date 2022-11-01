import 'dart:convert';

import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../utils/sharedPreference.dart';

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CategoryModel> categoryList = RxList();
  RxList<SubCategoryModel> subCategoryList = RxList();

  Future<dynamic> categoryApi() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETCATEGORY),
      headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
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
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['CategoryData'];
    });

    if (res.statusCode == 200) {
      if (jsonRes["status"].toString() == "true") {
        categoryList.clear();
        for (var i = 0; i < jsonArray.length; i++) {
          CategoryModel modelAgentSearch = CategoryModel();
          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.category = jsonArray[i]["category"].toString();
          modelAgentSearch.image = jsonArray[i]["image"].toString();
          modelAgentSearch.createdAt = jsonArray[i]["createdAt"].toString();

          categoryList.add(modelAgentSearch);

          isLoading(false);

          update();
        }

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
