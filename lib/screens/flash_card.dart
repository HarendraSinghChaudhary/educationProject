// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/study_material/study_material_controller.dart';
import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/screens/quiz_end.dart';
import 'package:Ambitious/screens/study_material_detail.dart';
import 'package:Ambitious/testing/navigation_testing.dart';

import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:story_view/story_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/status_change_controller.dart';
import '../reusable/url_launcher.dart';
import '../services/youtubevideo.dart';
import 'customStory.view/storyview.dart';

// class FlashCard extends StatefulWidget {
//   String id, title,moduleId;
//   FlashCard({Key? key, required this.id, required this.title,required this.moduleId})
//       : super(key: key);

//   @override
//   State<FlashCard> createState() => _FlashcardState();
// }

// class _FlashcardState extends State<FlashCard> {
//   int _curr = 1;
//   double pageNumber = 0.0;

//   StudyMaterialController studyMaterialController =
//       Get.put(StudyMaterialController(), permanent: false);
//   String isSelected = "";
//   ScrollController _controller = ScrollController();

//   late final Mixpanel _mixpanel;

//   Future<void> _initMixpanel() async {
//     _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
//         optOutTrackingDefault: false);
//   }

//   @override
//   void initState() {
//     _initMixpanel();

//     super.initState();
//     pageNumber = 0.0;

//     studyMaterialController.studyMaterialApi(widget.moduleId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("length: " +
//         studyMaterialController.studyMaterialList.length.toString());
//     return Scaffold(
//         backgroundColor: kBackgroundColor,
//         body: Obx(() => 
//         studyMaterialController.isLoading.value
//             ? Align(
//                 alignment: Alignment.center,
//                 child: Platform.isAndroid
//                     ? CircularProgressIndicator(
//                         strokeWidth: 1,
//                       )
//                     : CupertinoActivityIndicator())
//             : Column(
//                 children: [
//                   SizedBox(height: Get.height * 0.05),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: Get.width * 0.04,
//                         right: Get.width * 0.04,
//                         top: Get.height * 0.02),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // Get.offAll(BottomNavigationScreen(
//                             //     index: 0.obs, learningPathIndex: 0.obs));
//                             Get.back();
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.transparent,
                
//                             ),
//                             child: Center(
//                               child: Icon(
//                                 Icons.close_rounded,
//                                 color: kPrimaryColor,
//                                 size: 28,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: Get.width * 0.05,
//                         ),
//                         SizedBox(
//                           width: Get.width * 0.65,
//                           height: Get.height * 0.015,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             child: LinearProgressIndicator(
//                               backgroundColor:
//                                   kLightGreyColorwithMail.withOpacity(0.3),
//                               minHeight: Get.height * 0.017,
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(kCyanColor),
//                               value: pageNumber,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.01,
//                   ),
//                   Container(
//                     height: Get.height * 0.80,
//                     child: Swiper(
//                       loop: false,
//                       autoplayDisableOnInteraction: true,
//                       itemCount:
//                           studyMaterialController.studyMaterialList.length,
//                       itemWidth: Get.width * 0.95,
//                       itemHeight: Get.height * 0.75,
//                       layout: SwiperLayout.STACK,
//                       onIndexChanged: (int index) {
//                         _curr = index;

//                         print("current: " + _curr.toString());
//                         pageNumber = pageNumber == 0.0
//                             ? (1 /
//                                 studyMaterialController
//                                     .studyMaterialList.length)
//                             : (_curr /
//                                 studyMaterialController
//                                     .studyMaterialList.length);
//                         print(pageNumber);

