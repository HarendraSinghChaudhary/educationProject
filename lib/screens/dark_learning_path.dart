import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/courses/courses_controller.dart';
import '../controllers/courses/darkcourse_controller.dart';
import '../models/courseby_cat_model.dart';
import '../reusable/default_button.dart';
import '../services/web_view.dart';
import '../utils/constant.dart';
import 'dark_course_detail.dart';

class DarkLearningBinding implements Bindings{

 final List <CoursesByCatModel> courseListbyLearningPath;
 final String image;
 final String title;
 final String description;
DarkLearningBinding({required this.courseListbyLearningPath,required this.description,required this.image,required this.title});
@override
  void dependencies() {
    Get.lazyPut<DarkLearningPathController>(() => DarkLearningPathController(courseListbyLearningPath: courseListbyLearningPath, description: description, image: image, title: title,)); 
    
  }
}
class DarkLearningPathController extends GetxController{
 final List <CoursesByCatModel> courseListbyLearningPath;
 final String image;
 final String title;
 final String description;
 
DarkLearningPathController({required this.courseListbyLearningPath,required this.description,required this.image,required this.title});
RxBool islearn = true.obs; 
RxInt viewCount= 0.obs;
}
class DarkLearningPath extends GetView<DarkLearningPathController> {

   
   const DarkLearningPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   foregroundColor: kWhiteColor,
        //   elevation: 0,
        //   automaticallyImplyLeading: true,
        // ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: w*0.08,
              right: w*0.08,
              top: h*0.06
            ),
                      height: h*0.25,
                      width: w,
                      decoration: BoxDecoration(
                        gradient: kbluegradiant,
                        borderRadius: BorderRadius.circular(h*0.01),
                      ),
                      alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    height: h*0.03,
                    width: w*0.07,
                    child: IconButton(
                      padding: const EdgeInsets.only(),
                      icon:  Icon(
                        Icons.arrow_back_ios,
                        color: kWhiteColor,
                        size: h*0.03,
                      ),
                      onPressed: (){
                        Get.back();
                      },
                    ),
                  ),
                  Text(
                    // "Crypto Investor",
                    controller.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor
                    ),
                  ),
                  SizedBox(
                    height: h*0.01,
                  ),
                  Expanded(
                    child: Text(
                      // "Learn the basics of cryptocurrencies and how to buy, sell and trade.",
                      controller.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor
                      ),
                    ),
                  )
                ],
              ),
              
            ),
            Expanded(
              flex: 2,
              // child: Image.asset("assets/images/magnifying glass.png",height: h*0.1,)
              child: Image.network(controller.image),
              ),

          ],
        ),

                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: h*0.01,
                            ),
                            Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                  height: 44,
                                  decoration: BoxDecoration(color: kcardblue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const TabBar(

                                    unselectedLabelStyle: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    indicator: BoxDecoration(
                                      // color: Colors.white,
                                      
                                      // borderRadius: BorderRadius.circular(25),
                        
                                    ),
                                    unselectedLabelColor: kWhiteColor,
                                    labelColor: ktabtextselcetedColor,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    tabs: [
                                      Tab(
                                        text: 'LEARN',
                                      ),
                                      
                                      Tab(
                                        text: 'BUILD',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                  Learn(list: controller.courseListbyLearningPath,),
                                  const Build()
                                    ]),
                                )
                                
                        
                              ],
                        ),
                      ),
                    )
        ],
      ),
    );

  }
}

