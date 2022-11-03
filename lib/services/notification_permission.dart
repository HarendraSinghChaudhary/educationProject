import 'package:Ambitious/screens/onboarding/quick_notification.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class NotificationPermission extends StatefulWidget {
  const NotificationPermission({Key? key}) : super(key: key);

  @override
  State<NotificationPermission> createState() => _NotificationPermissionState();
}

class _NotificationPermissionState extends State<NotificationPermission> {
  bool status = false;
  bool buttonPress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text("Permissions"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(11),
                            height: Get.height * 0.05,
                            width: Get.width * 0.12,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kPurpleColor),
                            child: SvgPicture.asset(
                              "assets/images/not.svg",
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Notifications",
                          style: TextStyle(
                              color: kTitleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        child: FlutterSwitch(
                          activeColor: kPurpleColor,
                          width: Get.width * 0.13,
                          height: Get.height * 0.03,
                          valueFontSize: 0.0,
                          toggleSize: 20.0,
                          toggleColor: Colors.white,
                          value: status,
                          borderRadius: 30.0,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              status = val;

                              if (status == true) {
                                Get.to(const QuickNotification());
                                setState(() {});
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
