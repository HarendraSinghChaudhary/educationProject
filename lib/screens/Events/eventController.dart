

import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

import '../../utils/endpoint_url.dart';
class EventBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}
class EventController extends GetxController{
  
Rxn<PowerHoursModel> powerHours = Rxn<PowerHoursModel>();
RxString slackurl = "".obs;
RxString slackTitle = "".obs;
Rxn<Datum> data = Rxn<Datum>();
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getpowerHourData();
    super.onInit();
  }
  Future getpowerHourData()async{

     Uri url = Uri.parse(RestDatasource.GETPOWERHOUR_URL);
try {
  var request =await http.get(
    url,
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString()
      },);
      if(request.statusCode==200){
        powerHours.value = powerHoursModelFromJson(request.body);
      }
} catch (e) {
  print(e);
  
}
  } 
  Future getslackData()async{

     Uri url = Uri.parse(RestDatasource.SLACK_URL);
try {
  var request =await http.get(
    url,
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString()
      },);
      if(request.statusCode==200){
      }
} catch (e) {
  print(e);
  
}
  }
  convertdate(String data){

   DateTime date= DateTime.parse(data.toString());
return   DateFormat("EEEE MMMM dd").format(date);

  }

}