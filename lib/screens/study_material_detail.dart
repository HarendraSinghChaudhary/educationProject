import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';



class StudyMaterialDetail extends StatefulWidget {
 String detail, image;
  StudyMaterialDetail({Key? key,  required this.detail, required this.image})
      : super(key: key);

  @override
  State<StudyMaterialDetail> createState() => _StudyMaterialDetailState();
}

class _StudyMaterialDetailState extends State<StudyMaterialDetail> {


  ScrollController _controller = ScrollController();

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      
  }




  @override
  Widget build(BuildContext context) {
   return Scaffold (appBar: AppBar(
    title: const Text("Study Material Detail"),
    centerTitle: true,
    backgroundColor: kPrimaryColor,
    elevation: 0,
   ),

   body: Padding(
                    padding:  const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: 
                    
                    
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      color: Colors.white,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListView(
                
                        children: [
                          Container(
                            height: Get.height * 0.2,
                            decoration:  BoxDecoration(
                                color: Colors.blue,
                                borderRadius: const BorderRadius.only(
                                    topLeft: const Radius.circular(10),
                                    topRight: const Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                       widget.image.toString()),
                                    fit: BoxFit.cover)),
                          ),

                   
                          Html(
                              data: widget.detail),
     
                        ],
                      ),
                    ),
                  ),
   
   
   
   );
    
  }
}