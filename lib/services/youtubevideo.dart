import 'dart:developer';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import '../screens/Events/CurrentEvent/currentEventController.dart';
import 'launcher.dart';

class YoutubeBinding implements Bindings {
 @override
 void dependencies() {

  Get.create<Youtubecontroller>(() => Youtubecontroller()); 
   } 
}


class YoutubeVideoPlayer extends StatefulWidget {
  RxBool play ;
  String url;
  YoutubeVideoPlayer({required this.play,required this.url});
  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  
late YoutubePlayerController youtubecontroller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;
  // StudyMaterialController controller =
  //     Get.put(StudyMaterialController(), permanent: false);
  // Youtubecontroller controller = Get.put(Youtubecontroller(),permanent: false);
  // Youtubecontroller controller = Get.lazyPut(() => Youtubecontroller());
  // Youtubecontroller controller =
  //  Get.create<Youtubecontroller>(() => Youtubecontroller());
  String urlid= "";
  

  

  @override
  void initState() {

    print("start");
    urlid = YoutubePlayer.convertUrlToId(widget.url).toString();
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
youtubecontroller = YoutubePlayerController(
      initialVideoId: urlid,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
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

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: youtubecontroller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
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
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
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
                      FullScreenButton(
                        controller: youtubecontroller,
                        color: Colors.blueAccent,
                      ),
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

class Youtubecontroller extends GetxController{
  late YoutubePlayerController youtubecontroller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;
  // final List<String> idsList = [
  //   'nPt8bK2gbaU',
  //   'gQDByCdjUXw',
  //   'iLnmTe5Q2Qw',
  //   '_WoCV4c6XOE',
  //   'KmzdUe0RSJo',
  //   '6jZDSSZZxjQ',
  //   'p2lYr3vM_1w',
  //   '7QUtEmBT_-w',
  //   '34_PXCzGw1M',
  // ];
}




class CustomYoutubeBuilder extends StatefulWidget {
  final String url;
  final YoutubePlayerController? youtubecontroller;
  const CustomYoutubeBuilder({Key? key,required this.url, this.youtubecontroller}) : super(key: key);

  @override
  State<CustomYoutubeBuilder> createState() => _CustomYoutubeBuilderState();
}

class _CustomYoutubeBuilderState extends State<CustomYoutubeBuilder> {

late YoutubePlayerController youtubecontroller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;
  // StudyMaterialController controller =
  //     Get.put(StudyMaterialController(), permanent: false);
  // Youtubecontroller controller = Get.put(Youtubecontroller(),permanent: false);
  // Youtubecontroller controller = Get.lazyPut(() => Youtubecontroller());
  // Youtubecontroller controller =
  //  Get.create<Youtubecontroller>(() => Youtubecontroller());
  String urlid= "";
  

  

  @override
  void initState() {

    print("start");
    urlid = YoutubePlayer.convertUrlToId(widget.url).toString();
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
youtubecontroller = YoutubePlayerController(
      initialVideoId: urlid,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
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

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:"youtubeplayer",
      child: YoutubePlayer(
        controller:widget.youtubecontroller ?? youtubecontroller,
        showVideoProgressIndicator: true,
        bottomActions: [
      const SizedBox(width: 14.0),
      CurrentPosition(),
      const SizedBox(width: 8.0),
      ProgressBar(
      isExpanded: true,
      colors: const ProgressBarColors(backgroundColor: kWhiteColor,playedColor: kPrimaryColor,bufferedColor: kPrimaryColor),
      ),
      RemainingDuration(),
      const PlaybackSpeedButton(),
      // FullScreenButton(),
      IconButton(
      onPressed: (){
        // Get.to(
        //   ()=>FullScreenYoutube(controller:widget.youtubecontroller ?? youtubecontroller)
        // );
        youtubecontroller.pause();
        // Get.to(
        //      ()=>WebViewExample(
        //       url: "https://www.youtube.com/watch?v=6uVXqT_26pA",//widget.url, 
        //       title: "Youtube")
        //    );
          //  urllauncher(url)
           launchInBrowser(widget.url);
      }, 
      icon: Icon(youtubecontroller.value.isFullScreen?Icons.fullscreen_exit: Icons.fullscreen,color: kWhiteColor,),
      )
    
        ],
        progressIndicatorColor: Colors.blueAccent,
        // topActions: <Widget>[
        //   const SizedBox(width: 8.0),
        //   Expanded(
        //     child: Text(
        //       youtubecontroller.metadata.title,
        //       // youtubecontroller.metadata.,
        //       style: const TextStyle(
        //         color: Colors.white,
        //         fontSize: 18.0,
        //       ),
        //       overflow: TextOverflow.ellipsis,
        //       maxLines: 1,
        //     ),
        //   ),
        //   // IconButton(
        //   //   icon: const Icon(
        //   //     Icons.settings,
        //   //     color: Colors.white,
        //   //     size: 25.0,
        //   //   ),
        //   //   onPressed: () {
        //   //     log('Settings Tapped!');
        //   //   },
        //   // ),
        // ],
        onReady: () {
      isPlayerReady = true;
        },
        onEnded: (data) {
      // youtubecontroller.reload();
      // youtubecontroller.reset();
      youtubecontroller.pause();
        },
      ),
    );
  }
}


class YoutubeVideoPlayer2 extends StatefulWidget {
  String url;
  YoutubeVideoPlayer2({required this.url});
  @override
  _YoutubeVideoPlayer2State createState() => _YoutubeVideoPlayer2State();
}

class _YoutubeVideoPlayer2State extends State<YoutubeVideoPlayer2> {
  
late YoutubePlayerController youtubecontroller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;
  // StudyMaterialController controller =
  //     Get.put(StudyMaterialController(), permanent: false);
  // Youtubecontroller controller = Get.put(Youtubecontroller(),permanent: false);
  // Youtubecontroller controller = Get.lazyPut(() => Youtubecontroller());
  // Youtubecontroller controller =
  //  Get.create<Youtubecontroller>(() => Youtubecontroller());
  String urlid= "";
  

  

  @override
  void initState() {

    print("start");
    urlid = YoutubePlayer.convertUrlToId(widget.url).toString();
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
youtubecontroller = YoutubePlayerController(
      initialVideoId: urlid,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
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

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
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



class FullScreenYoutube extends StatefulWidget {
  final YoutubePlayerController controller;
  const FullScreenYoutube({Key? key,required this.controller }) : super(key: key);

  @override
  State<FullScreenYoutube> createState() => _FullScreenYoutubeState();
}

class _FullScreenYoutubeState extends State<FullScreenYoutube> {
  @override
  Widget build(BuildContext context) {
    return
    WillPopScope(
      onWillPop:()=> onWillPop(),
      child: OrientationBuilder(builder: 
             (BuildContext context, Orientation orientation) {
              return 
       Align(
         alignment: Alignment.center,
         child: FittedBox(
           fit: BoxFit.fill,
           child: Hero(
            tag: "youtubeplayer",
             child: YoutubePlayer(
               controller: widget.controller,
             ),
           ),
         ),
       );
      }),
    );
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
}