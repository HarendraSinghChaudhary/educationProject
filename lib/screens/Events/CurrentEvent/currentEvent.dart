import 'package:Ambitious/screens/Events/eventController.dart';
import 'package:Ambitious/services/launcher.dart';
import 'package:Ambitious/services/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../services/addtocalendra.dart';
import '../../../services/youtubevideo.dart';
import '../../../utils/constant.dart';
import '../../../utils/hearder.dart';
import '../../flash_card.dart';
import 'currentEventController.dart';

class CurrentEventView extends GetView<CurrentEventController>{
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return
    Obx(
      ()=>Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: kWhiteColor,
          elevation: 0,
          // automaticallyImplyLeading: true,
          leading: IconButton(
            icon:  Image.asset(
              "assets/images/cancel.png",
              color: kWhiteColor,
              height: h*0.03,
            ),
            onPressed: (){
              Get.back();
            },
          ),
        ),
      body: Container(
        height: h,
        width: w,
        color: kdarkblue,
        child: Column(
          children:[
            SizedBox(
              height: h*0.33,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Header(
                      des: "", 
                      heading: "",
                      image: ""
                      ),
                  ),
                  Align(
                              // bottom: -20,
                              // left: w * 0.15,
                              // right: w * 0.15,
                              // top: h*0.08,
                              // width: w*0.3,
                              alignment: Alignment.bottomCenter,
                              // heightFactor: 1.2,

                              child: Visibility(
                                  visible: controller.data.value!.image!.isNotEmpty,
                                  child: 
                                  ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(h*0.02)),
                                    child: Image.network(
                                      controller.data.value!.image.toString(),
                                                height: h*0.25,
                                                errorBuilder: ((context, error, stackTrace) {
                                                  return Container();
                                                }),
                                                
                                  
                                    ),
                                  )),),
                                  ],
              ),
            ),
            Expanded(
              child: Container(
                height: h,
                width: w,
                padding: EdgeInsets.symmetric(
                  horizontal: w*0.04,
                  // vertical: h*0.01
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    // shrinkWrap: true,
                    children: [
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          // "Influencer 101: Growing to 100K Followers",
                          controller.data.value!.powerHoursTitle.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight:FontWeight.w700,
                            color: kWhiteColor
                          ),
                        ),
                      ),
                      //  youtube player visibility
                      Visibility(
                        visible: controller.eventController.showyoutube.value,
                        // &&controller.data.value!.video!="",
                        child: Column(
                          children: [
                            Container(
                              height: h*0.25,
                              width: w,
                              padding: EdgeInsets.only(
                                left: w*0.1,
                                right: w*0.1,
                                top: h*0.02
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(h*0.01)
                              ),
                              child:CustomYoutubeBuilder(url: controller.data.value!.video.toString() ,)
                               
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: w*0.1
                                ),
                                title: Text(
                                controller.youtubeTitle.value,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              subtitle: Text(
                                controller.youtubeAuther.value,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 12,
                                  height: 2,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              ),
                          ],
                        ),
                      ),
                      
                      
                      //  rsvp, add to calender, join powerhour button   
                      Visibility(
                        visible: !controller.eventController.showyoutube.value,
                        child: Column(
                          children: [
                            Text(
                                controller.convertdate(controller.data.value!.startTime!),
                                style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 12
                                ),
                      
                              ),
                              SizedBox(
                                height: h*0.01,
                              ),
                         // attending count visibility
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                            
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                        'assets/images/community.svg',
                        height: 14,
                        color:  kWhiteColor,
                      ),
                      Text(
                        " ${controller.eventController.selectcount} Attending",
                        style: const TextStyle(
                          fontSize: 16,
                          color: kWhiteColor
                        ),
                      )
                              ],
                            ),
                          ),
                          //showing that you are attending powerhour
                          Visibility(
                            visible: controller.eventController.powerHours.value!.upcoming![controller.eventController.selectedIndex.value].is_user_attending!,
                            child: const Text(
                              "YOU ARE ATTENDING THIS POWER HOUR",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: kattendingColor
                              ),
                              ),
                              ),
                              // visibility of rsvp button
                              Visibility(
                        visible: !controller.eventController.powerHours.value!.upcoming![controller.eventController.selectedIndex.value].is_user_attending!&&!controller.eventController.showyoutube.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w*0.15),
                          child:controller.eventController.rsvploading.value?loader: RSVP(""))),

                          // visibility for join power hour or add to calendra


                        Visibility(
                          visible: controller.eventController.powerHours.value!.upcoming![controller.eventController.selectedIndex.value].is_user_attending!&&!controller.eventController.showyoutube.value,
                          // condition to show between add to calendra or join power hour
                          child: controller.data.value!.startTime!.toLocal().isBefore(controller.currentdate)
                                ?
                                 Padding(
                        
                            padding: EdgeInsets.symmetric(horizontal: w*0.15,vertical: h*0.01),
                                   child: JoinButton(controller.data.value!.joinUrl),
                                 )
                                 :
                                 Padding(
                            padding: EdgeInsets.symmetric(horizontal: w*0.15,vertical: h*0.01),
                                   child: AddtoCalender(
                                    starttime: controller.data.value!.startTime!.toLocal(),
                                    endtime: controller.data.value!.startTime!.toLocal(),
                                    title: controller.data.value!.powerHoursTitle.toString(),
                                    des: controller.data.value!.joinUrl.toString(),
                                   ),
                                 ),
                        ),
                          ],
                        ),
                      ),
                      SizedBox(
                              height: h*0.015,
                            ),
                      HtmlView(
                        text: controller.data.value!.description!,
                      )
                    ],
                  ),
                ),
              ) 
            )
          ]
        ),
      ),
    )
    );
       }
}

