import 'package:demo/reusable/default_button.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';






class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool _isObscure  = true;
  final _formkey =  GlobalKey<FormState>();
  bool  button = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: kPrimaryColor,
                      ),
                    ),
                    const Text(
                      'Create Password',
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
                  'Your password must have at\nleast one symbol & 8 or\n more characters.',
                  style: GoogleFonts.roboto(
                    height: 1.5,
                      color: kSubTitleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
               const SizedBox(
                  height: 47,
                ),
                Form(
                  key:  _formkey,
                  child: TextFormField(
                    obscureText: _isObscure ,
                    style: GoogleFonts.roboto(
                        color: kTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(top: 23,bottom: 23,left: 20),
                      fillColor: Colors.white,
                        filled: true,
                        suffixIcon: TextButton(
          
                            onPressed: () {
                              _isObscure= !_isObscure;
                              setState((){});
                            },
                            child: Text(
                            _isObscure?  'SHOW' :"HIDE",
          
                              style: GoogleFonts.roboto(
                                  color: kLightGreyColorwithMail,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                        hintText: 'Password',
                        hintStyle:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kGreyColor),
                        border: OutlineInputBorder(borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                    ),
          
                    validator: (value){
                      if(value.toString().isEmpty){
                        return "Please enter Password";
                      }else if (value.toString().length <6){
                        return 'Please Enter minimum 6 Digit';
                      }else if (!regex.hasMatch(value!)){
                        return "Please make a strong Password";
                      }return null;
                    },
                  ),
                ),
               const SizedBox(
                  height: 50,
                ),
                Text(
                  'Already have ab account?',
                  style: GoogleFonts.roboto(
                      color: kTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),

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

                // Navigate to RealQuick class

                DefaultButton(
                  width: Get.width * 0.8, 
                  height: Get.height * 0.075, 
                  text: "SIGN UP", 
                  press: () {

                     if(_formkey.currentState!.validate()){
                       Get.toNamed("/realQuick");

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
