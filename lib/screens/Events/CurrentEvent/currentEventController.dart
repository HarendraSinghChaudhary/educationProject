


import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/screens/Events/eventController.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
class CurrentEventBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CurrentEventController());
  }
}
class CurrentEventController extends GetxController{
  DateTime? date ;
 Rxn<Datum> data =Rxn<Datum>();
   @override
  void onInit() {
    // TODO: implement onInit
    data = Get.find<EventController>().data;
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  convertdate(){
    date = DateTime.parse(data.value!.data.toString());
    return date;
  }
}