//                         setState(() {});
//                       },
//                       scrollDirection: Axis.vertical,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.only(top: 10.0, bottom: 20),
//                           child: Card(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: Get.width * 0.05),
//                             color: Colors.white,
//                             shape: BeveledRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: Get.height * 0.2,
//                                   decoration: BoxDecoration(
//                                       color: Colors.blue,
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(10),
//                                           topRight: Radius.circular(10)),
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               studyMaterialController
//                                                   .studyMaterialList[index]
//                                                   .image
//                                                   .toString()),
//                                           fit: BoxFit.cover)),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                         margin: EdgeInsets.all(10),
//                                         width: Get.width * 0.30,
//                                         height: Get.height * 0.035,
//                                         decoration: BoxDecoration(
//                                           color: kPrimaryColor,
//                                           borderRadius:
//                                               BorderRadius.circular(30),
//                                         ),
//                                         child: FlatButton(
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30)),
//                                           onPressed: () {
//                                             // Get.to(
//                                             //   StudyMaterialDetail(
//                                             //     image: studyMaterialController
//                                             //         .studyMaterialList[index]
//                                             //         .image
//                                             //         .toString(),
//                                             //     detail: studyMaterialController
//                                             //         .studyMaterialList[index]
//                                             //         .StudayMaterial
//                                             //         .toString()));
//                                             Get.to(
//                                               ()=>HtmlView(text: studyMaterialController.studyMaterialList[index].StudayMaterial.toString())
//                                             );
//                                           },
//                                           child: Text(
//                                             "View More",
//                                             textAlign: TextAlign.center,
//                                             style: const TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 11,
//                                                 fontWeight: FontWeight.w400),
//                                           ),
//                                         ))
//                                   ],
//                                 ),
//                                 Expanded(
//                                   child: HtmlView(text: studyMaterialController.studyMaterialList[index].StudayMaterial.toString()),
//                                   // child: Html(
//                                   //     data: studyMaterialController
//                                   //         .studyMaterialList[index]
//                                   //         .StudayMaterial
//                                   //         .toString()),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   studyMaterialController.studyMaterialList.length - 1 == _curr || studyMaterialController.studyMaterialList.length==1
//                       ? DefaultButton(
//                           width: Get.width * 0.86,
//                           height: Get.height * 0.070,
//                           text: 'COMPLETE',
//                           press: () {
//                             _mixpanel.track('Course Finished', properties: {
//                               "Course Name": widget.title.toString()
//                             });

//                             Get.off(
//                               ()=>LessonEnd(),
//                               binding: LessonEndBinding()
//                             //   QuizEnd(
//                             //   length: studyMaterialController
//                             //       .studyMaterialList.length,
//                             // )
//                             );
//                           })
//                       : Container(),
//                 ],
//               )
              
//               ));
//   }
// }





// class CustomStoryView extends GetView<StudyMaterialController>{
//   const CustomStoryView({Key? key}): super (key:key);
//   @override
//   Widget build(BuildContext context) {
//     // Get.lazyPut<StudyMaterialController>(()=>StudyMaterialController());
//     // StudyMaterialController controller = Get.find<StudyMaterialController>();

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("More"),
//       // ),
//       backgroundColor: Colors.black,
//       body:
//       Obx(
//         ()=>Get.find<StudyMaterialController>().isLoading.value?loader: 
//         CustomCourseView(
//           study: Get.find<StudyMaterialController>().studyMaterialList,
//           courseItem:   List.generate(Get.find<StudyMaterialController>().studyMaterialList.length, (index) {
//           return 
            
//             Container(
//             height: h,

//             width: w,
//             padding: EdgeInsets.only(top: h*0.05),
//             // decoration: BoxDecoration(
//             //   // color: Colors.red,
//             // //   image: DecorationImage(
//             // //                               image: NetworkImage(
//             // //                                   controller
//             // //                                       .studyMaterialList[index]
//             // //                                       .image
//             // //                                       .toString()),
//             // //                               fit: BoxFit.cover),
//             // ),

