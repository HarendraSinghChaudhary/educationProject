


import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/screens/Events/eventController.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class CurrentEventBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CurrentEventController());
  }
}
class CurrentEventController extends GetxController{
  DateTime? date ;
 Rxn<AllDatum> data =Rxn<AllDatum>();
 RxString youtubeTitle = "".obs;
 RxString youtubeAuther = "".obs;
 RxString youtubeImage = "".obs;
 RxBool isYoutube = false.obs;
   @override
  void onInit() {
    // TODO: implement onInit
    data = Get.find<EventController>().data;
    // youb
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  valueupdate(String title, String auther){
    youtubeAuther = auther.obs;
    youtubeTitle = title.obs;
    update();
  }
  convertdate(DateTime date){

return DateFormat("EEEE MMMM dd ").add_jm().format(date);

  }
}