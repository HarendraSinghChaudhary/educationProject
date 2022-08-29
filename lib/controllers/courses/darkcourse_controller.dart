import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../../models/darkcoursemodel.dart';
import '../../screens/flash_card.dart';
import '../../utils/endpoint_url.dart';

class DarkCourseDetail_Controller extends GetxController {
String ids ;

DarkCourseDetail_Controller({required this.ids});
Rxn<DarkCourseDetailModel> bigdata = Rxn<DarkCourseDetailModel>();
RxBool isLoading = true.obs;
final scrollcontroller = ScrollController();
String finishId = "";
String lessonTitle = "";
String darkCourseId = "";
Rx<bool> isstart = true.obs;
String startid = "";
String startTitle = "";
@override
  void onInit() {
    // TODO: implement onInit
    
    getcourse_Module().whenComplete(() {
      for (var element in bigdata.value!.allmodule!) { 
        if(element.IsCompleated!){
          isstart(false);
          break;
        }
      }
    });
    darkCourseId = ids;
    super.onInit();
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
  }else{
for (var element in bigdata.value!.allmodule!) { 
        if(!element.IsCompleated!){
          startid = element.id.toString();
          startTitle = element.moduletitle.toString();
          break;
        }
      }
      Get.to(() => FlashCard(
      id: startid.toString(),
      title: startTitle.toString()));
      lessonTitle =
       startTitle.toString();
       finishId = startid.toString();
  }
  
}


Future getcourse_Module()async{
  print("course id: "+ ids.toString());
Uri url = Uri.parse(RestDatasource.GETCOURSEMODULE+ids);
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
       bigdata.value = darkCourseDetailModelFromJson(jsonEncode(data["data"]));
       isLoading(false);
       print(isLoading);


      }
} catch (e) {
  
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