//             child: Center(
//               child: SingleChildScrollView(
//                 // controller: scrollcontroller,
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     HtmlView(text: Get.find<StudyMaterialController>().studyMaterialList[index].StudayMaterial.toString()),
//                     Visibility(
//                       visible: Get.find<StudyMaterialController>().studyMaterialList[index].image!=""&&Get.find<StudyMaterialController>().studyMaterialList[index].image!=null&&Get.find<StudyMaterialController>().studyMaterialList[index].image!="null",
//                       child: Column(
//                         children: [
//                           SizedBox(height: h*0.02,),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(h*0.02),
//                             child: Image.network(
//                               Get.find<StudyMaterialController>().studyMaterialList[index].image.toString()
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Visibility(
//                       visible: Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl!=null&&Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl!="null"&&Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl!="",
//                       child: Column(
//                         children: [
//                           SizedBox(height: h*0.02,),
//                           SizedBox(
//                             height: h*0.3,
//                             width: w,
//                             child: YoutubeVideoPlayer(play: true.obs,url: Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl.toString(),)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: h*0.1,),



//                   ],
//                 ),
//         )));
//         }),)
//       )
      
       
//     );

  
//     }


// }

class CustomStoryView extends StatefulWidget {
  String id, title,moduleId;
  CustomStoryView({Key? key, required this.id, required this.title,required this.moduleId})
      : super(key: key);

  @override
  State<CustomStoryView> createState() => _CustomStoryViewState();
}

class _CustomStoryViewState extends State<CustomStoryView> {
  int _curr = 1;
  double pageNumber = 0.0;
  final storyController = StoryController();
  StudyMaterialController controller =
      Get.put(StudyMaterialController(), permanent: false);
  String isSelected = "";
  
  ScrollController scrollcontroller = ScrollController();

  late final Mixpanel _mixpanel;
  RxBool play = false.obs;

  Future<void> _initMixpanel() async {
    _mixpanel = await Mixpanel.init("bc1020e51bd5d65cb512f6e1906cf6c4",
        optOutTrackingDefault: false);
  }

  @override
  void initState() {
    _initMixpanel();
    controller.studyMaterialApi(widget.moduleId);
    print("start");
// scrollcontroller.addListener(() { 
// //   if(scrollcontroller.position.atEdge){
// //     if(scrollcontroller.offset>=100.0){
// // play(true);
// // controller.youtubecontroller.play();
// //     }
// //   }else{
// // controller.youtubecontroller.pause();
// //     play(false);
// //   }
// print(scrollcontroller.positions.last);
//     // print("========="+scrollcontroller.position.maxScrollExtent.toString());


// if(scrollcontroller.offset>(scrollcontroller.position.maxScrollExtent-100)){
// controller.youtubecontroller.play();
// }else{
// controller.youtubecontroller.pause();
// }
// });

// if(scrollcontroller.position.maxScrollExtent<scrollcontroller.offset+1080.00){
// controller.youtubecontroller.play();
//     }
// controller.youtubecontroller = YoutubePlayerController(
//       initialVideoId: controller.idsList.first,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
  //  controller.idController = TextEditingController();
  //   controller.seekToController = TextEditingController();
  //   controller.videoMetaData = const YoutubeMetaData();
  //   controller.playerState = PlayerState.unknown;
    super.initState();
    pageNumber = 0.0;


  }
  // void listener() {
  //   if (controller.isPlayerReady && mounted && !controller.youtubecontroller.value.isFullScreen ) {
  //     setState(() {
  //       controller.playerState = controller.youtubecontroller.value.playerState;
  //       controller. videoMetaData = controller.youtubecontroller.metadata;

  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<StudyMaterialController>(()=>StudyMaterialController());
    // StudyMaterialController controller = Get.find<StudyMaterialController>();

    return 
    WillPopScope(child: Scaffold(
      // appBar: AppBar(
      //   title: Text("More"),
      // ),
      backgroundColor: Colors.black,
      body:
      Obx(
        ()=>Get.find<StudyMaterialController>().isLoading.value?loader: 
        CustomCourseView(
          study: Get.find<StudyMaterialController>().studyMaterialList,
          
        //   courseItem:   List.generate(Get.find<StudyMaterialController>().studyMaterialList.length, (index) {
        //   return 
            
        //     Container(
        //     height: h,

        //     width: w,
        //     padding: EdgeInsets.only(top: h*0.05),
        //     // decoration: BoxDecoration(
        //     //   // color: Colors.red,
        //     // //   image: DecorationImage(
        //     // //                               image: NetworkImage(
        //     // //                                   controller
        //     // //                                       .studyMaterialList[index]
        //     // //                                       .image
        //     // //                                       .toString()),
        //     // //                               fit: BoxFit.cover),
        //     // ),

        //     child: Center(
        //       child: SingleChildScrollView(
        //         controller: scrollcontroller,
        //         physics: BouncingScrollPhysics(),
        //         child: Column(
        //           children: [
        //             HtmlView(text: Get.find<StudyMaterialController>().studyMaterialList[index].StudayMaterial.toString()),
        //             Visibility(
        //               visible: Get.find<StudyMaterialController>().studyMaterialList[index].image!=""&&Get.find<StudyMaterialController>().studyMaterialList[index].image!=null&&Get.find<StudyMaterialController>().studyMaterialList[index].image!="null",
        //               child: Column(
        //                 children: [
        //                   SizedBox(height: h*0.02,),
        //                   ClipRRect(
        //                     borderRadius: BorderRadius.circular(h*0.02),
        //                     child: Image.network(
        //                       Get.find<StudyMaterialController>().studyMaterialList[index].image.toString()
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Visibility(
        //               visible: Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl!=null&&Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl!="null"&&Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl!="",
        //               child: Column(
        //                 children: [
        //                   SizedBox(height: h*0.02,),
        //                   SizedBox(
        //                     height: h*0.3,
        //                     width: w,
        //                     child: YoutubeVideoPlayer(play: play,url: Get.find<StudyMaterialController>().studyMaterialList[index].youtubeUrl.toString(),)),
        //                 ],
        //               ),
        //             ),
        //             SizedBox(height: h*0.1,),



        //           ],
        //         ),
        // )));
        // }),
        
        )
      )
      
       
    ), 
    onWillPop: ()=> willpop() );
    
  
    }
Future<bool> willpop(){
  // late bool back;
  // back=true;
 return  Get.delete<StudyMaterialController>();

}
}

class HtmlView extends StatelessWidget {
  final String text;
   HtmlView({Key? key,required this.text}) : super(key: key);
final String htmlData = r"""
<p id='top'><a href='#bottom'>Scroll to bottom</a></p>
      <h1>Header 1</h1>
      <h2>Header 2</h2>
      <h3>Header 3</h3>
      <h4>Header 4</h4>
      <h5>Header 5</h5>
      <h6>Header 6</h6>
      <h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for maxLines:</h3>
      <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum sapien feugiat lorem tempor, id porta orci elementum. Fusce sed justo id arcu egestas congue. Fusce tincidunt lacus ipsum, in imperdiet felis ultricies eu. In ullamcorper risus felis, ac maximus dui bibendum vel. Integer ligula tortor, facilisis eu mauris ut, ultrices hendrerit ex. Donec scelerisque massa consequat, eleifend mauris eu, mollis dui. Donec placerat augue tortor, et tincidunt quam tempus non. Quisque sagittis enim nisi, eu condimentum lacus egestas ac. Nam facilisis luctus ipsum, at aliquam urna fermentum a. Quisque tortor dui, faucibus in ante eget, pellentesque mattis nibh. In augue dolor, euismod vitae eleifend nec, tempus vel urna. Donec vitae augue accumsan ligula fringilla ultrices et vel ex.</h5>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Inline Styles:</h3>
      <p>The should be <span style='color: blue;'>BLUE style='color: blue;'</span></p>
      <p>The should be <span style='color: red;'>RED style='color: red;'</span></p>
      <p>The should be <span style='color: rgba(0, 0, 0, 0.10);'>BLACK with 10% alpha style='color: rgba(0, 0, 0, 0.10);</span></p>
      <p>The should be <span style='color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p>The should be <span style='background-color: red; color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: right;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: justify;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col span="2" width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td rowspan='2'>Rowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td colspan="2"><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support (inline: <bird></bird> and as block):</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3 id='middle'>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol style="list-style-type: lower-alpha;" start="5">
            <li>With a nested</li>
            <li>ordered list</li>
            <li>with a lower alpha list style</li>
            <li>starting at letter e</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
      <h3>Image support:</h3>
      <h3>Network png</h3>
      <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
      <h3>Network svg</h3>
      <img src='https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg' />
      <h3>Local asset png</h3>
      <img src='asset:assets/html5.png' width='100' />
      <h3>Local asset svg</h3>
      <img src='asset:assets/mac.svg' width='100' />
      <h3>Data uri (with base64 support)</h3>
      <img alt='Red dot (png)' src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==' />
      <img alt='Green dot (base64 svg)' src='data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB2aWV3Qm94PSIwIDAgMzAgMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxjaXJjbGUgY3g9IjE1IiBjeT0iMTAiIHI9IjEwIiBmaWxsPSJncmVlbiIvPgo8L3N2Zz4=' />
      <img alt='Green dot (plain svg)' src='data:image/svg+xml,%3C?xml version="1.0" encoding="UTF-8"?%3E%3Csvg viewBox="0 0 30 20" xmlns="http://www.w3.org/2000/svg"%3E%3Ccircle cx="15" cy="10" r="10" fill="yellow"/%3E%3C/svg%3E' />
      <h3>Custom source matcher (relative paths)</h3>
      <img src='/wikipedia/commons/thumb/e/ef/Octicons-logo-github.svg/200px-Octicons-logo-github.svg.png' />
      <h3>Custom image render (flutter.dev)</h3>
      <img src='https://flutter.dev/images/flutter-mono-81x100.png' />
      <h3>No image source</h3>
      <img alt='No source' />
      <img alt='Empty source' src='' />
      <h3>Broken network image</h3>
      <img alt='Broken image' src='https://www.notgoogle.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
      <h3>MathML Support:</h3>
      <math>
      <mrow>
        <mi>x</mi>
        <mo>=</mo>
        <mfrac>
          <mrow>
            <mrow>
              <mo>-</mo>
              <mi>b</mi>
            </mrow>
            <mo>&PlusMinus;</mo>
            <msqrt>
              <mrow>
                <msup>
                  <mi>b</mi>
                  <mn>2</mn>
                </msup>
                <mo>-</mo>
                <mrow>
                  <mn>4</mn>
                  <mo>&InvisibleTimes;</mo>
                  <mi>a</mi>
                  <mo>&InvisibleTimes;</mo>
                  <mi>c</mi>
                </mrow>
              </mrow>
            </msqrt>
          </mrow>
          <mrow>
            <mn>2</mn>
            <mo>&InvisibleTimes;</mo>
            <mi>a</mi>
          </mrow>
        </mfrac>
      </mrow>
      </math>
      <math>
        <munderover >
          <mo> &int; </mo>
          <mn> 0 </mn>
          <mi> 5 </mi>
        </munderover>
        <msup>
          <mi>x</mi>
          <mn>2</mn>
       </msup>
        <mo>&sdot;</mo>
        <mi>&dd;</mi><mi>x</mi>
        <mo>=</mo>
        <mo>[</mo>
        <mfrac>
          <mn>1</mn>
          <mi>3</mi>
       </mfrac>
       <msup>
          <mi>x</mi>
          <mn>3</mn>
       </msup>
       <msubsup>
          <mo>]</mo>
          <mn>0</mn>
          <mn>5</mn>
       </msubsup>
       <mo>=</mo>
       <mfrac>
          <mn>125</mn>
          <mi>3</mi>
       </mfrac>
       <mo>-</mo>
       <mn>0</mn>
       <mo>=</mo>
       <mfrac>
          <mn>125</mn>
          <mi>3</mi>
       </mfrac>
      </math>
      <math>
        <msup>
          <mo>sin</mo>
          <mn>2</mn>
        </msup>
        <mo>&theta;</mo>
        <mo>+</mo>
        <msup>
          <mo>cos</mo>
          <mn>2</mn>
        </msup>
        <mo>&theta;</mo>
        <mo>=</mo>
        <mn>1</mn>
      </math>
      <h3>Tex Support with the custom tex tag:</h3>
      <tex>i\hbar\frac{\partial}{\partial t}\Psi(\vec x,t) = -\frac{\hbar}{2m}\nabla^2\Psi(\vec x,t)+ V(\vec x)\Psi(\vec x,t)</tex>
      <p id='bottom'><a href='#top'>Scroll to top</a></p>
""";
  @override
  Widget build(BuildContext context) {
  var qwe;

    return Html(
      shrinkWrap:true,
            data:text,
            //  controller
            //     .studyMaterialList[index]
            //     .StudayMaterial
            //     .toString()
            tagsList: Html.tags..add("flutter"),
            style: {
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
              alignment: Alignment.topLeft,
            ),
            'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
          },
          customRenders: {
          // tagMatcher("tex"): CustomRender.widget(widget: (context, buildChildren) => Math.tex(
          //   context.tree.element?.innerHtml ?? '',
          //   // mathStyle: MathStyle.display,
          //   textStyle: context.style.generateTextStyle(),
          //   // onErrorFallback: (FlutterMathException e) {
          //   //   return Text(e.message);
          //   // },
          // )),
          tagMatcher("bird"): CustomRender.inlineSpan(inlineSpan: (context, buildChildren) => TextSpan(text: "🐦")),
          tagMatcher("flutter"): CustomRender.widget(widget: (context, buildChildren) => FlutterLogo(
            style: (context.tree.element!.attributes['horizontal'] != null)
                ? FlutterLogoStyle.horizontal
                : FlutterLogoStyle.markOnly,
            textColor: context.style.color!,
            size: context.style.fontSize!.size! * 5,
          )),
          tagMatcher("table"): CustomRender.widget(widget: (context, buildChildren) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            // child: tableRender.call().widget!.call(context, buildChildren),
          )),
          // audioMatcher(): audioRender(),
          // iframeMatcher(): iframeRender(),
          // mathMatcher(): mathRender(onMathError: (error, exception, exceptionWithType) {
          //   print(exception);
          //   return Text(exception);
          // }),
          // svgTagMatcher(): svgTagRender(),
          // svgDataUriMatcher(): svgDataImageRender(),
          // svgAssetUriMatcher(): svgAssetImageRender(),
          // svgNetworkSourceMatcher(): svgNetworkImageRender(),
          networkSourceMatcher(domains: ["flutter.dev"]): CustomRender.widget(
              widget: (context, buildChildren) {
                return FlutterLogo(size: 36);
              }),
          networkSourceMatcher(domains: ["mydomain.com"]): networkImageRender(
            headers: {"Custom-Header": "some-value"},
            altWidget: (alt) => Text(alt ?? ""),
            loadingWidget: () => Text("Loading..."),
          ),
          // On relative paths starting with /wiki, prefix with a base url
              (context) => context.tree.element?.attributes["src"] != null
              && context.tree.element!.attributes["src"]!.startsWith("/wiki"):
          networkImageRender(mapUrl: (url) => "https://upload.wikimedia.org" + url!),
          // Custom placeholder image for broken links
          networkSourceMatcher(): networkImageRender(altWidget: (_) => FlutterLogo()),
          // videoMatcher(): videoRender(),
        },
        onImageTap: (src, _, __, ___) {
          print(src);
        },
        onImageError: (exception, stackTrace) {
          print(exception);
        },
        onCssParseError: (css, messages) {
          print("css that errored: $css");
          print("error messages:");
          messages.forEach((element) {
            print(element);
          });
        },
          onLinkTap: (link,context,_,__) {
                                    launchurl(link.toString());
                                  },
            );
  }

CustomRenderMatcher texMatcher() => (context) => context.tree.element?.localName == 'tex';

CustomRenderMatcher birdMatcher() => (context) => context.tree.element?.localName == 'bird';

CustomRenderMatcher flutterMatcher() => (context) => context.tree.element?.localName == 'flutter';
}
