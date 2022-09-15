

import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
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
Rxn<AllDatum> data = Rxn<AllDatum>();
RxBool homeloading = false.obs;
RxBool showyoutube = false.obs;
String timezonename = "";
Future setCurentLocation() async {
  String timezone = 'Etc/UTC';
  print("======= $timezone");
  try {
    timezonename = await FlutterNativeTimezone.getLocalTimezone();
    print("=======111 $timezone");
  } catch (e) {
    print('Could not get the local timezone');
  }
  // _currentLocation = getLocation(timezone);
  // setLocalLocation(_currentLocation);
}
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    setCurentLocation().whenComplete((){
    getpowerHourData();
    });
    super.onInit();
  }
  Future getpowerHourData()async{

     Uri url = Uri.parse(RestDatasource.GETPOWERHOUR_URL+"?timeZone="+timezonename);
try {
  var request =await http.get(
    url,
      headers: {
        "Authorization":
            Preferences.pref!.getString("token").toString()
      },);
      if(request.statusCode==200){
        powerHours.value = powerHoursModelFromJson(request.body);
        homeloading(true);
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
  convertdate(DateTime date){

return DateFormat("EEEE MMMM dd").format(date);

  }

}