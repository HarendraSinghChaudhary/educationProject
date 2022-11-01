import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/controllers/EventController/eventController.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class CurrentEventBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CurrentEventController());
  }
}

class CurrentEventController extends GetxController {
  DateTime? date;
  DateTime currentdate = DateTime.now();
  Rxn<AllDatum> data = Rxn<AllDatum>();
  RxString youtubeTitle = "".obs;
  RxString youtubeAuther = "".obs;
  RxString youtubeImage = "".obs;
  RxBool isYoutube = false.obs;
  EventController eventController = Get.find<EventController>();

  @override
  void onInit() {
    data = Get.find<EventController>().data;
    super.onInit();
  }

  valueupdate(String title, String auther) {
    youtubeAuther.value = auther;
    youtubeTitle.value = title;
    update();
  }

  checkIsbefore() {}
  convertdate(DateTime date) {
    return DateFormat("EEEE MMMM dd ").add_jm().format(date.toLocal());
  }
}
