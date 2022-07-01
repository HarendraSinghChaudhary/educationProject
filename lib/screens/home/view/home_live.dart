// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:Ambitious/controllers/category_controller.dart/category_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../reusable/home_header.dart';
import '../../../utils/list.dart';
class HomeLive extends StatefulWidget {
  const HomeLive({Key? key}) : super(key: key);

  @override
  State<HomeLive> createState() => _ProfileState();
}

class _ProfileState extends State<HomeLive> {

  String id = "";
  String name = "";
  String email = "";
  bool bookmark =  false;
  ScrollController _controller = ScrollController();

 CategoryController categoryController = Get.put(CategoryController(), permanent: true);

 @override
 void initState() {
   super.initState();

   getUserList();

   categoryController.categoryApi();
   categoryController.subcategoryApi();

   _controller = ScrollController();
   
 }


 @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kBackgroundColor,
        body: 


        Obx((() => 

     categoryController.isLoading.value
                        ? Align(
                            alignment: Alignment.center,
                            child: Platform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator())
                        : 

        
        
        
         SingleChildScrollView(
          controller: controllerScroll,
      
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),

              SizedBox(height: Get.height * 0.015,),
            Center(
               child:  Text( "Hi, ${name} 👋🏼",
                  style: TextStyle(
                    color: Color(0xff344356),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
             ),

              SizedBox(height: Get.height * 0.02,),

              Center(
                child: SizedBox(
                  width: Get.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                          Container(
                                height: 27,
                                width: 27,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:  Color(0xffAEB8FF),
                                ),
                                child: const Icon(
                                  Icons.help,
                                  color: Colors.white,
                                  size: 13,
                                ),
                              ),

                             const SizedBox(height: 5,),

                              const Text(
                              'Request Topic',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),



                      ],
                    ),

                       Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                            Container(padding: EdgeInsets.all(6),
                                  height: 27,
                                  width: 27,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27),
                                    color: Color(0xffAEB8FF),
                                  ),
                                  child: SvgPicture.asset('assets/images/Shape.svg',)
                              ),

                             const SizedBox(height: 5,),

                              const Text(
                              'Redeem Points',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),



                      ],
                    ),

                       Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                            Container(
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                  color:const Color(0xffAEB8FF),
                                ),
                                child:const Icon(Icons.message,color: Colors.white,size: 18,)
                              ),

                             const SizedBox(height: 5,),

                              const Text(
                              'Invite Friends',
                              style: TextStyle(
                                color: Color(0xff344356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),



                      ],
                    )

                  ],),
                ),
              ),
           
               SizedBox(height: Get.height * 0.02,),


            const  Padding(
                padding:  EdgeInsets.all(16),
                child:  Text(
                  '📈 LEARNING PATH',
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
               Row(
          children: [
            SizedBox(
              height: 150,
              width: Get.width * 0.99,
              child: ListView.builder(
                  itemCount: categoryController.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                
                      ),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed('/wipCoursePlayerNew');
                        },
                        child: Container(
                          width: 150,
                          height: 141,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Container(
                                height: 72,
                                width: 162,
                                decoration: BoxDecoration(
                                    borderRadius:const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          categoryController.categoryList[index].image.toString()
                                         
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                             const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  // paths[index]['name'].toString(),
                                  categoryController.categoryList[index].category.toString(),
                                  style: const TextStyle(
                                    color: kTitleColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
      ),
              SizedBox(height: Get.height * 0.01,),
           const   Padding(
                padding:  EdgeInsets.all(16.0),
                child:  Text(
                  '🔥 HOT COURSES',
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
               GridView.builder(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                itemCount: categoryController.subCategoryList.length,
                controller: _controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return 
                  Container(
                  
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 85,
                          width: 176,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(categoryController.subCategoryList[index].image.toString()),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 6),
                          child: Text(
                                //'Bitcoin & Blockchain',
                                categoryController.subCategoryList[index].subCategory.toString(),
                                style: TextStyle(
                                  color: kTitleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        ),
                      const  SizedBox(
                          height: 10,
                        ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                                bottom: 1,
                              ),
                              child: Text(
                                '12 Shorts',
                                style: TextStyle(
                                  color: kLightGreyColorwithMail,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),


                            InkWell(
                              onTap:(){
                                setState( (){
                                  bookmark  = !bookmark;
                                });
                              },
                                child: bookmark == false ? Icon(Icons.bookmark_border_outlined):Icon(Icons.bookmark))
                           
                          
                          
                          ],
                        ),

                        // SizedBox(height: Get.height * 0.01,)
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: Get.height * 0.03,)
            
            ],
          ),
        )
     
     )
        
        
        
        
        
       
     
      ),
    ));
  }

    Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());
  

    setState(() {});
  }
}