class Learn extends GetView {
 final List <CoursesByCatModel> list;
   Learn({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: w*0.05,
                                  vertical: h*0.02
                                ),
                                crossAxisSpacing: w*0.06,
                                mainAxisSpacing: h*0.03,
                                childAspectRatio: 0.5,
                                children: List.generate(
                                  list.length, (index) => 
                                InkWell(
                                  onTap: (){
                                    Get.find<CoursesController>().coursecount(list[index].id);
                                    // Get.find<DarkLearningPathController>().viewCount.value = list[index].viewCount!;
                                    DarkCourseDetail.viewCount = list[index].viewCount.toString();
                                    
                                          Get.to(
                                            ()=>DarkCourseDetail(),
                                          binding: DarkCourseDetailBinding(id:
                                          list[index].id
                                          .toString(),
                                          ),);
                                        },
                                  child: Column(
                                    
                                    children: [
                                      Expanded(
                                        child: Container(
                                           height: h*0.2,
                                          width: w,
                                          decoration: BoxDecoration(
                                            color: kcardblue,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(h*0.02),topRight: Radius.circular(h*0.02)),
                                            image:  DecorationImage(image: 
                                            // AssetImage("assets/images/img_9.png",),
                                            NetworkImage(list[index].image.toString()),
                                            fit: BoxFit.fill,
                                            )
                                          ),
                                        // child: Image.asset("assets/images/img_9.png")
                                        ),
                                      ),
                                      // Expanded(child: Image.network(list[index].image.toString(),fit: BoxFit.fill,)),
                                      Container(
                                        height: h*0.14,
                                        width: w,
                                        padding: EdgeInsets.symmetric(
                                          vertical: h*0.015,
                                          horizontal: w*0.03
                                        ),
                                        decoration: BoxDecoration(
                                          color: kcardblue,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(h*0.02),bottomRight: Radius.circular(h*0.02))
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "Bitcoin, Simplified",
                                              list[index].title.toString(),
                                              
                                              // softWrap: true,
                                              maxLines: 2,

                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400,
                                                                color: kWhiteColor
                                                              ),
                                            ),
                                              const Spacer(),
                                            Text(
                                              // "12 Shorts",
                                              "${list[index].modules??0} Modules",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.w400,
                                                                color: kWhiteColor
                                                              ),
                                            ),
                                            SizedBox(
                                              height: h*0.01,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                // Expanded(
                                                //   child: Row(
                                                //     children: [
                                                //       CircleAvatar( 
                                                //         radius: h*0.012,
                                                //         backgroundColor: kWhiteColor.withOpacity(0.5),
                                                //         foregroundColor: kcardblue,
                                                //         child: const Icon(Icons.thumb_up_off_alt_rounded,size: 15,)),
                                                //       Text(
                                                //                                       "  ${list[index].allLikes}%",
                                                //                                       // controller.bigdata.value!.
                                                //                                       style: TextStyle(
                                                //   fontSize: 10,
                                                //   fontWeight: FontWeight.w300,
                                                //   color: kWhiteColor.withOpacity(0.5),
                                                //   height: 2,
                                                //                                       ),
                                                //                                     ),
                                                //     ],
                                                //   ),
                                                // ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                       Icon(Icons.groups,size: 20,color: kWhiteColor.withOpacity(0.5),),
                                                      Text(
                                                                                      "  "+list[index].viewCount.toString(),
                                                                                      style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  color: kWhiteColor.withOpacity(0.5),
                                                  height: 2,
                                                                                      ),
                                                                                    ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                              
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              );

  }
}
class Build extends StatelessWidget {
  const Build({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w*0.05),
      margin: EdgeInsets.only(top: h*0.05),
      child: Column(
        children: [
          const Text(
            "Tap the button below to access projects from an external link. ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: kWhiteColor
            ),
          ),

          DefaultButton2(
            onPressed: (){
              print("111");
              Get.to(
                ()=>
                WebViewExample(
                  url: "http://theambitiousapp.com/projects",
                  title: "Projects",
                )
              );
            },
            margin: EdgeInsets.only(top: h*0.03),
            width: w,
            heigth: h*0.065,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(h*0.017)
            ),
            child: Text(
              "OPEN PROJECTS".toUpperCase(),
              textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: kWhiteColor
            ),
              ),
          ),
          DefaultButton2(
            onPressed: (){
               Get.to(
                ()=>
                WebViewExample(
                  url: "https://forms.gle/rUP49H2aNx4BUA818",
                  title: "Welcome to Ambtious",
                )
              );
            },
            margin: EdgeInsets.only(top: h*0.03),
            width: w,
            heigth: h*0.065,
            decoration: BoxDecoration(
              // color: kPrimaryColor,
              border: Border.all(width: 2,color: kPrimaryColor),
              borderRadius: BorderRadius.circular(h*0.017)
            ),
            child: Text(
              "SUGGEST A PROJECT".toUpperCase(),
              textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: kWhiteColor
            ),
              ),
          )
        ],
      ),
    );
    
  }
}


class DarkLearningPath2 extends GetView<DarkLearningPathController> {

   
   const DarkLearningPath2({Key? key}) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return 
    Obx(
      ()=>Scaffold(
      backgroundColor: kdarkblue,
      body: CustomScrollView(
        slivers: [
          ExtendedSliverAppbar(
            toolBarColor:kdarkblue,
            isOpacityFadeWithToolbar:true,
            isOpacityFadeWithTitle:true,
            
            // title: Text(
            //   // "Crypto Investor",
            //   controller.title,
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //     color: kWhiteColor
            //   ),
            // ),
      
      leading:  InkWell(
        onTap: (){
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/Arrow.png",
            height: h*0.03,
          ),
        ),
      ),
      background:Container(
                      height: h*0.4,
                      width: w,
                      padding: EdgeInsets.only(
                        left: w*0.1,
                        right: w*0.1,
                        top: h*0.05,
                        bottom: h*0.02

                      ),
                      decoration: const BoxDecoration(
                        gradient: kbluegradiant,
                        // borderRadius: BorderRadius.circular(h*0.01),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(controller.image,height: h*0.15,),
                Text(
              // "Crypto Investor",
              controller.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 2,
                color: kWhiteColor
              ),
            ),
            SizedBox(
              height: h*0.01,
            ),
            Text(
              // "Learn the basics of cryptocurrencies and how to buy, sell and trade.",
              controller.description,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: kWhiteColor
              ),
            )
                        ],
                      ),

                    ),
      // Image.asset(
      //   'assets/cypridina.jpeg',
      //   fit: BoxFit.cover,
      // ),
      // actions: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: Icon(
      //     Icons.more_horiz,
      //     color: Colors.white,
      //   ),
      // ),
    ),
        //   SliverAppBar(
        //     backgroundColor: Colors.transparent,

