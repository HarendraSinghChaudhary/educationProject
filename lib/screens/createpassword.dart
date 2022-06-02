import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

import 'Login.dart';
import 'Realquick.dart';
import 'bottombar.dart';
import 'newaccount.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool _isObscure  = true;
  final _formkey = new GlobalKey<FormState>();
  bool  button = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Newaccount()));
                      },
                      child: Container(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xff5468FF),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Create Password',
                      style: TextStyle(
                        color: Color(0xff344356),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Your password must have at\nleast one symbol & 8 or\n more characters.',
                  style: GoogleFonts.roboto(
                      color: Color(0xff344356).withOpacity(0.8),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 47,
                ),
                Form(
                  key:  _formkey,
                  child: TextFormField(
                    obscureText: _isObscure ,
                    style: GoogleFonts.roboto(
                        color: Color(0xff344356),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 23,bottom: 23,left: 20),
                      fillColor: Colors.white,
                        filled: true,
                        suffixIcon: TextButton(
          
                            onPressed: () {
                              _isObscure= !_isObscure;
                              setState((){});
                            },
                            child: Text(
                            _isObscure?  'SHOW' :"UNSHOW",
          
                              style: GoogleFonts.roboto(
                                  color: Color(0xff344356).withOpacity(0.40),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color(0xff344356).withOpacity(0.50)),
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
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Already have ab account?',
                  style: GoogleFonts.roboto(
                      color: Color(0xff344356),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.roboto(
                          color: Color(0xff5468FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    if(_formkey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RealQuick()));
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
                          'SIGN UP',
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
