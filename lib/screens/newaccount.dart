// ignore_for_file: prefer_const_constructors

import 'package:demo/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Login.dart';
import 'createpassword.dart';

class Newaccount extends StatefulWidget {
  const Newaccount({Key? key}) : super(key: key);

  @override
  State<Newaccount> createState() => _NewaccountState();
}

class _NewaccountState extends State<Newaccount> {
  final _valikey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
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
                    Container(
                      child: GestureDetector(
                        onTap: (){
                         Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff5468FF),
                        ),
                      ),
                    ),
                    Text(
                      'New Account',
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
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
                      color: kSubTitleColor,
                      fontSize: 20,
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
                      color: kSubTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                    },
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(height:50 ,),
                GestureDetector(
                  onTap: () {
                    if(_valikey.currentState!.validate()){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePassword()));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 50, right: 14),
                    height: 58,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Color(0xff5468FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          'CONTINUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff3D56F0),
                            ),
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
