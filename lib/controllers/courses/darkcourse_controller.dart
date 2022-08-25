import 'dart:convert';

import 'package:Ambitious/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../../models/darkcoursemodel.dart';
import '../../utils/endpoint_url.dart';

class DarkCourseDetail_Controller extends GetxController {
String ids ;
DarkCourseDetail_Controller({required this.ids});
Rxn<DarkCourseDetailModel> bigdata = Rxn<DarkCourseDetailModel>();
RxBool isLoading = true.obs;
final scrollcontroller = ScrollController();

@override
  void onInit() {
    // TODO: implement onInit
    
    getcourse_Module(ids);
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
Future getcourse_Module(String id)async{
Uri url = Uri.parse(RestDatasource.GETCOURSEMODULE+id);
try {
  var request =await http.get(
    url,
      headers: {
        "Authorization":
            authToken
      },);
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