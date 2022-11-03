import 'dart:convert';

import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/sharedPreference.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

import '../../utils/endpoint_url.dart';

//in working

class EventBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}

class EventController extends GetxController {
  Rxn<PowerHoursModel> powerHours = Rxn<PowerHoursModel>();
  RxString slackurl = "".obs;
  RxString slackTitle = "".obs;
  RxBool is_user_attending = false.obs;
  Rxn<AllDatum> data = Rxn<AllDatum>();
  RxBool homeloading = false.obs;
  RxBool showyoutube = false.obs;
  String timezonename = "";
  RxString selectedID = "".obs;
  RxString selectcount = "".obs;
  RxBool rsvploading = false.obs;
  RxInt selectedIndex = 0.obs;
  Future setCurentLocation() async {
    String timezone = 'Etc/UTC';
    try {
      timezonename = await FlutterNativeTimezone.getLocalTimezone();
    } catch (e) {}
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
    setCurentLocation().whenComplete(() {
      getpowerHourData();
    });
    super.onInit();
  }

  Future getpowerHourData() async {
    Uri url = Uri.parse(
        RestDatasource.GETPOWERHOUR_URL + "?timeZone=" + timezonename);
    try {
      var request = await http.get(
        url,
        headers: {
          "Authorization": Preferences.pref!.getString("token").toString()
        },
      );
      if (request.statusCode == 200) {
        powerHours.value = powerHoursModelFromJson(request.body);
        homeloading(true);
      }
    } catch (e) {}
  }

  Future rsvpapi() async {
    rsvploading.value = true;
    Uri url = Uri.parse(RestDatasource.RSVP_URL);
    try {
      var request = await http.post(
        url,
        body: {"powerHourId": selectedID.value},
        headers: {
          "Authorization": Preferences.pref!.getString("token").toString()
        },
      );
      var json = jsonDecode(request.body);
      if (request.statusCode == 200) {
        if (json["status"]) {
          powerHours.value!.upcoming![selectedIndex.value].is_user_attending =
              true;
          int value = int.parse(selectcount.value) + 1;
          selectcount.value = value.toString();
          powerHours.value!.upcoming![selectedIndex.value].attendees_count =
              value;
          rsvploading.value = false;
        } else {
          rsvploading.value = false;
          showSnack(json["msg"]);
        }
      } else {
        rsvploading.value = false;
        showSnack(json["msg"]);
      }
    } catch (e) {
      rsvploading.value = false;
    }
  }

  Future getslackData() async {
    Uri url = Uri.parse(RestDatasource.SLACK_URL);
    try {
      var request = await http.get(
        url,
        headers: {
          "Authorization": Preferences.pref!.getString("token").toString()
        },
      );
      if (request.statusCode == 200) {}
    } catch (e) {}
  }

  convertdate(DateTime date) {
    return DateFormat("EEEE MMMM dd").format(date.toLocal());
  }
}
