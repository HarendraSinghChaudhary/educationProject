import 'dart:convert';
import 'dart:developer';

import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../models/onboarding_finish_model.dart';
import '../../utils/sharedPreference.dart';

class OnBoardingController extends GetxController {
  RxBool isLoading = false.obs;
  OnBoardingFinishModel? onBoardingFinishModel;
  RxList<String> interestedInSelectedList = RxList();
  RxList<String> goalsSelectedList = RxList();
  RxList<String> learningPreferencesSelectedList = RxList();

  Future<dynamic> finishOnBoarding() async {
    try {
      var request = http.post(Uri.parse(RestDatasource.FINISH_ONBOARDING_URL),
          headers: {
            'content-type': 'application/json',
            "Authorization": Preferences.pref!.getString("token").toString()
          },
          body: json.encode({
            "interestedIn": interestedInSelectedList,
            "careerGoals": goalsSelectedList,
            "learningPreferences": learningPreferencesSelectedList
          }));

      String msg = "";
      var jsonArray;
      var jsonRes;
      var res;

      await request.then((http.Response response) {
        res = response;
        log("OnBoarding Req Status: " + response.statusCode.toString());
        const JsonDecoder _decoder = JsonDecoder();
        jsonRes = _decoder.convert(response.body.toString());
      });

      if (res.statusCode == 200) {
        log("${jsonRes["learningPath"]["header"]}");
        log("${jsonRes["learningPath"]["suggestedPath"]["title"]}");

        log("${jsonRes["learningPath"]["suggestedPath"]["reasons"][0]}");
        log("${jsonRes["learningPath"]["suggestedPath"]["reasons"][1]}");

        log("${jsonRes["learningPath"]["suggestedPath"]["tools"][0]}");
        log("${jsonRes["learningPath"]["suggestedPath"]["tools"][1]}");

        log("${jsonRes["learningPath"]["suggestedPath"]["tagline"]}");
        log("${jsonRes["learningPath"]["suggestedPath"]["learnerCount"]}");

        onBoardingFinishModel= OnBoardingFinishModel(
          header: jsonRes["learningPath"]["header"], 
          title: jsonRes["learningPath"]["suggestedPath"]["title"], 
          reasons: jsonRes["learningPath"]["suggestedPath"]["reasons"],
           tools: jsonRes["learningPath"]["suggestedPath"]["tools"],
            tagline: jsonRes["learningPath"]["suggestedPath"]["tagline"],
             learnerCount: jsonRes["learningPath"]["suggestedPath"]["learnerCount"]);

        update();
        return 200;
      } else {
        update();
        return res.statusCode;
      }
    } catch (e) {
      log("Error : ${e.toString()}");
    }
  }
}
