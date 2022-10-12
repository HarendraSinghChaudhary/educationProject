import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/testing/dammysotryview.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
// import 'package:story_view/controller/story_controller.dart';
import '../../models/darkcoursemodel.dart';
import '../../screens/dark_course_detail.dart';
import '../../screens/flash_card.dart';
import '../../utils/endpoint_url.dart';
import '../study_material/study_material_controller.dart';

class DarkCourseDetail_Controller extends GetxController {
String ids ;

DarkCourseDetail_Controller({required this.ids});
Rxn<DarkCourseDetailModel> bigdata = Rxn<DarkCourseDetailModel>();
RxBool isLoading = true.obs;
RxInt viewCount= 0.obs;
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
replace(){
  Get.back();
  Get.to(
    ()=>DarkCourseDetail(),
    binding: DarkCourseDetailBinding(id: ids)
  );
}
late final Mixpanel mixpanel;
Future<void> _initMixpanel() async {
   mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4", optOutTrackingDefault: false);
  }

@override
  void onInit() {
    // TODO: implement onInit
   
    relode();
    darkCourseId = ids;
    _initMixpanel();
    super.onInit();
  }

  relode(){
    getcourse_Module().whenComplete(() {
mixpanel.track(
        "Course Home Page",
       properties: {
        "Course Name":bigdata.value!.title.toString(),
        "Email":Preferences.pref!.get("email")
       } 
      );
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
  firstcheck(){
      bool what = bigdata.value!.allmodule!.every((value){
       if(value.IsCompleated!){

        return true;
       }else{
        return false;
       }
        });
       return what;
  }
  checkCopletion(){
    print("start");
    
    if(firstcheck()){
      print("1212121212");
      isCompleted.value = false;

    }else{
      print("123123123");
      isCompleted.value=true;
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
Future<bool> goback()async{
  if(!isCompleted.value){
mixpanel.track(
        "Course Finished",
       properties: {
        "Course Name":bigdata.value!.title.toString(),
        "Email":Preferences.pref!.get("email")
       } 
      );
  }
  return true;
}
onpressed(){
  if(bigdata.value!.allmodule!.isEmpty){
   showSnack(
    "No Module Available",
    "Modules Will Be Available Soon"
   );
  }else if(!isCompleted.value){
    //  Get.snackbar("module completed", "");
    mixpanel.track(
        "Course Finished",
       properties: {
        "Course Name":bigdata.value!.title.toString(),
        "Email":Preferences.pref!.get("email")

       } 
      );
    Get.back();
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
      title: startTitle.toString(),
      
      ),
      // binding: StudayMaterialBinding(id: startid,moduleId: module_id,title:startTitle),
      );
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
        "Authorization":Preferences.pref!.getString("token").toString() },);

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