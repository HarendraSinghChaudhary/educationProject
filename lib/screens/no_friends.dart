import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/constant.dart';
class NoFriend extends StatefulWidget {
  const NoFriend({Key? key}) : super(key: key);

  @override
  State<NoFriend> createState() => _NoFriendState();
}

class _NoFriendState extends State<NoFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Text(
                'No Friends!',
                style: TextStyle(
                  color: kTitleColor, fontSize: 20, fontWeight: FontWeight.w600,),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const Text(
                'It’s lonely here. Add some\nfriends to make studying\nmore fun!',
                style: TextStyle(
                    color: kSubTitleColor,
                    fontSize: 20,
                    height: 1.5
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height*0.04,),
              Container(
                height: Get.height*0.08,
                width: Get.width*0.1750,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kPrimaryColor,
                    boxShadow: const [
                      BoxShadow(
                          color: kPrimaryColor,
                          blurRadius: 4,
                          spreadRadius: 0.2,
                          offset: Offset(0.2,0.2)
                      )
                    ]
                ),
                child: Icon(Icons.add,color: Colors.white,size: 35,),
              )

            ],
          ),
        ),
      ),
    );
  }
}
