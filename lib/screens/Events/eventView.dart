import 'package:Ambitious/models/powerhourModel.dart';
import 'package:Ambitious/screens/Events/CurrentEvent/currentEvent.dart';
import 'package:Ambitious/screens/Events/CurrentEvent/currentEventController.dart';
import 'package:Ambitious/screens/Events/eventController.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:Ambitious/utils/endpoint_url.dart';
import 'package:Ambitious/utils/hearder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../services/launcher.dart';
import '../../services/web_view.dart';

class EventView extends GetView<EventController>{
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return
    Obx(
      ()=>Scaffold(
      body: Container(
        height: h,
        width: w,
        color: kdarkblue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Header(
              des: "Tune in to a Live Power Hour, Watch On-Demand or Join a Slack Community", 
              heading: "Community", 
              image: "assets/images/OBJECTS.png"
              ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: w*0.04
                ),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: w*0.02,vertical: h*0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                               Image.asset(
                                "assets/images/label.png",
                                height: h*0.03,
                               ),
                                const Text(
                                  " Upcoming Power Hours",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kWhiteColor
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h*0.01,
                            ),
                            const Text(
                              "Register for an upcoming event to learn from a community leader live",
                              style: TextStyle(
                                fontSize: 14,
                                
                                color: kWhiteColor,
                        
                              ),
                            ),
                        
                           
                        
                            Container(
                              height: h*0.36,
                              margin: EdgeInsets.symmetric(
                                vertical: h*0.015
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.powerHours.value!.upcoming!.length,
                                itemBuilder:(context, index) {
                                  AllDatum data = controller.powerHours.value!.upcoming![index];
                                  return GestureDetector(
                                    onTap: (){
                                      controller.data.value = data;
                                      controller.showyoutube(false);
                                      Get.to(
                                        ()=>CurrentEventView(),
                                        binding: CurrentEventBinding()
                                      );
                                    },
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                        right: w*0.04,
                                      bottom: h*0.01
                                      ),
                                      child: CommunityCard(
                                        flex2: 3,
                                        url: 
                                        // "assets/images/banner.png",
                                        data.image.toString(),
                                        child: Container(
                                          width: w,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: w*0.025,
                                            vertical: h*0.01
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.symmetric(
                                                  vertical: h*0.01
                                                ),
                                                child: Text(
                                                  // "Thursday July 21st".toUpperCase(),
                                                  "${controller.convertdate(data.startTime!)}",
                                                  // textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    fontSize:12,
                                                    fontWeight: FontWeight.w700,
                                                    color: kWhiteColor
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.symmetric(vertical: h*0.01),
                                                child: Text(
                                                  // "Breaking Down The Blockchain",
                                                  data.powerHouseTitle.toString(),
                                                  // textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    fontSize:16,
                                                    fontWeight: FontWeight.w700,
                                                    color: kWhiteColor
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                "📲 In-App Event",
                                                // textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize:12,
                                                  fontWeight: FontWeight.w400,
                                                  color: kWhiteColor
                                                ),
                                              ),
                                            ],
                                        
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                        
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          // urllauncher(slackUrl);
                          launchInBrowser(slackUrl);
                        },
                        child: const SlackCard(
                          url: "assets/images/prefix.png",
                          title: "Join Slack Group",
                          subtitle: "Network with Ambitious people like yourself and participate in events.",
                        ),
                      ),
                      SizedBox(
                        height: h*0.03,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: w*0.02,vertical: h*0.01),
                        child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                
                               Image.asset(
                                "assets/images/label.png",
                                height: h*0.03,
                               ),
                                const Text(
                                  " Watch On Demand",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kWhiteColor
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h*0.01,
                            ),
                            const Text(
                              "Missed a Power Hour, No Biggie, We got you :)",
                              style: TextStyle(
                                fontSize: 14,
                                
                                color: kWhiteColor,
                        
                              ),
                            ),
                        
                           
                        
                            Container(
                              height: h*0.3,
                              margin: EdgeInsets.symmetric(
                                vertical: h*0.015
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.powerHours.value!.passed!.length,
                                itemBuilder:(context, index) {
                                  AllDatum data = controller.powerHours.value!.passed![index];
                                  return GestureDetector(
                                    onTap: (){
                                      controller.data.value = data;
                                      controller.showyoutube(true);
                                      Get.to(
                                        ()=>CurrentEventView(),
                                        binding: CurrentEventBinding()
                                      );
                                    },
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                        right: w*0.04,
                                        bottom: h*0.01
                                      ),
                                      child: CommunityCard(
                                        flex2: 2,
                                        url: 
                                        // "assets/images/banner.png",
                                        data.image.toString(),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: w*0.025,
                                            vertical: h*0.01
                                          ),
                                          child: Container(
                                            width: w,
                                            padding:  EdgeInsets.symmetric(vertical: h*0.01),
                                            child: Text(
                                              // "Breaking Down The Blockchain",
                                              data.powerHouseTitle.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize:16,
                                                fontWeight: FontWeight.w700,
                                                color: kWhiteColor
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                        
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(
                          ()=>  WebViewExample(
                              title: "Suggest an idea",
                              url: suggessionUrl,
                            )
                          );
                        },
                        child: const SlackCard(
                          url: "assets/images/idea.png",
                          title: "Suggest an idea",
                          subtitle: "Request a Power Hour Topic  or apply to host your own.",
                        ),
                      ),
                      SizedBox(
              height: h*0.1,
            ),
                    ],
                  ),
                ),
              ),
            ),
            
          ]
        ),
      ),
    )

    );
       }
}


