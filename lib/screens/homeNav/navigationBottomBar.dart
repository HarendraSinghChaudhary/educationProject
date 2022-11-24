import 'package:Ambitious/controllers/exitDialogue/exit_controller.dart';
import 'package:Ambitious/controllers/EventController/eventController.dart';
import 'package:Ambitious/screens/homeNav/Setting/profile.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'Commuinity/eventView.dart';
import 'Browse/dark_course.dart';
import 'For_you/newHome_live.dart';

// in working

class BottomNavigationScreen extends StatefulWidget {
  RxInt index, learningPathIndex;
  BottomNavigationScreen(
      {required this.index, required this.learningPathIndex});

  @override
  State<BottomNavigationScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<BottomNavigationScreen> {
  ProfileController profileController =
      Get.put(ProfileController(), permanent: true);
  EventController powerHoursController =
      Get.put(EventController(), permanent: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileController._selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (s) => IndexedStack(
            index: s.selectedIndex,
            children: <Widget>[
              // const HomeLive(),
              const NewHomeLive(),
              const Dark_Course(),

              //EventView(),
              const Profile(),
            ],
          ),
        ),
        bottomNavigationBar: SuperFaBottomNavigationBar(),
      ),
    );
  }
}

class SuperFaBottomNavigationBar extends StatelessWidget {
  ProfileController profileController =
      Get.put(ProfileController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      // init only first time
      builder: (s) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset(
                'assets/images/foryou.png',
                width: 20,
                color: profileController._selectedIndex == 0.obs
                    ? kPrimaryColor
                    : kWhiteColor,
              ),
            ),

            //dashboard
            label: "For You",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(
                  'assets/images/search.svg',
                  width: 20,
                  color: profileController._selectedIndex == 1.obs
                      ? kPrimaryColor
                      : kWhiteColor,
                ),
              ),

              //Enquiry
              label: "Browse"),
          // BottomNavigationBarItem(
          //     icon: Padding(
          //       padding: const EdgeInsets.only(bottom: 5.0),
          //       child: SvgPicture.asset(
          //         'assets/images/community.svg',
          //         width: 25,
          //         color: profileController._selectedIndex == 2.obs
          //             ? kPrimaryColor
          //             : kWhiteColor,
          //       ),
          //     ),
          //     label: "Community"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(
                  'assets/images/profile2.svg',
                  width: 20,
                  color: profileController._selectedIndex == 3.obs
                      ? kPrimaryColor
                      : kWhiteColor,
                ),
              ),

              //Menu
              label: "Settings")
        ],
        currentIndex: s.selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kWhiteColor,
        backgroundColor: kdarkblue,
        onTap: (index) => s.onItemTapped(index),
      ),
    );
  }
}

class ProfileController extends GetxController {
  late RxInt _selectedIndex = 0.obs;
  set selectedIndex(value) => _selectedIndex.value = value;
  get selectedIndex => _selectedIndex.value;

  onItemTapped(int index) {
    selectedIndex =
        index; // The set method is accessed this way, you have confused it with methods.
    update();
  }
}
