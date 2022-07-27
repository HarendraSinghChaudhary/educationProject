import 'dart:io';

import 'package:Ambitious/controllers/category/category_controller.dart';
import 'package:Ambitious/controllers/exitDialogue/exit_controller.dart';

import 'package:Ambitious/controllers/signup_controller.dart/apple_signin_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/reusable/skip_button.dart';
import 'package:Ambitious/screens/homeNav/home_nav.dart';
import 'package:Ambitious/screens/onboarding/realQuick/view/coursesby_category.dart';
import 'package:Ambitious/testing/testing_first.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/list.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _OnbaordingNotificationLikeState();
}

class _OnbaordingNotificationLikeState extends State<Category> {
  String isSelected = "";
  // bool isSelected = false;

  List<String> idList = [];
  List<String> collectId = [];
  TextStyle tital = const TextStyle(
    color: kTitleColor,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  bool _value = false;
  TextStyle subtital =
      const TextStyle(color: kSubTitleColor, fontSize: 12, height: 1.5);

  //  CategoryController categoryController = Get.find();

  CategoryController categoryController =
      Get.put(CategoryController(), permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    categoryController.categoryApi();

    getUserList();

    // Get.lazyPut<CategoryController>(() => CategoryController());
  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
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
                  height: h * 0.04,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SkipButton(
                      //   height: Get.height * 0.04,
                      //   width: Get.width * 0.22,
                      //   text: "Skip",
                      //   press: () {
                      //     Get.to(HomeNav(index: 0));
                      //   },
                      // )
                    ],
                  ),
                ),

                SizedBox(
                  height: h * 0.02,
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
  
                SizedBox(
                  height: h * 0.02,
                ),
                Obx((() => ListView.builder(
                    controller: _controller,
                    itemCount: categoryController.categoryList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      print(isSelected);
                      print(
                          categoryController.categoryList[index].id.toString());
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
                            child: CheckboxListTile(
                              title: SizedBox(
                                width: Get.width * 0.40,
                                child: Text(
                                  categoryController
                                      .categoryList[index].category
                                      .toString(),
                                  style: tital,
                                ),
                              ),
                              // subtitle: const Text('A computer science portal for geeks.'),
                              secondary: CircleAvatar(
                                radius: Get.width * 0.07,
                                backgroundImage: NetworkImage(
                                  categoryController.categoryList[index].image
                                      .toString(),
                                ),
                              ),
                              autofocus: false,
                              activeColor:kPrimaryColor,
                              checkColor: Colors.white,
                              selected: _value,
                              value: categoryController
                                  .categoryList[index].isSelected,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  if (value == true) {
                                    idList.add(categoryController
                                        .categoryList[index].id
                                        .toString());
                                  } else {
                                    idList.remove(categoryController
                                        .categoryList[index].id
                                        .toString());
                                  }

                                  categoryController
                                      .categoryList[index].isSelected = value!;
                                });
                              },
                            ),
                          ),

                     
                        ),
                      );
                    }))),
              ],
            ),
          ),
        )),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: Get.height * 0.09,
            color: kWhiteColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
              child: Center(
                child: DefaultButton(
                    width: w * 0.9,
                    height: w * 0.14,
                    text: 'Next',
                    press: () {
                      print("list: " + idList.toString());

                      String sub = idList.join(",");

                      print("true: " + sub);

                      if (idList.isNotEmpty) {
                        Get.to(CoursesbyCategory(catId: sub.toString()))
                            ?.then((value) {
                          // idList.clear();
                          // categoryController.categoryApi();
                        });
                      } else {
                        Get.snackbar("Please select category", "");
                      }
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());

    token = pref.getString("name").toString();
    print("name: " + name.toString());
  }
}