class CommunityCard extends StatelessWidget {
  final Widget child;
  final String url;
  final flex2;
  const CommunityCard({Key? key,required this.child, required this.url,required this.flex2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w*0.42,
      child: Card(
        color: ksettingcardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(h*0.02),
        ),
        elevation: 8,
        shadowColor: kPrimaryColor.withOpacity(0.5),
        child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Expanded(
                    flex: 4,
                     child: Container(
                       height: h*0.2,
                      //  width: w*0.42,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(h*0.02),
                          //  color: kPrimaryColor,
                           image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.fill
                           )
                       ),
                     ),
                   ),
                   Expanded(
                    flex: flex2,
                     child: child
                   )
                 ],
               ),
      ),
    );
  }
}

class SlackCard extends StatelessWidget {
  final url;
  final title;
  final subtitle;
  const SlackCard({Key? key,required this.url, required this.subtitle, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ksettingcardColor,
      elevation: 8,
      shadowColor: kPrimaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(h*0.02)
      ),
      child:Row(
        children:[
          Expanded(
              flex: 3,
            child: Image.asset(url,height: h*0.04,),
            ),
            Expanded(
              flex: 9,

            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: h*0.012),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight:FontWeight.w700,
          color: kWhiteColor
        ),
       ),
                  Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          fontWeight:FontWeight.w300,
          color: kWhiteColor
        ),
       ),
                ],
              ),
            ),
            ),
            Expanded(
              flex: 2,
            child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        radius: h*0.015,
        child: Icon(Icons.arrow_forward,size: h*0.02,)),
            ),
        ]
      )
      
      //  ListTile(
      //   // tileColor: ksettingcardColor,
      //   isThreeLine: true,
      //  leading:Image.asset("assets/images/prefix.png",height: h*0.04,),
      //  title: Text(
      //   "Join Slack Group",
      //   style: TextStyle(
      //     fontSize: 16,
      //     fontWeight:FontWeight.w700,
      //     color: kWhiteColor
      //   ),
      //  ),
      //  subtitle: Text(
      //   "Network with Ambitious people like yourself and participate in events.",
      //   style: TextStyle(
      //     fontSize: 12,
      //     fontWeight:FontWeight.w300,
      //     color: kWhiteColor
      //   ),
      //  ),
      //  trailing: CircleAvatar(
      //   backgroundColor: kPrimaryColor,
      //   foregroundColor: kWhiteColor,
      //   radius: h*0.015,
      //   child: Icon(Icons.arrow_forward,size: h*0.02,)),
       

      // ),

    );
  }
}