        //     snap: false,
        //     pinned: true,
        //     floating: true,
        //     automaticallyImplyLeading: true,
        //     expandedHeight: h*0.4,
        // //     bottom: PreferredSize(
        // //       preferredSize: Size.fromHeight(h*0.3),
        // //       child: 
        // //       Column(
        // //   // crossAxisAlignment: CrossAxisAlignment.start,
        // //   // mainAxisAlignment: MainAxisAlignment.end,
        // //   children: [

        // //     Text(
        // //       // "Crypto Investor",
        // //       controller.title,
        // //       textAlign: TextAlign.center,
        // //       style: const TextStyle(
        // //         fontSize: 24,
        // //         fontWeight: FontWeight.w700,
        // //         color: kWhiteColor
        // //       ),
        // //     ),
        // //     SizedBox(
        // //       height: h*0.01,
        // //     ),
        // //     Text(
        // //       // "Learn the basics of cryptocurrencies and how to buy, sell and trade.",
        // //       controller.description,
        // //       textAlign: TextAlign.center,
        // //       maxLines: 3,
        // //       overflow: TextOverflow.ellipsis,
        // //       style: const TextStyle(
        // //         fontSize: 18,
        // //         fontWeight: FontWeight.w400,
        // //         color: kWhiteColor
        // //       ),
        // //     ),
            
        // //   ],
        // // ),
        // //     ),
        // // //     
            
             
        //     flexibleSpace:FlexibleSpaceBar(
        //     title:Column(
        //       children: [
        //         Image.network(controller.image,height: h*0.15,),
        //     //     Text(
        //     //   // "Crypto Investor",
        //     //   controller.title,
        //     //   textAlign: TextAlign.center,
        //     //   style: const TextStyle(
        //     //     fontSize: 24,
        //     //     fontWeight: FontWeight.w700,
        //     //     color: kWhiteColor
        //     //   ),
        //     // ),
        //     // SizedBox(
        //     //   height: h*0.01,
        //     // ),
        //     // Text(
        //     //   // "Learn the basics of cryptocurrencies and how to buy, sell and trade.",
        //     //   controller.description,
        //     //   textAlign: TextAlign.center,
        //     //   maxLines: 3,
        //     //   overflow: TextOverflow.ellipsis,
        //     //   style: const TextStyle(
        //     //     fontSize: 18,
        //     //     fontWeight: FontWeight.w400,
        //     //     color: kWhiteColor
        //     //   ),
        //     // ),
        //       ],
        //     ),
        //     centerTitle: true,
        //       background: Container(
        //     padding: EdgeInsets.only(
        //       left: w*0.08,
        //       right: w*0.08,
        //       top: h*0.06
        //     ),
        //               // height: h*0.4,
        //               width: w,
        //               decoration: BoxDecoration(
        //                 gradient: kbluegradiant,
        //                 borderRadius: BorderRadius.circular(h*0.01),
        //               ),
        //               alignment: Alignment.bottomCenter,

        //             ),
        //     ), 
        //               ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: h*0.01,
                ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      height: 44,
                      decoration: BoxDecoration(color: kcardblue,
                        borderRadius: BorderRadius.circular(15),
                        
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                controller.islearn.value= true;
                              },
                              borderRadius: BorderRadius.circular(h*0.02),
                              child:  Center(
                                child: Text(
                                  "LEARN",
                                  style: TextStyle(
                                    color:controller.islearn.value?kPrimaryColor: kWhiteColor
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                controller.islearn.value= false;
                              },
                              borderRadius: BorderRadius.circular(h*0.02),
                              child:  Center(
                                child: Text(
                                  "BUILD",
                                  style: TextStyle(
                                    color: controller.islearn.value?kWhiteColor:kPrimaryColor
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      ),  

                    ),
                    Visibility(visible: controller.islearn.value, child: Learn(list: controller.courseListbyLearningPath,)),
                    // Visibility(visible: controller.islearn.value, child: Learn(list: controller.courseListbyLearningPath,)),
                    Visibility(visible: !controller.islearn.value,child: const Build())
                      
                    
            
                  ],
            ),
          )
        ],
      ),
    )

    );
       }
}