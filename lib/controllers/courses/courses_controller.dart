import 'dart:convert';
import 'dart:developer';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/models/allcourses_model.dart';
import 'package:Ambitious/models/courseby_cat_model.dart';
import 'package:Ambitious/models/get_courses_library_model.dart';
import 'package:Ambitious/models/get_hot_courses_model.dart';
import 'package:Ambitious/models/learnig_path_model.dart';
import 'package:Ambitious/screens/onboarding/quick_notification.dart';
import 'package:Ambitious/services/mixpanel.dart';
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

  RxList<Categories>? getCourseLibraryCategoriesList = RxList();
  RxList<Library>? getCourseLibraryList = RxList();

  @override
  void onInit() {
    mixpanelTrack("Course Browse");
    gethotsubcatApi();
    getHotCoursesApi();
    learningPathApi();
    allCoursesApi();
    super.onInit();
  }

  change_to_a(int a) {
    var b = ((a / 100) * 255).toInt();
    return b;
  }

  bottomSheet() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.bottomSheet(const QuickNotification(),
          // persistent:false,
          isScrollControlled: true,
          enterBottomSheetDuration: const Duration(milliseconds: 1000));
    });
  }

  Future<dynamic> getCoursesLibrary() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.LIBRARY_URL),
      headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
      },
    );
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;

      jsonRes = json.decode(response.body.toString());
    });

    if (res.statusCode == 200) {
      final librarymodel = GetCourseLibraryModel.fromJson(jsonRes);

      librarymodel.categories!.forEach((element) {
        getCourseLibraryCategoriesList!.add(element);
      });

      librarymodel.library!.forEach((element) {
        getCourseLibraryList!.add(element);
      });

      isLoading(false);
      update();
    } else {
      log("Error: RestDatasource.LIBRARY_URL Failed To Load Data");
      isLoading(false);
      update();
    }
  }

  Future<dynamic> gethotsubcatApi() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETHOTSUBCET_URL),
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
      const JsonDecoder _decoder = JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
      if (jsonRes["status"].toString() == "true") {
        hotsubcatList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
          LearningPathModel modelAgentSearch = LearningPathModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.subCategoryName =
              jsonArray[i]["category"].toString();
          modelAgentSearch.description = jsonArray[i]["Description"] ?? "";
          modelAgentSearch.a = jsonArray[i]["A"] ?? 255;
          modelAgentSearch.r = jsonArray[i]["R"] ?? 0;
          modelAgentSearch.g = jsonArray[i]["G"] ?? 0;
          modelAgentSearch.b = jsonArray[i]["B"] ?? 0;

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

            courseModel.description = subcatList[j]["description"].toString();
            courseModel.allLikes = subcatList[j]["allLikes"].toString();
            courseModel.viewCount = subcatList[j]['ViewsCount'] ?? 0;

            courseModel.title = subcatList[j]["title"].toString();
            courseModel.modules = subcatList[j]["allmodule"].length;

            modelAgentSearch.courseListbyLearningPath.add(courseModel);
          }

          hotsubcatList.add(modelAgentSearch);

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

  Future<dynamic> getHotCoursesApi() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETHOTCOURSE_URL),
      headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
      },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;
    try {
      await request.then((http.Response response) {
        res = response;
        const JsonDecoder _decoder = JsonDecoder();
        jsonRes = _decoder.convert(response.body.toString());
        msg = jsonRes["message"].toString();
        jsonArray = jsonRes['courseData'];
      });

      if (res.statusCode == 200) {
        if (jsonRes["status"].toString() == "true") {
          getHotCourseList.clear();

          for (var i = 0; i < jsonArray.length; i++) {
            GetHotCoursesModel modelAgentSearch = GetHotCoursesModel();

            modelAgentSearch.id = jsonArray[i]["_id"].toString();
            modelAgentSearch.title = jsonArray[i]["title"].toString();

            modelAgentSearch.shortDescrition =
                jsonArray[i]["shortDescrition"].toString();
            modelAgentSearch.description =
                jsonArray[i]["description"].toString();

            modelAgentSearch.categoryId = jsonArray[i]["categoryId"].toString();
            modelAgentSearch.courseDatatitle =
                jsonArray[i]["courseDatatitle"].toString();
            modelAgentSearch.hotCourses = jsonArray[i]["hotCourses"].toString();

            modelAgentSearch.courseData = jsonArray[i]["courseData"].toString();
            modelAgentSearch.allLikes = jsonArray[i]["allLikes"].toString();
            modelAgentSearch.allModules =
                jsonArray[i]["allmodule"].length.toString();
            modelAgentSearch.viewCount = jsonArray[i]["ViewsCount"].toString();

            if (jsonArray[i]["image"] != null) {
              modelAgentSearch.image = jsonArray[i]["image"].toString();
            }

            getHotCourseList.add(modelAgentSearch);

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
    } catch (e) {}
  }

  Future<dynamic> learningPathApi() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.LEARNINGPATH_URL),
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
      const JsonDecoder _decoder = JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
      if (jsonRes["status"].toString() == "true") {
        learningPathList.clear();

        for (var i = 0; i < jsonArray.length; i++) {
          LearningPathModel modelAgentSearch = LearningPathModel();

          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.subCategoryName =
              jsonArray[i]["subCategory"].toString();
          modelAgentSearch.description = jsonArray[i]["Description"] ?? "";
          modelAgentSearch.a = jsonArray[i]["A"] ?? 255;
          modelAgentSearch.r = jsonArray[i]["R"] ?? 0;
          modelAgentSearch.g = jsonArray[i]["G"] ?? 0;
          modelAgentSearch.b = jsonArray[i]["B"] ?? 0;

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

            courseModel.description = subcatList[j]["description"].toString();
            courseModel.allLikes = subcatList[j]["allLikes"].toString();

            courseModel.title = subcatList[j]["title"].toString();
            courseModel.modules = subcatList[j]["allmodule"].length;
            courseModel.viewCount = subcatList[j]["ViewsCount"] ?? 0;

            modelAgentSearch.courseListbyLearningPath.add(courseModel);
          }

          learningPathList.add(modelAgentSearch);

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

  Future<dynamic> allCoursesApi() async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETHOTSUBCET_URL),
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
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
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

            courseModel.description = catList[j]["description"].toString();

            courseModel.title = catList[j]["title"].toString();

            modelAgentSearch.courseListbyCategory.add(courseModel);
          }

          allCourseList.add(modelAgentSearch);

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

  Future<dynamic> coursesByCatApi(String catId) async {
    isLoading(true);

    var request = http.get(
      Uri.parse(RestDatasource.GETSUBCATEGORY + catId),
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
      const JsonDecoder _decoder = JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
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

  Future<dynamic> coursecount(String courseId) async {
    isLoading(true);

    var request = http.post(Uri.parse(RestDatasource.COURSEVIEWCOUNT_URL),
        headers: {
          "Authorization": Preferences.pref!.getString("token").toString()
        },
        body: {
          "courseId": courseId
        });

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      final JsonDecoder _decoder = new JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['courseData'];
    });

    if (res.statusCode == 200) {
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

  Future<dynamic> addfcm(String fcm) async {
    try {
      var request =
          http.post(Uri.parse(RestDatasource.ADDFCMTOKEN_URL), headers: {
        "Authorization": Preferences.pref!.getString("token").toString()
      }, body: {
        "userid": Preferences.pref!.getString("id").toString(),
        "FcmToken": Preferences.pref!.getString("fcmToken").toString()
      });

      String msg = "";
      var jsonArray;
      var jsonRes;
      var res;

      await request.then((http.Response response) {
        res = response;
        final JsonDecoder _decoder = new JsonDecoder();
        jsonRes = _decoder.convert(response.body.toString());
        msg = jsonRes["msg"].toString();
      });

      if (res.statusCode == 200) {
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
    } catch (e) {}
  }
}
