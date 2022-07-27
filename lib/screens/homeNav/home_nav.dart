// // ignore_for_file: prefer_const_constructors, unnecessary_new

// import 'package:Ambitious/controllers/exitDialogue/exit_controller.dart';
// import 'package:Ambitious/controllers/home_nav/home_nav_controller.dart';

// import 'package:Ambitious/main.dart';
// import 'package:Ambitious/screens/courses/courseHeader/view/course_header.dart';
// import 'package:Ambitious/screens/home/view/home_live.dart';
// import 'package:Ambitious/screens/marketplace.dart';
// import 'package:Ambitious/screens/profileone.dart';
// import 'package:Ambitious/screens/resource_center.dart';
// import 'package:Ambitious/screens/profile.dart';
// import 'package:Ambitious/utils/constant.dart';
// import 'package:Ambitious/utils/show_hide.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';







// class HomeNav extends StatefulWidget {
//   int index;
//   RxInt? indexPath;
//   HomeNav({required this.index, this.indexPath});
//   @override
//   _HomeNavState createState() => _HomeNavState();
// }

// class _HomeNavState extends State<HomeNav> {

//   late ScrollController _controller;

//   HomeLive homeLive = HomeLive();


 
//   int _index = 0;
//   List widgets = <Widget>[
//    HomeLive(),
//    CourseHeader(),
//    // MarketPlace(),
//    ResourceCenter(),
//    Profile(),
//   ];


//   ScreenController screenController = Get.put(ScreenController(), permanent: false);


//   @override
//   void initState() {
//     super.initState();

    

//       screenController.tabIndex = widget.index;

     
//       controllerScroll = ScrollController();

//   }



//   @override
//   void dispose() {
//  controllerScroll.dispose();
//     super.dispose();
//   }

//   //LanguageChange languageChange = new LanguageChange();
//   GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

//   @override
//   Widget build(BuildContext context) {

//     print("index: "+widget.index.toString());

   
   
//     return 


//      WillPopScope(
//       onWillPop: () => showExitPopup(context), 
//       child: Scaffold(
//         backgroundColor: Colors.black,
        
//         body: widgets.elementAt(_index),
//         bottomNavigationBar:  BottomNavigationBar(
            
//             elevation: 30,
             
//               backgroundColor: Colors.white,
//               currentIndex: screenController.tabIndex,
//               type: BottomNavigationBarType.fixed,
//               // showSelectedLabels: true,
//               selectedIconTheme: IconThemeData(color: kPrimaryColor),
//               unselectedIconTheme: IconThemeData(color: kGreyColor),
//               selectedLabelStyle: TextStyle(fontSize: 12, color: kPrimaryColor, fontWeight: FontWeight.w400),
//               unselectedLabelStyle:
//                   TextStyle(fontSize: 12, color: kGreyColor),
//               selectedItemColor: kPrimaryColor,
//               unselectedItemColor: kTitleColor,
//               onTap: (page) {
              
//                 setState(() {
//                   _index = page;
//                 });
//               },
//               items: [
              
//                 BottomNavigationBarItem(
                  
//                   icon: Padding(
//                      padding: EdgeInsets.only(bottom: 5.0),
//                     child: SvgPicture.asset(
//                       'assets/images/home.svg',
//                        width: 20,
//                       color: screenController.tabIndex == 0 ? kPrimaryColor : kTitleColor,
//                     ),
//                   ),
                 
//                   //dashboard
//                   label: "Home",
//                 ),
              
              
              
              
//                 BottomNavigationBarItem(
//                     icon: Padding(
//                       padding: EdgeInsets.only(bottom: 5.0),
//                       child: SvgPicture.asset(
//                         'assets/images/courses.svg',
//                          width: 18,
//                         color: screenController.tabIndex == 1 ? kPrimaryColor: kTitleColor,
//                       ),
//                     ),
            
//                     //Enquiry
//                     label: "Courses"),
//                 // BottomNavigationBarItem(
//                 //     icon: Padding(
//                 //       padding: EdgeInsets.only(bottom: 4.0),
//                 //       child: SvgPicture.asset(
//                 //         'assets/icons/market.svg',
//                 //         width: 22,
//                 //         color: _index == 2 ? kPrimaryColor : kTitleColor,
//                 //       ),
//                 //     ),
//                 //
//                 //     //Property
//                 //     label: "Market"),
//                 BottomNavigationBarItem(
//                     icon: Padding(
//                      padding: EdgeInsets.only(bottom: 5.0),
//                       child: SvgPicture.asset(
//                         'assets/icons/help.svg',
//                         width: 20,
//                         color: screenController.tabIndex == 2 ? kPrimaryColor : kTitleColor,
//                       ),
//                     ),
                
//                     //Menu
//                     label: "Community"),
//                 BottomNavigationBarItem(
//                     icon: Padding(
//                      padding: EdgeInsets.only(bottom: 3.0),
//                       child: SvgPicture.asset(
//                         'assets/images/profile.svg',
//                         width: 20,
//                         color: screenController.tabIndex == 3 ? kPrimaryColor : kTitleColor,
//                       ),
//                     ),
            
//                     //Menu
//                     label: "Profile")
              
              
              
//               ]),
//         ),
      
//     );

    
    
    
    

    
    
    
    
    
   

    
//   }



// }



// // class ShowBottomsheet extends StatefulWidget {
// //   const ShowBottomsheet({ Key? key }) : super(key: key);

// //   @override
// //   State<ShowBottomsheet> createState() => _ShowBottomsheetState();
// // }

// // class _ShowBottomsheetState extends State<ShowBottomsheet> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () {
// //          showModalBottomSheet(
// //         context: context,
// //         // color is applied to main screen when modal bottom screen is displayed
// //         barrierColor: Colors.greenAccent,
// //         //background color for modal bottom screen
// //         backgroundColor: Colors.yellow,
// //         //elevates modal bottom screen
// //         elevation: 10,
// //         // gives rounded corner to modal bottom screen
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(10.0),
// //         ),
// //         builder: (BuildContext context) {
// //           return Container(
// //             height: 200,
// //             child: Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   const Text('GeeksforGeeks'),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       );
// //       },
// //       child: Container(
    
        
        
// //       ),
// //     );
// //   }
// // }
