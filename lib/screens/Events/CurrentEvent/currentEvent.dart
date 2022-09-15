import 'package:Ambitious/screens/Events/eventController.dart';
import 'package:Ambitious/services/launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../services/youtubevideo.dart';
import '../../../utils/constant.dart';
import '../../../utils/hearder.dart';
import '../../flash_card.dart';
import 'currentEventController.dart';

class CurrentEventView extends GetView<CurrentEventController>{
  @override
  Widget build(BuildContext context) {
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
              height: h*0.3,
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
                    alignment: Alignment.bottomCenter,
                    child: Image.network(
                      // "assets/images/banner.png",
                    controller.data.value!.image.toString(),
                    height:h*0.2,
                    width: h*0.2,
                    )
                  )
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
                          controller.data.value!.powerHouseTitle.toString(),
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
                              child: WhichCard(
                                youtubeurl: controller.data.value!.video,
                              )
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
                            controller.data.value!.startTime!.isBefore(DateTime.now())? JoinButton(controller.data.value!.joinUrl):AddtoCalender(),
                          ],
                        ),
                        ),
                      // AddtoCalender(),
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

class WhichCard extends StatelessWidget {
  final youtubeurl;
  const WhichCard({Key? key, required this.youtubeurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoPlayer2(url: youtubeurl ?? "https://www.youtube.com/watch?v=-duwSMIgNMU",);
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



class AddtoCalender extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){},
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
              "   ADD to CALENDAR",
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