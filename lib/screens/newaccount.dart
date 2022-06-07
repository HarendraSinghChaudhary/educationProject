// ignore_for_file: prefer_const_constructors

import 'package:demo/reusable/default_button.dart';
import 'package:demo/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';



class Newaccount extends StatefulWidget {
  const Newaccount({Key? key}) : super(key: key);

  @override
  State<Newaccount> createState() => _NewaccountState();
}

class _NewaccountState extends State<Newaccount> {

  // global key for validation in textfield
  final _valikey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.002,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                       Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      'New Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'Start by entering your email\naddress below.',
                  
                  style: GoogleFonts.roboto(
                    height: 1.5,
                      color: kSubTitleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                  
                ),
                SizedBox(
                  height: 75,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always, key: _valikey,
                  child: TextFormField(
                    style: GoogleFonts.roboto(
                        color: Color(0xff344356),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 23,bottom: 23,left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: kLightGreyColorwithMail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none
                      ),
                      focusColor: Colors.white,
                    ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'Please Enter Email'),
                          EmailValidator(errorText: 'Please enter a valid email address'),
                        ]
                      ),
          
                ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Already have an account?',
                  style: GoogleFonts.roboto(
                      color: kTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),

                // Navigate to Login Screen or Login Class

                TextButton(
                    onPressed: () {
                  Get.toNamed("/signIn");
                    },
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(height: Get.height * 0.05 ,),


                // Navigate to Create Password Class
                // DefaultButton is reusable class called from reusable folder

                DefaultButton(
                  width: Get.width * 0.8, 
                  height: Get.height * 0.075, 
                  text: "CONTINUE", 
                  press: () {
                      if(_valikey.currentState!.validate()){
                      Get.toNamed("/createPassword");
                    }

                  }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
