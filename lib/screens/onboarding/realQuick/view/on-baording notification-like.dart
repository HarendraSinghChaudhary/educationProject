import 'dart:io';

import 'package:demo/controllers/category_controller.dart/category_controller.dart';
import 'package:demo/reusable/default_button.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/list.dart';

class OnbaordingNotificationLike extends StatefulWidget {
  const OnbaordingNotificationLike({Key? key}) : super(key: key);

  @override
  State<OnbaordingNotificationLike> createState() =>
      _OnbaordingNotificationLikeState();
}

class _OnbaordingNotificationLikeState
    extends State<OnbaordingNotificationLike> {
  bool isSelected = false;
  TextStyle tital = const TextStyle(
    color: kTitleColor,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  TextStyle subtital =
      const TextStyle(color: kSubTitleColor, fontSize: 12, height: 1.5);

  //  CategoryController categoryController = Get.find();

CategoryController categoryController = Get.put(CategoryController(), permanent: true);
  

      @override
  void initState() {
    // TODO: implement initState
    super.initState();

    

    // Get.lazyPut<CategoryController>(() => CategoryController());

   categoryController .categoryApi();



  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: 
      
      
      SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: 


        // categoryController.isLoading.value
        //                 ? Align(
        //                     alignment: Alignment.center,
        //                     child: Platform.isAndroid
        //                         ? CircularProgressIndicator()
        //                         : CupertinoActivityIndicator())
        //                 :
        
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.06,
              ),
              const Text(
                'What interests you?',
                style: TextStyle(
                    color: kTitleColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              const Text(
                'Pick 2',
                style: TextStyle(
                    color: kSubTitleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),


              Obx((() =>    ListView.builder(
                  controller: _controller,
                  itemCount:  categoryController.categoryList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.height * 0.020,
                          vertical: Get.height * 0.01),
                      child: Container(
                        height: Get.height * 0.12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                offset: const Offset(0, 3),
                                blurRadius: 7,
                              )
                            ]),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: Get.width * 0.07,
                                      backgroundImage: NetworkImage(
                                         categoryController.categoryList[index].image.toString(),
                                      ),
                                    ),
                                      SizedBox(
                                  width: Get.width * 0.04,
                                ),
                                Container(
                              width: Get.width * 0.40,
                                  child: Text(
                                    Get.find<CategoryController>().categoryList[index].category.toString(),
                                    style: tital,
                                  ),
                                ),
                                  ],
                                ),
                              
                                SizedBox(
                                  height: Get.height * 0.002,
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: kPrimaryColor,
                                  value: categoryController.categoryList[index].isSelected,
                                  onChanged: (value) {
                                    setState(() {
                                     Get.find<CategoryController>().categoryList[index].isSelected = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }))),
           
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.03),
                child: DefaultButton(
                    width: w * 0.9,
                    height: w * 0.14,
                    text: 'Next',
                    press: () {
                      Get.toNamed('/onboardingNextPage');
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
