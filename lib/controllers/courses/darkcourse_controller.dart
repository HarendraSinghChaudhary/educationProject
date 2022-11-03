import 'dart:convert';
import 'package:Ambitious/services/mixpanel.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/darkcoursemodel.dart';
import '../../screens/homeNav/Browse/dark_course_detail.dart';
import '../../screens/homeNav/Browse/flash_card.dart';
import '../../utils/endpoint_url.dart';

class DarkCourseDetail_Controller extends GetxController {
  String ids;

  DarkCourseDetail_Controller({required this.ids});
  Rxn<DarkCourseDetailModel> bigdata = Rxn<DarkCourseDetailModel>();
  RxBool isLoading = true.obs;
  RxInt viewCount = 0.obs;
  final scrollcontroller = ScrollController();
  String finishId = "";
  bool isread = false;
  int ontapLength = 0;
  String lessonTitle = "";
  String darkCourseId = "";
  String module_id = "";
  RxBool isCompleted = false.obs;
  Rx<bool> isstart = true.obs;
  RxBool ismixpanelsent = false.obs;
  String startid = "";
  String startTitle = "";
  replace() {
    Get.back();
    Get.to(() => DarkCourseDetail(), binding: DarkCourseDetailBinding(id: ids));
  }

  @override
  void onInit() {
    // TODO: implement onInit

    relode();
    darkCourseId = ids;

    super.onInit();
  }

  relode() {
    getcourse_Module().whenComplete(() {
      Mixpanell.mixpanel!.track("Course Home Page", properties: {
        "Course Name": bigdata.value!.title.toString(),
        "Email": Preferences.pref!.get("email")
      });
      for (var element in bigdata.value!.allmodule!) {
        if (element.IsCompleated!) {
          isstart(false);
          break;
        }
      }
      checkCopletion();
      update();
    });
  }

  firstcheck() {
    bool what = bigdata.value!.allmodule!.every((value) {
      if (value.IsCompleated!) {
        return true;
      } else {
        return false;
      }
    });
    return what;
  }

  checkCopletion() {
    if (firstcheck()) {
      isCompleted.value = false;
    } else {
      isCompleted.value = true;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
  Future<bool> goback() async {
    if (!isCompleted.value) {
      Mixpanell.mixpanel!.track("Course Finished", properties: {
        "Course Name": bigdata.value!.title.toString(),
        "Email": Preferences.pref!.get("email")
      });
    }
    return true;
  }

  onpressed() {
    if (bigdata.value!.allmodule!.isEmpty) {
      showSnack("No Module Available", "Modules Will Be Available Soon");
    } else if (!isCompleted.value) {
      Mixpanell.mixpanel!.track("Course Finished", properties: {
        "Course Name": bigdata.value!.title.toString(),
        "Email": Preferences.pref!.get("email")
      });
      Get.back();
    } else {
      for (var element in bigdata.value!.allmodule!) {
        if (!element.IsCompleated!) {
          startid = element.id.toString();
          startTitle = element.moduletitle.toString();
          module_id = element.moduleId.toString();
          ontapLength = element.studayMaterial!;
          isread = element.IsCompleated!;
          break;
        }
      }

      if (ontapLength != 0) {
        Get.to(
          () => CustomStoryView(
            id: startid.toString(),
            moduleId: module_id,
            title: startTitle.toString(),
          ),
        );
        lessonTitle = startTitle.toString();
        finishId = module_id.toString();
      } else {
        Get.snackbar("", "");
      }
    }
  }

  Future getcourse_Module() async {
    Uri url = Uri.parse(RestDatasource.GETCOURSEMODULE +
        ids +
        "&userid=" +
        Preferences.pref!.getString("id").toString());
    try {
      var request = await http.get(
        url,
        headers: {
          "Authorization": Preferences.pref!.getString("token").toString()
        },
      );

      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        bigdata.value = darkCourseDetailModelFromJson(jsonEncode(data["data"]));
        isLoading(false);
      }
    } catch (e) {}
  }
}

class DarkCourseDetailBinding implements Bindings {
  String id;
  DarkCourseDetailBinding({required this.id});
  @override
  void dependencies() {
    Get.lazyPut<DarkCourseDetail_Controller>(
        () => DarkCourseDetail_Controller(ids: id));
  }
}