class JoinButton extends StatelessWidget{
  final joinurl;
  JoinButton(this.joinurl);
  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){
        launchInBrowser(joinurl);
        // print(DateTime.now().timeZoneOffset);
        // Get.find<EventController>().setCurentLocation();
      },
      style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  elevation: 2,
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.02))
                  ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: h*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Icon(
              Icons.video_call,
              color: kWhiteColor,
            ),
            Text(
              "   JOIN POWER HOUR",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
                // height: 2,
                fontWeight:FontWeight.w700
              ),
            )
          ],
        ),
      ),
    );
  }
}


class RSVP extends StatelessWidget{
  final joinurl;
  RSVP(this.joinurl);
  @override
  Widget build(BuildContext context){
    return  TextButton(
      onPressed: (){
        // launchInBrowser(joinurl);
        // print(DateTime.now().timeZoneOffset);
        Get.find<EventController>().rsvpapi();
        // Get.find<>()
      },
      style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  elevation: 2,
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.02))
                  ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: h*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Alarm.png",height: h*0.034,color: kWhiteColor,),
            const Text(
              "   RSVP TO WORKSHOP",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
                // height: 2,
                fontWeight:FontWeight.w700
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddtoCalender extends StatelessWidget{
  final DateTime starttime;
  final DateTime endtime;
  final String title;
  final String des;
  AddtoCalender({required this.des,required this.endtime, required this.starttime, required this.title});
  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){
        addtoCalendar(
          starttime,
          endtime,
          title,
          des
        );
      },
      style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  elevation: 2,
                  // backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.02),side: const BorderSide(color: kPrimaryColor,width: 3))
                  ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: h*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Icon(
              Icons.calendar_month,
              color: kWhiteColor,
            ),
            Text(
              "   ADD TO CALENDAR",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
                // height: 2,
                fontWeight:FontWeight.w700
              ),
            )
          ],
        ),
      ),
    );
  }
}



class CurrentEventView2 extends StatefulWidget {
  String url;
  CurrentEventView2({required this.url});
  @override
  _CurrentEventView2State createState() => _CurrentEventView2State();
}

