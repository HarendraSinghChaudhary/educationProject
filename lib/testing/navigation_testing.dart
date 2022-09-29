import 'package:Ambitious/controllers/courses/courses_controller.dart';
import 'package:Ambitious/controllers/exitDialogue/exit_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/models/learnig_path_model.dart';
import 'package:Ambitious/screens/Events/eventController.dart';
import 'package:Ambitious/screens/courses/courseHeader/view/course_header.dart';
import 'package:Ambitious/screens/courses/learningPath/view/learning_path.dart';
import 'package:Ambitious/screens/home/view/home_live.dart';
import 'package:Ambitious/screens/profile.dart';
import 'package:Ambitious/screens/resource_center.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/show_hide.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../screens/Events/eventView.dart';
import '../screens/dark_course.dart';
import '../screens/dark_learning_path.dart';
import '../screens/home/newHome_live.dart';

class BottomNavigationScreen extends StatefulWidget {

  RxInt index, learningPathIndex;
  BottomNavigationScreen({ required this. index, required this.learningPathIndex });


  @override
  State<BottomNavigationScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<BottomNavigationScreen> {

  ProfileController profileController = Get.put(ProfileController(), permanent: true);
  EventController powerHoursController = Get.put(EventController(), permanent: false);
    late final Mixpanel _mixpanel;

  Future<void> _initMixpanel() async {
    _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
        optOutTrackingDefault: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
    profileController._selectedIndex = widget.index;


    if (widget.index == 0.obs) {

      clearMethod();

   



    }
   
  }

  clearMethod () async{
     await  _initMixpanel();
    _mixpanel.track("Course Home Page");

  }


  @override
  Widget build(BuildContext context) {

    print("index: "+ widget.index.toString());
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
      EventView(),
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
 

  ProfileController profileController = Get.put(ProfileController(), permanent: false );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>( // init only first time
      builder: (s) => BottomNavigationBar(

         type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
                  
                  icon: Padding(
                     padding: const EdgeInsets.only(bottom: 5.0),
                    child: SvgPicture.asset(
                      'assets/images/home.svg',
                       width: 20,
                      color: profileController._selectedIndex == 0.obs ? kPrimaryColor : kWhiteColor,
                    ),
                  ),
                 
                  //dashboard
                  label: "For You",
                ),
              
              
              
              
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: SvgPicture.asset(
                        'assets/images/courses.svg',
                         width: 18,
                        color: profileController._selectedIndex == 1.obs ? kPrimaryColor: kWhiteColor,
                      ),
                    ),
            
                    //Enquiry
                    label: "Courses"),

                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: SvgPicture.asset(
                        'assets/images/profile.svg',
                        width: 22,
                        color: profileController._selectedIndex == 2.obs ? kPrimaryColor : kWhiteColor,
                      ),
                    ),
                    label: "Community"),
                // BottomNavigationBarItem(
                //     icon: Padding(
                //      padding: EdgeInsets.only(bottom: 5.0),
                //       child: SvgPicture.asset(
                //         'assets/icons/help.svg',
                //         width: 20,
                //         color: profileController._selectedIndex == 2.obs ? kPrimaryColor : kTitleColor,
                //       ),
                //     ),
                
                //     //Menu
                //     label: "Community"),
                BottomNavigationBarItem(
                    icon: Padding(
                     padding: const EdgeInsets.only(bottom: 3.0),
                      child: SvgPicture.asset(
                        'assets/images/profile.svg',
                        width: 20,
                        color: profileController._selectedIndex == 3.obs ? kPrimaryColor : kWhiteColor,
                      ),
                    ),
            
                    //Menu
                    label: "Profile")
              
              
        ],
        currentIndex: s.selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kWhiteColor,
        backgroundColor: kdarkblue,
        // unselectedLabelStyle:const TextStyle(color: kWhiteColor),
        onTap: (index) => s.onItemTapped(index),
        /* currentIndex: Get.find<ProfileController>().selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: Get.find<ProfileController>().onItemTapped, */
      ),
    );
  }
}

class ProfileController extends GetxController {

//  LearningPathIndex learningPathIndexController =
//       Get.put(LearningPathIndex(), permanent: false);

  late RxInt _selectedIndex = 0.obs;
  set selectedIndex(value) => _selectedIndex.value = value;
  get selectedIndex => _selectedIndex.value;

  onItemTapped(int index) {

  // learningPathIndexController.isShowIndex = 0.obs;

    selectedIndex = index; // The set method is accessed this way, you have confused it with methods.
    update();
  }
}
