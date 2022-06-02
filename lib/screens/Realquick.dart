import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Notification.dart';

class RealQuick extends StatefulWidget {
  const RealQuick({Key? key}) : super(key: key);

  @override
  State<RealQuick> createState() => _RealQuickState();
}

class _RealQuickState extends State<RealQuick> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Real quick',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff344356),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Are you in school?',
                    style: GoogleFonts.roboto(
                        color: Color(0xff344356).withOpacity(0.80),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        color: Color(0xff5468FF),
                      ),
                      child: Text(
                        'YES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Pagenotification()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Colors.white,
                      ),
                      child: Text(
                        'NO',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 29,),
              TextFormField(
                maxLines: 1,
                style: GoogleFonts.roboto(
                    color: Color(0xff344356),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 25,bottom: 25,left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Start typing your school name...',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xff979797)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                  ),
                  focusColor: Colors.white,
                ),
              ),
        
              SizedBox(height: 142,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Pagenotification()));
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
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
