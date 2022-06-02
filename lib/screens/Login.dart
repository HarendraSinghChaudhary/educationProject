import 'package:demo/screens/newaccount.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Realquick.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
final _formkey= new GlobalKey<FormState>();
bool buttonk = false;
bool _Show= true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Newaccount()));
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xff5468FF),
                          ),
                        ),
                      ),
                      Text(
                        'Welcome back',
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
                    'Sign in to your existing\n account',
                    style: GoogleFonts.roboto(color: Color(0xff344356).withOpacity(0.8),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
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
                          color: Color(0xff344356).withOpacity(0.50)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Please Enter Email'),
                        EmailValidator(errorText: 'enter valid email'),
                      ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: _Show,
                    style: GoogleFonts.roboto(color: Color(0xff344356),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 23,bottom: 23,left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: TextButton(

                          onPressed: () {
                            setState((){
                            _Show = !_Show;
                            });
                          },

                          child: Text(
                            _Show ?  'SHOW' : 'UNSHOW',
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
                      return "Please Enter Password";
                    }else if(value.toString().length <6){
                      return "Please Enter Minimum 6 DIGIT";
                    }
                    },

                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Don'+"'"+'t have an account?',
                    style: GoogleFonts.roboto(color: Color(0xff344356),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Newaccount()));
                      },
                      child: Text(
                        'CREATE ACCOUNT',
                        style: GoogleFonts.roboto(color: Color(0xff5468FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: (){
                          if(_formkey.currentState!.validate()){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RealQuick()));
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
              ),),
          ),
        )
        ,
      )
      ,
    );
  }
}
