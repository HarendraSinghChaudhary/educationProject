
import 'package:Ambitious/screens/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/status_change_controller.dart';
import '../../models/study_material_model.dart';
import '../../services/youtubevideo.dart';
import '../../utils/constant.dart';
import '../quiz_end.dart';

class CustomCourseView extends StatefulWidget {
  final List<Widget> courseItem;
  final List<StudyMaterialModel> study;
  // final int a,r,g,b;
  const CustomCourseView({Key? key,required this.courseItem, required this.study,}) : super(key: key);

  @override
  State<CustomCourseView> createState() => _CustomCourseViewState();
}

class _CustomCourseViewState extends State<CustomCourseView> {
  List images =[
    "https://tinypng.com/images/social/website.jpg",
    "https://apod.nasa.gov/apod/image/2202/AuroraPillars_Correia_4898.jpg",
    "https://www.w3schools.com/w3css/img_lights.jpg",
    "https://www.ilmubahasainggris.com/wp-content/uploads/2017/03/NGC.jpg.webp",
    "https://thumbs.dreamstime.com/z/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg",
    "https://miro.medium.com/max/700/0*rZecOAy_WVr16810"
  ];
  int currentIndex = 0;
  int maxlength = 0;
  // Youtubecontroller youtubecontroller = Get.find(()=>Youtubecontroller());
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxlength = widget.courseItem.length;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(change_to_a(widget.study[currentIndex].a!.toInt()), widget.study[currentIndex].r!.toInt(), widget.study[currentIndex].g!.toInt(), widget.study[currentIndex].b!.toInt()),

      body: Container(
      height: h,
      width: w,
      padding: EdgeInsets.only(top: h*0.05),
      child: Stack(
        children: [
          // Align(
          //   alignment:Alignment.center,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: InkWell(
          //         onTap: () {
          //           print("left");
          //         }
          //       )),
          //       Expanded(
          //         child: InkWell(
          //         onTap: () {
          //           print("right");
          //         }
          //       )),
          //     ],
          //   ),
          // ),
          PageView.builder(
            itemCount: maxlength,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value){
              currentIndex = value;
              setState(() {
                
              });
            },
            itemBuilder: (context, index){
              return widget.courseItem[currentIndex];
            },
          ),
          // Align(
          //   alignment:Alignment.center,
          //   child: InkWell(
          //       onTap: (){
          //         print("tap");
          //         if(currentIndex<5){
          //         currentIndex++;
          //         }
          //         setState(() {
          //           print(currentIndex);
          //         });
          //       },
          //       child: 
          //       Image.network(images[currentIndex])),
          // ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: w*0.01,vertical: h*0.01),
              child: Row(
                children: List.generate(maxlength, (index) => Expanded(child: Container(height: h*0.005,decoration: BoxDecoration(color:index<=currentIndex? kCyanColor:kstatusgreyColor, borderRadius: BorderRadius.circular(h*0.0025)),margin: EdgeInsets.symmetric(horizontal: w*0.001),))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: w*0.2,
              height: h,
              child:GestureDetector(
                onTap: (){

                  if(currentIndex>0){
                    print("taptap");
                    currentIndex--;
                    setState(() {
                      
                    });
                  }

                },
              )
            ),
            
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: w*0.8,
              height: h,
              child:GestureDetector(
                onTap: (){
                  if(currentIndex==maxlength-1){
                      Get.off(
                              ()=>LessonEnd(),
                              binding: LessonEndBinding()
                            //   QuizEnd(
                            //   length: studyMaterialController
                            //       .studyMaterialList.length,
                            // )
                            );
                    }

                  if(currentIndex<maxlength-1){
                    print("taptap");
                    currentIndex++;
                    // Get.delete(Youtubecontroller());
                    setState(() {
                      
                    });
                  }

                },
              )
            ),
            
          ),
          
          
      
        ],
      
      ),
        ),
    );
    
  }
  change_to_a(int a){
  var b = ((a/100)*255).toInt();
  print(b);
 return b;
}

}

