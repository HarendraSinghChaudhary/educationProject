
import 'package:demo/reusable/default_button.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';




class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  bool buttonk = false;
  bool _Show = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: kPrimaryColor,
                        ),
                      ),
                      const Text(
                        'Welcome back',
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
                    'Sign in to your existing\n account',
                    style: GoogleFonts.roboto(
                        height: 1.5,
                        color: kSubTitleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  TextFormField(
                    style: GoogleFonts.roboto(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 23, bottom: 23, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                      hintStyle:
                          const TextStyle(fontSize: 20, color: kLightGreyColorwithMail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please Enter Email'),
                      EmailValidator(errorText: 'enter valid email'),
                    ]),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  TextFormField(
                    obscureText: _Show,
                    style: GoogleFonts.roboto(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 23, bottom: 23, left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: TextButton(
                          onPressed: () {
                            setState(() {
                              _Show = !_Show;
                            });
                          },
                          child: Text(
                            _Show ? 'SHOW' : 'HIDE',
                            style: GoogleFonts.roboto(
                                color: kLightGreyColorwithMail,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )),
                      hintText: 'Password',
                      hintStyle:
                          const TextStyle(fontSize: 20, color: kLightGreyColorwithMail),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Please Enter Password";
                      } else if (value.toString().length < 6) {
                        return "Please Enter Minimum 6 DIGIT";
                      }
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.roboto(
                        color: kTitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/newAccount");
                      },
                      child: Text(
                        'CREATE ACCOUNT',
                        style: GoogleFonts.roboto(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),

                  // Navigate to RealQuick Class
                  // Reusable widget
                  DefaultButton(
                      width: Get.width * 0.8,
                      height: Get.height * 0.075,
                      text: "LOG IN",
                      press: () {
                        if (_formkey.currentState!.validate()) {
                          Get.toNamed("/realQuick");
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
