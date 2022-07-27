import 'dart:io';

import 'package:Ambitious/controllers/study_material/study_material_controller.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class CourseDetail extends StatefulWidget {
  String title, id;
  CourseDetail({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  StudyMaterialController studyMaterialController =
      Get.put(StudyMaterialController(), permanent: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studyMaterialController.studyMaterialApi(widget.id);
  }

  final ScrollController _controller = ScrollController();



  @override
  Widget build(BuildContext context) {
    print("id...." + widget.id.toString());
    // print("length: "+ studyMaterialController.studyMaterialList.first.courseData.length.toString());
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: kBackgroundColor,
          leading: BackButton(),
          iconTheme: IconThemeData(color: kPrimaryColor),
        ),
        body: SingleChildScrollView(
          child: Obx((() => 


                          studyMaterialController.isLoading.value
                         
                  ? Align(
                      alignment: Alignment.center,
                      child: Platform.isAndroid
                          ? CircularProgressIndicator()
                          : CupertinoActivityIndicator())
                  :


          
          
          
          
          
          
          
          ListView.builder(
    
                shrinkWrap: true,
                controller: _controller,
                itemCount: studyMaterialController.studyMaterialList.first.courseData.length,
                itemBuilder: (BuildContext context, int index) {
                  return

                  studyMaterialController
                                  .studyMaterialList.first.courseData[index]
                                  .toString() != "" ?


                  
                  
                  
                   Padding(
                    padding:  EdgeInsets.only(bottom: 10.0),
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      color: Colors.white,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.2,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://pilbox.themuse.com/image.jpg?filter=antialias&h=422&opt=1&pos=top-left&prog=1&q=keep&url=https%3A%2F%2Fcms-assets.themuse.com%2Fmedia%2Flead%2F01212022-1047259374-coding-classes_scanrail.jpg%3Fv%3De701c89d3e07cc24ac41b2df50f5a40a821e3813&w=767"),
                                    fit: BoxFit.cover)),
                          ),
                          Html(
                              data: studyMaterialController
                                  .studyMaterialList.first.courseData[index]
                                  .toString())
                        ],
                      ),
                    ),
                  ): Container();
                },
              )
              
              
              
              )),
      
      
      
      
      
        ));
  }
}
