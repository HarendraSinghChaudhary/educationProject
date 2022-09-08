import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/testing/dammysotryview.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:story_view/controller/story_controller.dart';
import '../../models/darkcoursemodel.dart';
import '../../screens/dark_course_detail.dart';
import '../../screens/flash_card.dart';
import '../../utils/endpoint_url.dart';

class DarkCourseDetail_Controller extends GetxController {
String ids ;

DarkCourseDetail_Controller({required this.ids});
Rxn<DarkCourseDetailModel> bigdata = Rxn<DarkCourseDetailModel>();
RxBool isLoading = true.obs;
final scrollcontroller = ScrollController();
String finishId = "";
bool isread = false;
int ontapLength = 0;
String lessonTitle = "";
String darkCourseId = "";
String module_id = "";
RxBool isCompleted = false.obs;
Rx<bool> isstart = true.obs;
String startid = "";
String startTitle = "";
replace(){
  Get.back();
  Get.to(
    ()=>DarkCourseDetail(),
    binding: DarkCourseDetailBinding(id: ids)
  );
}
@override
  void onInit() {
    // TODO: implement onInit
    
    relode();
    darkCourseId = ids;
    super.onInit();
  }
  relode(){
    getcourse_Module().whenComplete(() {
      for (var element in bigdata.value!.allmodule!) { 
        if(element.IsCompleated!){
          isstart(false);
          break;
        }
      }
      checkCopletion();
      update();
    });
  }
  checkCopletion(){
    print("start");
    if(bigdata.value!.allmodule!.every((value){
       if(value.IsCompleated!){
          return true;
       }else{
        return false;
       }
    })){
      print("1212121212");
      isCompleted(false);

    }else{
      print("123123123");
      isCompleted(true);
    }
    // for (var element in bigdata.value!.allmodule!) { 
    //     if(!element.IsCompleated!){
    //       startid = element.id.toString();
    //       startTitle = element.moduletitle.toString();
    //       module_id = element.moduleId.toString();
    //       break;
    //     }}
    // for (var element in bigdata.value!.allmodule!) { 
    //     if(element.IsCompleated!){
    //       isstart(false);
    //       break;
    //     }
        

      // }
  }
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    
  }
  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

onpressed(){
  if(bigdata.value!.allmodule!.isEmpty){
     Get.snackbar("No module availble", "");
  }else if(!isCompleted.value){
     Get.snackbar("module completed", "");

  } else {
for (var element in bigdata.value!.allmodule!) { 
        if(!element.IsCompleated!){
          startid = element.id.toString();
          startTitle = element.moduletitle.toString();
          module_id = element.moduleId.toString();
          ontapLength = element.studayMaterial!;
          isread = element.IsCompleated!;
          break;
        }
      }
      // StroryViews.id = startid.toString();
      // StroryViews.moduleId = module_id;
      // StroryViews.id=startTitle.toString();
      // Get.to(
      //   ()=>StroryViews(),
      //   binding: StoryViewBinding()
      // );
if(ontapLength!=0){
Get.to(() => CustomStoryView(
      id: startid.toString(),
      moduleId: module_id,
      title: startTitle.toString()));
      lessonTitle =
       startTitle.toString();
       finishId = module_id.toString();
}else{
  Get.snackbar("", "");
}
      
  }
  
}


Future getcourse_Module()async{
  print("course id: "+ ids.toString());
Uri url = Uri.parse(RestDatasource.GETCOURSEMODULE+ids+"&userid="+Preferences.pref!.getString("id").toString());
try {
  var request =await http.get(
    url,
      headers: {
        "Authorization":
            authToken
      },);

      print("token: "+authToken.toString());
      if(request.statusCode==200){
        var data = jsonDecode(request.body);
        print("data===="+data.toString());
        // bigdata.value = null;
       bigdata.value = darkCourseDetailModelFromJson(jsonEncode(data["data"]));
       isLoading(false);
       print(isLoading);


      }
} catch (e) {
  print(e);
  
}
}

}

class DarkCourseDetailBinding implements Bindings {
  String id;
  DarkCourseDetailBinding({required this.id});
  @override
  void dependencies() {
    Get.lazyPut<DarkCourseDetail_Controller>(() => DarkCourseDetail_Controller(ids: id)); 
    
  }
}