class _CurrentEventView2State extends State<CurrentEventView2> {
  
late YoutubePlayerController youtubecontroller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;
  String urlid= "";
  CurrentEventController controller =Get.put<CurrentEventController>(CurrentEventController(),permanent: false);
  @override
  void initState() {

    print("start");
    urlid = YoutubePlayer.convertUrlToId(widget.url).toString();
youtubecontroller = YoutubePlayerController(
      initialVideoId: urlid,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
   idController = TextEditingController();
    seekToController = TextEditingController();
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
    super.initState();
  }
  void listener() {
    if (isPlayerReady && mounted && !youtubecontroller.value.isFullScreen ) {
      setState(() {
        playerState = youtubecontroller.value.playerState;
         videoMetaData = youtubecontroller.metadata;
    Get.find<CurrentEventController>().valueupdate(youtubecontroller.metadata.title, youtubecontroller.metadata.author);
    
      });
    }
  }
  

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    youtubecontroller.pause();
    dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubecontroller.dispose();
     idController.dispose();
    seekToController.dispose();
    super.dispose();
  }
Future<bool> onWillPop()async{
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // Get.off(
    //    ()=>CurrentEventView(youtubeurl: widget.controller,),
    //    binding: CurrentEventBinding()
    //  );
    Get.back();
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return
    Obx(
      ()=>WillPopScope(
        onWillPop: () => onWillPop(),
        child: SizedBox(
          height: h,
          width: w,
          child: Stack(
            children: [
              Visibility(
                visible: youtubecontroller.value.isFullScreen,
                child: YoutubePlayer(
                  controller: youtubecontroller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  // bottomActions: [],
                  topActions: <Widget>[
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        youtubecontroller.metadata.title,
                        // youtubecontroller.metadata.,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    // IconButton(
                    //   icon: const Icon(
                    //     Icons.settings,
                    //     color: Colors.white,
                    //     size: 25.0,
                    //   ),
                    //   onPressed: () {
                    //     log('Settings Tapped!');
                    //   },
                    // ),
                  ],
                  onReady: () {
                    isPlayerReady = true;
                  },
                  onEnded: (data) {
                    // youtubecontroller.reload();
                    // youtubecontroller.reset();
                    youtubecontroller.pause();
                  },
                ),
                ),
              Visibility(
                visible: !youtubecontroller.value.isFullScreen,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: kWhiteColor,
                    elevation: 0,
                    // automaticallyImplyLeading: true,
                    leading: IconButton(
                      icon:  Image.asset(
                        "assets/images/cancel.png",
                        color: kWhiteColor,
                        height: h*0.03,
                      ),
                      onPressed: (){
                        Get.back();
                      },
                    ),
                  ),
                body: Container(
                  height: h,
                  width: w,
                  color: kdarkblue,
                  child: Column(
                    children:[
                      SizedBox(
                        height: h*0.33,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Header(
                                des: "", 
                                heading: "",
                                image: ""
                                ),
                            ),
                            Align(
                                        // bottom: -20,
                                        // left: w * 0.15,
                                        // right: w * 0.15,
                                        // top: h*0.08,
                                        // width: w*0.3,
                                        alignment: Alignment.bottomCenter,
                                        // heightFactor: 1.2,
                    
                                        child: Visibility(
                                            visible: controller.data.value!.image!.isNotEmpty,
                                            child: 
                                            ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(h*0.02)),
                                              child: Image.network(
                                                controller.data.value!.image.toString(),
                                                          height: h*0.25,
                                                          errorBuilder: ((context, error, stackTrace) {
                                                            return Container();
                                                          }),
                                                          
                                            
                                              ),
                                            )),),
                                            ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: h,
                          width: w,
                          padding: EdgeInsets.symmetric(
                            horizontal: w*0.04,
                            // vertical: h*0.01
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              // shrinkWrap: true,
                              children: [
                                 Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    // "Influencer 101: Growing to 100K Followers",
                                    controller.data.value!.powerHoursTitle.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight:FontWeight.w700,
                                      color: kWhiteColor
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: Get.find<EventController>().showyoutube.value,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h*0.25,
                                        width: w,
                                        padding: EdgeInsets.only(
                                          left: w*0.1,
                                          right: w*0.1,
                                          top: h*0.02
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(h*0.01)
                                        ),
                                        child: YoutubePlayer(
                                                        controller: youtubecontroller,
                                                        showVideoProgressIndicator: true,
                                                        progressIndicatorColor: Colors.blueAccent,
                                                        // bottomActions: [],
                                                        topActions: <Widget>[
                                                          const SizedBox(width: 8.0),
                                                          Expanded(
                                                            child: Text(
                                                              youtubecontroller.metadata.title,
                                                              // youtubecontroller.metadata.,
                                                              style: const TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 18.0,
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                          // IconButton(
                                                          //   icon: const Icon(
                                                          //     Icons.settings,
                                                          //     color: Colors.white,
                                                          //     size: 25.0,
                                                          //   ),
                                                          //   onPressed: () {
                                                          //     log('Settings Tapped!');
                                                          //   },
                                                          // ),
                                                        ],
                                                        onReady: () {
                                                          isPlayerReady = true;
                                                        },
                                                        onEnded: (data) {
                                                          // youtubecontroller.reload();
                                                          // youtubecontroller.reset();
                                                          youtubecontroller.pause();
                                                        },
                                                      ),
                                      ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: w*0.1
                                          ),
                                          title: Text(
                                          controller.youtubeTitle.value,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        subtitle: Text(
                                          controller.youtubeAuther.value,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 12,
                                            height: 2,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        ),
                                    ],
                                  ),
                                ),
                    
                                Visibility(
                                  visible: !Get.find<EventController>().showyoutube.value,
                                  child: Column(
                                    children: [
                                       Text(
                                        controller.convertdate(controller.data.value!.startTime!),
                                        style: const TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 12
                                        ),
                    
                                      ),
                                      SizedBox(
                                        height: h*0.01,
                                      ),
                                      controller.data.value!.startTime!.toLocal().isBefore(controller.currentdate)
                                      ?
                                       JoinButton(controller.data.value!.joinUrl)
                                       :
                                       AddtoCalender(
                                        starttime: controller.data.value!.startTime!.toLocal(),
                                        endtime: controller.data.value!.startTime!.toLocal(),
                                        title: controller.data.value!.powerHoursTitle.toString(),
                                        des: controller.data.value!.joinUrl.toString(),
                                       ),
                                    ],
                                  ),
                                  ),
                                // AddtoCalender(),
                                SizedBox(
                                        height: h*0.015,
                                      ),
                                HtmlView(
                                  text: controller.data.value!.description!,
                                )
                              ],
                            ),
                          ),
                        ) 
                      )
                    ]
                  ),
                ),
                  ),
              ),
            ],
          ),
        ),
      )
    );

     YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      onEnterFullScreen: (){
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
          ]
        );
      },
      player: YoutubePlayer(
        controller: youtubecontroller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        // bottomActions: [],
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              youtubecontroller.metadata.title,
              // youtubecontroller.metadata.,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.settings,
          //     color: Colors.white,
          //     size: 25.0,
          //   ),
          //   onPressed: () {
          //     log('Settings Tapped!');
          //   },
          // ),
        ],
        onReady: () {
          isPlayerReady = true;
        },
        onEnded: (data) {
          // youtubecontroller.reload();
          // youtubecontroller.reset();
          youtubecontroller.pause();
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset(
              'assets/ypf.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.video_library),
            //   onPressed: () => Navigator.push(
            //     context,
            //     CupertinoPageRoute(
            //       builder: (context) => VideoList(),
            //     ),
            //   ),
            // ),
          ],
        ),
        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  
                  TextField(
                    enabled: isPlayerReady,
                    controller: idController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter youtube \<video id\> or \<link\>',
                      fillColor: Colors.blueAccent.withAlpha(20),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => idController.clear(),
                      ),
                    ),
                  ),
    
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // IconButton(
                      //   icon: const Icon(Icons.skip_previous),
                      //   onPressed: controller.isPlayerReady
                      //       ? () => controller.youtubecontroller.load(controller.idsList[
                      //           (controller.idsList.indexOf(controller.youtubecontroller.metadata.videoId) -
                      //                   1) %
                      //               controller.idsList.length])
                      //       : null,
                      // ),
                      IconButton(
                        icon: Icon(
                          youtubecontroller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: isPlayerReady
                            ? () {
                                youtubecontroller.value.isPlaying
                                    ? youtubecontroller.pause()
                                    : youtubecontroller.play();
                                setState(() {});
                              }
                            : null,
                      ),
                      IconButton(
                        icon: Icon(muted ? Icons.volume_off : Icons.volume_up),
                        onPressed: isPlayerReady
                            ? () {
                                muted
                                    ? youtubecontroller.unMute()
                                    : youtubecontroller.mute();
                                setState(() {
                                  muted = !muted;
                                });
                              }
                            : null,
                      ),
                      // IconButton(
                      //   onPressed: (){
                      //     youtubecontroller.pause();
                      //     Get.to(()=>FullScreenYoutube(controller: youtubecontroller,));
                      //   }, icon: const Icon(Icons.fullscreen))
                      // FullScreenButton(
                      //   controller: youtubecontroller,
                      //   color: Colors.blueAccent,
                      // ),
                      // IconButton(
                      //   icon: const Icon(Icons.skip_next),
                      //   onPressed: controller.isPlayerReady
                      //       ? () => controller.youtubecontroller.load(controller.idsList[
                      //           (controller.idsList.indexOf(controller.youtubecontroller.metadata.videoId) +
                      //                   1) %
                      //               controller.idsList.length])
                      //       : null,
                      // ),
                    ],
                  ),
    
                  Row(
                    children: <Widget>[
                      const Text(
                        "Volume",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          value: volume,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          label: '${(volume).round()}',
                          onChanged: isPlayerReady
                              ? (value) {
                                  setState(() {
                                    volume = value;
                                  });
                                  youtubecontroller.setVolume(volume.round());
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
    
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      // color: _getStateColor(_playerState),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      playerState.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
   
    );
  }
    void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
