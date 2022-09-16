import 'dart:convert';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/models/allcourses_model.dart';
import 'package:Ambitious/models/courseby_cat_model.dart';
import 'package:Ambitious/models/get_hot_courses_model.dart';
import 'package:Ambitious/models/learnig_path_model.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/sharedPreference.dart';


class CoursesController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool homePageLoading = true.obs;
  RxList<CoursesByCatModel> coursesByCatList = RxList();
  RxList<AllCoursesModel> allCourseList = RxList();
  RxList<LearningPathModel> learningPathList = RxList();
  RxList<LearningPathModel> hotsubcatList = RxList();
   RxList<GetHotCoursesModel> getHotCourseList = RxList();


@override
  void onInit() {
    // TODO: implement onInit
    
gethotsubcatApi();
getHotCoursesApi();
learningPathApi();
allCoursesApi();
    super.onInit();
  }
change_to_a(int a){
  var b = ((a/100)*255).toInt();
  print(b);
 return b;
}

Future<dynamic> gethotsubcatApi() async {
    print("token courses" + token.toString());

    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETHOTSUBCET_URL),
      headers: {
        "Authorization":Preferences.pref!.getString("token").toString() },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      const JsonDecoder _decoder =  JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      print("Response: " + response.body.toString() + "_");
      print("ResponseJSON: " + jsonRes.toString() + "_");
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['subcategoryData'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        hotsubcatList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
         LearningPathModel modelAgentSearch = LearningPathModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.subCategoryName = jsonArray[i]["subCategory"].toString();
          modelAgentSearch.description = jsonArray[i]["Description"]??"";
          modelAgentSearch.a = jsonArray[i]["A"]??255;
          modelAgentSearch.r = jsonArray[i]["R"]??0;
          modelAgentSearch.g = jsonArray[i]["G"]??0;
          modelAgentSearch.b = jsonArray[i]["B"]??0;

          if (jsonArray[i]["image"] != null) {
            modelAgentSearch.image = jsonArray[i]["image"].toString();
          }

          // var subcatList = jsonArray[i]["courseData"];


          // for (var j = 0; j < subcatList.length; j++) {
          //   CoursesByCatModel courseModel = CoursesByCatModel();

          //   courseModel.id = subcatList[j]["_id"].toString();
          //   courseModel.shortDescrition =
          //       subcatList[j]["shortDescrition"].toString();

          //   courseModel.image = subcatList[j]["image"].toString();

          //   courseModel.description =
          //       subcatList[j]["description"].toString();
          //       courseModel.allLikes = subcatList[j]["allLikes"].toString();

        
          //     courseModel.title = subcatList[j]["title"].toString();
          //     courseModel.modules = subcatList[j]["allmodule"].length;
          

          // modelAgentSearch.courseListbyLearningPath.add(courseModel);


          // print("title: "+subcatList[j]["title"].toString());


          
          // }
          
          hotsubcatList.add(modelAgentSearch);

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




    Future<dynamic> getHotCoursesApi() async {
    print("token courses" + token.toString());

    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETHOTCOURSE_URL),
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString() },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      const JsonDecoder _decoder = JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      print("Response: " + response.body.toString() + "_");
      print("ResponseJSON: " + jsonRes.toString() + "_");
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        getHotCourseList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
         GetHotCoursesModel modelAgentSearch = GetHotCoursesModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.title= jsonArray[i]["title"].toString();

           modelAgentSearch.shortDescrition = jsonArray[i]["shortDescrition"].toString();
          modelAgentSearch.description= jsonArray[i]["description"].toString();

           modelAgentSearch.categoryId = jsonArray[i]["categoryId"].toString();
          modelAgentSearch.courseDatatitle= jsonArray[i]["courseDatatitle"].toString();
           modelAgentSearch.hotCourses= jsonArray[i]["hotCourses"].toString();

           modelAgentSearch.courseData = jsonArray[i]["courseData"].toString();
           modelAgentSearch.allLikes = jsonArray[i]["allLikes"].toString();
           modelAgentSearch.allModules = jsonArray[i]["allmodule"].length.toString();

          if (jsonArray[i]["image"] != null) {
            modelAgentSearch.image = jsonArray[i]["image"].toString();
          }



          
          getHotCourseList.add(modelAgentSearch);

         

       

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

    Future<dynamic> learningPathApi() async {
    print("token courses" + token.toString());

    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.LEARNINGPATH_URL),
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString() },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      const JsonDecoder _decoder =  JsonDecoder();
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
          modelAgentSearch.description = jsonArray[i]["Description"]??"";
          modelAgentSearch.a = jsonArray[i]["A"]??255;
          modelAgentSearch.r = jsonArray[i]["R"]??0;
          modelAgentSearch.g = jsonArray[i]["G"]??0;
          modelAgentSearch.b = jsonArray[i]["B"]??0;

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
                courseModel.allLikes = subcatList[j]["allLikes"].toString();

        
              courseModel.title = subcatList[j]["title"].toString();
              courseModel.modules = subcatList[j]["allmodule"].length;
          

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

  Future<dynamic> allCoursesApi() async {
    print("token courses" + token.toString());

    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETHOTSUBCET_URL),
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString()},
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
                catList[j]["shortDescrition"].toString();

            if (catList[j]["image"] != null) {
              courseModel.image = catList[j]["image"].toString();
            }

            courseModel.description =
                catList[j]["description"].toString();

        
              courseModel.title = catList[j]["title"].toString();

              // if (courseModel.courseData.toString() !=  "") {
              // courseModel.courseData = catList[j]["courseData"];
              // }
              
          

          modelAgentSearch.courseListbyCategory.add(courseModel);


          print("title: "+catList[j]["title"].toString());
          print("courseData: "+ catList[j]["courseData"].toString());


          
          }
          
          allCourseList.add(modelAgentSearch);

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

  Future<dynamic> coursesByCatApi(String catId) async {
    print("token courses" + token.toString());
    print("catId courses" + catId.toString());
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETSUBCATEGORY + catId),
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString()},
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      const JsonDecoder _decoder =  JsonDecoder();
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
