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
                  vertical: h*0.01
                ),
                child: Column(
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
                    Container(
                      height: h*0.25,
                      width: w,
                      padding: EdgeInsets.symmetric(
                        horizontal: w*0.1,
                        vertical: h*0.02
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(h*0.01)
                      ),
                      child: WhichCard(
                        youtubeurl: controller.data.value!.video,
                      )
                      ),
                    HtmlView(
                      text: controller.data.value!.description!,
                    )
                  ],
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