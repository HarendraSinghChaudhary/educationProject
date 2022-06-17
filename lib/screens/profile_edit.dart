import 'package:demo/reusable/default_button.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextStyle tital =
      TextStyle(color: kTitleColor, fontWeight: FontWeight.w700, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kBackgroundColor,
            leading: BackButton(),
            iconTheme: IconThemeData(color: kPrimaryColor),
          ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/priofileedit.svg',
              height: Get.height * 0.2,
              width: Get.width * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(

                left: Get.width * 0.07,
                right: Get.width * 0.07,
                top: Get.height * 0.07,
                bottom: Get.height * 0.04,
              ),
              child: Text(
                'Change your information',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color:  kTitleColor,
                    fontSize: 27,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.07,
                  right: Get.width * 0.07,
                  top: Get.height * 0.006),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.01, bottom: Get.height * 0.005),
                    child: Text(
                      'Name',
                      style: tital,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        suffixIcon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: kWhiteColor, width: 14,),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.only(
                            top: Get.height * 0.02, left: Get.width * 0.05)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.07,
                  right: Get.width * 0.07,
                  top: Get.height * 0.006),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.01, bottom: Get.height * 0.005),
                    child: Text(
                      'Email',
                      style: tital,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "yourmailid@gmail.com",
                        suffixIcon: Icon(
                          Icons.mail_outline,
                          size: 22,
                          color: kPrimaryColor,
                        ),
                        focusColor: kPrimaryColor,
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: kWhiteColor, width: 14),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.only(
                            top: Get.height * 0.02, left: Get.width * 0.05)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.07,
                  right: Get.width * 0.07,
                  top: Get.height * 0.006),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.01, bottom: Get.height * 0.005),
                    child: Text(
                      'Phone Number',
                      style: tital,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "+91 99999227722",
                        suffixIcon: Icon(
                          Icons.phone_iphone,
                          size: 22,
                          color: kPrimaryColor,
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 14),
                        ),
                        contentPadding: EdgeInsets.only(
                            top: Get.height * 0.02, left: Get.width * 0.05)),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height*0.07,),
            DefaultButton(
                width: Get.height * 0.40,
                height: Get.width * 0.14,
                text: 'Save',
                press: () {}),
            SizedBox(height: Get.height*0.02,),
          ],
        ),
      ),
    ));
  }
}
