import 'dart:convert';

import 'package:Ambitious/controllers/category/category_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/models/allcourses_model.dart';
import 'package:Ambitious/models/courseby_cat_model.dart';
import 'package:Ambitious/models/learnig_path_model.dart';
import 'package:Ambitious/models/subcategory_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';

import 'package:Ambitious/models/category_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class CoursesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CoursesByCatModel> coursesByCatList = RxList();
  RxList<AllCoursesModel> allCourseList = RxList();
  RxList<LearningPathModel> learningPathList = RxList();
  //  RxList<CoursesByCatModel> courseDataList = RxList();




    Future<dynamic> learningPathApi() async {
    print("token courses" + token.toString());

    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.LEARNINGPATH_URL),
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
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        learningPathList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
         LearningPathModel modelAgentSearch = LearningPathModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.subCategoryName = jsonArray[i]["subCategory"].toString();

          if (jsonArray[i]["image"] != null) {
            modelAgentSearch.image = jsonArray[i]["image"].toString();
          }

          var subcatList = jsonArray[i]["courseData"];

          for (var j = 0; j < subcatList.length; j++) {
            CoursesByCatModel courseModel = CoursesByCatModel();

            courseModel.id = subcatList[j]["_id"].toString();
            courseModel.shortDescrition =
                subcatList[j]["shortDescrition"].toString();

            courseModel.image = subcatList[j]["image"].toString();

            courseModel.description =
                subcatList[j]["description"].toString();

        
              courseModel.title = subcatList[j]["title"].toString();
          

          modelAgentSearch.courseListbyLearningPath.add(courseModel);


          print("title: "+subcatList[j]["title"].toString());


          
          }
          
          learningPathList.add(modelAgentSearch);

          // print("new: "+ allCourseList[0].courseListbyCategory[0].image.toString());

       

          isLoading(false);

          update();
        }

        // Get.snackbar(
        //   "",
        //   "",
        //   snackPosition: SnackPosition.TOP,
        //   titleText: Text(jsonRes["message"].toString()),
        //   messageText: Text(""),
        //   colorText: Colors.red,
        // );

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

  Future<dynamic> allCoursesApi() async {
    print("token courses" + token.toString());

    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.ALLCOURSES),
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
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        allCourseList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
          AllCoursesModel modelAgentSearch = AllCoursesModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.categoryName = jsonArray[i]["category"].toString();

          if (jsonArray[i]["image"] != null) {
            modelAgentSearch.image = jsonArray[i]["image"].toString();
          }

          var catList = jsonArray[i]["courseData"];

          for (var j = 0; j < catList.length; j++) {
            CoursesByCatModel courseModel = CoursesByCatModel();

            courseModel.id = catList[j]["_id"].toString();
            courseModel.shortDescrition =
                jsonArray[j]["shortDescrition"].toString();

            if (jsonArray[j]["image"] != null) {
              courseModel.image = catList[j]["image"].toString();
            }

            courseModel.description =
                catList[j]["description"].toString();

        
              courseModel.title = catList[j]["title"].toString();
          

          modelAgentSearch.courseListbyCategory.add(courseModel);


          print("title: "+catList[j]["title"].toString());


          
          }
          
          allCourseList.add(modelAgentSearch);

          print("new: "+ allCourseList[0].courseListbyCategory[0].image.toString());

       

          isLoading(false);

          update();
        }

        // Get.snackbar(
        //   "",
        //   "",
        //   snackPosition: SnackPosition.TOP,
        //   titleText: Text(jsonRes["message"].toString()),
        //   messageText: Text(""),
        //   colorText: Colors.red,
        // );

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

  Future<dynamic> coursesByCatApi(String catId) async {
    print("token courses" + token.toString());
    print("catId courses" + catId.toString());
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETSUBCATEGORY + catId),
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
      jsonArray = jsonRes['courseData'];
      print("length: " + jsonArray.length.toString());
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        coursesByCatList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
          CoursesByCatModel modelAgentSearch = CoursesByCatModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.shortDescrition =
              jsonArray[i]["shortDescrition"].toString();

          if (jsonArray[i]["image"] != null) {
            modelAgentSearch.image = jsonArray[i]["image"].toString();
          }

          modelAgentSearch.description = jsonArray[i]["description"].toString();

          if (jsonArray[i]["title"] != null) {
            modelAgentSearch.title = jsonArray[i]["title"].toString();
          }

          coursesByCatList.add(modelAgentSearch);

          print("name: " + jsonArray[i]["description"].toString());

          isLoading(false);

          update();
        }

        // Get.snackbar(
        //   "",
        //   "",
        //   snackPosition: SnackPosition.TOP,
        //   titleText: Text(jsonRes["message"].toString()),
        //   messageText: Text(""),
        //   colorText: Colors.red,
        // );

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
