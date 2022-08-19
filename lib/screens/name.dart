import 'dart:io';

import 'package:Ambitious/controllers/signup_controller.dart/edit_profile_controller.dart';
import 'package:Ambitious/main.dart';
import 'package:Ambitious/reusable/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';



class NameScreen extends StatefulWidget {
 String firstName, lastName, name;

 NameScreen({required this.firstName, required this.lastName, required this.name});


  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  String token = "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName; 
    getUserList();
  }

   EditProfileController editProfileController =
      Get.put(EditProfileController(), permanent: true);



  @override
  Widget build(BuildContext context) {
    print("id: "+id.toString());
    print("token======: " + token.toString());
    return Scaffold (
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          


             SizedBox(
                  height: h * 0.1,
                ),
                const Text(
                  "What's your name?",
                  style: TextStyle(
                      color: kTitleColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),

                 SizedBox(
                  height: h * 0.07,
                ),



                  Padding(
                     padding:EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                    child: TextFormField(
                      controller: firstNameController,
                    style: GoogleFonts.roboto(
                        color: kTitleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 23, bottom: 23, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'First Name',
                      hintStyle:
                          const TextStyle(fontSize: 18, color: kTitleColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                    ),
              
                ),
                  ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  child: TextFormField(
                    controller: lastNameController,
                    
         
                    style: GoogleFonts.roboto(
                        color: kTitleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 23, bottom: 23, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                   
                      hintText: 'Last Name',
                      hintStyle:
                          const TextStyle(fontSize: 18, color: kTitleColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.07,
                ),

                

                        Obx((() => 

                          editProfileController.isLoading.value
                        ? Align(
                            alignment: Alignment.center,
                            child: Platform.isAndroid
                                ? const CircularProgressIndicator()
                                : const CupertinoActivityIndicator())
                        : 

                         DefaultButton(
                    width: w * 0.9,
                    height: w * 0.14,

                 
                    text: 'CONTINUE',
                    press: () {

                      if (firstNameController.text.trim() != "null" || firstNameController.text.trim() != "" 
                      ){
                         if (lastNameController.text.trim() != "null" || lastNameController.text.trim() != "null") {

                          editProfileController.editProfileApi(id.toString(), widget.name, firstNameController.text, lastNameController.text);


                           
                         } else {
                        Get.snackbar("Please fill last name", "");
                       }

                       } else {
                        Get.snackbar("Please fill first name", "");
                       }


                     
                    },

                        
                        
                        )),)
              
               
        ],
      ),
    );
    
  }

     Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    token = pref.getString("token").toString();

    print("token++++: " + token.toString());

   
  

    setState(() {});
  }
}